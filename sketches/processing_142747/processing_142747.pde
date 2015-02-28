
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: Hong Jiyae <<------ Write your full name here!
 // ID: 201420117 <<--------- Write your ID here!

float angle;
int a=5; 
int b=5; 
float xW=50;
float direction =1;

void setup(){
  size(600,600);
  background(255);

// noLoop();
}

void draw(){
  background(255);
  stroke(0);
noFill();





for (int i = 0; i < width; i = i + b) {
 for (int j = 0; j < height; j = j +b) {

   strokeWeight(xW/10);
noStroke(); 
 noFill();
   fill(random(255));
  rect(i,j,a,a);
  
  
   angle += 1;
fill(random(189),random(255),random(255),50);
rotate(angle); 
scale(0.95); 
rectMode(CENTER); 
rect(356,321,800,800); 

  while (i < 250){
   
 ellipse(mouseX/10,mouseY/10,i, i);
 i = i + 1; 
 
  rect(mouseX/5,mouseY/5,i, i);
 i = i + 1; 
 } 


a=5+mouseX; 
b=5+mouseY/10; 

translate(width/2,height/2);


 }
}

   xW = xW + direction;
if (xW>100){
  direction = direction * -1;
}

xW = xW + direction;
if (xW<50){
  direction = direction * -1;
}
}

void keyPressed(){
  redraw();
}


