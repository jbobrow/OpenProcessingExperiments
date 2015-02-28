


Flake[] f = new Flake[10];

//christmas card
void setup() {
  size(600, 600);
  background(255);
  strokeWeight(0.5);
  for (int i=0;i<f.length;i++) {
    f[i]= new Flake(random(width), random(height), random(5,7));
  }
}

void draw() {
  background(255);
  for (int i=0;i<f.length;i++) {
    f[i].drawFlake();
  }
}

class Flake {
  float x=0;
  float y=0;
  float sizeOfFlake=10;
  float xInc=0;
  float yInc=0;
  
  public Flake(float x, float y, float s) {
    this.x=x;
    this.y=y;
    this.sizeOfFlake=s;
    xInc = random(1,3);
    yInc = random(3,7);
  }

  void drawFlake() {
    pushMatrix();
    translate(x, y);  
    int a=360/6;
    for (int i=0;i<6;i++) {
      println(i);
      strokeWeight(0.1);

      pushMatrix();
      for (int ii=0;ii<sizeOfFlake;ii++) {
        strokeWeight(map(ii, 0, sizeOfFlake, 3, 0.1));
        line(0, 0, sizeOfFlake, sizeOfFlake); 
        line(0, 0, sizeOfFlake, -sizeOfFlake);
        translate(sizeOfFlake, 0);
      }
      popMatrix();
      rotate( radians((a)));
    }
    popMatrix();
    x+=xInc;
    y+=yInc;
    
    if(y>height){y=-30;x=random(width);}
  }
}

