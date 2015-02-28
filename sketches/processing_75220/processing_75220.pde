
int xPosition=100;
int yPosition=200;
int d=50;
int yPos =0;
int dir =1;
PFont font;
void setup (){
size (640,480);
frameRate(60);
}

void draw (){
  {
    println(frameRate);
fill(random(0,255),random(0,255),176);
 font = loadFont("CooperBlackStd-48.vlw");
textFont(font, 100);
text("PARTY", 95, yPos);
  font = loadFont("CooperBlackStd-48.vlw");
textFont(font, 100);
text("BOOB", 130, yPos+60);
font = loadFont("CooperBlackStd-48.vlw");
textFont(font, 100);
text("BEACH",90, yPos+120);



 
     frameRate(60);
  fill (255,235,201);
  ellipse (random(0,640),random(0,480),d,d);
    ellipse (random(0,640)+35,random(0,480)+35,d,d);
    fill (255,195,201);
  ellipse (random(0,640),random(0,480),d/3,d/3);
    ellipse (random(0,640)+35,random(0,480)+35,d/3,d/3);
    fill (240,103,148);
ellipse (random(0,640),random(0,480),d/10,d/10);
    ellipse (random(0,640)+35,random(0,480)+35,d/10,d/10);
}


if (yPos > 480 || yPos < 0){ //|| or, && : and
dir = dir * -1;
 }


  yPos += 10* dir; // xPos = xPos +10*dir
  
  //x = x+1;      ===      x +=1;
if (keyPressed ==true) {
  background(255);}
}



