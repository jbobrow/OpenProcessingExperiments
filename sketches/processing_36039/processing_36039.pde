
//Ref - Learning Processing : a beginner's guide to programming images,
//animation, and interaction / Daniel Shiffman.

//Colour Variables:
float r =random(255);
float g =random(255);
float b =random(255);

void setup(){
  
   size(400,400);
   smooth();
   frameRate(30);
   noCursor();
}

void draw(){
  
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  
//body:
 stroke(0);
 rect(mouseX,mouseY,20,40); 
 fill(255);
 rect(mouseX,mouseY-30,60,60);
 
//eyes:
 fill(r,g,b);
 ellipse(mouseX-15,mouseY-30,20,30);
 ellipse(mouseX+15,mouseY-30,20,30);
  //eyeballs:
  noStroke();
  fill(0);
  ellipse(pmouseX-15,pmouseY-30,5,5);
  ellipse(pmouseX+15,pmouseY-30,5,5);

//legs+arms:
 stroke(0);
 line(mouseX-10,mouseY+20,pmouseX-10,pmouseY+40);
 line(mouseX+10,mouseY+20,pmouseX+10,pmouseY+40);
 line(mouseX-12,mouseY+2,pmouseX-12,pmouseY+30);
 line(mouseX+12,mouseY+2,pmouseX+12,pmouseY+30);
}

void mousePressed(){
  println("Robocop");
}

