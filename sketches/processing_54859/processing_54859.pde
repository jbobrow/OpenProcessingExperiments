
void setup() {
  size(600, 600);
  background(0);
//  noStroke();
  smooth();
  fill(255);
  noFill();
  stroke(255, 255);
//  noLoop();
  frameRate(1);
}

float dlSpirali = 50;
float szSpirali = 8;
int ilRekS = 25;
float kASpi = PI/6;

void draw() {
}

void mousePressed ()
{
  pushMatrix();
  background(0);
  float mX = mouseX;
  float mY = mouseY;
  translate(mX, mY);
  rotate(random(-HALF_PI, HALF_PI));
  pushMatrix();
    spirala(0, 0, dlSpirali, szSpirali, kASpi, ilRekS);      
  popMatrix();

    rotate(PI);
    spirala(0, 0, dlSpirali, szSpirali, kASpi, ilRekS);
  popMatrix();      
}

void spirala(float X1, float Y1, float H, float B, float kA, int ilRek)
{
//  rectMode(CENTER);
  if(ilRek > 0)
  {
    ilRek--;
    translate(X1, Y1);
    rotate(kA);
    //rect(0, 0, H, B);
    strokeWeight(B);
    curve(sin(-kA)*H, cos(-kA)*H, 0, 0, 0, H, sin(-kA)*H, H+cos(-kA)*H);
    int Rand = int(random(6));
    if(Rand>0){
      spirala(0, H, H*0.85, B*0.8, kA, ilRek);      
    }
    else if(Rand == 0){
      pushMatrix();
      spirala(0, H, H, B, -kA, ilRek);
      popMatrix();
      spirala(0, H, H, B, kA, ilRek);
    }
    else{
      
    }
    
    
    
    
  }
}

