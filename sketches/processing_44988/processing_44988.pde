
float rad = 150, angle, x, y;
boolean pressed=false;

void setup() {
  size(825, 490, P3D);
  background(200,100,0);
  text("created by Christian Geick 2011", width-200, height-50);
  fill(102,28,14,150);
  noStroke();
  smooth();
  frameRate(24);
}

void draw() {
  
  if(!pressed && mousePressed) {
    pressed = true;
  }

  if(mousePressed && rad<=300) {
    rad+=10;
  }
  if(!mousePressed && rad>150) {
    rad-=10;
  }

  if(pressed) {
    background(224,214,151);
    translate(width/2, height/2,0);
    rotateY(radians(frameCount));
    rotateX(radians(frameCount));
    
    for(int j=0; j<360; j+=15) {
      pushMatrix();
      rotateY(radians(j));
      rotateZ(radians(frameCount));
      for(int i=0; i<=360; i+=15) {
        angle = radians(i);
        x = (rad + noise(frameCount+i)*5) * cos(angle);
        y = (rad + noise(frameCount+i)*35) * sin(angle);
        pushMatrix();
          translate(x,y,0);
          ellipse(0,0,3,3);
          rotateY(radians(90));
          ellipse(0,0,3,3);  
          rotateX(radians(90));
          ellipse(0,0,3,3);  
        popMatrix();
      }
      popMatrix();
    }
  }
}

