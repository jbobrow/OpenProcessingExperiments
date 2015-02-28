
//color, location, and eye size randomness variables
int hatColor;
int bandColor;
int startUpX;
int startUpY;
int shoeColor;
int eyeSize;
//noise variables (shout out to Prof. LeMasters for his help on noise!)
float noiseA;
float noiseB;
float geoX;
float geoY;
float increment;

void setup() {
   size (500,500);
 //settin' up the random (shout out to Tracy for her assistance on randomizing);
   hatColor=(random(54), random(150), random(200));
   bandColor=(random(25), random(0), random(255));
   shoeColor=(random(25), random(0), random(200));
   startUpX=random(400);
   startUpY=width/2;
   eyeSize=random(5);
//noisy
    geoX=width/2;
    geoY=height/2;
    noiseA=1;
    noiseB=100;
    increment=0.005;

}
 
void draw () {
   background(7,15,100);
   noStroke()
   //moon
   fill(250,247,215);
   ellipse(100,100,100,100);
   //rocketship
   fill(203,43,49);
   ellipse(500,500,200,500);
   fill(220,231,245);
   ellipse(500,350,80,80);
   //tryin' the ol' matrix
   pushMatrix();
   //and gettin' a little noisier
   geoX=geoX-(0.5-noise(noiseA));
   geoY=geoY-(0.5-noise(noiseB));
   noiseA=noiseA+increment;
   noiseB=noiseB+increment;
   myX=geoX;
   myY=geoY;
   noStroke();
   fill(hatColor); // random colors for the hat
   rect(myX+32,myY+3,35,20); //hat
   rect(myX+27,myY+14,45,5);
   fill(bandColor); // random colors for the hat band
   rect(myX+32,myY+11,35,3); // hat band
   fill(87); // charcoal
   ellipse(myX+50,myY+55,70,75); // body and wings
   ellipse(myX+19,myY+65,12,40);
   ellipse(myX+81,myY+65,12,40);
   fill(0); // black
   ellipse(myX+48,myY+40,eyeSize+2,eyeSize+2); // eyes and random sizing
   ellipse(myX+52,myY+40,eyeSize+2,eyeSize+2);
   fill(250); // white
   ellipse(myX+50,myY+75,30,35); // tummy
   fill(shoeColor); // random shoe color
   ellipse(myX+39,myY+93,15,5); // feet
   ellipse(myX+61,myY+93,15,5);
   fill(200,150,0); // orange
   triangle(myX+44,myY+44,myX+56,myY+44,myX+50,myY+49); // beak
   stroke(0)
  // helmet and air supply
   fill(114,207,234,30)
   ellipse(myX+50,myY+35,80,80);
   fill(0);
   rect(myX+87,myY+52,1,700);
   popMatrix();
}
