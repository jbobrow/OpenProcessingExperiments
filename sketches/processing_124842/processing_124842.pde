

PImage casa;


void setup() {
  size(640,480);
  String url = "http://quattrovecchiinamerica.files.wordpress.com/2008/10/dscn2405.jpg?w=720";
  // Load image from a web server
  casa = loadImage(url, "gif");
  
}

void draw() {
  background (casa);
  
    //MACCHINA

//carrozzeria
   stroke (129,12,12);
   fill (129,12,12);
   rect (8+mouseX,390,180,50);
   
//carrozzeria2
   fill (129,12,12);
   rect (50+mouseX, 360,90,30);
//finestrini
  fill (255,254,209);
  rect (55+mouseX, 365, 80, 25);
//divisione
  fill (129,12,12);
  rect (90+mouseX, 360, 10, 30);
//maniglia
 stroke (0,0,0);
 fill (0,0,0);
 ellipse (105+ mouseX, 405, 15, 6);
//ruote
 stroke (0,0,0);
 fill (0,0,0);
 ellipse (50+mouseX, 440, 40,40);
 ellipse (150+mouseX, 440, 40,40);
 //cerchioni
 stroke (134,134,134);
 fill (134,134,134);
 ellipse (50+mouseX, 440,18,18);
 ellipse (150+mouseX, 440, 18,18);
 //luci
 stroke (255,33,33);
 fill (255,33,33);
 ellipse (8+mouseX, 405, 6,15);
 stroke (242,236,42);
 fill (242,236,42);
 ellipse (188+mouseX, 405, 6,15);
 //paraurti
 stroke (134,134,134);
 fill (134,134,134);
 ellipse (14+mouseX, 425, 18, 5);
 ellipse (182+mouseX, 425,18,5);
}



