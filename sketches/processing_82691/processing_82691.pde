
float[] xPos = new float [0];
float[] yPos = new float [0];             // Array
float[] xVel = new float [0];
float[] yVel = new float [0];
float[] partsize = new float[0];
PImage Snowman;
PImage bg;
PImage star;




void setup() {
  
 size(800,600);
 Snowman = loadImage("MerryUpdate.png");
 bg = loadImage("Merrybg.png");
 star = loadImage("Merrystar.png");
}


void draw() {
  background(25, 40, 95);
  
  
  image(bg,0,100);
  image(Snowman,150,100);
  image(star, 650,20);
  
  noStroke();
  
  // Makes a new particle
  xPos = append(xPos, random(0,800));
  yPos = append(yPos, 0);
  xVel = append(xVel, random(-1,1));
  yVel = append(yVel, random(1,3));
  partsize = append(partsize,random(1,7));
  fill(0);
  fill(255);
  
  
  
  for (int i = 0; i<xPos.length; i++ ) {
   
  ellipse(xPos[i], yPos[i], partsize[i], partsize[i]);
  xPos[i] += xVel[i];       /// Adding them together
  yPos[i] += yVel[i];        /// to make them move
 
 
}


if(xPos.length>600) {
  xPos = subset(xPos, 1);
  yPos = subset(yPos, 1);
  xVel = subset(xVel, 1);
  yVel = subset(yVel, 1); 
  partsize = subset(partsize, 1);
}

fill(0);
   float xpos = constrain(map(mouseX,0,300,338,538),408,416); 
   float ypos = constrain(map(mouseY,0,400,213,413),280,288);
  ellipse(xpos,ypos,3.5,3.5);
  
  float xpos2 = constrain(map(mouseX,0,300,300,500),370,378);
   float ypos2 = constrain(map(mouseY,0,400,213,413),280,288);
  
  ellipse(xpos2,ypos2,3.5,3.5);

}



  







