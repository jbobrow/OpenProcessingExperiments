

float x;
float y;
float w;
float h;


    void setup() {
     size(500,500);
     background(255);
     smooth();
}
    void draw() {
 strokeWeight(40);
      stroke(255); 
 line(pmouseX, pmouseY, mouseX, mouseY);
strokeWeight(1);
  stroke(0);
  x= random(500);
  y= random (500);
  w= random(500);
  h= random(500);
  //strokeWeight()= random(20);
  line(x, y, w, h);
 

}

void mousePressed(){
  
  background(255);
}


