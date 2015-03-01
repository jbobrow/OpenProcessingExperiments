
float xnoise;
float ynoise;

void setup(){
  size(500,500);
  smooth();
  xnoise=random(15);
  ynoise=random(15);
}

void draw(){
  background(255);
  for (int y=0;y<=height;y+=4){
    xnoise+=0.02;
    for (int x=0;x<width;x+=4){
      ynoise+=0.03;
      drawShape(x,y,noise(xnoise,ynoise));
    }
  }
}

void drawShape(float x,float y, float noise){
  pushMatrix();
  translate(x,y);
  float grey=noise*255;
  float alph=noise*255;
  fill(grey,alph);
  rotate(radians(360*noise));
  triangle(0,0,0,10,10,0);
  popMatrix();
}
