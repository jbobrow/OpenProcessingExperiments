
void setup(){
  size(600,600);
  background(255);
  frameRate(24);
}

void draw(){
  noStroke();
  
 for(int i=0; i<600; i+=5){
   for(int j=0; j<600; j+=5){
     float m = map(mouseX, 0, width, 0, 255);
     fill( random(255), random(113, 229), random(113, 229), m);
     rect(i,j, 50, 50);
     //println(m);
   }
 }
 
}

void mousePressed() {
  fill(0);
  ellipse(mouseX, mouseY, 50, 50);
}


