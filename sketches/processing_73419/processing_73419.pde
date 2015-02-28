
int storeTime;
int incTime;
int xPos;
int yPos;
int bPos;
int fPos;
float a;
float TextFont;

void setup(){
  
  size(600,600);
  PFont font= loadFont("Corbel-35.vlw");
  textFont(font);
  storeTime=0;
  xPos=0;
  yPos=1;
  bPos=3;

  incTime= millis();
  
}

void draw (){
 {
  background(0);
   incTime= millis()/2;
  
  int seconds = (millis() - incTime) / 1000;
	 int minutes = seconds / 60;
	 
	 seconds-=minutes * 60;
	
	 fill(225,225,225);
	
	 text((minutes) + ":" + (seconds),540,540);
  
 }
  println ((incTime-storeTime)/10);
  xPos=((incTime-storeTime)/10);
  bPos=((incTime-storeTime)/20);
  fPos=((incTime-storeTime)/5);
  fill (183,250,129);
  rect(500,xPos,10,60);
  rect(xPos,20,10,60);
 
  fill(xPos);
    rect(xPos,500,10,60);
    rect(xPos,300,10,60);
    rect(400,xPos,10,60);
    rect(20,xPos,10,60);
 
  fill(62,255,250);
  
  rect(xPos,400,10,60);
  rect(xPos,100,10,60);
  rect(200,xPos,10,60);
  
  fill (206,138,252);
   rect(bPos,200,10,60);
  rect(bPos,100,10,60);
  rect(500,bPos,10,60);
  
  fill (235,255,198);
  rect (fPos,10,10,60);
  rect (fPos,570,10,60);
  
}

void mousePressed (){
  storeTime=incTime;
  
}

