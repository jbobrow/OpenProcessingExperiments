
float pw = 40; //pupil width
float ph = 40; //pupil height
int dropPos = 300;
boolean cry = false;
float m = 0;

void setup() {
  size(800,800);
  smooth();
  rectMode(CENTER);
}

void draw() {
  background(255);
  strokeWeight(5);
  stroke(0);
  noFill();
  eye(200,150);
  eye(600,150);
  
  //pupil
  stroke(0,0,255);
  float mx = constrain(mouseX, 120,280);
  float m2 = mx + 400;
  float my = constrain(mouseY, 145,155);
  if (mx <240 && mx >160) {
    my = constrain(mouseY, 125,175);
  }
   if (mousePressed) {
    pw  +=1;
    ph  +=1;
    m -=1;

 
  } else {
    pw-=10;
    ph-=10;
    m+= 1;
    tearDrop(200,dropPos,100);
    tearDrop(600,dropPos,100);
  }
  
  pw = constrain(pw, 40, 100);
  ph = constrain(ph, 40, 100);
  fill(0,0,255);
  ellipse(mx, my, pw,ph);
  ellipse(m2, my, pw,ph);
  m = constrain(m,0,7);
  if (m==7) {

    
    dropPos += 10;
  } else {
    dropPos = 300;
  }
  
 
  noStroke();
  fill(0,0,255);
  
  
}
void eye(int ex, int ey) {
 int squint = constrain(mouseY,50,180);
  arc(ex,ey, 200,squint,radians(0),radians(360));
    arc(ex,ey, 200,squint,radians(360),radians(0));

}

void tearDrop(int j, int k, int r) {
    pushMatrix();
    translate(j,k);
    
  rotate(-HALF_PI);
  beginShape();
  for(int i=0;i<360;i+=10) {
    
    float t = radians(i);
    float x = cos(t)*r;
    float y = sin(t) * pow(sin(t/2), m) *r;
    vertex(x,y);
   if (mousePressed) {
     y += 1; }

  }
  endShape(CLOSE);
  popMatrix();
  
  
  
}

