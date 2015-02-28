
void setup(){
  size(400,400);
}


void draw(){
  //This controls the sky
  background(0,255,255);
  
  //This controls the ground, beehive, tree
  fill(120,75,0);
  ellipse(200,180,50,20);
  ellipse(200,190,60,20);
  ellipse(200,205,70,30);
  ellipse(200,225,80,40);
  fill(0);
  ellipse(200,225,20,30);
  fill(0,200,0);
  rect(0,375,400,25);
  fill(80,35,0);
  rect(190,160,150,10);
  rect(300,0,50,375);
  fill(0,200,0);
  ellipse(300,0,500,100);
 
 //This controls Bee 1
  fill(255);
  ellipse(mouseX,mouseY-10,15,25);
  fill(255,255,0);
  ellipse(mouseX,mouseY,30,20); 
  fill(255,255,0);
  strokeWeight(2);
  line(mouseX,mouseY-10,mouseX,mouseY+10);
  ellipse(mouseX-15,mouseY-5,10,10);

//This controls Bee 2
  fill(255);
  ellipse(mouseY,mouseX-10,15,25);
  fill(255,255,0);
  ellipse(mouseY,mouseX,30,20); 
  fill(255,255,0);
  line(mouseY,mouseX-10,mouseY,mouseX+10);
  ellipse(mouseY-15,mouseX-5,10,10);

//This controls Bee 3
  fill(255);
  ellipse(mouseX,mouseX-10,15,25);
  fill(255,255,0);
  ellipse(mouseX,mouseX,30,20); 
  fill(255,255,0);
  line(mouseX,mouseX-10,mouseX,mouseX+10);
  ellipse(mouseX-15,mouseX-5,10,10);
  
//This controls Bee 4
  fill(255);
  ellipse(mouseY,mouseY-10,15,25);
  fill(255,255,0);
  ellipse(mouseY,mouseY,30,20); 
  fill(255,255,0);
  line(mouseY,mouseY-10,mouseY,mouseY+10);
  ellipse(mouseY-15,mouseY-5,10,10);
}





