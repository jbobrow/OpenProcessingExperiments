
import netscape.javascript.*;

PFont f = createFont("Arial",30,true);
PFont z = createFont("Verdana",17,true);
PFont p = createFont("Verdana",10,true);
PFont myFont;
String nom = "Navegueu sobre les caselles per veure els recursos educatius\n";
String web = "\nPremeu la casella en concret per entrar a la seva pàgina web";
int pantalla = 0;
Eye e1, e2, e3;
PImage webImg;

float x=0;
float y=0;
float R=280;
float angulo;

int xOne = 0;

void setup() {
  size(1200,600);
  
  //String[] fontList = PFont.list();
  //println(fontList);
  
  noStroke();
  e1 = new Eye( 250,  90, 120);
  e2 = new Eye( 164, 385,  80);  
  e3 = new Eye( 1050, 450, 220);
  
  String url = "http://www.delorenzo.es/_Media/logo_universitat_de_lleida_med.jpeg";
  // Load image from a web server
  webImg = loadImage("logo.jpeg");
}

void draw() {
  
  if (pantalla == 0) { // Pantalla inicial
    background(255);
  
    e1.update(mouseX, mouseY);
    e2.update(mouseX, mouseY);
    e3.update(mouseX, mouseY);

    e1.display();
    e2.display();
    e3.display();
    
    noFill();
    stroke (193, 70, 128);
    curve(-400, -400, width/2,height/2, 3*(width/4),height/2, 1200, -700);   
    curve(21, -1200, width/2,height/2, width/4,height/2, 600, -100);
    curve(-650, -40, width/4,height/2, 3*(width/4),height/2, 800, -540);
    curve(-34, -440, width/4,height/2, 3*(width/4),height/2, 20, -10);
     
    noStroke();
    fill(227, 190, 226);
    ellipse(width/2+55,height/2-7, 65, 65);
    ellipse(width/4+55,height/2-7, 65, 65);
    ellipse(3*(width/4)+55,height/2-7, 65, 65);
    
    fill(175, 117, 158);
    ellipse(width/2-55,height/2-7, 65, 65);
    ellipse(width/4-55,height/2-7, 65, 65);
    ellipse(3*(width/4)-55,height/2-7, 65, 65);
    
    fill (193, 70, 128);
    if (overCircle(width/2,height/2-7, 65)) ellipse(width/2,height/2-7, 190, 190);
    ellipse(width/2,height/2-7, 65, 65);
    if (overCircle(width/4,height/2-7, 65)) ellipse(width/4,height/2-7, 190, 190);
    ellipse(width/4,height/2-7, 65, 65);
    if (overCircle(3*(width/4),height/2-7, 65))ellipse(3*(width/4),height/2-7, 190, 190);
    ellipse(3*(width/4),height/2-7, 65, 65);
    
    fill(255);
    stroke (193, 70, 128);
    textFont(z,20);
    textAlign(CENTER);
    text("Hibridacions",width/2,height/2);
    text("Insert Coin",width/4,height/2);
    text("Què rizomem?",3*(width/4),height/2);
    
    image(webImg,3*(width/4)+150, (height/2)-270);
  }
  
  else if (pantalla == 1) { // Pantalla mapa
    
    // Colors pantalla, font, etc.
    background(255);

    // Botó torna
    textFont(z);
    noStroke();
    fill(193, 70, 128);
    if (overCircle(width/8-70,height/2-220, 65)) ellipse((width/8)-70,(height/2)-220, 85, 85);
    ellipse((width/8)-70,(height/2)-220, 65, 65); // Botó torna
    //if (overCircle(3*(width/4)+220, (height/2)+220, 65)) ellipse(3*(width/4)+220, (height/2)+220, 85, 85);
    //ellipse(3*(width/4)+220, (height/2)+220, 65, 65); // Botó +info
    fill(255);
    textAlign(CENTER);
    text("Torna",(width/8)-70,(height/2)-215);
    //text("+info",3*(width/4)+220, (height/2)+225);
    
    textFont(p);
    textAlign(LEFT);
    fill(23, 214, 250); //Arts esceniques
    rect((width/8)-130, height/2, 25, 10, 7);
    fill(0);
    text("Arts escèniques",(width/8)-100, height/2+7);
    
    fill(250, 178, 23); //Arts visuals
    rect((width/8)-130, height/2+20, 25, 10, 7);
    fill(0);
    text("Arts visuals",(width/8)-100, height/2+27);
    
    fill(132, 49, 229);
    rect((width/8)-130, height/2+40, 25, 10, 7);
    fill(0);
    text("Associacions",(width/8)-100, height/2+47);
    
    fill(148, 226, 245);
    rect((width/8)-130, height/2+60, 25, 10, 7);
    fill(0);
    text("Fauna",(width/8)-100, height/2+67);
    
    fill(138, 175, 51);
    rect((width/8)-130, height/2+80, 25, 10, 7);
    fill(0);
    text("Espais naturals",(width/8)-100, height/2+87);
    
    fill(51, 112, 175);
    rect((width/8)-130, height/2+100, 25, 10, 7);
    fill(0);
    text("Esports",(width/8)-100, height/2+107);
    
    fill(255, 187, 144);
    rect((width/8)-130, height/2+120, 25, 10, 7);
    fill(0);
    text("Festes i Fires",(width/8)-100, height/2+127);
    
    fill(245, 188, 245);
    rect((width/8)-130, height/2+140, 25, 10, 7);
    fill(0);
    text("Institucions educatives",(width/8)-100, height/2+147);
    
    fill(46, 240, 76);
    rect((width/8)-130, height/2+160, 25, 10, 7);
    fill(0);
    text("Les rutes",(width/8)-100, height/2+167);
    
    fill(193, 193, 115);
    rect((width/8)-130, height/2+180, 25, 10, 7);
    fill(0);
    text("Monuments",(width/8)-100, height/2+187);
    
    fill(193, 159, 115);
    rect((width/8)-130, height/2+200, 25, 10, 7);
    fill(0);
    text("Música",(width/8)-100, height/2+207);
    
    fill(177, 250, 214);
    rect((width/8)-130, height/2+220, 25, 10, 7);
    fill(0);
    text("Patrimoni industrial",(width/8)-100, height/2+227);
    
    fill(247, 112, 200);
    rect((width/8)-130, height/2+240, 25, 10, 7);
    fill(0);
    text("Programes didàctics",(width/8)-100, height/2+247);
    
    fill(152, 152, 152);
    rect((width/8)-130, height/2+260, 25, 10, 7);
    fill(0);
    text("Recursos (no específics)",(width/8)-100, height/2+267);
     
    image(webImg,3*(width/4)+150, (height/2)-270);
    
    // Calculem elipse de rodones    
    for (int i= 0; i<94; i++ ) {
      if (i < 2) {
         noFill();
         stroke(23, 214, 250);
         curve(2000, 2000, x,y, width/2 + R*cos(0.0668*(i+30)),height/2 + R*sin(0.0668*(i+30)), 2000, 2000);
         noStroke();
         fill (23, 214, 250); 
      }
      else if (i >= 2 && i <15) {
         if (i == 4 || i == 7 || i == 9 || i == 12) {
             noFill();
             stroke(250, 178, 23);
             curve(1000, 1000, x,y, width/2 + R*cos(0.0668*(i+40)),height/2 + R*sin(0.0668*(i+40)), 1000, 1000);
             noStroke();
         }
         fill(250, 178, 23);
      }
      else if (i >= 14 && i <22) {
        if (i == 16 || i == 19 || i == 21) {
             noFill();
             stroke(132, 49, 229);
             curve(1200, 1200, x,y, width/2 + R*cos(0.0668*(i+70)),height/2 + R*sin(0.0668*(i+70)), 500, 500);
             noStroke();
         }
        fill(132, 49, 229);
      }
      else if (i >= 21 && i <23) {
        noFill();
        stroke(148, 226, 245);
        curve(200, 200, x,y, width/2 + R*cos(0.0668*(i+50)),height/2 + R*sin(0.0668*(i+50)), 200, 200);
        noStroke();
        fill(148, 226, 245);
      }
      else if (i >= 22 && i <25) {
        noFill();
        stroke(138, 175, 51);
        curve(200, 200, x,y, width/2 + R*cos(0.0668*(i+45)),height/2 + R*sin(0.0668*(i+45)), 200, 200);
        noStroke();
        fill(138, 175, 51);
      }
      else if (i >= 24 && i <30) {
        if (i == 25 || i == 27 || i == 29) {
             noFill();
             stroke(51, 112, 175);
             curve(1300, 1300, x,y, width/2 + R*cos(0.0668*(i+40)),height/2 + R*sin(0.0668*(i+40)), 600, 600);
             noStroke();
         }
        fill(51, 112, 175);
      }
      else if (i >= 29 && i <36) {
        if (i == 30 || i == 32 || i == 33) {
             noFill();
             stroke(255, 187, 144);
             curve(600, 600, x,y, width/2 + R*cos(0.0668*(i+30)),height/2 + R*sin(0.0668*(i+30)), 100, 100);
             noStroke();
        }
        fill(255, 187, 144);
      }
      else if (i >= 35 && i <46) {
        if (i == 37 || i == 38 || i == 40 || i == 42 || i == 43 || i == 45) {
             noFill();
             stroke(245, 188, 245);
             curve(600, 600, x,y, width/2 + R*cos(0.0668*(i+20)),height/2 + R*sin(0.0668*(i+20)), 100, 100);
             noStroke();
        }
        fill(245, 188, 245);
      }
      else if (i >= 45 && i <53) {
         if (i != 52 && i != 47) {
           noFill();
           stroke(46, 240, 76);
           curve(100, 100, x,y, width/2 + R*cos(0.0668*(i*6+60)),height/2 + R*sin(0.0668*(i*6+60)), 300, 300);
           noStroke();
         }
         fill(46, 240, 76);
      }
      else if (i >= 52 && i <64) {
         /*if (i != 55 && i != 60) {
           noFill();
           stroke(193, 193, 115);
           curve(200, 200, x,y, width/2 + R*cos(0.0668*(i*3+30)),height/2 + R*sin(0.0668*(i*3+30)), 1100, 1100);
           noStroke();
         }*/
        fill(193, 193, 115);
      }
      else if (i >= 63 && i <69) fill(193, 159, 115);
      else if (i >= 68 && i <73) fill(177, 250, 214);
      else if (i >= 72 && i <87) {
        if (i == 74 || i == 81) {
           noFill();
           stroke(247, 112, 200);
           curve(2000, -2000, x,y, width/2 + R*cos(0.0668*(i+10)),height/2 + R*sin(0.0668*(i+10)), 500, 500);
           noStroke();
         }
        fill(247, 112, 200);
      }
      else if (i >= 86 && i <94) fill(152, 152, 152);
      
      angulo = 0.0668*i;
      if (overCircle(int(x),int(y),16)) ellipse (x,y,20,20);
      ellipse (x,y,16,16);
      fill(255);
      //textAlign(CENTER);
      //text(i+1,x,y+3);
      x = width/2 + R*cos(angulo) ;
      y = height/2 + R*sin(angulo);
    }
    
    //textFont(z);
    myFont = createFont("Calibri Bold", 21);
    textFont(myFont);
    strokeWeight(2);
    fill(0);
    textAlign (CENTER);
    text (nom, width/2,height/2);
    text (web, width/2,height/2+45);
 
    if (overCircle(int(width/2 + R*cos(0.067*93)),int(height/2 + R*sin(0.067*93)),16)) {
        nom = "Teatre Municipal l’Escorxador";
        web = "http://cultura.paeria.es/ca/artsEsceniques/escorxador/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*0)),int(height/2 + R*sin(0.067*0)),16)) {
        nom = "Centre de Titelles de Lleida";
        web = "http://www.titelleslleida.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*1)),int(height/2 + R*sin(0.067*1)),16)) {
        nom = "Museu d’Art Jaume Morera";
        web = "http://mmorera.paeria.es/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*2)),int(height/2 + R*sin(0.067*2)),16)) {
        nom = "Museu de Lleida Diocesà i Comarcal";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*3)),int(height/2 + R*sin(0.067*3)),15)) {
        nom = "Sala Leandre Cristòfol ";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*4)),int(height/2 + R*sin(0.067*4)),16)) {
        nom = "Centre d’art la Panera";
        web = "http://www.lapanera.cat/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*5)),int(height/2 + R*sin(0.067*5)),16)) {
        nom = "Espai Cavallers: centre d’artistes i artesans (espai 3)";
        web = "http://www.espaicavallers.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*6)),int(height/2 + R*sin(0.067*6)),16)) {
        nom = "Sala d’exposicions de la Cambra de Comerç i Indústria";
        web = "http://imac.paeria.es/ca/artsVisuals/salesMunicipals/\ncambraComerc.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*7)),int(height/2 + R*sin(0.067*7)),15)) {
        nom = "Sala Municipal d’Exposicions de Sant Joan";
        web = "http://imac.paeria.es/es/artsVisuals/salesMunicipals/\nsalaStJoan.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*8)),int(height/2 + R*sin(0.067*8)),16)) {
        nom = "Institut d’Estudis Ilerdencs";
        web = "http://www.fpiei.es/ca/index.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*9)),int(height/2 + R*sin(0.067*9)),16)) {
        nom = "Institut Municipal d’Acció Cultural";
        web = "http://imac.paeria.es/ca/coneixerIMAC/index.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*10)),int(height/2 + R*sin(0.067*10)),16)) {
        nom = "Centre cultural i social de l’Obra Social Fundació “la Caixa”";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*11)),int(height/2 + R*sin(0.067*11)),15)) {
        nom = "Anella Cultural";
        web = "http://www.i2cat.net/i2cat/servlet/\nI2CAT.MainServlet?seccio=21_40";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*12)),int(height/2 + R*sin(0.067*12)),16)) {
        nom = "Cafè Curt";
        web = "http://www.cafedelteatre.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*13)),int(height/2 + R*sin(0.067*13)),16)) {
        nom = "Fundació Vallpalou";
        web = "http://www.fundaciovallpalou.org/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*14)),int(height/2 + R*sin(0.067*14)),16)) {
        nom = "Castellers de Lleida";
        web = "http://www.castellersdelleida.cat/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*15)),int(height/2 + R*sin(0.067*15)),15)) {
        nom = "Associació d’Amics de la Seu Vella";
        web = "http://www.amicsseuvellalleida.org/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*16)),int(height/2 + R*sin(0.067*16)),16)) {
        nom = "Associació de la Festa de Moros i Cristians";
        web = "http://www.miclleida.org/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*17)),int(height/2 + R*sin(0.067*17)),16)) {
        nom = "FECOLL (Federació de Colles de l’Aplec del Caragol)";
        web = "http://www.aplec.org/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*18)),int(height/2 + R*sin(0.067*18)),16)) {
        nom = "Orfeó Lleidatà";
        web = "http://www.orfeolleidata.cat/orfeop.php?idx=1";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*19)),int(height/2 + R*sin(0.067*19)),15)) {
        nom = "Associació cultural Neret";
        web = "http://www.neret.org/2008/sec/inici/index.php";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*20)),int(height/2 + R*sin(0.067*20)),16)) {
        nom = "Associació lleidatana per a la síndrome de Down";
        web = "info@downlleida.org";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*21)),int(height/2 + R*sin(0.067*21)),16)) {
        nom = "Centre de recuperació de la fauna salvatge de Vallcalent";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*22)),int(height/2 + R*sin(0.067*22)),16)) {
        nom = "Parc Municipal de la Mitjana";
        web = "http://www.lleidatur.com/cat/\nla_mitjana_turisme_accessible.html";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*23)),int(height/2 + R*sin(0.067*23)),15)) {
        nom = "El camí del riu";
        web = "http://sostenibilitat.paeria.cat/espais-naturals/\nel-cami-del-riu";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*24)),int(height/2 + R*sin(0.067*24)),16)) {
        nom = "Centre Excursionista de Lleida";
        web = "http://www.cel.cat/index.htm";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*25)),int(height/2 + R*sin(0.067*25)),16)) {
        nom = "Unió Esportiva de Lleida";
        web = "http://www.unioesportivalleida.cat/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*26)),int(height/2 + R*sin(0.067*26)),16)) {
        nom = "Club esportiu de bàsquet de Lleida";
        web = "http://www.lleidabasquet.com/ca/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*27)),int(height/2 + R*sin(0.067*27)),15)) {
        nom = "Club Tir amb arc de Pardinyes";
        web = "http://www.arcpardinyes.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*28)),int(height/2 + R*sin(0.067*28)),16)) {
        nom = "Club de tennis Urgell";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*29)),int(height/2 + R*sin(0.067*29)),16)) {
        nom = "Fira Natura";
        web = "http://www.firanatura.ipcena.org/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*30)),int(height/2 + R*sin(0.067*30)),16)) {
        nom = "Festa del Medi Ambient";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*31)),int(height/2 + R*sin(0.067*31)),15)) {
        nom = "Fira de Lleida";
        web = "http://www.firadelleida.com/cat/index.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*32)),int(height/2 + R*sin(0.067*32)),16)) {
        nom = "L’Aplec del Caragol";
        web = "http://www.aplec.org/cat/index.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*33)),int(height/2 + R*sin(0.067*33)),16)) {
        nom = "Les colles sardanistes";
        web = "http://imac.paeria.es/ca/culturaPopular/sardanes/\nindex.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*34)),int(height/2 + R*sin(0.067*34)),16)) {
        nom = "Les colles geganteres";
        web = "http://imac.paeria.es/ca/culturaPopular/CPiT/\ncapgrossosGegants/index.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*35)),int(height/2 + R*sin(0.067*35)),15)) {
        nom = "Mediateca Municipal Josep Alcobé";
        web = "telecentres@paeria.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*36)),int(height/2 + R*sin(0.067*36)),16)) {
        nom = "Ludoteca la Bordeta";
        web = "ludobordeta@paeria.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*37)),int(height/2 + R*sin(0.067*37)),16)) {
        nom = "Ludoteca Centre Històric";
        web = "ludocentreh@paeria.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*38)),int(height/2 + R*sin(0.067*38)),16)) {
        nom = "Ludoteca Cappont";
        web = "ludocentreh@paeria.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*39)),int(height/2 + R*sin(0.067*39)),15)) {
        nom = "Ludoteca mòbil";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*40)),int(height/2 + R*sin(0.067*40)),16)) {
        nom = "Ludoteca de Balàfia";
        web = "ludocentreh@paeria.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*41)),int(height/2 + R*sin(0.067*41)),16)) {
        nom = "Ludoteca Arenys de Segre";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*42)),int(height/2 + R*sin(0.067*42)),16)) {
        nom = "Ludoteca el Kangur";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*43)),int(height/2 + R*sin(0.067*43)),15)) {
        nom = "Ludoteca el Pati";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*44)),int(height/2 + R*sin(0.067*44)),16)) {
        nom = "Biblioteca pública";
        web = "bplleida.cultura@gencat.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*45)),int(height/2 + R*sin(0.067*45)),16)) {
        nom = "La Lleida secreta";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=lleida_secreta";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*46)),int(height/2 + R*sin(0.067*46)),16)) {
        nom = "Pels carrers de la ciutat medieval";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=carrers_ciutat_medieval";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*47)),int(height/2 + R*sin(0.067*47)),15)) {
        nom = "Petits grans racons";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=petits_grans_racons";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*48)),int(height/2 + R*sin(0.067*48)),16)) {
        nom = "Les catedrals i els seus tresors";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=catedrals_seus_tresors";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*49)),int(height/2 + R*sin(0.067*49)),16)) {
        nom = "Els poders medievals";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=poders_medievals";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*50)),int(height/2 + R*sin(0.067*50)),16)) {
        nom = "La Lleida modernista";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=modernisme_lleidata";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*51)),int(height/2 + R*sin(0.067*51)),15)) {
        nom = "Bus turístic";
        web = "http://turisme.paeria.es/\nruta_turistica.php?id=bus_panoramic";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*52)),int(height/2 + R*sin(0.067*52)),16)) {
        nom = "La Seu Vella";
        web = "www.mhcat.net";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*53)),int(height/2 + R*sin(0.067*53)),16)) {
        nom = "El Castell de Gardeny";
        web = "gardeny@paeria.es";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*54)),int(height/2 + R*sin(0.067*54)),16)) {
        nom = "El Palau de la Paeria";
        web = "http://turisme.paeria.es/entitat.php?id=palau_paeria";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*55)),int(height/2 + R*sin(0.067*55)),15)) {
        nom = "La Catedral Nova";
        web = "www.ciudadescatedralicias.org";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*56)),int(height/2 + R*sin(0.067*56)),16)) {
        nom = "Església de Sant Llorenç";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*57)),int(height/2 + R*sin(0.067*57)),16)) {
        nom = "Antic Hospital de Santa Maria";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*58)),int(height/2 + R*sin(0.067*58)),16)) {
        nom = "Església de Sant Martí";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*59)),int(height/2 + R*sin(0.067*59)),15)) {
        nom = "Església de Sant Joan";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*60)),int(height/2 + R*sin(0.067*60)),16)) {
        nom = "El Peu del Romeu";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*61)),int(height/2 + R*sin(0.067*61)),16)) {
        nom = "L’acadèmia Mariana";
        web = "www.bisbatlleida.org";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*62)),int(height/2 + R*sin(0.067*62)),16)) {
        nom = "L’escultura Indíbil i Mandoni";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*63)),int(height/2 + R*sin(0.067*63)),15)) {
        nom = "Auditori Enric Granados";
        web = "http://imac.paeria.es/ca/musica/enricGranados/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*64)),int(height/2 + R*sin(0.067*64)),16)) {
        nom = "Cafè del Teatre. Escorxador de Lleida";
        web = "http://www.cafedelteatre.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*65)),int(height/2 + R*sin(0.067*65)),16)) {
        nom = "Orfeó Lleidatà";
        web = "http://www.orfeolleidata.cat/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*66)),int(height/2 + R*sin(0.067*66)),16)) {
        nom = "Arts centre de dansa i música";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*67)),int(height/2 + R*sin(0.067*67)),15)) {
        nom = "Orquestra simfònica\n Julià Carbonell de les Terres de Lleida";
        web = "http://www.orquestrajctlleida.com/";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*68)),int(height/2 + R*sin(0.067*68)),16)) {
        nom = "Museu de l’Automoció Roda Roda";
        web = "http://imac.paeria.es/ca/patrimonindustrial/\nmuseuRodaRoda/index.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*69)),int(height/2 + R*sin(0.067*69)),16)) {
        nom = "Museu de l’Aigua de Lleida";
        web = "http://imac.paeria.es/ca/patrimonindustrial/\nmuseuAigua/index.aspx";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*70)),int(height/2 + R*sin(0.067*70)),16)) {
        nom = "El Dipòsit del Pla de l’Aigua";
        web = "www.museudelaiguadelleida.cat";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*71)),int(height/2 + R*sin(0.067*71)),15)) {
        nom = "Estació de tren";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*72)),int(height/2 + R*sin(0.067*72)),16)) {
        nom = "Programa d’educació ambiental: Lleida en viu!";
        web = "http://sostenibilitat.paeria.cat/\nformacio-educacio-i-sensibilitzacio-ambiental/\nprograma-escolar-d2019educacio-ambiental-lleida-en-viu/\nprograma-escolar-deducacio-ambiental";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*73)),int(height/2 + R*sin(0.067*73)),16)) {
        nom = "L’Agenda 21 Escolar de Lleida";
        web = "http://sostenibilitat.paeria.cat/\nagenda-21/l2019agenda-21-escolar-de-lleida/\ninformacio-que-es-lagenda-21-escolar-de-lleida";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*74)),int(height/2 + R*sin(0.067*74)),16)) {
        nom = "Residus: Què puc fer amb...?";
        web = "http://sostenibilitat.paeria.cat/\nresidus-i-neteja-viaria/que-pots-fer-amb/\nnormes-basiques-de-neteja-urbana-i-\nrecollida-d2019escombraries-horari-etc";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*75)),int(height/2 + R*sin(0.067*75)),15)) {
        nom = "Vols conèixer la informació ambiental del municipi?";
        web = "http://sostenibilitat.paeria.cat/perfils/\ninformacio-ambiental-de-lleida/\ninformacio-ambiental-de-lleida";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*76)),int(height/2 + R*sin(0.067*76)),16)) {
        nom = "Roda esportistes";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*77)),int(height/2 + R*sin(0.067*77)),16)) {
        nom = "Guia Didàctica: La Seu Vella";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*78)),int(height/2 + R*sin(0.067*78)),16)) {
        nom = "Tallers d’Educació Visual i Plàstica";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*79)),int(height/2 + R*sin(0.067*79)),15)) {
        nom = "Mis zapatillas";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*80)),int(height/2 + R*sin(0.067*80)),16)) {
        nom = "L’altra cara de la història de l’art";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*81)),int(height/2 + R*sin(0.067*81)),16)) {
        nom = "Drets dels infants i adolescents. Mediator";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*82)),int(height/2 + R*sin(0.067*82)),16)) {
        nom = "Prevenció de violència";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*83)),int(height/2 + R*sin(0.067*83)),15)) {
        nom = "L’urbanisme contemporani a Lleida. 1860 – 1900";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*84)),int(height/2 + R*sin(0.067*84)),16)) {
        nom = "Un món de música";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*85)),int(height/2 + R*sin(0.067*85)),16)) {
        nom = "Passejada per la Lleida Medieval. Cristians, jueus i sarraïns";
        web = "http://ime.paeria.cat/dinamicaeducativa/\nrecursosdidactics/Default.asp";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*86)),int(height/2 + R*sin(0.067*86)),16)) {
        nom = "Centre cívic de Balàfia";
        web = "http://telecentres.paeria.es/telecentres/\ntiki-index.php?page=CentreCivicBalafia";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*87)),int(height/2 + R*sin(0.067*87)),15)) {
        nom = "Centre obert municipal del centre històric “casal companyia”";
        web = "http://www.promotorasocial.net/\ncatala/serveis/casal-companyia.htm";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*88)),int(height/2 + R*sin(0.067*88)),16)) {
        nom = "Centre obert municipal del centre històric “casal remolins”";
        web = "http://www.promotorasocial.net/\ncatala/serveis/casal-remolins.htm";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*89)),int(height/2 + R*sin(0.067*89)),16)) {
        nom = "Centre obert municipal “Pas a pas”";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*90)),int(height/2 + R*sin(0.067*90)),16)) {
        nom = "Centre cívic els Magraners - Club de joves Magraners";
        web = "";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*91)),int(height/2 + R*sin(0.067*91)),15)) {
        nom = "Club joves Secà";
        web = "http://telecentres.paeria.es/telecentres/\ntiki-index.php?page=CentreCivicSeca";
    }
    else if (overCircle(int(width/2 + R*cos(0.067*92)),int(height/2 + R*sin(0.067*92)),16)) {
        nom = "El bus turístic";
        web = "http://turisme.paeria.es/documents/\nca/folleto_bus_turistic2009.pdf";
    }
    /*else {
      nom = "Navegueu sobre les caselles per veure els recursos educatius\nPremeu la casella en concret si voleu entrar a la seva web";
      web = "\n\nPodeu trobar més informació pulsant el botó +info";
    } */

  }
}

