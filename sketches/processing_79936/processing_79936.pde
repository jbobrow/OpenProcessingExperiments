
int cX=0;
int cY=0;
int count=0;
int c1 = 100;
int c2 = 200;
int c3 = 300;
int windCount;
boolean windOn= false;
Cloud[] clouds = new Cloud [5]; 

void setup(){
  size(600,600);
  for(int i=0; i < clouds.length; i++){
    clouds[i] = new Cloud((130*i),int(random(0,50)), random(1,5));
  }
}

void draw(){
  pushMatrix();
    noStroke();
    fill(50,50,200);
    rect(0,0,height,width);
  popMatrix();
  
  for (int i=0; i < clouds.length; i++){
    clouds[i].drawCloud();
  }
  
  pushMatrix();
    fill(200,200,200);
    ellipse((width/2), height, 220,55);
    fill(130,130,130);
    ellipse((width/2), height, 200,50);
  popMatrix();
  
  if(mousePressed){
    windOn = true;
    windCount += 10;
    fill(200,10);
    ellipse((width/2), height-30, (width/2)-80, height+windCount);
  }else{
    windOn = false;
    windCount=0;
  }
}

class Cloud{

int xPos;
int yPos;
float sc;

Cloud(int _xPos, int _yPos, float _sc){
  this.xPos = _xPos;
  this.yPos = _yPos;
  this.sc = _sc;
}

void drawCloud(){
  pushMatrix();
    if(xPos > width){
      xPos = -300;
    }else{
      xPos+= sc;
    }
    
    
    if(windOn){
      if(sc > 0.5){
        if(((height+windCount)/2) > (yPos+30)){
        if((xPos > 200) && (xPos < 300)){
          sc-= 0.1;
        }
       }
      }
    }else{
      if(sc < 10){
        sc+=0.01;
      }
    }
    
    translate(xPos,yPos);
    noStroke();
    scale(0.3);
    scale(sc);
    fill(255);
    ellipse(10,100,80,30);
    ellipse(0,80,50,30);
    ellipse(10,110,50,30);
  popMatrix();
}
}


