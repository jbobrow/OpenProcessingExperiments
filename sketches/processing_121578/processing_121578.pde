
//Seno+seno

float pX;
float pY;
float speed1= .5; //velocidad en X
float speed2= .009; // velocidad en Y
float speed3= .8; //frecuencia pequenia
float osc;
  float osc2= 100;
float val;
float sVal;
float sNval;
float Nval;
float radio= 10;

void setup () {
size (400, 600);
smooth();
background (0, 189, 255);
}

void draw () {

 osc+=speed1;
 osc2-=speed1;
 sVal+=speed2;
  Nval+=speed3;
  sNval=sin(Nval);
  pY=cos(sVal)*(osc*.2);
  pX=cos(sNval)*pY+height/3;
 // strokeWeight(.02);
fill(0, 189, 255, 135);
strokeWeight(.7);
stroke(255, 180);
ellipse (pX, osc2, radio, radio);
/*strokeWeight(.15);
stroke(0, 30);
line(osc, pY-radio/2, osc,0);
 line(osc, pY-radio/2, osc,0);
  line(osc, pY+radio/2, osc, height);
 line(osc, pY+radio/2, osc, height);*/

if (osc2>=height-5||osc2<5) {
speed1=-speed1;
}

//println();
}


