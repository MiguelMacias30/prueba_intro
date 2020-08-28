require_relative 'request'

def head
    head = "<!doctype html>
            <html lang='en'>
            <head>
                <title>Nasa</title>
                <!-- Required meta tags -->
                <meta charset='utf-8'>
                <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>

                <!-- Bootstrap CSS -->
                <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css' integrity='sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z' crossorigin='anonymous'
                <link href='https://fonts.googleapis.com/css2?family=Oswald:wght@700&display=swap' rel='stylesheet'>
                </head>
                <body style= 'background-image: url(https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/1200/public/media/image/2015/11/131753-viaje-marte.jpg?itok=OrJ0nkVj); font-family:Oswald, sans-serif;'>

                    <h1 class = 'text-center my-5' style= 'color:white;'>MARS ROVERS</h1>\n'
                    '<p class = 'text-center'style='color:white;'>un mars rover es un vehiculo motorizado que se desplaza por la superficie de marte a su llegada.estos vehiculos tienen varias ventajas respecto a los modulos de aterrizaje estacionarios:son capaces de examinar areas de territorio mas amplio, pueden ser dirigidos a zonas con interes cientifico, pueden situarse en posiciones donde reciben luz solar durante los meses de invierno y son capaces de obtener conocimiento del entorno para ser controlados de forma remota</p>"
    return head
end


def content(api)
  data = get_data(api)
    mars = ""
    '<div class= "container">'
    mars = '<div class="row p-5" style= "color:black">'
    #data.each do |imagen|
    #imagen[1].each do |fotos|
    #fotos.each do |k, v|
      #puts v if k == "img_src"
      #end
        data.each do |imagen|
        imagen[1].each do |fotos|
        mars += "
        <div class='col-md-4'>
            <div class='card' style='width: 18rem;'>
                <img src='#{fotos['img_src']}' class='card-img-top'>
                <div class='card-body'>
                <h5 class='card-title'>'NASA'</h5>
                <p  class='card-text'>'#{fotos['earth_date']}'</p>
             </div>
        </div>
    </div>
    "
      end
      '</div>'
      mars += '</div>'

    end
    return mars
end


def foot
    foot =  "<!-- Optional JavaScript -->
             <!-- jQuery first, then Popper.js, then Bootstrap JS -->
             <script src='https://code.jquery.com/jquery-3.5.1.slim.min.js' integrity='sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj' crossorigin='anonymous'></script>
             <script src='https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js' integrity='sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN' crossorigin='anonymous'></script>
             <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js' integrity='sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV' crossorigin='anonymous'></script>
        </body>
    </html>"

    return foot
end


def build_page
  url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=7zTHP1OsvMBYmLxmUO99BDUqRwqgGopBSYkEWaqt'
  index = head() + content(url) + foot()

  return index
end

File.write('./index.html', build_page())
