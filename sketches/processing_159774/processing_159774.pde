

float circleX= 90;
float circleY= 70;
float rectX= 150;

float r;
float g;
float b;
float a;


void setup() {
  size(500,500);
  background(frameCount/2);
  
  smooth();    
}


void draw() {//flower
   r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);

  noStroke();
  fill(r,g,b,a);
  
  ellipse(width/2, height/2, 90, 90);
  ellipse(210, 210, circleY, circleY);
  ellipse(290, 210, circleY, circleY);
  ellipse(250, 190, circleY, circleY);
  ellipse(250, 300, circleY, circleY);
  ellipse(210, 280, circleY, circleY);
  ellipse(290, 280, circleY, circleY);
  ellipse(300, 250, circleY, circleY);
 ellipse(200, 250, circleY, circleY);
 
 circleY= circleY+.4;



  fill(r,g,b,a);
rect(245, 250, 10, rectX);

rectX= rectX+.4;

}

void keyPressed(){
  println(key);
}


