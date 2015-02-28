
float xL =0.0;
float yL=0.0;
float xLpupil=0.0;
float yLpupil=0.0;
float xR=0.0;
float yR= 0.0;
float xRpupil =0.0;
float yRpupil =0.0;
PImage img;

void setup(){
size(800,900);
img= loadImage("Unknown.jpeg");
strokeWeight(10);
frameRate(10);
}

 void draw(){
  
  background(0);
   /// ears and head(bonnet)


if (mousePressed == true) {
  fill(random(250),random(250),random(250));
  ellipse(300,230,150,350);
}


if (mousePressed == true) {
  fill(random(250),random(250),random(250));
  ellipse(500,230,150,350);
}


if (mousePressed == true) {
  fill(random(250),random(250),random(250));
  ellipse(400,450,520,400);
}



///white face
fill(255);
ellipse(400,520,400,250);



  xL = mouseX;
  yL = mouseY;
  xLpupil = mouseX;
  yLpupil = mouseY;
  xR = mouseX;
  yR = mouseY;
  xRpupil = mouseX;
  yRpupil = mouseY;
 
   xL = constrain(xL, 300, 500);
  yL = constrain(yL, 310, 510);
  xR = constrain(xR, 500, 50);
  yR = constrain(yR, 310,510);

  // constraining movement of left and right pupils
  xLpupil = constrain(xLpupil, 300, 500);
  yLpupil = constrain(yLpupil, 310, 510);
  xRpupil = constrain(xRpupil, 500, 500);
  yRpupil = constrain(yRpupil, 310, 510);


 
  // color of left eye --- interactive with mouse manipulation
  noStroke();
  fill(1);
  ellipse(xL, yL, 50, 100);
 
  // color of right eye --- interactive with mouse manipulation
  noStroke();
  fill(1);
  ellipse(xR, yR, 50, 100);
 

///black eyes
fill(1);
ellipse(xLpupil,yLpupil,50,100);
fill(1);
ellipse(xRpupil,yRpupil,50,100);

///yellow nose
fill(600,200,50);
ellipse(400,560,50,30);

///black flower petals
fill(1);
ellipse(400,610,15,15);
ellipse(220,320,50,50);
ellipse(280,320,50,50);
ellipse(280,265,50,50);
ellipse(220,265,50,50);

///white flower center
fill(255);
ellipse(250,290,50,50);


}






