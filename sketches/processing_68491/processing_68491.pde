
PImage ask;
PImage boy;
PImage boyno;
PImage girl;
PImage girlsit;
PImage ground;
PImage shadowboy;
PImage shadowman;
PImage shadowold;
PImage shadowwoman;
PImage train3;
PImage subway;
PImage storybook;

boolean boyaction = false;
boolean chairaction = false;
boolean girlaction = false;
boolean subwayImage = false;
boolean storybookImage = false;


float train3X=-2000;

PImage[] train1=new PImage[3];
PImage[] train2=new PImage[3];



float shadowboyPosX = random(350,500);
float shadowmanPosX = random(0,100);
float shadowoldPosX = random(0,50);
float shadowwomanPosX = random(400,500);



float[] train1PosX=new float[3];
float[] train2PosX=new float[3];
float[] train1PosY=new float[3];
float[] train2PosY=new float[3];
float[] trainVel= new float[3];


void setup() {

  size(500, 569);
  frameRate(20);
  smooth();

  ask = loadImage("ask.png");
  boy = loadImage("boy.png");
  boyno = loadImage("boyno.png");
  girl = loadImage("girl.png");
  girlsit = loadImage("girlsit.png");
  ground = loadImage("ground.png");
  train3 = loadImage("train3.png");
  shadowboy= loadImage("shadowboy.png");
  shadowman = loadImage("shadowman.png");
  shadowold = loadImage("shadowold.png");
  shadowwoman = loadImage("shadowwoman.png");
  subway = loadImage("subway.png");
  storybook = loadImage("storybook.png");


  
 for(int i=0;i<3;i++){

  trainVel[i]=random(20,40);
  train1[i] = loadImage("train1.png");
  train2[i] = loadImage("train2.png");

  train1PosY[i]=random(150,270);
  train2PosY[i]=random(70,150);
  train1PosX[i]=random(-5000,-1000);
 }
}


void draw() {
  background(17, 60, 88);      //background image
  


  drawtrains();
  
  image(ground, -100, 0,600,569);
 
  boysaction();
  
  girlsaction();
  
  drawshadow();
  
   if(subwayImage==false){
   image(subway,0,0);
     if(keyPressed ==true){
     subwayImage=true; 
     
     }  
   
   
   }
   
   if(subwayImage==true && storybookImage==false){
    image(storybook,0,0);
     keyPressed();
   }
   
  
}



void mouseClicked() {
  //--------------click boy--------------
  if (mouseX<265 && mouseX>200 && mouseY<470 && mouseY>300)
  { 
    boyaction = true;
  }
  
  //--------------click chair--------------
  if(mouseX<430 && mouseX>320 && mouseY<440 && mouseY>380)
  {
    chairaction = true;
    girlaction = true;
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT){
       storybookImage=true;}
   
}
}


//-----------boy's action---------------------
void boysaction(){
  
  if (boyaction==false ) {
    image(boy, 200, 300, 65, 170);
//    image(girl,20,320,53,154);
//    image(ask,50,270,62,60);
  };

  if (boyaction==true) {
    image(boyno, 140, 290, 120, 190);
    
  };
  
}
//-----------boy's action---------------------


//------------girl's action----------------
void girlsaction(){
  
  if (boyaction==false && girlaction == false) {
    image(girl,20,320,53,154);                     //girl stands
    image(ask,50,270,62,60);
    
  };



  if (boyaction==true && girlaction == false) {
    image(girl,100,320,53,154);
    image(ask,130,230,62,60);                     //girl asks
   
  };
  
 
  if (chairaction==true){
    image(girlsit,380,330,90,180);     //girl sits
    boyaction=false;
  };
}
//------------girl's action----------------


 //--------------draw trains----------------
void drawtrains(){

  for(int i=0;i<3;i++){
  image(train1[i], train1PosX[i], train1PosY[i], 1000, 129);
  train1PosX[i]=train1PosX[i]+trainVel[i];
  
  if(train1PosX[i]>=5000){
   train1PosY[i]=random(150,270);
   train1PosX[i]=random(-5000,-1000); 
   train1PosX[i]=train1PosX[i]+trainVel[i];
  };
   
   
  image(train2[i], train2PosX[i], train2PosY[i],  881, 88);
  train2PosX[i]=train2PosX[i]-trainVel[i];
  
  if(train2PosX[i]<=-2000){
   train2PosY[i]=random(70,150);
   train2PosX[i]=random(1000,5000); 
   train2PosX[i]=train2PosX[i]-trainVel[i];
  };
  
  
  image(train3, train3X, 30, 717, 71);
  train3X=train3X+5;
  
  if(train3X>2000){
   train3X=-2000; 
   train3X=train3X+5; 
  }
}
}
  
  




//---------------------------------------------


//---------------draw the shadow people------------
void drawshadow(){
  image(shadowboy,shadowboyPosX,400,84,222);
  shadowboyPosX = shadowboyPosX-2;
  if(shadowboyPosX<-100){
   shadowboyPosX=500; 
   shadowboyPosX=shadowboyPosX-2;
  }
  
  image(shadowwoman,shadowwomanPosX,380,90,250);
  shadowwomanPosX = shadowwomanPosX-1.5;
  if(shadowwomanPosX<-100){
   shadowwomanPosX=500; 
   shadowwomanPosX=shadowwomanPosX-1.5;
  }
  
  image(shadowman,shadowmanPosX,350,102,270);
  shadowmanPosX = shadowmanPosX+2;
  if(shadowmanPosX>500){
   shadowmanPosX=-102; 
   shadowmanPosX=shadowmanPosX+2;
  }
  
  image(shadowold,shadowoldPosX,430,100,170);
  shadowoldPosX = shadowoldPosX+1;
   if(shadowoldPosX>500){
   shadowoldPosX=-100; 
   shadowoldPosX=shadowoldPosX+1;
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
}

