
//Arthur Luo//

//Halloween Nyan Kitty and pumpkins.//

//Microgame//

int frames = 12;
int panel = 0;
PImage[] nyan = new PImage[frames];
PImage pumpkin, sky,skeleton,fail,goodjob;
int flying;
boolean check=true;
float score = 0;
float a;



void setup(){
  frameRate(30);
  for( int i=0; i < nyan.length; i++){
    nyan[i]=loadImage(i+".png");
  }
  pumpkin = loadImage("pumpkin.png");
  sky = loadImage("sky.jpg");
  skeleton = loadImage("skeleton.png");
  fail = loadImage("fail.png");
  goodjob = loadImage("goodjob.jpg");
  size(1000,750);
  

}

void draw(){
  randomSeed(0);
  panel = (panel+1) % nyan.length;
  if(keyPressed == true){
    check = false;
  }
  if(check){
    flying=flying+10;
    image(sky,0,0);
    text("Press Any Key to start game",450,300);
    image(nyan[panel],flying,0);
    image(nyan[panel],flying+100,300);
    image(nyan[panel],flying+170,500);
    image(nyan[panel],flying-50,600);
    if(flying>500){
      flying = 0;  
    }
  }else{
    float m=400+flying,n=550+flying,l=200+flying;
    float m=400+flying,n=550+flying,l=200+flying;
    flying = flying - 3;
    image(sky,0,0);
    image(pumpkin,200,200);
    image(pumpkin,250,320);
    image(pumpkin,330,450);
    image(pumpkin,730,480);
    noCursor();
    image(nyan[panel],mouseX-125,mouseY-125);
    image(skeleton,m,300);
    image(skeleton,n,500);
    image(skeleton,l,600);
    if(mouseX>=200 && mouseX<=260 && mouseY>=200 && mouseY<=270){
      a = a+1;
    }
    if(mouseX>=250 && mouseX<=310 && mouseY>=320 && mouseY<=390){
      a = a+1;
    }
    if(mouseX>=330 && mouseX<=390 && mouseY>=450 && mouseY<=520){
      a = a+1;
    }
    if(mouseX>=730 && mouseX<=790 && mouseY>=480 && mouseY<=550){
      a = a+1;      
    }
    if(a>=55){
      image(goodjob,100,100);
    }

  }

}










