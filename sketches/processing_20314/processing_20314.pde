
int xwidth=960;
int ylength=540;

void setup(){
size(xwidth,ylength);
background(223,213,197);
smooth();
}

void draw (){
  fill(255);
  rectMode(CENTER);
  if (mousePressed && (mouseButton== LEFT)){
  noFill();
  stroke(142,14,14);
  strokeWeight(1.5);
   rect(mouseX,mouseY,45,45);
     }
   else if(mousePressed && (mouseButton == RIGHT)){
     noStroke();
     fill(223,213,197,50);
     //strokeJoin(ROUND);
     rect(mouseX,mouseY,45,45);
     }
}

void keyPressedd(){
if (key=='s'){
  saveFrame();
}
}               
