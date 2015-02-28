
 float peterX;
float peterY;

float peterWidth;
float peterHeight;

float r = 255;
float g = 100;
float b = 180;


void setup(){
  background(255);
  size(400, 400);
  smooth();
  ellipseMode(RADIUS);
  
  peterX = width/2;
  peterY = height/2;
  
  peterWidth = 50;
  peterHeight = 50;
  

}

void draw(){
  background(104);
  
  if(mousePressed){
    peterX = mouseX;
    peterY = mouseY;
  }
  if(mousePressed){
    if(mouseButton == RIGHT){
      r = random(0, 255);
      g = random(0, 255);
      b = random(0, 255);
    }
  }else{
    r = 255;
    g = 100;
    b = 180;
  }
      
  if(keyPressed){
    peterWidth=15;
    peterHeight=15;
  }else{
     peterWidth = 50;
  peterHeight = 50;
  }
  
noStroke();
fill(255);
arc(peterX, peterY, peterWidth, peterHeight, PI, TWO_PI);
//head
triangle(peterX-peterWidth, peterY, peterX, peterY+(peterHeight*2), peterX+peterWidth, peterY);
//nose
fill(0);
ellipse(peterX, peterY+(peterHeight*2), peterWidth/10, peterHeight/10);
fill(r, g, b);
stroke(0);
strokeWeight(peterWidth/6);
//right ear
ellipse(peterX+(peterWidth*.05)+peterWidth, peterY-peterHeight/1.25, peterWidth/1.35, peterHeight/1.35);
//left ear
ellipse(peterX-(peterWidth*.05)-peterWidth, peterY-peterHeight/1.25, peterWidth/1.35, peterHeight/1.35);
strokeWeight(2);
fill(0);
//left eye
ellipse(peterX-(peterWidth/2),peterY+(peterHeight/1.75),peterWidth/8,peterHeight/8);
//right eye
ellipse(peterX+(peterWidth/2),peterY+(peterHeight/1.75),peterWidth/8,peterHeight/8);
stroke(0);
strokeWeight(3);
//left whiskers
line(peterX-(peterWidth/1.5),peterY+(peterHeight*1.5), peterX-(peterWidth/5), peterY+(peterHeight*1.5));
line(peterX-(peterWidth/1.75),peterY+(peterHeight*1.65), peterX-(peterWidth/5),peterY+(peterHeight*1.5));
line(peterX-(peterWidth/1.85),peterY+(peterHeight*1.85), peterX-(peterWidth/5),peterY+(peterHeight*1.5));
//right whiskers
line(peterX+(peterWidth/5),peterY+(peterHeight*1.5),peterX+(peterWidth/1.5),peterY+(peterHeight*1.5));
line(peterX+(peterWidth/5),peterY+(peterHeight*1.5),peterX+(peterWidth/1.75),peterY+(peterHeight*1.65));
line(peterX+(peterWidth/5),peterY+(peterHeight*1.5),peterX+(peterWidth/1.85),peterY+(peterHeight*1.85));
noStroke();
fill(255);
//left eye gleam
ellipse((peterX-(peterWidth/2))+peterWidth/20,(peterY+(peterHeight/1.75))-peterHeight/20,peterWidth/15, peterHeight/15);
//right eye gleam
ellipse((peterX+(peterWidth/2))+peterWidth/20,(peterY+(peterHeight/1.75))-peterHeight/20,peterWidth/15, peterHeight/15);
 
}


