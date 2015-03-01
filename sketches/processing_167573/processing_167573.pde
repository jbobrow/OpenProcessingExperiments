
Wave myWave1;
Wave myWave2;
Wave myWave3;
float angle;
float clr;
float spinspin;
int pointillize = 16;

void setup() {
  size (1200,900,P3D);
  noStroke();
  
 myWave1 = new Wave(color(51,209,152,150), 100,200,2,1);
 myWave2 = new Wave (color(163, 229, 50), 50,100,1,1);
 myWave3= new Wave (color(0, 168, 203,100), 25, 50, 2, 2);

}

void draw() {
  if (mousePressed){
  background(255);
  }
  camera(width/2, height/2, 300, width/2, height/2, 0, 0, 1, 0);
  pointLight(200, 200, 200, width/2, height/2, 200);
  
  translate(width/4, height/4);
  rotateY(angle);
  rotateX(angle);
  
   angle += 0.01;
   
    float cameraY = height/2.0;
  float fov = mouseX/float(width) * PI/2;
  float cameraZ = cameraY / tan(fov / 2.0);
  float aspect = float(width)/float(height);
  if (mousePressed) {
    aspect = aspect / 2.0;
  }
  perspective(fov, aspect, cameraZ/10.0, cameraZ*10.0);
  
  translate(width/2+30, height/2, 0);
  rotateX(-PI/6);
  rotateY(PI/3 + mouseY/float(height) * PI);
 
 if (mouseX > 250) {
   rotateY(spinspin);
  }else if (mousePressed) {
    clr = 25; 
    rotateY(cos(spinspin));
  } else {
   rotateY(-spinspin);
   clr = 25;
  } 
  
  
    
 
  myWave1.move();
  myWave1.display();
  myWave2.move();
  myWave2.display();
  myWave3.move();
  myWave3.display();
}

class Wave {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
 
  
  Wave(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
   yspeed = tempYspeed;
  
}

void display() {
  stroke(0,0,0,0);
  if (mousePressed) {
    fill (c/6);
  } else {
  fill(c);
  }
  rectMode(CENTER);
  rect (xpos,ypos,200,100);
}


void move() {
  if (mousePressed) {
  xpos = xpos + xspeed+100;
  if (xpos> width) {
    xpos=25;
  } } else {
  xpos = xpos + xspeed;
  if (xpos> width) {
    xpos=0;
  } }
  if (mousePressed) {
    ypos = ypos + yspeed+8;
    if (ypos> height) {
      ypos = 0;
    } } else {
    ypos=ypos+yspeed;
    if (ypos> height) {
      ypos=0;
  }
    }
}
}

