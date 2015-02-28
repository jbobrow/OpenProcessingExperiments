
////////////////////////////////////////////////////////
//                                                    //
//        Maria Lüdtke                                //
//        Processing nach Frieder Nake                //
//        Tweetable Codes Projektwochen               //
//        Fachhochschule Potsdam WS 13/14             //
//        @TweetableCodes    @_trimpd                 //                             //
//                                                    //
////////////////////////////////////////////////////////



int rahmendicke= 80;
int i = 50;
int zeichnen=6;

void setup()
{
size(600,600);
strokeWeight(0.5);
background(240);

}

void draw(){

  stroke(0);
  float my = mouseY;
  float mx= mouseX;

  // Rahmen
  if(mouseY>height-rahmendicke){my = height-rahmendicke-random(0,5);}
  if(mouseY<rahmendicke){my = rahmendicke+random(0,5);}
  if(mouseX>width-rahmendicke){mx = width-rahmendicke-random(0,5);}
  if(mouseX<rahmendicke){mx = rahmendicke+random(0,5);}
  // Rahmen ende

  // Linien
  // oben nach unten
  if (zeichnen==1 && mousePressed == true) {line(mx,rahmendicke+random(0,5),mx,my);}
  // unten nach oben
  if (zeichnen==2 && mousePressed == true) {line(mx,height-rahmendicke+random(0,5),mx,my);}
  // links nach rechts
  if (zeichnen==3 && mousePressed == true) {line(rahmendicke+random(0,5),my,mx,my);}
  // rechts nach links
  if (zeichnen==4 && mousePressed == true) {line(width-rahmendicke+random(0,5),my,mx,my);}
   //  Horizontal frei
  if (zeichnen==5 && mousePressed == true) {line(mx,my,mx+i,my);}
  // Plotterarm hoch - charmant!
  if (zeichnen==6) {}
  // Linien ende

}

void keyReleased() {
  if (key == '1') zeichnen=1;
  if (key == '2') zeichnen=2;
  if (key == '3') zeichnen=3;
  if (key == '4') zeichnen=4;
  if (key == '5') zeichnen=5;
  if (key=='s') zeichnen = 6;
  if (key == DELETE || key == BACKSPACE) {background(240);}
}

void keyPressed() {
  if (keyCode == UP) i+=50;
  if (keyCode == DOWN) i-=50;
}