void mousePressed() {
  if (pantalla == 0) {
    if (overCircle(width/2,height/2-7, 65) ) {
      pantalla = 1; 
    }
    else if (overCircle(width/4,height/2-7, 65)) {
      link("http://espaihibrid.files.wordpress.com/2013/05/introduccic3b3-del-recurs.pdf");
    }
    else if (overCircle(3*(width/4),height/2-7, 65)) {
      link("http://espaihibrid.wordpress.com");
    }
    else pantalla = 0;
  }
  else if (pantalla == 1) {
    if (overCircle((width/8)-100,(height/2)-220, 65)) pantalla = 0;
    //else if (overCircle(3*(width/4)+220, (height/2)+220, 65))link("http://www.fce.udl.es/Recursos/Recursos/guia_recursos_educatius_lleida.pdf");
    if (overCircle(int(width/2 + R*cos(0.067*93)),int(height/2 + R*sin(0.067*93)),16)) {
        link("http://cultura.paeria.es/ca/artsEsceniques/escorxador/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*0)),int(height/2 + R*sin(0.067*0)),16)) {
        link("http://www.titelleslleida.com/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*1)),int(height/2 + R*sin(0.067*1)),16)) {
        link("http://mmorera.paeria.es/");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*2)),int(height/2 + R*sin(0.067*2)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*3)),int(height/2 + R*sin(0.067*3)),15)) 
    else if (overCircle(int(width/2 + R*cos(0.067*4)),int(height/2 + R*sin(0.067*4)),16)) {
        link("http://www.lapanera.cat/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*5)),int(height/2 + R*sin(0.067*5)),16)) {
        link("http://www.espaicavallers.com/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*6)),int(height/2 + R*sin(0.067*6)),16)) {
        link("http://imac.paeria.es/ca/artsVisuals/salesMunicipals/cambraComerc.aspx");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*7)),int(height/2 + R*sin(0.067*7)),15)) {
        link("http://imac.paeria.es/es/artsVisuals/salesMunicipals/salaStJoan.aspx");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*8)),int(height/2 + R*sin(0.067*8)),16)) {
        link("http://www.fpiei.es/ca/index.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*9)),int(height/2 + R*sin(0.067*9)),16)) {
        link("http://imac.paeria.es/ca/coneixerIMAC/index.aspx");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*10)),int(height/2 + R*sin(0.067*10)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*11)),int(height/2 + R*sin(0.067*11)),15)) {
        link("http://www.i2cat.net/i2cat/servlet/I2CAT.MainServlet?seccio=21_40");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*12)),int(height/2 + R*sin(0.067*12)),16)) {
        link("http://www.cafedelteatre.com/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*13)),int(height/2 + R*sin(0.067*13)),16)) {
        link("http://www.fundaciovallpalou.org/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*14)),int(height/2 + R*sin(0.067*14)),16)) {
        link("http://www.castellersdelleida.cat/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*15)),int(height/2 + R*sin(0.067*15)),15)) {
        link("http://www.amicsseuvellalleida.org/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*16)),int(height/2 + R*sin(0.067*16)),16)) {
        link("http://www.miclleida.org/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*17)),int(height/2 + R*sin(0.067*17)),16)) {
        link("http://www.aplec.org/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*18)),int(height/2 + R*sin(0.067*18)),16)) {
        link("http://www.orfeolleidata.cat/orfeop.php?idx=1");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*19)),int(height/2 + R*sin(0.067*19)),15)) {
        link("http://www.neret.org/2008/sec/inici/index.php");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*20)),int(height/2 + R*sin(0.067*20)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*21)),int(height/2 + R*sin(0.067*21)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*22)),int(height/2 + R*sin(0.067*22)),16)) {
        link("http://www.lleidatur.com/cat/la_mitjana_turisme_accessible.html");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*23)),int(height/2 + R*sin(0.067*23)),15)) {
        link("http://sostenibilitat.paeria.cat/espais-naturals/el-cami-del-riu");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*24)),int(height/2 + R*sin(0.067*24)),16)) {
        link("http://www.cel.cat/index.htm");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*25)),int(height/2 + R*sin(0.067*25)),16)) {
        link("http://www.unioesportivalleida.cat/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*26)),int(height/2 + R*sin(0.067*26)),16)) {
        link("http://www.lleidabasquet.com/ca/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*27)),int(height/2 + R*sin(0.067*27)),15)) {
        link("http://www.arcpardinyes.com/");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*28)),int(height/2 + R*sin(0.067*28)),16))
    else if (overCircle(int(width/2 + R*cos(0.067*29)),int(height/2 + R*sin(0.067*29)),16)) {
        link("http://www.firanatura.ipcena.org/");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*30)),int(height/2 + R*sin(0.067*30)),16))
    else if (overCircle(int(width/2 + R*cos(0.067*31)),int(height/2 + R*sin(0.067*31)),15)) {
        link("http://www.firadelleida.com/cat/index.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*32)),int(height/2 + R*sin(0.067*32)),16)) {
        link("http://www.aplec.org/cat/index.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*33)),int(height/2 + R*sin(0.067*33)),16)) {
        link("http://imac.paeria.es/ca/culturaPopular/sardanes/index.aspx");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*34)),int(height/2 + R*sin(0.067*34)),16)) {
        link("http://imac.paeria.es/ca/culturaPopular/CPiT/capgrossosGegants/index.aspx");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*35)),int(height/2 + R*sin(0.067*35)),15)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*36)),int(height/2 + R*sin(0.067*36)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*37)),int(height/2 + R*sin(0.067*37)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*38)),int(height/2 + R*sin(0.067*38)),16))
    //else if (overCircle(int(width/2 + R*cos(0.067*39)),int(height/2 + R*sin(0.067*39)),15))
    //else if (overCircle(int(width/2 + R*cos(0.067*40)),int(height/2 + R*sin(0.067*40)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*41)),int(height/2 + R*sin(0.067*41)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*42)),int(height/2 + R*sin(0.067*42)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*43)),int(height/2 + R*sin(0.067*43)),15))
    //else if (overCircle(int(width/2 + R*cos(0.067*44)),int(height/2 + R*sin(0.067*44)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*45)),int(height/2 + R*sin(0.067*45)),16)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=lleida_secreta");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*46)),int(height/2 + R*sin(0.067*46)),16)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=carrers_ciutat_medieval");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*47)),int(height/2 + R*sin(0.067*47)),15)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=petits_grans_racons");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*48)),int(height/2 + R*sin(0.067*48)),16)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=catedrals_seus_tresors");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*49)),int(height/2 + R*sin(0.067*49)),16)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=poders_medievals");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*50)),int(height/2 + R*sin(0.067*50)),16)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=modernisme_lleidata");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*51)),int(height/2 + R*sin(0.067*51)),15)) {
        link("http://turisme.paeria.es/ruta_turistica.php?id=bus_panoramic");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*52)),int(height/2 + R*sin(0.067*52)),16)) {
        link("www.mhcat.net");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*53)),int(height/2 + R*sin(0.067*53)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*54)),int(height/2 + R*sin(0.067*54)),16)) {
        link("http://turisme.paeria.es/entitat.php?id=palau_paeria");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*55)),int(height/2 + R*sin(0.067*55)),15)) {
        link("www.ciudadescatedralicias.org");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*56)),int(height/2 + R*sin(0.067*56)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*57)),int(height/2 + R*sin(0.067*57)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*58)),int(height/2 + R*sin(0.067*58)),16)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*59)),int(height/2 + R*sin(0.067*59)),15)) 
    //else if (overCircle(int(width/2 + R*cos(0.067*60)),int(height/2 + R*sin(0.067*60)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*61)),int(height/2 + R*sin(0.067*61)),16)) {
        link("www.bisbatlleida.org");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*62)),int(height/2 + R*sin(0.067*62)),16))
    else if (overCircle(int(width/2 + R*cos(0.067*63)),int(height/2 + R*sin(0.067*63)),15)) {
        link("http://imac.paeria.es/ca/musica/enricGranados/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*64)),int(height/2 + R*sin(0.067*64)),16)) {
        link("http://www.cafedelteatre.com/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*65)),int(height/2 + R*sin(0.067*65)),16)) {
        link("http://www.orfeolleidata.cat/");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*66)),int(height/2 + R*sin(0.067*66)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*67)),int(height/2 + R*sin(0.067*67)),15)) {
        link("http://www.orquestrajctlleida.com/");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*68)),int(height/2 + R*sin(0.067*68)),16)) {
        link("http://imac.paeria.es/ca/patrimonindustrial/museuRodaRoda/index.aspx");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*69)),int(height/2 + R*sin(0.067*69)),16)) {
        link("http://imac.paeria.es/ca/patrimonindustrial/museuAigua/index.aspx");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*70)),int(height/2 + R*sin(0.067*70)),16)) {
        link("www.museudelaiguadelleida.cat");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*71)),int(height/2 + R*sin(0.067*71)),15)) 
    else if (overCircle(int(width/2 + R*cos(0.067*72)),int(height/2 + R*sin(0.067*72)),16)) {
        link("http://sostenibilitat.paeria.cat/formacio-educacio-i-sensibilitzacio-ambiental/programa-escolar-d2019educacio-ambiental-lleida-en-viu/programa-escolar-deducacio-ambiental");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*73)),int(height/2 + R*sin(0.067*73)),16)) {
        link("http://sostenibilitat.paeria.cat/agenda-21/l2019agenda-21-escolar-de-lleida/informacio-que-es-lagenda-21-escolar-de-lleida");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*74)),int(height/2 + R*sin(0.067*74)),16)) {
        link("http://sostenibilitat.paeria.cat/residus-i-neteja-viaria/que-pots-fer-amb/normes-basiques-de-neteja-urbana-i-recollida-d2019escombraries-horari-etc");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*75)),int(height/2 + R*sin(0.067*75)),15)) {
        link("http://sostenibilitat.paeria.cat/perfils/informacio-ambiental-de-lleida/informacio-ambiental-de-lleida");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*76)),int(height/2 + R*sin(0.067*76)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*77)),int(height/2 + R*sin(0.067*77)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*78)),int(height/2 + R*sin(0.067*78)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*79)),int(height/2 + R*sin(0.067*79)),15)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*80)),int(height/2 + R*sin(0.067*80)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*81)),int(height/2 + R*sin(0.067*81)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*82)),int(height/2 + R*sin(0.067*82)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*83)),int(height/2 + R*sin(0.067*83)),15)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*84)),int(height/2 + R*sin(0.067*84)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*85)),int(height/2 + R*sin(0.067*85)),16)) {
        link("http://ime.paeria.cat/dinamicaeducativa/recursosdidactics/Default.asp");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*86)),int(height/2 + R*sin(0.067*86)),16)) {
        link("http://telecentres.paeria.es/telecentres/tiki-index.php?page=CentreCivicBalafia");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*87)),int(height/2 + R*sin(0.067*87)),15)) {
        link("http://www.promotorasocial.net/catala/serveis/casal-companyia.htm");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*88)),int(height/2 + R*sin(0.067*88)),16)) {
        link("http://www.promotorasocial.net/catala/serveis/casal-remolins.htm");
    }
    //else if (overCircle(int(width/2 + R*cos(0.067*89)),int(height/2 + R*sin(0.067*89)),16))
    //else if (overCircle(int(width/2 + R*cos(0.067*90)),int(height/2 + R*sin(0.067*90)),16)) 
    else if (overCircle(int(width/2 + R*cos(0.067*91)),int(height/2 + R*sin(0.067*91)),15)) {
        link("http://telecentres.paeria.es/telecentres/tiki-index.php?page=CentreCivicSeca");
    }
    else if (overCircle(int(width/2 + R*cos(0.067*92)),int(height/2 + R*sin(0.067*92)),16)) {
        link("http://turisme.paeria.es/documents/ca/folleto_bus_turistic2009.pdf");
    }
    else {
      nom = "Navegueu sobre les caselles per veure els recursos educatius\n";
      web = "\nPremeu la casella en concret per entrar a la seva pàgina web";
    }
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


// Classe ull
class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

 void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
 }
  
 void display() {
    pushMatrix();
    translate(x, y);
    fill(193, 70, 128);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(255);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}



