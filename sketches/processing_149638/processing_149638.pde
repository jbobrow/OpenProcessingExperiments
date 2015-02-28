
PImage logo;
PImage inicio,ican,origen,aprende;
PImage segmento,alianzas,propuesta,actividades,canal,flujo,costos,recursos,relacion,acerca;
PImage udi,flecha,principal,cerrar;
PImage fondo,fondo01,fondo02,fondo03,fondo04,fondo01b;

PFont fuente01 = createFont("HelveticaNeueLTPro-Bd",19,false);
PFont fuente02 = createFont("HelveticaNeueLTPro-ThEx",14,false);
PFont fuente03 = createFont("HelveticaNeueLTPro-MdEx",14,false);

byte estado = 1; //1=bienvenida, 2=inicio, 3=aprende, 4=total
byte paso = 0;
int wlogo, hlogo;
float ms1 = 0, dms1 = 0;
int imgini = 100, ancho = 550, alto = 500; 

String ini = "Bienvenidos a ICAN, con esta aplicación se busca mejorar el desarrollo de una idea de negocio y volverla rentable implementando la metodología denominada como canvas, la cual surgió como tesis de grado de Alexander Osterwalder con ayuda de su tutor Yves Pigneur, así lograron obtener buenos resultados pues ya varios paises utilizan este método para lograr objetivos favorables.";
String ica = "Ican es una aplicación con la que se busca lograr un mejor desarrollo de la metodología conocida como canvas y lograr una mator eficiencia en la elaboración del mismo, con esta herramienta se podrá solidificar una idea y lograr hacerlo realidad.";
String ori = "La metodología canvas parte de la idea o de una propuesta de valor determinada por cada empresa, con esta idea comienza la estructura canvas que es la cual desarrollaremos en ICAN y para desarrollarla necesitaremos 9 módulos que son la estructura básica del canvas, así lograremos consolidar la propuesta de valor y hacerla efectiva.";
String apr = "El canvas es una guía que pretende ayudar con la creación de un modelo de negocio rentable, escalable y rpetible, el cual puede ser usado en los diferentes campos empresariales, ya que nos permitirá ver como funcionará nuestra empresa en la parte lógica y emotica, hallando la fortaleza de nuestra propuesta de valor, para hacer de nuestro proyecto tecnológico una empresa próspera.";
String seg01 = "Determinar, conocer y clasificar nuestros futuros clientes en base a la necesidad, para lograr un canvas más definido. Se puede clasificar en:";
String seg02 = "Geográfica: ";
String seg03 = "Demográfica: ";
String seg04 = "Piscográfica: ";
String seg05 = "Conductual: ";
String seg06 = "Países, regiones, ciudades, barrios.";
String seg07 = "Edad, género.";
String seg08 = "Clase social, estilo de vida.";
String seg09 = "Conductas, beneficios.";
String ali01 = "Hacen referencia a no solo los clientes, si no también a los aspectos importantes como accionistas y proveedores con los cuales estableceremos el desarrollo de nuestro negocio. Podemos realizar alianzas por:";
String ali02 = "Estratégica\nCooperación competitiva\nInnovación\nRelaciones comprador-proveedor";
String pro01 = "Es el servicio que vamos a ofrecer, identificando el cómo le daremos solución y las necesidades, como:";
String pro02 = "Rendimiento\nConveniencia\nPersonalización\nDiseño\nNovedad\nUsabilidad";
String act01 = "Son aquellas actividades que ayudan al funcionamiento del negocio, que son necesarias para llevar acabo el proyecto. Pueden ser:";
String act02 = "Físicos\nIntelectuales\nHumanos\nFinancieros";
String can01 = "En el canal de distribución se maneja de acuerdo a los clientes, y productos o servicios que brindaremos. El canal tiene 5 fases que debemos tener presente. Fases del canal:";
String can02 = "Conciencia: ";
String can03 = "Evaluación: ";
String can04 = "Compra: ";
String can05 = "Después de las Ventas: ";
String can06 = "Aumentar la conciencia acerca de nuestro producto o servicio.";
String can07 = "Ayudar a evaluar nuestro producto o servicio.";
String can08 = "Comprar productos y servicios específicos.";
String can09 = "Ofrecer atención al cliente post-venta.";
String flu01 = "Identificar el flujo de ingresos para lograr una estabilidad económica. Se determina el valor que nuestros cliente van a pargar por los servicios prestados, teniendo en cuenta:";
String flu02 = "Venta de activos\nDiferentes usos de la tarifa\nCuotas de suscripción\nPréstamo/alquiler\nConcesión de licencias\nComisiones de intermediación\nPublicidad";
String cos01 = "Establecer los costos que se invertirán en el negocio, costos que se tiene en cueta después de desarrollada cada uno de los aspectos anteriores.";
String cos02 = "Los costos fijos: ";
String cos03 = "Los costos variables: ";
String cos04 = "Salarios, arriendos, etc.";
String cos05 = "Son variados dependiendo del";
String rec01 = "Hace referencia a todos los procesos internos que son necesarios e importantes para llevar a cabo el proyecto. Posee tres fases:";
String rec02 = "Producción: ";
String rec03 = "Resolución de problemas: ";
String rec04 = "Plataforma / Red: ";
String rec05 = "Diseño, toma de decisiones y entrega de un producto.";
String rec06 = "Servicios de consulta para clientes individuales o grupos.";
String rec07 = "Modelos de negocio diseñados como una plataforma para la prestación de servicios.";
String rel01 = "Relaciones que una empresa tiene con segmento de clientes, estas pueden ser personales o automatizadas, las cuales se unen para trabajar por un mismo fin. Puede ser:";
String rel02 = "Asistencia personal\nAutoservicio\nServicios automatizados\nComunidades\nCo-creación";
String ace01 = "Esta aplicación es elaborada como proyecto de grado, el cual es netamente académico, para obtener el título profesional de Diseño Gráfico de la Universitaria De Investigación y Desarollo 'UDI'";
String ace02 = "Diseñado por:\nJennifer Guiterrez Castillo\nMaylin Brillith Manosalva Galvis";

