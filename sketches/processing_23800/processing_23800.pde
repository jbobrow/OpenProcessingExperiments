

int r;
int g;
int b;

void setup(){
  size(700,600);

}

void draw(){
  background(200,4,50);
  smooth();

r = mouseX;
g = mouseX;
b = mouseY;

background(r,g,b);

  // body
  stroke(0);
  fill(0);
  rectMode(CENTER);
  rect(pmouseX,pmouseY,mouseX +10,mouseY +20);

  
  // eyes
  stroke(0);
  fill(255);
  ellipse(mouseX,mouseY,60,20);
  ellipse(mouseX +100,mouseY +0,60,20);
  
// changing eye size  
if(mouseX<300){ //either true or false
  ellipse(mouseX,mouseY,80,40);
}else if(mouseX<500) {
  ellipse(mouseX +100,mouseY +0,80,40);
}
  
  
  // eyeballs
  stroke(255);
  fill(0);
  ellipse(mouseX,mouseY,10,20);
  ellipse(mouseX + 100,mouseY +0,10,20);

// changing eyeball size
if(mouseX<300){ //either true or false
  ellipse(mouseX,mouseY,40,40);
}else if(mouseX<500) {
  ellipse(mouseX +100,mouseY +0,40,40);
}
  
  
  // mouth
  stroke(0);
  fill(200,4,50);
  rect(mouseX +50,mouseY +90,200,70);
  line(mouseX -50,mouseY +90,mouseX +150,mouseY +90);
  
// changing mouth shape
if(mouseX<300){
  fill(255);
  rect(mouseX +50,mouseY +90,200,40);
  rect(mouseX +50,mouseY +90,150,40);
  rect(mouseX +50,mouseY +90,90,40);
  rect(mouseX +50,mouseY +90,30,40);
  line(mouseX -50,mouseY +90,mouseX +150,mouseY +90);
}
 
}


