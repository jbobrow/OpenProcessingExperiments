
// (i couldn't make any of these local without it messing up?) **********

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
float scaleOne;
float xPos=width/2;
float xDir=1;
float yPos=1;


 // *******************SETUP*******************

void setup() {
   size (500,500);
   rectMode(CENTER);
 //settin' up the random (shout out to Tracy for her assistance on randomizing);
   hatColor=(random(54), random(150), random(200));
   bandColor=(random(25), random(0), random(255));
   shoeColor=(random(25), random(0), random(200));
   startUpX=random(400);
   startUpY=width/2;
   scaleOne=random(1);
   
 
//noisy
    geoX=width/2;
    geoY=height/2;
    noiseA=1;
    noiseB=100;
    increment=0.005;


// *******************DRAW*******************

}
  
void draw () {
   background(7,15,100);
   noStroke()
   //moon
   makeMoon(100); // ENTER THE DESIRED MOON SIZE WITHIN ()!!!!!!!
   //rocketship
   makeRocketship();
   //tryin' the ol' matrix
   pushMatrix();
   scale(scaleOne,scaleOne);
   //and gettin' a little noisier
   makeNoise();
   // SKUTTLEBUTT and Accessories
    makeSkuttlebutt();
   popMatrix();
//robot
  pushMatrix();
  scale(.5);
  xPos=xPos+xDir;
  translate(xPos,yPos);
  if (xPos>width/3.25)
    {
      xDir=-1;
    }
  if (xPos<-width/3.25) {
   xDir=1;
}
  buildRobot(450,682,100,125);
  popMatrix();

}


// ****************CUSTOM STUFF*****************

//MOON
void makeMoon(int moonSize){
fill(250,247,215);
   ellipse(100,100,moonSize,moonSize);
   }


//ROCKETSHIP
void makeRocketship(){
   //platform
   fill(128);
   rect(250,450,310,20);
    fill(203,43,49);
   ellipse(500,500,200,500);
   fill(220,231,245);
   ellipse(500,350,80,80);
   }

//NOISE
void makeNoise(){
    geoX=geoX-(0.5-noise(noiseA));
   geoY=geoY-(0.5-noise(noiseB));
   noiseA=noiseA+increment;
   noiseB=noiseB+increment;
   myX=geoX;
   myY=geoY;
   }

//SKUTTLEBUTT
void makeSkuttlebutt() {

noStroke();
    fill(87); // charcoal
   ellipse(myX+50,myY+55,70,75); // body and wings
   ellipse(myX+19,myY+65,12,40);
   ellipse(myX+81,myY+65,12,40);
   fill(hatColor); // random colors for the hat
   rect(myX+50,myY+8,35,20); //hat
   rect(myX+50,myY+20,45,5);
   fill(bandColor); // random colors for the hat band
   rect(myX+50,myY+17,35,3); // hat band
   fill(0); // black
   ellipse(myX+48,myY+40,2,2); // eyes and random sizing
   ellipse(myX+52,myY+40,2,2);
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
   line(myX+87,myY+52,myX+87,myY+10000);
   }
   
   void buildRobot(float xpos, float ypos, int xw, int yh) {
  fill(204,64,0);
  ellipse(xpos-xw/4,ypos-yh/1.15,xw/2.5,yh/4);//left ellipse
  ellipse(xpos+xw/4.15,ypos-yh/1.15,xw/2.5,yh/4);//right ellipse
  fill(64,128,255);
  rect(xpos,ypos,xw,yh);//body
  rect(xpos,ypos-yh/1.15,xw/1.5,yh/2);//head
  line(xpos-xw/2.25,ypos-yh/1.15,xpos-xw/1.25,ypos-yh*1.2);//left antenna
  line(xpos+xw/2.25,ypos-yh/1.15,xpos+xw/1.25,ypos-yh*1.15);//right antenna
  rect(xpos-xw/1.4,ypos,xw/5,yh/1.1);//left arm
  rect(xpos+xw/1.4,ypos,xw/5,yh/1.1);//right arm
  rect(xpos-xw/4.5,ypos+yh,xw/4.5,yh);//left leg
  rect(xpos+xw/4.5,ypos+yh,xw/4.5,yh);//right leg
  fill(240);
  rect(xpos-xw/7,ypos-yh/1.05,xw/5.75,yh/7);//left eye
  rect(xpos+xw/7,ypos-yh/1.05,xw/5.75,yh/7);//right eye
  fill(random(255));
  rect(xpos,ypos-yh/1.375,xw/2.5,yh/25);//mouth
  fill(204,64,0);
  triangle(xpos-xw/1.4,ypos+yh/1.75,xpos-xw/1.4,ypos+yh/2.5,xpos-xw/1.8,ypos+yh/2.5);
  triangle(xpos-xw/1.125,ypos+yh/2.5,xpos-xw/1.4,ypos+yh/1.75,xpos-xw/1.4,ypos+yh/2.5);//left hand
  triangle(xpos+xw/1.4,ypos+yh/1.75,xpos+xw/1.4,ypos+yh/2.5,xpos+xw/1.8,ypos+yh/2.5);
  triangle(xpos+xw/1.125,ypos+yh/2.5,xpos+xw/1.4,ypos+yh/1.75,xpos+xw/1.4,ypos+yh/2.5);//right hand
  rect(xpos-xw/4.5,ypos+yh*1.5,xw/3.5,yh/7.5);//left foot
  rect(xpos+xw/4.5,ypos+yh*1.5,xw/3.5,yh/7.5);//right foot
  ellipse(xpos,ypos,xw*0.7,yh*0.55);//dial
  fill(0);
  line(xpos,ypos,xpos-xw/4,ypos-yh/6);
  ellipse(xpos,ypos,xw/10,yh/15);
  fill(255,255,70);
  rect(xpos,ypos-yh/1.775,xw/3,yh/8);//neck
  rect(xpos-xw/1.8,ypos-yh/3,xw/8,yh/5.5);//left arm connector
  rect(xpos+xw/1.8,ypos-yh/3,xw/9,yh/5.5);//right arm connector
}

   