boolean sobre(float xc, float dia, float xy){
  float disx = xc - mouseX;
  float disy = xy - mouseY;
  if(sqrt(sq(disx)+sq(disy)) <= dia){
    return true;
  }else{
    return false;
  }
}

boolean sobreinicio(float xc, float dia, float xy){
  float disx = xc - mouseX;
  float disy = xy - mouseY;
  if(sqrt(sq(disx)+sq(disy)) <= dia){
    return true;
  }else{
    return false;
  }
}

boolean sobreican(float xc, float dia, float xy){
  float disx = xc - mouseX;
  float disy = xy - mouseY;
  if((sqrt(sq(disx)+sq(disy))) <= dia){
    return true;
  }else{
    return false;
  }
}

boolean sobreorigen(float xc, float dia, float xy){
  float disx = xc - mouseX;
  float disy = xy - mouseY;
  if((sqrt(sq(disx)+sq(disy))) <= 50){
    return true;
  }else{
    return false;
  }
}

boolean sobreaprende(float xc, float dia, float xy){
  float disx = xc - mouseX;
  float disy = xy - mouseY;
  if((sqrt(sq(disx)+sq(disy))) <= dia){
    return true;
  }else{
    return false;
  }
}

boolean sobreprincipal(){
  float disx = 275 - mouseX;
  float disy = 475 - mouseY;
  if((sqrt(sq(disx)+sq(disy))) <= 16){
    imageMode(CENTER);
    noStroke();
    fill(94);
    rect(0,460,550,40);
    image(principal,ancho/2,480,32,32);
    fill(255);
    ellipse(300,480,10,10);
    ellipse(250,480,10,10);
    return true;
  }else{
    noStroke();
    fill(94);
    rect(0,460,550,40);
    image(principal,ancho/2,480,32,32);
    return false;
  }
}

