
import processing.opengl.*;

int mq = 100; //quantity
Ball balls[] = new Ball [mq];
int q = 25;
float threshold;
int depth = 480;
PFont font;

float rotationY;
float rotationX = 0;

boolean pause = false;

void setup(){
  size(800,480, OPENGL);
  smooth();
  font = loadFont("MyriadPro-LightSemiExt-24.vlw"); 
  textFont(font, 11); 
  colorMode(RGB, 100);
  calculateThreshold();
  for(int i = 0; i < mq; i++){
    balls[i] = new Ball(random(-width/2, width/2), random(-height/2, height/2), random(-depth/2, depth/2) );  
  }
  
}

void draw(){
  background(90);
  pushMatrix();
  translate(0,0,-depth/2);
  
  pushMatrix();
  translate(width/2, height/2, 0);
  if(mousePressed){
    float addRotationY = PI*(mouseX-pmouseX)/200;
    float addRotationX = -PI*(mouseY-pmouseY)/200;
    rotationX = rotationX + addRotationX; 
    rotationY = rotationY + addRotationY; 
  } 
  rotateY(rotationY);
  rotateX(rotationX);
  
  for(int i = 0; i < q; i++){
    balls[i].update(pause);
    for(int j = i + 1; j < q ; j++){
      float distance = balls[i].distance(balls[j]);
      if(distance < threshold ){
        float weight = width / 40 - sqrt(sqrt(distance) );
        if(weight < 0){
          noStroke();
        } else {
          strokeWeight(weight / 2 + 1);
        }
        for(int k = j + 1; k < q; k ++){
          float distance2 = balls[i].distance(balls[k]);
          float distance3 = balls[j].distance(balls[k]);
          if(distance2 < threshold && distance3 < threshold ){
            //float r = map( pow(distance, 0.5), 0, 200, 0, 100 );
            //float g = map( pow(distance2, 0.5), 0, 200, 0, 50 );
            //float b = map( pow(distance3, 0.5), 0, 200, 0, 100 );
            //float a = map(weight/2 + 1, 0, 10, 0, 100);
            
            float r = map( distance, 0, threshold, 0, 100 );
            float g = map( distance2 , 0, threshold, 0, 50 );
            float b = map( distance3 , 0, threshold, 0, 100 );
            float a = map( weight/2 + 1, 1, 10, 10, 100);
            
            fill(r,g,b, a);
            stroke(r * 0.8, g * 0.8, b * 0.8, a);
            beginShape(TRIANGLES);
            vertex(balls[i].v.x, balls[i].v.y, balls[i].v.z);
            vertex(balls[j].v.x, balls[j].v.y, balls[j].v.z);
            vertex(balls[k].v.x, balls[k].v.y, balls[k].v.z);
            endShape();
          }
        }
      }
    }
    balls[i].display();
  }
  noFill();
  stroke(50, 10);
  strokeWeight(1);
  box(width, height, depth);
  popMatrix();
  popMatrix();
  fill(20);
  text("Vertex Count:", 10, height - 30);
  text("Add, subtract vertices with W, S keys  -  Pause, un-pause vertex movement with space key  -  Rotate screen by dragging mouse", 10, height - 10);
  fill(80,10,80);
  text(q, 100, height - 30);
  //text(threshold, 160, height - 25);
  
}


void keyPressed() {
  if (key == 'w') {
    q++;
  } else if (key == 's') {
    q--;
  } else if (key== ' ') {
    pause = !pause; 
  }
  if(q < 1 ){
    q = 1; 
  } else if (q > 100 ){
    q = 100; 
  }
  calculateThreshold();
}

void calculateThreshold(){
 threshold = pow((pow(q, 0.5) - 20),4) * 1.85;
 println(threshold); 
}


class Ball {
  PVector v, vel; //vector (center), velocity
  Ball( float x, float y, float z ) {
    v = new PVector(x,y,z);
    vel = new PVector( random(1.0), random(1.0), random(1.0) );
  }
  
  void update(boolean pause){
    if(!pause){
      if(v.x  >= width/2 || v.x  <= -width/2 ){
        vel.x *= -1; 
      }
      if(v.y  >= height/2 || v.y  <= -height/2 ){
        vel.y *= -1; 
      }
      if(v.z  >= depth/2 || v.z  <= -depth/2 ){
        vel.z *= -1; 
      }
      v.add(vel);
    }
  }
  
  void display(){
    pushMatrix();
    translate(v.x, v.y, v.z);
    noStroke();
    fill(30,30);
    sphere( 3.5 );
    popMatrix();
  }
  
  float distance(Ball ball1){
    float distCUBED = sq(v.x - ball1.v.x) + sq(v.y - ball1.v.y) + sq(v.z - ball1.v.z);
    return distCUBED;
  }
}


