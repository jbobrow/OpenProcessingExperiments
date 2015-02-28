
float glassX;
float R;
float G;
float B;
float glassY;
void setup(){
  size(400,400);
  glassX = height/2;
  glassY = 1 + glassX;
  R = 0;
  G = 0;
  B = 0;  
  smooth();
}
void draw(){
  background(250);
  fill(20);
  ellipse(140,205,30,30);
  ellipse(242,205,30,30);
  rectMode(CENTER);
  fill(R, G ,B);
  rect(145,glassX,60,50,50);  
  rect(240,glassX,60,50,50);
  stroke(20);
  fill(0);
  rect(189,glassX,40,5);
  rect(115,glassX,10,20);
  rect(270,glassX,10,20);
  rect(293,glassX,36,18);
  fill(100,161,252,20);
  ellipse(210,190,200,250);

    if( R == 0 && G == 0 && B == 0){
    R = random(200);
    G = random(200);
    B = random(200);
    } else {
      R = 0;
      G = 0;
      B = 0;
    }
  
    if( R > 70 && G < 70){
      glassY += random(3);
      glassX += glassY/20;
    } else {
      glassY += -.3;
      glassX += -1;
    }
}