void mousePressed() {
  if(sobreinicio(103,50,280) == true && estado == 2) {
    estado = 3;
  }
  if(sobreican(219,50,280) == true && estado == 2) {
    estado = 4;
  }
  if(sobreorigen(331,50,280) == true && estado == 2) {
    estado = 5;
  }
  if(sobreaprende(447,50,280) == true && estado == 2){
    estado = 6;
  }
  if(sobreinicio(144.5,37.5,195.5) == true && (estado == 3 || estado == 4 || estado == 5 || estado == 6)) {
    estado = 3;
  }
  if(sobreican(231.5,37.5,195.5) == true && (estado == 3 || estado == 4 || estado == 5 || estado == 6)) {
    estado = 4;
  }
  if(sobreorigen(318.5,37.5,195.5) == true && (estado == 3 || estado == 4 || estado == 5 || estado == 6)) {
    estado = 5;
  }
  if(sobreaprende(405.5,37.5,195.5) == true && (estado == 3 || estado == 4 || estado == 5 || estado == 6)){
    estado = 6;
  }
  if(sobreprincipal() == true){
    estado = 7;
  }
  if(sobre(428,12,172) == true && estado == 7){
    estado = 2;
  }
  if(sobre(157.5,32.5,208) == true && estado == 7){
    estado = 3;
  }
  if(sobre(232.5,32.5,208) == true && estado == 7){
    estado = 8;
  }
  if(sobre(307.5,32.5,208) == true && estado == 7){
    estado = 9;
  }
  if(sobre(382.5,32.5,208) == true && estado == 7){
    estado = 10;
  }
  if(sobre(157.5,32.5,298) == true && estado == 7){
    estado = 11;
  }
  if(sobre(232.5,32.5,298) == true && estado == 7){
    estado = 12;
  }
  if(sobre(307.5,32.5,298) == true && estado == 7){
    estado = 13;
  }
  if(sobre(382.5,32.5,298) == true && estado == 7){
    estado = 14;
  }
  if(sobre(200,32.5,388) == true && estado == 7){
    estado = 15;
  }
  if(sobre(275,32.5,388) == true && estado == 7){
    estado = 16;
  }
  if(sobre(350,32.5,388) == true && estado == 7){
    estado = 17;
  }
  redraw();
}

void setup(){
  size(550,500,P3D);
  logo = loadImage("ican-22.png");
  inicio = loadImage("ican-23.png");
  ican = loadImage("ican-24.png");
  origen = loadImage("ican-25.png");
  aprende = loadImage("ican-26.png");
  segmento = loadImage("ican-27.png");
  alianzas = loadImage("ican-28.png");
  propuesta = loadImage("ican-29.png");
  actividades = loadImage("ican-30.png");
  canal = loadImage("ican-31.png");
  flujo = loadImage("ican-32.png");
  costos = loadImage("ican-33.png");
  recursos = loadImage("ican-34.png");
  relacion = loadImage("ican-35.png");
  acerca = loadImage("ican-49.png");
  udi = loadImage("logo_udi.png");
  flecha = loadImage("ican-36.png");
  principal = loadImage("ican-37.png");
  cerrar = loadImage("ican-38.png");
  fondo = loadImage("textura-fondo.jpg");
  fondo01 = loadImage("ican-50.png");
  fondo01b = loadImage("ican-50b.png");
  fondo02 = loadImage("ican-53.png");
  fondo03 = loadImage("ican-51.png");
  fondo04 = loadImage("ican-52.png");
  wlogo = logo.width;
  hlogo = logo.height;
}

