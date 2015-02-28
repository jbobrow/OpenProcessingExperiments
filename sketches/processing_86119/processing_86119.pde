
int myX;
int myY;

void setup() {
   size (500,500);
   myX=100;
   myY=100;
}

void draw () {
   background(128);
   myX=mouseX;
   myY=mouseY;
   noStroke();
   fill(0); // black
   rect(myX+32,myY+3,35,20); //hat
   rect(myX+27,myY+14,45,5);
   fill(200,0,230); // magenta
   rect(myX+32,myY+11,35,3); // hat band
   fill(87); // charcoal
   ellipse(myX+50,myY+55,70,75); // body and wings
   ellipse(myX+19,myY+65,12,40);
   ellipse(myX+81,myY+65,12,40);
   fill(0); // black
   ellipse(myX+48,myY+40,2,2); // eyes
   ellipse(myX+52,myY+40,2,2);
   fill(250); // white
   ellipse(myX+50,myY+75,30,35); // tummy
   fill(200,150,0); // orange
   ellipse(myX+39,myY+93,15,5); // feet
   ellipse(myX+61,myY+93,15,5);
   triangle(myX+44,myY+44,myX+56,myY+44,myX+50,myY+49); // beak
}
