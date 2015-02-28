
//based partially off a Generative Gestalthung image manipulation sketch
float posY = 300;
float posX = 200;
//pages
boolean page1 = true;
boolean page2 = false;
boolean page3 = false;
boolean page4 = false;

//gifs
import gifAnimation.*;
Gif skull,subcon;
 Gif zeldaup;
Gif zeldadown;
Gif zeldaleft;
Gif zeldaright;
Gif zeldarightidle;
Gif zeldaleftidle;
Gif zeldadownidle;
Gif current;
Gif loopingGif;
void setup(){
    background(0);
  size(600,400);
  
  // create the GifAnimation object for playback
  loopingGif = new Gif(this, "tree.gif");
  loopingGif.loop();
    zeldaleft = new Gif(this, "linkleft.gif");
  zeldaleft.loop();
    zeldaup = new Gif(this, "linkup.gif");
  zeldaup.loop();
  zeldaright = new Gif(this, "linkright.gif");
  zeldaright.loop();
zeldadown = new Gif(this, "linkdown.gif");
  zeldadown.loop();
    zeldarightidle = new Gif(this, "linkrightidle.gif");
  zeldarightidle.loop();
    zeldaleftidle = new Gif(this, "linkleftidle.gif");
  zeldaleftidle.loop();
  zeldadownidle = new Gif(this, "linkdownidle.gif");
  zeldadownidle.loop();
current=zeldadown;
current.play();
  skull = new Gif(this, "skullglow.gif");
subcon = new Gif(this, "subcon.gif");
 skull.play();
 subcon.play();

}
 
void draw(){
  if(page1){
    drawPage1();
  }
  else if(page2){
    drawPage2();
  }
  else if(page3){
    drawPage3();
  }
    else if(page4){
    drawPage4();
  }
}
 
void drawPage1(){
   background(0);
float tileCountX = keyCode/10+1;
  float tileCountY = keyCode/10+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 200; gridY < height; gridY += stepY){  
    for (float gridX =300; gridX < width; gridX += stepX){
      image(skull, gridX, gridY, stepX, stepY);
     image(subcon, 300, 200, 300, 300);
}
imageMode(CENTER);
  }
}
 
void drawPage2(){
{
  background(255,0,246);
   float tileCountX = keyCode/10+1;
  float tileCountY = keyCode/10+1;
  float stepX = width/tileCountX;
  float stepY = height/tileCountY;
  for (float gridY = 100; gridY < height; gridY += stepY){   
    for (float gridX = 100; gridX < width; gridX += stepX){
      image(loopingGif, gridX, gridY, 100,100);

      image(current, posX, posY, 120,130);
       fill(255);
       noStroke();
 rect(580,20,10,10);
    }
  }
}
}
 
void drawPage3(){
  background(0);
  noStroke();
  fill(255);
    noStroke();
 rect(580,20,10,10);
  }

  void drawPage4(){
  background(0);
  fill(255);
  rect(580,20,10,10);
  noStroke();
  }

  void keyPressed(){

if(keyCode==UP){
posY -= 20;
current = zeldaup;
current.play();
}


   if(posY<-0) {
      posY = 400;
   }

if(keyCode==DOWN){
posY += 20;
current = zeldadown;
current.play();
}

  if(posY<-400) {
      posY = 0;
   }
   
if(keyCode==LEFT){
posX -= 20;
current=zeldaleft;
current.play();
}

 if(posX<-600) {
      posY = 0;
   }
if(keyCode==RIGHT){
posX += 20;
current=zeldaright;
current.play();
}
}

  void keyReleased() {
  if(keyCode == LEFT) current=zeldaleftidle;current.play();
  if(keyCode == RIGHT)  current=zeldarightidle;current.play();
  if(keyCode == UP) current.stop();
  if(keyCode == DOWN) current=zeldadownidle;current.play();
}

void mousePressed(){
  if(page1){
    if(hitDetect(mouseX,mouseY,200,200,300,200,300,50)){
      page1=false;
      page2=true;
      page3=false;
       page4=false;
    }
  } else if(page2){
      if(hitDetect(mouseX,mouseY,20,20,580,20,300,50)){
      page1=false;
      page2=false;
      page3=true;
      page4=false;
    }
     } else if(page3){
      if(hitDetect(mouseX,mouseY,20,20,580,20,300,50)){
      page1=false;
      page2=false;
      page3=false;
      page4 = true;
    }
     } else if(page4){
      if(hitDetect(mouseX,mouseY,20,20,580,20,300,50)){
      page1=true;
      page2=false;
      page3=false;
      page4 = false;
    }
  } else if(page4){
  }
}
 
 
boolean hitDetect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  w1 /= 2;
  h1 /= 2;
  w2 /= 2;
  h2 /= 2;
  if(x1 + w1 >= x2 - w2 && x1 - w1 <= x2 + w2 && y1 + h1 >= y2 - h2 && y1 - h1 <= y2 + h2) {
    return true;
  } else {
    return false;
  }
}


