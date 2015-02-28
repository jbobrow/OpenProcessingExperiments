
void setup(){
  size (640,480);
background (255);
stroke(255);
strokeWeight(1);
//noStroke();
//noLoop();
frameRate(5);
}
void draw() {  
//background (255);

float angle, i;
float vx, vy;


beginShape(TRIANGLE_FAN);
    float v= random (height);
    float h= random (width);
int cx=int (h);
int cy=int (v);
  vertex(cx,cy);
  for(angle=0; angle<=360; angle+=40) {
    float e= random (0.8,1.2);
    float r=random (190,235);
    float g=random (0,95);
    float b=random (50,120);
 
    vx=cx + cos(radians(angle))* 50;
    vy=cy + sin(radians(angle))* 50*e;
    vertex (vx,vy);
    fill(r,g,b);
  }


//saveFrame("estrella-###.jpg");

}

void mouseReleased() {
//saveFrame("estrella-###.jpg");
background (255);
}

