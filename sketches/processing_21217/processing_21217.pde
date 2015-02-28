
//import PDF library
import processing.pdf.*;
//create a boolean to turn recording on/off
boolean record;
void setup () {
size (480, 720);
background (211,205,195);
}
void draw () {
//use an if statement to start recording
if (record) {
// Note that #### will be replaced with the frame number. Fancy!
beginRecord(PDF, "frame-####.pdf");
}
noStroke();
fill (28,109,113);
rectMode (CENTER);

  noStroke();
  for (int i=20; i<=width-20; i+= 20) {
    for (int j = 20; j<=height-20; j+=20) {
      fill (198,202,204);
      ellipse (i, j, 7, 7);
    }
  }


fill(86,19,37); // cuadro grande ezquinas
rect (width/6, height/8, 100, 100); 
rect (width-width/6, height/8, 100, 100);
rect (width/6, height-height/8, 100, 100);
rect (width-width/6, height-height/8, 100, 100);

fill(95,28,46);
rect (width/6, height/8, 80, 80);
rect (width-width/6, height/8, 80, 80);
rect (width/6, height-height/8, 80, 80);
rect (width-width/6, height-height/8, 80, 80);

fill(116,38,59);
rect (width/6, height/8, 60, 60);
rect (width-width/6, height/8, 60, 60);
rect (width/6, height-height/8, 60, 60);
rect (width-width/6, height-height/8, 60, 60);

fill(137,55,77);
rect (width/6, height/8, 40, 40);
rect (width-width/6, height/8, 40, 40);
rect (width/6, height-height/8, 40, 40);
rect (width-width/6, height-height/8, 40, 40);

fill(161,76,99);
rect (width/6, height/8, 20, 20);
rect (width-width/6, height/8, 20, 20);
rect (width/6, height-height/8, 20, 20);
rect (width-width/6, height-height/8, 20, 20);

fill(86,19,37);
rect (width/6, height/2, 100, 100); // cuadros abajo
rect (width-width/6, height/2, 100, 100);
rect (width/6, height-height/2, 100, 100);
rect (width-width/6, height-height/2, 100, 100);

fill(95,28,46);
rect (width/6, height/2, 80, 80);
rect (width-width/6, height/2, 80, 80);
rect (width/6, height-height/2, 80, 80);
rect (width-width/6, height-height/2, 80, 80);

fill(116,38,59);
rect (width/6, height/2, 60, 60);
rect (width-width/6, height/2, 60, 60);
rect (width/6, height-height/2, 60, 60);
rect (width-width/6, height-height/2, 60, 60);

fill(137,55,77);
rect (width/6, height/2, 40, 40);
rect (width-width/6, height/2, 40, 40);
rect (width/6, height-height/2, 40, 40);
rect (width-width/6, height-height/2, 40, 40);

fill(161,76,99);
rect (width/6, height/2, 20, 20);
rect (width-width/6, height/2, 20, 20);
rect (width/6, height-height/2, 20, 20);
rect (width-width/6, height-height/2, 20, 20);

fill(86,19,37); // cuadros arriba enmedio
rect (width/2, height/3.2, 100, 100);
rect (width-width/2, height/3.2, 100, 100);
rect (width/2, height-height/3.2, 100, 100);
rect (width-width/2, height-height/3.2, 100, 100);

fill(95,28,46);
rect (width/2, height/3.2, 80, 80);
rect (width-width/2, height/3.2, 80, 80);
rect (width/2, height-height/3.2, 80, 80);
rect (width-width/2, height-height/3.2, 80, 80);

fill(116,38,59);
rect (width/2, height/3.2, 60, 60);
rect (width-width/2, height/3.2, 60, 60);
rect (width/2, height-height/3.2, 60, 60);
rect (width-width/2, height-height/3.2, 60, 60);


fill(137,55,77);
rect (width/2, height/3.2, 40, 40);
rect (width-width/2, height/3.2, 40, 40);
rect (width/2, height-height/3.2, 40, 40);
rect (width-width/2, height-height/3.2, 40, 40);

fill(161,76,99);
rect (width/2, height/3.2, 20, 20);
rect (width-width/2, height/3.2, 20, 20);
rect (width/2, height-height/3.2, 20, 20);
rect (width-width/2, height-height/3.2, 20, 20);

fill(7,69,122); // cuadros arriba enmedio
rect (width/6, height/3.2, 80, 80);
rect (width-width/6, height/3.2, 80, 80);
rect (width/6, height-height/3.2, 80, 80);
rect (width-width/6, height-height/3.2, 80, 80);

fill(11,75,130);
rect (width/6, height/3.2, 60, 60);
rect (width-width/6, height/3.2, 60, 60);
rect (width/6, height-height/3.2, 60, 60);
rect (width-width/6, height-height/3.2, 60, 60);

fill(15,84,142);
rect (width/6, height/3.2, 40, 40);
rect (width-width/6, height/3.2, 40, 40);
rect (width/6, height-height/3.2, 40, 40);
rect (width-width/6, height-height/3.2, 40, 40);


fill(19,101,170);
rect (width/6, height/3.2, 20, 20);
rect (width-width/6, height/3.2, 20, 20);
rect (width/6, height-height/3.2, 20, 20);
rect (width-width/6, height-height/3.2, 20, 20);

fill(20,113,191);
rect (width/6, height/3.2, 10, 10);
rect (width-width/6, height/3.2, 10, 10);
rect (width/6, height-height/3.2, 10, 10);
rect (width-width/6, height-height/3.2, 10, 10);


fill(7,69,122); // cuadros arriba enmedio
rect (width/2, height/2, 80, 80);

fill(11,75,130);
rect (width/2, height/2, 60, 60);

fill(15,84,142);
rect (width/2, height/2, 40, 40);

fill(19,101,170);
rect (width/2, height/2, 20, 20);

fill(20,113,191);
rect (width/2, height/2, 10, 10);

fill(7,69,122); // cuadros arriba enmedio
rect (width/2, height/8, 80, 80);

fill(11,75,130);
rect (width/2, height/8, 60, 60);

fill(15,84,142);
rect (width/2, height/8, 40, 40);

fill(19,101,170);
rect (width/2, height/8, 20, 20);

fill(20,113,191);
rect (width/2, height/8, 10, 10);

fill(7,69,122); // cuadros arriba enmedio
rect (width/2, height-height/8, 80, 80);

fill(11,75,130);
rect (width/2, height-height/8, 60, 60);

fill(15,84,142);
rect (width/2, height-height/8, 40, 40);

fill(19,101,170);
rect (width/2, height-height/8, 20, 20);

fill(20,113,191);
rect (width/2, height-height/8, 10, 10);




noFill();
stroke (94,27,45);
strokeWeight (25);
//outer rectangle3
rect (width/2, height/2, width, height);

noFill();
stroke (14,72,121);
strokeWeight (8);
//outer rectangle3
rect (width/2, height/2, width, height);


}
                
                                
