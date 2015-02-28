
int x = 0;
int y = 0;
int currentTime = 0;
int startTime = 0;
PFont font;

void setup(){
  size(700,600);
  font = loadFont("pepsi.vlw");
  textFont(font);
}
void draw(){
  currentTime = millis();
  int time = currentTime-startTime;
  int stopwatch = currentTime-startTime;
  translate(width/2,height/2);
  rotate((time/500)*(PI/4));
  background(0+(time/100),0+(time/100),0+(time/100));
  noStroke();
  
  fill(random(100,255),0,0);
  ellipse(x,y,time/500,time/500);
  
  ellipse(x-(time/240),y-(time/240),time/300,time/300);
  ellipse(x+(time/240),y-(time/240),time/300,time/300);
  ellipse(x+(time/240),y+(time/240),time/300,time/300);
  ellipse(x-(time/240),y+(time/240),time/300,time/300);
  
  ellipse(x-(time/120),y,time/250,time/250);
  ellipse(x,y-(time/120),time/250,time/250);
  ellipse(x+(time/120),y,time/250,time/250);
  ellipse(x,y+(time/120),time/250,time/250);
  
  ellipse(x-(time/65),y,time/190,time/190);
  ellipse(x,y-(time/65),time/190,time/190);
  ellipse(x+(time/65),y,time/190,time/190);
  ellipse(x,y+(time/65),time/190,time/190);
  
  ellipse(x-(time/70),y-(time/70),time/180,time/180);
  ellipse(x+(time/70),y-(time/70),time/180,time/180);
  ellipse(x+(time/70),y+(time/70),time/180,time/180);
  ellipse(x-(time/70),y+(time/70),time/180,time/180);
  
  ellipse(x-(time/45),y-(time/45),time/160,time/160);
  ellipse(x+(time/45),y-(time/45),time/160,time/160);
  ellipse(x+(time/45),y+(time/45),time/160,time/160);
  ellipse(x-(time/45),y+(time/45),time/160,time/160);
  
  ellipse(x-(time/27),y,time/150,time/150);
  ellipse(x,y-(time/27),time/150,time/150);
  ellipse(x+(time/27),y,time/150,time/150);
  ellipse(x,y+(time/27),time/150,time/150);
  
  fill(random(50,150),50,random(150,255));
  
  ellipse(x-(time/300),y,time/400,time/400);
  ellipse(x,y-(time/300),time/400,time/400);
  ellipse(x+(time/300),y,time/400,time/400);
  ellipse(x,y+(time/300),time/400,time/400);
  
  ellipse(x-(time/120),y-(time/120),time/230,time/230);
  ellipse(x+(time/120),y-(time/120),time/230,time/230);
  ellipse(x+(time/120),y+(time/120),time/230,time/230);
  ellipse(x-(time/120),y+(time/120),time/230,time/230);
  
  ellipse(x-(time/40),y,time/170,time/170);
  ellipse(x,y-(time/40),time/170,time/170);
  ellipse(x+(time/40),y,time/170,time/170);
  ellipse(x,y+(time/40),time/170,time/170);
  
  ellipse(x-(time/30),y-(time/30),time/140,time/140);
  ellipse(x+(time/30),y-(time/30),time/140,time/140);
  ellipse(x+(time/30),y+(time/30),time/140,time/140);
  ellipse(x-(time/30),y+(time/30),time/140,time/140);
  
  fill(255-(time/100),255-(time/100),255-(time/100));
  textSize(10+(time/300));
  text(stopwatch/1000,-30-(time/500),5+(time/800));
}
void mousePressed(){
  startTime = currentTime;
}

