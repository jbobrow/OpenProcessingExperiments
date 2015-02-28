
int storeTime;
int incTime;
int w;

float angle = 00;
float offset = 300;
float scalar= 40;
float speed = 0.45;
PFont font;


void setup(){
  size(600,600);
  storeTime=0;
  incTime=0;
  font=loadFont("Noteworthy-Bold-60.vlw");
  textFont(font);
}

void draw(){
  
 incTime=millis();
  int r = (incTime-storeTime)/100;
  int w = (incTime-storeTime);
  
  background(216,216,216);
  fill(255,255,255);
  noStroke();
  ellipse(300,300,160,160);
  
  float x=offset + cos(angle) * scalar;
  float y= offset + sin(angle) * scalar;
 fill(random(0,255),0,0);
  ellipse(x,y,40,40);
  angle += speed;
  
  textSize(60);
  text(w,225,120);
 
 if(millis()<10000){
  textSize(60);
  text("Click to restart time", 60,500);
 }
  

  
  //top
  if (millis()<2000){
    fill(252,28,3);
    ellipse (300,180,40,40);
  }
  
  //ne
    if (millis()< 3000){
    fill(225,124,0);
    ellipse (380,210,40,40);
    }
    
    //right
   if (millis()<4000){
   fill(250,255,3);
    ellipse (410,300,40,40);
  }
    
    //se
    if (millis()<5000){
     fill(80,220,7);
    ellipse (380,380,40,40);
  }
    
   
  //bottom
  if (millis()<6000){
    fill(3,200,252);
    ellipse (300,410,40,40);
  }
  
  
  //sw
  if (millis()< 7000){
    fill(3,37,252);
    ellipse (220, 380,40,40);
  }
  
  //left  
     if (millis()<8000){
     fill(147,3,252);
    ellipse (190,300,40,40);
  }
  
  
  //nw
  if (millis()< 9000){
    fill(250,63,204);
    ellipse (220,210,40,40);
  }
  
  
  
  
  
  
  
  
  
  //top
  if (millis()>10000){
    fill(252,28,3);
    ellipse (300,180,40,40);
  }
  
//ne
    if (millis()> 11000){
    fill(225,124,0);
    ellipse (380,210,40,40);
    }
    
    //right
   if (millis()>12000){
     fill(250,255,3);
    ellipse (410,300,40,40);
  }
    
    //se
    if (millis()>13000){
     fill(80,220,7);
    ellipse (380,380,40,40);
  }
    
   
  //bottom
  if (millis()>14000){
    fill(3,200,252);
    ellipse (300,410,40,40);
  }
  
  
  //sw
  if (millis()> 15000){
    fill(3,37,252);
    ellipse (220, 380,40,40);
  }
  
  //left  
     if (millis()>16000){
     fill(147,3,252);
    ellipse (190,300,40,40);
  }
  
  
  //nw
  if (millis()>17000){
   fill(250,63,204);
    ellipse (220,210,40,40);
  }
  
}
  
void mousePressed(){
 storeTime=incTime;
} 
  
  
  
  
  
  
  
  
  
  
  
  

