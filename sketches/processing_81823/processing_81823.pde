

int [] a = {12478,13812,9128,8421,7320};
//int [] b = {1,2,3};
int dataPhase;
int value = 0;
int barX = 0;
float delta;
int growth = 5;
boolean drawBar;// = False;
//PFont font;
//int fontSize;

void setup(){ 
  noStroke();
  smooth();
  size(500,500);
  drawBar = false;
//  fontSize = width/20;
//  font = loadFont("BebasNeue.otf");

  
}


void draw(){
  background(0);
  if(dataPhase == 0){
    mainPage();
  }
  else if (dataPhase == 1){
 genres();
// showData();
 loadText();
  }
  drawNewBar(mouseY,width);
}

//void showData() {
//  fill(100);
//  int i = int(map(mouseY,0, height,
//                         0, a.length));
//  int j = int(map(mouseX,0, width,
//                         0, a.length));
//  text(str(a[i]),mouseX,mouseY);
//  text(str(b[j])+","+str(a[i]),mouseX,mouseY);
  //print( a[i]);
//}



void mainPage() {
  PImage img;
  img = loadImage("title.jpg");
  image(img, 0, 0);
  }

void mousePressed() {
  if (dataPhase == 0) {
    dataPhase = 1;
  }
  
  if (mouseY <= height) {
    if (drawBar == true){
      drawBar = false;
    }
    else{
      drawBar = true;
    }
    fill(0);
   // rect(0, 0, barX, height*.20);
    text(a[0],0,height*2);
  }
}

void drawNewBar(int location,int len){
  if(drawBar == true){
//    println("drawBar is true");
    if(location > 0  && location < height*.2){
      rect(0,0,len,height*.2);
            fill(255);
      text(a[0],0, height*.2);
    }
    if(location < height*.4  && location > height*.2){
      fill(#847767);
      rect(0,height*.2,len,height*.2);
            fill(255);
      text(a[1],0, height*.4);
    }
    if(location < height*.6  && location > height*.4){
      fill(#847767);
      rect(0,height*.4,len,height*.2);
            fill(255);
      text(a[2],0, height*.6); 
    }
    if(location < height*.8 && location > height*.6){
      fill(#847767);
      rect(0, height*.6,len,height*.2);
            fill(255);
      text(a[3],0,height*.8);
    }
    if(location < height && location > height*.8){
      fill(#847767);
      rect(0, height*.8,len,height*.2);
            fill(255);
      text(a[4],0,height);
    }
    

  }
//      if(location < height*.2){
////      println("drawing bar");
//      rect(0,0,len,height*.2);
//      text(a[0],0, height*.2);
//  }
}

void genres() {

  fill(255);
  rect(0, 0, width, height*.20);
  fill(#eeeade);
  rect(0, height*.20, width, height*.20);
  fill(#d5c6b0);
  rect(0, height*.40, width, height*.20);
  fill(#b59a85);
  rect(0, height*.60, width, height*.20);
  fill(#847767);
  rect(0, height*.80, width, height*.20);

}

void loadText() {
//  textFont(font, fontSize);
  

  text("a l t e r n a t i v e", 0, height*.2);
  textSize(50);
  
  text("i n d i e", 0, height*.4);
  
  text("r & b", 0, height*.6);
  
  text("e l e c t r o n i c a", 0, height*.8);
  
  fill(255);
  text("r o c k", 0, height);
  
  fill(#847767);
}


