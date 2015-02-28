
PImage m;
PImage x;

 
void setup() {
   size(600,600);
   m = loadImage("john.png");
   x = loadImage("explo.png");
   smooth();
   
}
 
void draw () {
  image(x, 200,90,height/2,width/2);
  image(m, mouseX,mouseY,height/3,width/3);
  
}

void mousePressed() {
  stroke(4);
  fill(222);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,40,30);

}



