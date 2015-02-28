
    float r;
    float g;
    float b;
    float a;
    float diam;
    float x;
    float y;
   
    void setup() {
     
     size(500,500);
     background(0);
     smooth();
   }

void draw() {
     r = random(255);
     g = random(255);
     b = random(255);
     a = random(255);
     diam = random(20);
     x = random(width);
     y = random(height);
     noStroke();
     fill(r,g,b,a);
     ellipse(x,y,diam,diam);
     stroke(1);
    ellipse(pmouseX, pmouseY, mouseX, mouseY);


}


void mousePressed() {
  stroke(255);
  strokeWeight(7);
  fill(r,g,b,a);
  rectMode(CORNERS);
  ellipseMode(CENTER);
  ellipse(250,250,diam,diam);
  ellipse(50,50,diam,diam);
  ellipse(50,450,diam,diam);
  ellipse(450,450,diam,diam);
  ellipse(450,50,diam,diam);
  strokeWeight(random(0,20));
  rect(100,100,400,400);
  rect(0,0,100,100);
  rect(400,400,500,500);
  rect(0,400,100,500);
  rect(400,0,500,100);
  
  }
 
 

  
void keyPressed() {
  background(random(255));
  println(key);
}



