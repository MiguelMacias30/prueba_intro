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
