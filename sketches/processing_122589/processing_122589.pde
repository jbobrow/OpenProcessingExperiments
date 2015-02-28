
int maxX = 800, maxY = 500;
int eyeX = 100, eyeY = 200;

PImage bg, corBlue, corRed, eyes, uBroke, bNice;

PImage[] blackScreen = new PImage[12];
PImage[] crawlOut = new PImage[39];
PImage mouseOnTail = new PImage();
PImage[] punish = new PImage[2];

int catDraggedX, catDraggedY;

int action; //0= nothing. 1= crawling. 2= crawled out. 3= dragging. 4 = punishing. 5= blackscreen. 6= bnice/ubroke
int index;
int delayTime = 100;

int lastM;
int mil;

int catTailX1, catTailX2, catTailY1, catTailY2;
int plugX1, plugX2, plugY1, plugY2;
int relaX, relaY;
int catX, catY;

int tailPlugX, tailPlugY;
boolean refresh = true;

int endingTimer = 0;
void setup(){
  size(maxX, maxY);
  
  bg = loadImage("bg.jpg");
  corBlue = loadImage("coordinateblue.png");
  corRed = loadImage("coordinate-red.png");
  eyes = loadImage("eyes.png");
  uBroke = loadImage("ubrokehisheart.png");
  bNice = loadImage("bnice2him.png");
  
  for(int i = 0; i < blackScreen.length; i ++){
    if( i < 9){
      blackScreen[i] = loadImage("b0"+(i+1)+".png");
    }else{
      blackScreen[i] = loadImage("b"+(i+1)+".png");
    }
  }
  for(int i = 0; i < crawlOut.length; i ++){
    if( i < 9){
      crawlOut[i] = loadImage("c00"+(i+1)+".png");
    }else{
      crawlOut[i] = loadImage("c0"+(i+1)+".png");
    }
  }
  mouseOnTail = loadImage("c039v.png");
  punish[0] = loadImage("c040.png");
  punish[1] = loadImage("c041.png");
  
  action = 1;
  index = 0;
  catX = catY = 0;
  
  plugX1 = 615;
  plugX2 = 660;
  plugY1 = 160;
  plugY2 = 200;
  
  tailPlugX = 496;
  tailPlugY = 205;
}
void Bg(){
  image(bg,0,0);
}
void ShowEyes(){
  image(eyes, eyeX, eyeY);
}
void Crawl(){
  if(index < crawlOut.length){
    if(refresh){
      image(crawlOut[index++],0,0);
      refresh = false;
    }
  }else{
    catTailX1=450;
    catTailX2=515;
    catTailY1=190;
    catTailY2=250;
    index = 0;
    action = 2;
  }
}
void Punish(){
  if(index < 30){
    if(index % 10 < 6){
      if(refresh){
        image(punish[index % 2], 0, 0);
        refresh = false;
        index ++;
      }
    }else{
      if(refresh){
        image(punish[0], 0, 0);
        refresh = false;
        index ++;
      }
    }
  }else{
    index = 0;
    action = 5;
  }
}
void Black(){
  
  if(index < blackScreen.length){
    if(refresh){
      image(punish[0],0,0);
      image(blackScreen[index++],0,0);
      refresh = false;
    }
  }else{
    index = 0;
    action = 6;
  }
}
void Ending(){
  if(refresh){
    image(blackScreen[blackScreen.length - 1],0,0);
    image(uBroke,0,0);
    if(endingTimer++ == 15){
      image(bNice,0,150);
      noLoop();
    }else{
      refresh = false;
    }
  }
}
void ShowCorRed(){
  image (corRed,mouseX-45,mouseY-40); 
}
void ShowCorBlue(){
  image (corBlue,mouseX-45,mouseY-40); 
}
void updateTail(){
  catTailX1 = catX + 450;
  catTailX2 = catX + 515;
  catTailY1 = catY + 190;
  catTailY2 = catY + 250;
  tailPlugX = catX + 496;
  tailPlugY = catY + 205;
}
void draw(){
  if(action !=3 && action != 2){
    if( (millis()-lastM) > delayTime){
      refresh = true;
      lastM = millis();
      if(action != 6) Bg();
    }else{
      redraw();
    }
  }else{
    Bg();
  }
  
  if(action == 1){
    Crawl();
  }else if(action == 2){
    image(crawlOut[crawlOut.length-1], catX, catY);
    refresh = false;
    if(mousePressed){
        print("X "+mouseX+" Y "+mouseY);
    }
    if (mouseX > catTailX1 && mouseX < catTailX2 && mouseY > catTailY1 && mouseY < catTailY2) {
      if(mousePressed){
        relaX = mouseX - catX;
        relaY = mouseY - catY;
        action = 3;
      }else{
        ShowCorBlue();
     }
    }else{
      ShowCorRed();
    }
  }else if(action == 3){
    catX = mouseX -relaX;
    catY = mouseY -relaY;
    image(mouseOnTail, catX, catY);
    updateTail();
    if(!mousePressed){
      if(tailPlugX > plugX1 && tailPlugX < plugX2 && tailPlugY > plugY1 && tailPlugY < plugY2){
        index = 0;
        action = 4;
      }else{
        ShowCorBlue();
        relaX = relaY = 0;
        action = 2;
      }
    }
  }
  else if(action == 4){
    Punish();
  }
  else if(action == 5){
    Black();
  }
  else if(action == 6){
    Ending();
  }
}


