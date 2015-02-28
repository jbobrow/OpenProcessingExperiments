
int ballCount = 500;
int ballSpeed= 30;
int ballSize =8;
int i;
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



  for (i=0; i<ballCount; ++i){
    xspeed[i] = random(1, ballSpeed);
    yspeed[i] = random(0, ballSpeed);

    wdth[i] = random(1, ballSize/4);
    ht[i] = random(-ballSize/4, ballSize/4);

    xpos[i] = random(width/50, width/20);
    ypos[i] = random (height/100, width/30);

    Red = random(0, 255);
    Blue = random(0, 255);
    Green = random(0, 255);

    noStroke();
    frameRate(60);
  }
}

void draw(){
  if(Green==255 || Blue == 255 || Red ==255 ){
    Red = random(0, 255);
    Blue = random(0, 255);
    Green = random(0, 255);
  }

  //background(++Red, ++Green, ++Blue );



  for(int j=0; j<ballCount; ++j){


    fill(5+Red, ++Green, 2+Blue);
    ellipse (xpos[j], ypos[j], wdth[j], ht[j]);    
    xpos[j] += xspeed[j];
    ypos[j] += yspeed[j];

    if (xpos[j]>=width || xpos[j]<=0 ){
      xspeed[j]*= -1;

      Red = 5+Red ;
      Blue =  2- Blue ;
      Green = 3-Green;
    }
    if (ypos[j] >= height || ypos[j] <= 0){
      yspeed[j]*= -1;

      Red = 6- Red  ;
      Blue = 5+Blue ;
      Green =  4-Green  ;
    }
    ballSize = ballSize/40;
  } 
}





