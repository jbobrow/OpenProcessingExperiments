

boolean catInBox = false;
PImage bg, cateye, cored, coblue, wool;
//PImage[] catWalk = new PImage[2];
//PImage[][] catPlwool = new PImage[3][5];
//PImage[] catWalkBack = new PImage[2];
PImage[][] catPlWool = new PImage[4][];
PImage[] woolBall = new PImage[11];
PImage divWoolBall;

float yCatPos;
float xCatPos;

int woolIsShowing=0;
boolean isCatInBox = true;

int steps = 10;
//int delayTime = 2*1000/steps;
int delayTime = 50;
int delayTime2 = 100;
int stepX = 300/steps;
int stepY = 100/steps;
int times = 0;

int drinkSteps = 5;
int rand = 0;

int locX = 0, locY = 0;
int maxX = 800, maxY = 500;

int step = 1, index = 0;
boolean animating = false;

int catEyeX = 100, catEyeY = 200;

int woolX = 580, woolY = 380;

void setup() {
   size(maxX , maxY);
   
    

   bg = loadImage("bg.jpg");
   cateye = loadImage("eyes.png");
   cored = loadImage("coordinate-red.png");
   coblue = loadImage("coordinateblue.png");
   //wool = loadImage("woolball.png");
   
   catPlWool[0] = new PImage[6];
   for(int i=0;i<6;i++){
     catPlWool[0][i] = loadImage("way1-"+(i+1)+".png");
   }
   catPlWool[1] = new PImage[7];
   for(int i=0;i<7;i++){
     catPlWool[1][i] = loadImage("way1b-"+(i+1)+".png");
   }
   catPlWool[2] = new PImage[34];
   for(int i=0;i<34;i++){
     catPlWool[2][i] = loadImage("way2-"+(i+1)+".png");
   }
   catPlWool[3] = new PImage[2];
   catPlWool[3][0] = loadImage("catwalkb1.png");
   catPlWool[3][1] = loadImage("catwalkb2.png");
   
   for(int i=0; i< woolBall.length;i++){
     woolBall[i] = loadImage("wool"+(i+1)+".png");
   }
   divWoolBall = loadImage("woolball2.png");
}

void draw() {
   
   
    
   if(isCatInBox){
        showBg();
        image(cateye,catEyeX, catEyeY);
        image(cored,mouseX-45,mouseY-40);
        if (mouseX > 200 && mouseX < 300 && mouseY > 200 && mouseY < 400) {
             image (coblue,mouseX-45,mouseY-40); 
          if(mousePressed) { 
             animating = true;
             isCatInBox =false;
             step = 1;
             clickLeft();
             //test();
           }
          else{
          }
       }
       
       if(mouseX > 500 && mouseX < 600 && mouseY > 200 && mouseY < 400){
          image (coblue,mouseX-45,mouseY-40); 
          if(mousePressed) { 
             animating = true;
             isCatInBox =false;
             step = 3;
             clickRight();
           }
          else{
          }
       }
   }
   else if(animating){
     continueAnimation();
   }
}

void showBg(){
  image(bg,0,0);
}

void restoreVariables(){
  isCatInBox = true;
  animating = false;
  step = 1;
  index = 0;
}

void test(){
  
   image(catPlWool[0][0],0,0);
   image(woolBall[0], 0,0);
   delay(500);
   redraw();
}
void continueAnimation(){
  if (step ==1 || step ==2){
    clickLeft();
  }else if(step == 3 || step ==4){
    clickRight();
  }
}

void clickLeft(){
  animating = true;
  
  showBg();
  
  if(step == 1){
    locX = 100+index*10;
    locY = 200;
    image(catPlWool[0][index % 6],locX, locY);
    image(woolBall[index % 11], locX+200, locY+200);
    index += 1;
    delay(delayTime);
    
    if(locX > maxX){
      delay(2000);
      step = 2;
      index = 0;
    }
    redraw();
  }
  
  if(step == 2){
    
    locX = 800-index*10;
    locY = 300;
    if(locX < catEyeX){
      image(catPlWool[1][catPlWool.length-1], catEyeX, locY);
      image(woolBall[10 - index % 11], locX, locY);
      if(locX < -100){
        restoreVariables();
      }
      index += 1;
      delay(delayTime);
      redraw();
    }
    else{
      image(catPlWool[1][index % 7],locX+40, locY);
      image(woolBall[10 - index % 11],locX, locY);
      index += 1;
      delay(delayTime);
      redraw();
    }
  }
  
      
}
void clickRight(){
  animating = true;
  
  showBg();
  
  if(step == 3){
    locX = 0;
    locY = 100;
    image(catPlWool[2][index], locX, locY);
    if(index < 9){
      image(divWoolBall, woolX, woolY);
    }
    index += 1;
    if(index == catPlWool[2].length){
      step = 4;
      index = 0;
    }
    delay(delayTime2);
    redraw();
  }
  
  if(step == 4){
    locX = 500-10*index;
    locY = 200;
    image(divWoolBall, woolX, woolY);
    image(catPlWool[3][index % 2], locX, locY-2*index);
    index += 1;
    if(locX < catEyeX){
      restoreVariables();
    }
    delay(delayTime2);
    redraw();
  }
  
}


