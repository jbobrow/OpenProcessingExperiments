
int speed = 30;
int Size = 500;



float Red ;
float Green ;
float Blue ;
float xpos[] = new float[Size];
float ypos[] = new float[Size];
float W[] = new float[Size];
float H[] = new float[Size];
float xspeed[] = new float[Size];
float yspeed[] = new float[Size];



void setup(){

  size(500, 500);
  background(255);
  cursor(HAND);
  for (int i=0; i<250; i++){
    xspeed[i] = random(1, speed);
    yspeed[i] = random(-speed, speed);
    drawRect(xpos[i]=random(width), ypos[i]=random(height), W[i]=random(200), H[i]=random(200));
    //xpos[i] += xspeed[i];
    //ypos[i] += yspeed[i];
    frameRate(speed);
  }

}

void drawRect(float x, float y, float w, float h){

  Red = random(0, 255);
  Green = random(0, 255);
  Blue = random(0, 255);

  fill(Red, Green, Blue, 50);
  rect(x, y, w, h);

  x=x*3+1;
  y=-(y+1)/2;

  if(w <200 || w>0)
    w *= -1;
  if(h <200 || h>0)
    h *= -1;
  if(x <500 || x >0)
    x *= -2;
  //w = w*2;
  if(y <300 || y >0)
    y *= -1;
  h = h/2;
}

void draw(){
  if(mouseButton == RIGHT){
    drawRect(mouseX, mouseY, random(mouseX)/2, random(mouseY)/2);
    for(int j=0; j<500; j++){
      Red = random(0, 255);
      Green = random(0, 255);
      Blue = random(0, 255);
      speed = speed-30;


      fill(Red, Green, Blue, 50);
      drawRect(xpos[j], ypos[j], W[j], H[j]);


      xpos[j] += xspeed[j]/2 + (-2*mouseX);
      ypos[j] += 3*yspeed[j] - (2*mouseY);

      if(W[j] >500 || W[j]<=0)
        W[j] *= -1;

      if(H[j] >500 || H[j]<=0)
        H[j] *= +1;
       

      if(xpos[j] >350 || xpos[j] <500)
        xpos[j] *= +20;
      //W[j] = W[j]-30;
      //H[j] = H[j]+150;
      

      if(ypos[j] >250 || ypos[j]<0){
        ypos[j] = -150*ypos[j];
      //H[j] = H[j]+300;
      //W[j] = W[j]+78;
    ;}
      if(mousePressed == true){
        if(mouseButton == LEFT){
          noLoop();

          break;
        }
        size(500, 500);
        background(255);
        frameRate(15);

      }



    }

  }
}














