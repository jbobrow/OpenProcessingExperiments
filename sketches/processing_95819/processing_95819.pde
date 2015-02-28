
//total nubmer of possible points:
int numpoints = 10000;
int strokeFuzz=4; 
int strokeLucidity=5; 
int lineDensity=40; 
float [] x = new float [numpoints];
float [] y = new float [numpoints];
//number of points to draw:
int drawpoints = 0 ;
void setup() {
  size (800, 600);
frameRate = 60;
}
//store the data of mouseX,mouseY:
void mouseDragged() {
  for (int a=-100; 2000>=a; a+=lineDensity) {
      smooth();
      noFill();
  
  //add a new pint to the end of the list of points
  if (drawpoints < numpoints) {
    x[drawpoints]= mouseX;

    y[drawpoints] =mouseY;
    drawpoints += 1;
    print (a);
    print("/");
    println(drawpoints);
  }
}
}
int frame = 0;
void draw() {

  frame++;
  background(0);

  for (int i = 1;i <drawpoints; i++) {
    float phase = frame / i;
    float size = ((frame + i)*0.2) % 20;
    //curve(x[i], y[i], x[i-1], y[i-1],x[i-2], y[i-2], x[i-3], y[i-3]); 
    
    ellipse (x[i],y[i], size,size);
    strokeWeight(random(strokeFuzz));
        stroke(0, 245, random(0,245), random(strokeLucidity));

  
  
  line(x[i], y[i], x[i-1], y[i-1]);

}
}

void keyPressed() {
  drawpoints = 0;
}