void draw(){
  if(estado == 1){
    image(fondo,0,0,550,500);
    if(millis()<3800){
      image(logo,131,104,288,292);
    }
    if(millis()>3800 && millis()<7500){
      for ( int i = 0; i < (wlogo/2); i++) {
    // Begin loop for rows
        for ( int j = 0; j < (hlogo/2); j++) {
          int x = i*2 + 1;  // x position
          int y = j*2 + 1;  // y position
          int loc = x + y*logo.width;  // Pixel array location
          color c = logo.pixels[loc];  // Grab the color
          // Calculate a z position as a function of mouseX and pixel brightness
          float z = ((millis()-3800)/2 / float(width)) * brightness(logo.pixels[loc]) - 20.0;
          // Translate to the location, set fill and stroke, and draw the rect
          pushMatrix();
          translate(x + 100, y + 50, z);
          fill(c, 204);
          noStroke();
          rectMode(CENTER);
          rect(0, 0, 2, 2);
          popMatrix();
        }
      }
    }
    if(millis()>7500){
      rectMode(CORNER);
      estado = 2;
      float ms = millis();
      ms1 = ms;
    }
  }
  if(estado == 2 && dms1<550){
    textFont(fuente01);
    textAlign(CENTER,CENTER);
    imageMode(CENTER);
    image(fondo,ancho/2,alto/2,ancho,alto);
    image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
    image(inicio,103,280,imgini,imgini);
    fill(94);
    text("Inicio",103,335);
    image(ican,219,280,imgini,imgini);
    fill(94);
    text("Ican",219,335);
    image(origen,331,280,imgini,imgini);
    fill(94);
    text("Origen",331,335);
    image(aprende,447,280,imgini,imgini);
    fill(94);
    text("Aprende",447,335);
    noStroke();
    fill(94);
    float dms = millis()-ms1;
    dms1 = dms;
    rect(0,460,dms1,40);
    image(principal,ancho/2,480,32,32);
  }
  if(estado == 2 && dms1>=550){
    if(sobreinicio(103,50,280) == true){
      textFont(fuente01);
      textAlign(CENTER,CENTER);
      imageMode(CENTER);
      image(fondo,ancho/2,alto/2,ancho,alto);
      image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
      image(inicio,103,280,imgini,imgini);
      fill(190,193,183);
      text("Inicio",103,335);
      image(ican,219,280,imgini,imgini);
      fill(94);
      text("Ican",219,335);
      image(origen,331,280,imgini,imgini);
      fill(94);
      text("Origen",331,335);
      image(aprende,447,280,imgini,imgini);
      fill(94);
      text("Aprende",447,335);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
    }
    if(sobreican(219,50,280) == true){
      textFont(fuente01);
      textAlign(CENTER,CENTER);
      imageMode(CENTER);
      image(fondo,ancho/2,alto/2,ancho,alto);
      image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
      image(inicio,103,280,imgini,imgini);
      fill(94);
      text("Inicio",103,335);
      image(ican,219,280,imgini,imgini);
      fill(190,193,183);
      text("Ican",219,335);
      image(origen,331,280,imgini,imgini);
      fill(94);
      text("Origen",331,335);
      image(aprende,447,280,imgini,imgini);
      fill(94);
      text("Aprende",447,335);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
    }
    if(sobreorigen(331,50,280) == true){
      textFont(fuente01);
      textAlign(CENTER,CENTER);
      imageMode(CENTER);
      image(fondo,ancho/2,alto/2,ancho,alto);
      image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
      image(inicio,103,280,imgini,imgini);
      fill(94);
      text("Inicio",103,335);
      image(ican,219,280,imgini,imgini);
      fill(94);
      text("Ican",219,335);
      image(origen,331,280,imgini,imgini);
      fill(190,193,183);
      text("Origen",331,335);
      image(aprende,447,280,imgini,imgini);
      fill(94);
      text("Aprende",447,335);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
    }
    if(sobreaprende(447,50,280) == true){
      textFont(fuente01);
      textAlign(CENTER,CENTER);
      imageMode(CENTER);
      image(fondo,ancho/2,alto/2,ancho,alto);
      image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
      image(inicio,103,280,imgini,imgini);
      fill(94);
      text("Inicio",103,335);
      image(ican,219,280,imgini,imgini);
      fill(94);
      text("Ican",219,335);
      image(origen,331,280,imgini,imgini);
      fill(94);
      text("Origen",331,335);
      image(aprende,447,280,imgini,imgini);
      fill(190,193,183);
      text("Aprende",447,335);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
    }
    sobreprincipal();
    if(sobreinicio(103,50,280) == false && sobreican(219,50,280) == false && sobreorigen(331,50,280) == false && sobreaprende(447,50,280) == false && sobreprincipal() == false){
      textFont(fuente01);
      textAlign(CENTER,CENTER);
      imageMode(CENTER);
      image(fondo,ancho/2,alto/2,ancho,alto);
      image(logo,ancho/2,((alto-40)/2)/2,wlogo/1.5,hlogo/1.5);
      image(inicio,103,280,imgini,imgini);
      fill(94);
      text("Inicio",103,335);
      image(ican,219,280,imgini,imgini);
      fill(94);
      text("Ican",219,335);
      image(origen,331,280,imgini,imgini);
      fill(94);
      text("Origen",331,335);
      image(aprende,447,280,imgini,imgini);
      fill(94);
      text("Aprende",447,335);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
    }
  }
  if(estado == 3){ //inicio
    image(fondo,275,250,550,500);
    imageMode(CORNER);
    image(fondo01,50,192.5,450,252.5);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    fill(255);
    textFont(fuente01);
    textSize(14);
    image(inicio,144.5,195.5,75,75);
    text("Inicio",144.5,248);
    image(ican,231.5,195.5,75,75);
    text("Ican",231.5,248);
    image(origen,318.5,195.5,75,75);
    text("Origen",318.5,248);
    image(aprende,405.5,195.5,75,75);
    text("Aprende",405.5,248);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,CENTER);
    text(ini,68,270,406,170);
    textFont(fuente01);
    fill(174,60,79);
    triangle(152,260,144.5,267.5,137,260);
    if(sobreican(231.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(0);
      text("Ican",231.5,248);
      fill(255);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ini,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(152,260,144.5,267.5,137,260);
    }
    if(sobreorigen(318.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      fill(0);
      text("Origen",318.5,248);
      fill(255);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ini,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(152,260,144.5,267.5,137,260);
    }
    if(sobreaprende(405.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      fill(0);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ini,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(152,260,144.5,267.5,137,260);
    }
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 4){ //ican
    image(fondo,275,250,550,500);
    imageMode(CORNER);
    image(fondo01,50,192.5,450,252.5);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    fill(255);
    textFont(fuente01);
    textSize(14);
    image(inicio,144.5,195.5,75,75);
    text("Inicio",144.5,248);
    image(ican,231.5,195.5,75,75);
    text("Ican",231.5,248);
    image(origen,318.5,195.5,75,75);
    text("Origen",318.5,248);
    image(aprende,405.5,195.5,75,75);
    text("Aprende",405.5,248);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,CENTER);
    text(ica,68,270,406,170);
    textFont(fuente01);
    fill(174,60,79);
    triangle(224,260,231.5,267.5,239,260);
    if(sobreinicio(144.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(0);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(255);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ica,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(224,260,231.5,267.5,239,260);
    }
    if(sobreorigen(318.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      fill(0);
      text("Origen",318.5,248);
      fill(255);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ica,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(224,260,231.5,267.5,239,260);
    }
    if(sobreaprende(405.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      fill(0);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ica,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(224,260,231.5,267.5,239,260);
    }
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 5){ //origen
    image(fondo,275,250,550,500);
    imageMode(CORNER);
    image(fondo01,50,192.5,450,252.5);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    fill(255);
    textFont(fuente01);
    textSize(14);
    image(inicio,144.5,195.5,75,75);
    text("Inicio",144.5,248);
    image(ican,231.5,195.5,75,75);
    text("Ican",231.5,248);
    image(origen,318.5,195.5,75,75);
    text("Origen",318.5,248);
    image(aprende,405.5,195.5,75,75);
    text("Aprende",405.5,248);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,CENTER);
    text(ori,68,270,406,170);
    textFont(fuente01);
    fill(174,60,79);
    triangle(311,260,318.5,267.5,326,260);
    if(sobreinicio(144.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(0);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(255);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ori,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(311,260,318.5,267.5,326,260);
    }
    if(sobreican(231.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(0);
      text("Ican",231.5,248);
      fill(255);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ori,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(311,260,318.5,267.5,326,260);
    }
    if(sobreaprende(405.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      fill(0);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(ori,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(311,260,318.5,267.5,326,260);
    }
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 6){ //aprende 
    image(fondo,275,250,550,500);
    imageMode(CORNER);
    image(fondo01b,50,192.5,450,252.5);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    fill(255);
    textFont(fuente01);
    textSize(14);
    image(inicio,144.5,195.5,75,75);
    text("Inicio",144.5,248);
    image(ican,231.5,195.5,75,75);
    text("Ican",231.5,248);
    image(origen,318.5,195.5,75,75);
    text("Origen",318.5,248);
    image(aprende,405.5,195.5,75,75);
    text("Aprende",405.5,248);
    image(flecha,500,70,24,24);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,CENTER);
    text(apr,68,270,406,170);
    textFont(fuente01);
    fill(174,60,79);
    triangle(398,260,405.5,267.5,413,260);
    if(sobreinicio(144.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(0);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(255);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(apr,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(398,260,405.5,267.5,413,260);
    }
    if(sobreican(231.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      fill(0);
      text("Ican",231.5,248);
      fill(255);
      image(origen,318.5,195.5,75,75);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(apr,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(398,260,405.5,267.5,413,260);
    }
    if(sobreorigen(318.5,37.5,195.5) == true){
      image(fondo,275,250,550,500);
      imageMode(CORNER);
      image(fondo01,50,192.5,450,252.5);
      fill(94);
      rect(0,460,550,40);
      imageMode(CENTER);
      image(principal,ancho/2,480,32,32);
      image(logo,275,80,144,146);
      fill(255);
      textFont(fuente01);
      textSize(14);
      image(inicio,144.5,195.5,75,75);
      text("Inicio",144.5,248);
      image(ican,231.5,195.5,75,75);
      text("Ican",231.5,248);
      image(origen,318.5,195.5,75,75);
      fill(0);
      text("Origen",318.5,248);
      image(aprende,405.5,195.5,75,75);
      fill(255);
      text("Aprende",405.5,248);
      textFont(fuente02);
      fill(0);
      textAlign(CENTER,CENTER);
      text(apr,68,270,406,170);
      textFont(fuente01);
      fill(174,60,79);
      triangle(398,260,405.5,267.5,413,260);
    }
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 7){ //principal
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo02,275,305.5,325,285);
    image(cerrar,428,172,24,24);
    image(inicio,157.5,208,65,65);
    image(segmento,232.5,208,65,65);
    image(alianzas,307.5,208,65,65);
    image(propuesta,382.5,208,65,65);
    image(actividades,157.5,298,65,65);
    image(canal,232.5,298,65,65);
    image(flujo,307.5,298,65,65);
    image(costos,382.5,298,65,65);
    image(recursos,200,388,65,65);
    image(relacion,275,388,65,65);
    image(acerca,350,388,65,65);
    textFont(fuente01);
    textSize(12);
    textAlign(CENTER,TOP);
    fill(255);
    text("Inicio",157.5,241);
    text("Segmento",232.5,241);
    text("de Cliente",232.5,253);
    text("Alianzas",307.5,241);
    text("Propuesta",382.5,241);
    text("de Valor",382.5,253);
    text("Actividades",157.5,241+90);
    text("Claves",157.5,253+90);
    text("Canal",232.5,241+90);
    text("Flujo de",307.5,241+90);
    text("Ingresos",307.5,253+90);
    text("Costos",382.5,241+90);
    text("Recursos",200,421);
    text("Claves",200,433);
    text("Relación",275,421);
    text("Cliente",275,433);
    text("Acerca de",350,421);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 8){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Segmento de Cliente",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(segmento,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(seg01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(seg02,75,310);
    int lt = (int)textWidth(seg02);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(seg06,75+lt,310);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(seg03,75,330);
    lt = (int)textWidth(seg03);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(seg07,75+lt,330);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(seg04,75,350);
    lt = (int)textWidth(seg04);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(seg08,75+lt,350);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(seg05,75,370);
    lt = (int)textWidth(seg05);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(seg09,75+lt,370);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 9){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Alianzas",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(alianzas,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(ali01,75,250,400,80);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(ali02,75,325);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 10){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Propuesta de Valor",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(propuesta,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(pro01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(pro02,75,290);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 11){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Actividades Clave",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(actividades,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(act01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(act02,75,310);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 12){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Canal",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(canal,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(can01,75,250,400,80);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(can02,75,317.5,400,40);
    int lt = (int)textWidth(can02);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(can06,75+lt,317.5,400-lt,40);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(can03,75,352.5,400,40);
    lt = (int)textWidth(can03);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(can07,75+lt,352.5,400-lt,40);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(can04,75,387.5,400,40);
    lt = (int)textWidth(can04);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(can08,75+lt,387.5,400-lt,40);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(can05,75,405,400,40);
    lt = (int)textWidth(can05);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(can09,75+lt,405,400-lt,40);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 13){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Flujo de Ingresos",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(flujo,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(flu01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(flu02,75,307.5);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 14){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Costos",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(costos,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(cos01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(cos02,75,307.5);
    int lt = (int)textWidth(cos02);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(cos04,75+lt,307.5,400-lt,40);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(cos03,75,325,400,40);
    lt = (int)textWidth(cos03);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(cos05,75+lt,325,400-lt,40);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 15){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Recursos Claves",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(recursos,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(rec01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(rec02,75,307.5);
    int lt = (int)textWidth(rec02);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(rec05,75+lt,307.5,400-lt,40);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(rec03,75,342.5,400,40);
    lt = (int)textWidth(rec03);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(rec06,75+lt,342.5,400-lt,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(rec04,75,395,400,40);
    lt = (int)textWidth(rec04);
    textFont(fuente02);
    textAlign(LEFT,TOP);
    text(rec05,75+lt,395,400-lt,40);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 16){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Relacion Cliente",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo03,275,325,450,240);
    image(flecha,50,273,24,24);
    image(relacion,120,200,75,75);
    textFont(fuente02);
    fill(0);
    textAlign(CENTER,TOP);
    text(rel01,75,250,400,60);
    textFont(fuente03);
    textAlign(LEFT,TOP);
    text(rel02,75,307.5);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
  if(estado == 17){
    image(fondo,275,250,550,500);
    fill(94);
    rect(0,460,550,40);
    imageMode(CENTER);
    textFont(fuente01);
    fill(174,60,79);
    textAlign(LEFT,CENTER);
    text("Acerca de",165,190);
    image(principal,ancho/2,480,32,32);
    image(logo,275,80,144,146);
    image(fondo04,275,325,450,240);
    image(acerca,120,200,75,75);
    textFont(fuente01);
    fill(255);
    textAlign(CENTER,TOP);
    textSize(16);
    text(ace01,75,245,400,80);
    image(udi,275,354,250,47);
    text(ace02,75,380,400,60);
    if(sobreprincipal() == true){
      imageMode(CENTER);
      noStroke();
      fill(94);
      rect(0,460,550,40);
      image(principal,ancho/2,480,32,32);
      fill(255);
      ellipse(300,480,10,10);
      ellipse(250,480,10,10);
    }
  }
}


