
float r = 0;
float theta = 0;

float q = 1;
float k = 1;
float s = 0;
float z = 0;

void setup() {
  
  size(600,600,P3D);
  background(0);
  frameRate(30);
  
}

void draw() {
    
  float a = r*cos(theta);
  float b = r*sin(theta);
  float fa = (r+1)*cos(theta+1);
  float fb = (r+1)*sin(theta+1);
  
    //background(0);  
    stroke(a,b - 50,100);
    
    pushMatrix();
    
      translate(width/2,height/2,z);
    
      line(a,b,fa,fb);
 
    popMatrix();
    
    if(keyPressed) {
      keyPressed();
    }
    
    r+=q;
    theta+=k;
    
    translate(a,b,z);
    
    z--;    
    
    println("q = " + q);
    println("k = " + k);
}

void keyPressed() {
  
  if(key == 's') {
    k+=0.5;
  }
  if(key == 'x') {
    k-=0.5;
  }
  if(key == 'l') {
    q+=.01;
    z-=.01;
  }
  if(key == 'w') {
    q-=.01;
    z+=.01;
  }
  if(key == 'p') {
    switch(int(s)) {
      case 0:
        frameRate(1);
        s = 1;
        break;
      case 1:
        frameRate(30);
        s = 0;
        break;
    }
  }
  if(key == 'b') {
    background(0);
    r = 0;
    theta = 0;
  }
  if(key == 'o') {
    q = 1;
    k = 1;
  }
}

