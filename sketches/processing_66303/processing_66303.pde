
float circleX;
float circleY;
int state;

void setup(){
  size(500,500);
  circleX=25;
  circleY=125;
  state=1;
}

void draw(){
  PFont font;                        
  font = loadFont("Helvetica-Bold-48.vlw"); 
  textFont(font); 
  String message="THIS IS A BALL";
  fill(255);
  rect(0,100,50,50);
  rect(400,100,50,50);
  rect(0,400,50,50);
  rect(400,400,50,50); 
  fill(255,0,0);
  ellipse(circleX,circleY,25,25);
  
  if (circleX>0 && circleX<50 && circleY >100 && circleY<150){
    state=1;
  }
  
  if(state==1){
    circleX=circleX+5;
  }
  
  if (circleX>425 && circleX<450 && circleY>100 && circleY<150){
    fill(120,25,50);
    rect(400,100,50,50);
    fill(0);
    text(message, 20, 80);
    state=2; 
  }

  if(state==2){
    circleX= circleX-7.0;
    circleY=circleY+5; 
  }
  
  if(circleX<30 && circleX>0 && circleY>400 && circleY<475){
    state=3;
    fill(120,25,50);
    rect(0,400,50,50);
  }
  
  if(state==3){
    circleX=circleX+5;
  }
  
  if(circleX>425 && circleX<450 && circleY>400 && circleY<450){
    state=4;
    background(0);
  }
  
}



