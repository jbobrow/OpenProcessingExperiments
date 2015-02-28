
int ballCount = 500;
int ballSpeed = 3;
int ballSize = 8;
float[] xspeed = new float[ballCount];
float[] yspeed = new float[ballCount];
float[] xpos = new float[ballCount];
float[] ypos = new float[ballCount];
float[] wdth = new float[ballCount];
float[] ht = new float[ballCount];
float Red ;
float Green ;
float Blue ;

void setup(){
  size(400, 400);
  background(0);



  for (int i=0; i<ballCount; ++i){
    xspeed[i] = random(1, ballSpeed);
    yspeed[i] = random(-ballSpeed, ballSpeed);

    wdth[i] = random(1, ballSize);
    ht[i] =wdth[i];

    xpos[i] = random(width/10, width/10);
    ypos[i] = random (height/5, width/5);

    Red = random(0, 255);
    Blue = random(0, 255);
    Green = random(0, 255);

    noStroke();
    frameRate(50);
  }
}

void draw(){


background(Red, Green, Blue);

  if(Green==255 || Blue == 255 || Red ==255 ){
    Red = random(0, 255);
    Blue = random(0, 255);
    Green = random(0, 255);
  }




  for(int j=0; j<ballCount; ++j){


    fill(-Red+143, -Green+155, -Blue+16);
    ellipse (xpos[j], ypos[j], wdth[j], ht[j]);    
    xpos[j] += xspeed[j];
    ypos[j] += yspeed[j];

    if (xpos[j]>=width || xpos[j]<=0 ){
      xspeed[j]*= -1;

      Red = 2+Red ;
      Blue =  8- Blue ;
      Green = 5+Green;
    }
    if (ypos[j] >= height || ypos[j] <= 0){
      yspeed[j]*= -1;

      Red = 10- Red  ;
      Blue = 67+Blue ;
      Green = 12+Green ;
    }


  }

}









