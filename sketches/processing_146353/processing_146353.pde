
//variables
int numMuneca=8;
int t=1;

//Matrices
color[]colorMuneca=new color[numMuneca];
float[]posX=new float[numMuneca];
float[]posY=new float[numMuneca];
float[]velX=new float[numMuneca];
float[]velY=new float[numMuneca];

void setup(){
  size(800,700);
  background(random(127),35,239);
  
  for(int i=0; i<numMuneca; i++){//posiciones iniciales
    colorMuneca[i]=color(125,random(200),45);
    posX[i]=width/4;
    posY[i]=height/4;
    velX[i]=random(4,8);
    velY[i]=random(10,20);
  }
}

void draw(){
  background(mouseX,mouseY);
  
  for(int i = 0; i<numMuneca; i++){//inicio del bucle
    posX[i]+=velX[i];
    posY[i]+=velY[i];
    
    if((posX[i]<80)||(posX[i]>width-80)){
      velX[i]=-velX[i];
    }
    if((posY[i]<110)||(posY[i]>height-60)){
      velY[i] =-velY[i];
    }
    
      
//Muneca
//Cara, pelo
  strokeWeight(4);
  stroke(0,0,0);
  fill(0,0,0);
  ellipse(posX[i],posY[i]-80,80,60);
  ellipse(posX[i],posY[i]-10,160,120);
  fill(252,230,201);
  ellipse(posX[i],posY[i],150,120);
  
//Ojos
strokeWeight(1);
  fill(245,161,187);
  ellipse(posX[i]-45,posY[i]-6,55,55);
  ellipse(posX[i]+45,posY[i]-6,55,55);
  
//capa negra
  fill(0,0,0);
  ellipse(posX[i]-39,posY[i]-8,40,40);
  ellipse(posX[i]+39,posY[i]-8,40,40);
  
//boca
  strokeWeight(2);
  noFill();
  ellipse(posX[i],posY[i]+30,28,34);
  noStroke();
  fill(252,230,201);
  rect(posX[i]-20,posY[i]+10,40,20);
  }
}

void mousePressed(){
  for(int i=0; i<numMuneca; i++){
    posX[i]=mouseX;
    posY[i]=mouseY;
  }
}
