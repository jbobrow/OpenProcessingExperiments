
float [][] drop=new float[3][3];
float [][] speed={{30,60,80},
                  {60,80,30},
                  {80,30,60}};
float [][] k={{0,45,90},
              {0,45,90},
              {0,45,90}};//kakudo
float r;
int R = 70;
int A = 5;
float H = 200;

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100,100);
  background(0,0,100);
  smooth();
  noStroke();
}


void draw() {
  for(int y=0;y<3;y++){
    for(int x=0;x<3;x++){
      fill(H,40,100,10);
      k[x][y]+=speed[x][y];
      pushMatrix();
      translate(500/3*x+80,500/3*y+80);
      rotate(radians(k[x][y]));
      beginShape();
        for (float t=0; t<TWO_PI; t+=0.1) {
          r = 1 / (A * sin(t/2)+1);
          vertex(R*r*cos(t), R*r*sin(t));
        }
      endShape(CLOSE);
      popMatrix();
    }
  }
  H += 0.5;
  if(H>=360)H=0;
  fade();
}

void fade(){
  fill(0,0,100,5);
  rect(0,0,width,height);
}


