
float r;
float g;
float b;
float a;

 
void setup () {
  size(400,400);
}
 
 
void draw () {
smooth();
 r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
//rect (mouseX,mouseY, 50, 50);
  
 ellipseMode( CENTER); 
 
 
   if (mousePressed) {
     fill(255,186,0);
  ellipse(mouseX,mouseY,150,150);
}else{
  ellipse(mouseX,mouseY,150,150);
}

 
 
 fill(0);
 
  
 
  stroke(0);
  strokeWeight(1);
  fill(255,255, mouseY);
  ellipse(mouseX,mouseY,150,150); //face
   
  noStroke();
  fill(mouseX,10 ,mouseY);
  ellipse(mouseX,mouseY+50,50,30); //mouth
 
 
 //eye
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY-20,60,40); 
  fill(0);
  noStroke();
  ellipse(mouseX,mouseY-20,9,9);
}


