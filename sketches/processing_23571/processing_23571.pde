
import saito.objloader.*;

OBJModel model ;

Orizuru[] orizuru = new Orizuru[200];
float rotX, rotY;
float radY = 1;

void setup()
{
    size(640, 480, P3D);
    frameRate(30);
    model = new OBJModel(this, "orizuru.obj", "absolute", POLYGON);
    //model.enableDebug();
    model.disableMaterial();
    model.scale(100);
    model.translateToCenter();
    
    colorMode(HSB);
    
    for(int i=0; i<orizuru.length; i++){
      orizuru[i] = new Orizuru(random(2)+0.2, rand(200)+150,rand(2000) - 200,
        random(TWO_PI),random(TWO_PI),color(rand(255),255,255));
    }
}

int rand(int n){ return int(random(n)); }


void draw()
{
    background(255);
    //lights();
    pushMatrix();
    translate(width/2, height/2, 0);
    rotateX(rotY + -0.5 * cos(radY));
    rotateY(rotX);
    
    for(int i=0; i<orizuru.length; i++){
      orizuru[i].draw();
      orizuru[i].update();
    }

    popMatrix();
    
    radY += 0.01;
    radY %= TWO_PI;
}

void mouseDragged()
{
    rotX += (mouseX - pmouseX) * 0.01;
    rotY -= (mouseY - pmouseY) * 0.01;
}

class Orizuru{
  float speed;
  int r;
  int y;
  float rad;
  float rad2;
  color c;
  
  Orizuru(float speed, int r, int y, float rad, float rad2, int c){
    this.speed = speed;
    this.r = r;
    this.y = y;
    this.rad = rad;
    this.c = c;
  }
  
  void update(){
    rad += 0.1*speed;
    rad2 += 0.6*speed;
    y -= 4*speed;
    
    rad %= TWO_PI;
    rad2 %= TWO_PI;
  }
  
  void draw(){
    pushMatrix();
    
    noStroke();
    fill(c);
    
    translate(0,y + sin(rad2)*10,0);
    rotateY(rad);
    translate(r,0,0);
    rotateY(-HALF_PI);
    rotateX(sin(rad2)/4);
    model.draw();
    
    popMatrix();
  }
}


