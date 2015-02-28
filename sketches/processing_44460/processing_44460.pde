
PFont police;
import ddf.minim.*;
AudioPlayer morceau;
Minim minim;

float le ; float ri ;

int xpolice ; int ypolice ;


void setup ()
{
  size (600,600)  ; smooth(); 
  background (10,10,10) ;
  police = loadFont("DIN Bold.vlw"); 
  frameRate(24) ;
  minim = new Minim(this);
  morceau = minim.loadFile("Asian Dub Foundation - RAFI - 01.mp3");
  morceau.loop();
  
  xpolice = width/4 ; ypolice = height/4 ;
  fill(255,50,10,150) ;
  textFont(police,12);
  text("MOVE the MOUSE and CLIC", xpolice, ypolice);
  
}

void draw ()
{
//  background (30,ri) ; 
  noStroke() ;
  
  for  (int i = 0; i < 255 ; i++)
  {
    ri = morceau.right.get(i)*100 ;
    le = morceau.left.get(i)*100 ;
    println (ri + " " + le ) ;
  }
  
  if (mousePressed) 
  {
//    fill(210, 255,50, 25) ; //JAUNE
    fill(10, 10,10, 25) ; //NOIR
    ellipse(mouseX, mouseY, ri*7, ri*7) ;
    strokeWeight(1);
    stroke(255,50,10,25) ;
    noFill() ;
    ellipse(mouseX, mouseY, ri*7, ri*7) ;
  }
  fill(255,50,10,25) ; //ROUGE
  ellipse(mouseX, mouseY, ri*2, ri*2) ;
  
}
/*
void mouseReleased() {
  noStroke() ;
{
  fill(255, 10) ;
  ellipse(mouseX, mouseY, 100,100) ;
  }
}
**/





