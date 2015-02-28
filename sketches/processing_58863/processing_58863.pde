
PImage img;
float angle =0.0;
float weight;
boolean pinta;


void setup() {
  size (480, 120);
  background(0);
  
  smooth();
  noStroke();
noCursor();
 imageMode(CENTER);

  img= loadImage("ROSA.png");
  pinta = false;
}


void draw() {
  
  fill(0,4);
  rect(0,0,width,height);

 weight=60/(dist(mouseX,mouseY,pmouseX,pmouseY)+1);
// rotate (angle);
  

if(pinta){
  translate(mouseX,mouseY);
  rotate(radians(angle));
  image (img, 0,0, weight, weight); 
}
 
  angle +=5; 
  

}

void mousePressed(){
  pinta = true;
  
}

void mouseReleased(){
  background(0);
  pinta = false;
}


