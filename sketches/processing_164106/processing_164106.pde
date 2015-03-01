
PImage blue;
PImage red;
PImage green;
PImage yellow;
PImage[] pics = new PImage[3];

int[] X = new int[4];
int[] Y = new int[4];

int i = 0;
int Once = 1;
int phase = 0;
int shiftColor1,shiftColor2=0;
int x1,x2,x3,y1,y2,y3;
int Scale = 1;
float rot1,rot2 = 0;
int f = 0;

int randP(int P){
  P -= 40;
  P += random(40);
  return P;
}

void setup(){
  size(600,600);
  background(255);
  frameRate(1000);
  colorMode(HSB);
  
  blue = loadImage("tetris_blue.png"); //138 x 395
  red = loadImage("tetris_red.png"); //206 x 316
  green = loadImage("tetris_green.png"); //206 x 315
  yellow = loadImage("tetris_yellow.png"); //275 x 316
  pics[0] = loadImage("mushroom.png");
  pics[1] = loadImage("mario.png");
  pics[2] = loadImage("star.png");
  
}

void draw(){
  noStroke();
  fill(shiftColor2+=2,100,100);
  rect(0,0,600,600);
  x1=randP(50);
  y1=randP(100);
  x2=randP(300);
  y2=randP(220);
  x3=randP(300);
  y3=randP(50);
  if(shiftColor2>=360)
    shiftColor2=0;
  
  if(Once){
    
    for(i=0;i<4;i++){
        X[i] = random(50,550);
        Y[i] = random(-150,-50);
    }
    Once = 0;
  }
  
  
  
  if(phase>1000){
    
    for(i=0;i<4;i++){  
      fill(shiftColor1++,100,100);
      stroke(shiftColor1+30);
      triangle(x1*i,y1*i,x2*i,y2*i,x3*i,y3*i);
      if(shiftColor1>=360){
        shiftColor1=0;
      }
    }
    
    pushMatrix();
    
    translate(-300,300);
    for(i=0;i<4;i++){  
      fill(shiftColor1++,100,100);
      stroke(shiftColor1+30);
      triangle(x1*i,y1*i,x2*i,y2*i,x3*i,y3*i);
      if(shiftColor1>=360){
        shiftColor1=0;
      }
    }
    
    pushMatrix();
    
    translate(600,0);
    rotate(rot1+=PI/27);
    for(i=0;i<4;i++){  
      fill(shiftColor1++,100,100);
      stroke(shiftColor1+30);
      triangle(x1*i,y1*i,x2*i,y2*i,x3*i,y3*i);
      if(shiftColor1>=360){
        shiftColor1=0;
      }
    }
    
    popMatrix();
    
    popMatrix();
    
    phase++;
    println(phase);
    
    if(phase>1500){
      f++; 
      phase=0;
    }
  }
  if(phase>=500){
    
    pushMatrix();
    translate(300,300);
    rotate(rot2+=-PI/45);
    image(pics[f],0,0);
    popMatrix();
    pushMatrix();
    if(Scale<=30){
      scale(Scale++);
    } else{
      Scale = 1;
    }
    fill(100,90,50,90);
    noStroke();
    rect(0,0,20,20);
    popMatrix();
    
    println(phase);
    phase++;
  }
    for(i=0;i<4;i++){
       
    if(i==0){
      blue.resize(46,131.7);
      image(blue, X[i],Y[i]+=3);
    }
    else if(i==1){
      red.resize(68.7,105);
      image(red, X[i],Y[i]+=2);
    }
    else if(i==2){
      green.resize(68.7,105);
      image(green, X[i],Y[i]+=1);
    }
    else if(i==3){
      yellow.resize(91.7,105);
      image(yellow, X[i],Y[i]+=4);
    }
    
    if(Y[i]>600){
      X[i] = random(50,550);
      Y[i] = random(-800,-100);
    }
  }
  phase++;
  if(f>=3)
    f=0;
  println(phase);
}


