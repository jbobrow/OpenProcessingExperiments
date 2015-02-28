
int kreis = 3;
int kreisdown = 3;
int speed = 1;
int speeddown = 0;

void setup()
{
  size(500,500);
noStroke();
colorMode(RGB, 500);
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 400);
    point(i, j);
  }
}
}


void draw() {
line(pmouseX, pmouseY,mouseX,mouseY);
strokeWeight(1); 
triangle(mouseX,mouseY,mouseX,mouseY,pmouseX,pmouseX);
smooth(); 
kreis = kreis + speed;
kreisdown = kreisdown + speeddown;
 
 ellipse(kreis,kreisdown,5,5);
 
  if(kreis <= 0){
 speed = 1;
 speeddown = 0;
   } 
   
 if(kreis >= 500){
speed = -1; 
speeddown = 1;

}
 if(kreisdown >= 500){
speed = 0; 
speeddown = -1;
}

 if(kreisdown <= 0){
 speed = 1;
 speeddown = 1;
   } 
   
 if(kreisdown <= 0){
 speed = 1;
 speeddown = 1;
 }

   
}



void mousePressed(){
  ellipse(mouseX,mouseY,50,50);
  // draw rectangle wherever mouse is by klicking
  fill(random(500,0),400,400);

}

void mouseMoved() {
  strokeWeight(random(30)); 
  }
  
  
  void keyPressed(){
  size(500,500);
noStroke();
colorMode(RGB, 500);
for (int i = 0; i < 500; i++) {
  for (int j = 0; j < 500; j++) {
    stroke(i, j, 400);
    point(i, j);
  }
}
}

