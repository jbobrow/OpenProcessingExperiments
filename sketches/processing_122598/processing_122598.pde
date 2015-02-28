
int eSize;
int r,g,b,a;

void setup() {
  size(600, 600);
  eSize = 5;
  smooth();
  frameRate(60);
  background(255);
  r=0;
  g=0;
  b=0;
  a=255;
  
  //palette
  noStroke();
  fill(0);//black
  rect(0,500,50,50);
  fill(128,128,128);//darkgray
  rect(50,500,50,50);
  fill(255,0,0);//red
  rect(100,500,50,50);
  fill(255,165,0);//orange
  rect(150,500,50,50);
  fill(255,255,0);//yellow
  rect(200,500,50,50);
  fill(0,128,0);//light green
  rect(250,500,50,50);
  fill(0,255,0);//green
  rect(300,500,50,50);
  fill(0,191,255);//deep sky blue
  rect(350,500,50,50);
  fill(0,0,255);//blue
  rect(400,500,50,50);
  fill(146,7,131);//purple
  rect(450,500,50,50);
  fill(228,0,127);//magenta
  rect(500,500,50,50);
  fill(255,228,196);//bisque
  rect(550,500,50,50);
  
  //pallette2
  fill(255);//white
  rect(0,550,50,50);
  fill(211,211,211);//ligth gray
  rect(50,550,50,50);
  fill(255,192,203);//pink
  rect(100,550,50,50);
  fill(255,215,0);//gold
  rect(150,550,50,50);
  fill(209,247,113);//yellow green
  rect(200,550,50,50);
  fill(144,238,144);//light green
  rect(250,550,50,50);
  fill(127,255,212);//green
  rect(300,550,50,50);
  fill(224,255,255);//lightcyan
  rect(350,550,50,50);
  fill(100,149,237);//cornflowerblue
  rect(400,550,50,50);
  fill(221,160,221);//plum
  rect(450,550,50,50);
  fill(255,127,255);//light magenta
  rect(500,550,50,50);
  fill(255,218,185);//peachpuff
  rect(550,550,50,50);
  
  fill(r,g,b,a);
}

void draw() {
  //ellipse(mouseX, mouseY, 10, 10);
}

void mouseMoved(){
 // switch(key){
   // case'm':
     //fill(random(155)+100, random(155)+100,random(155)+100,20);
      //if(mouseY<500-150/2){
        //ellipse(mouseX, mouseY, 150,150);
     // }
    
    //case's':{
     //fill(r,g,b,a);
    //}
  //}
}

void mouseDragged(){
  if(mouseY<500-eSize/2){
  fill(r,g,b,a);
  ellipse(mouseX, mouseY,eSize,eSize);
  }
}

void mousePressed(){
  //pallette
  if(mouseX>=0 && mouseX<50 && mouseY<=500 && mouseY<550 ){
    r=0;
    g=0;
    b=0;
  }
    if(mouseX>=50 && mouseX<100 && mouseY>=500 && mouseY<550 ){
    r=128;
    g=128;
    b=128;
  }
    if(mouseX>=100 && mouseX<150 && mouseY>=500 && mouseY<550 ){
    r=255;
    g=0;
    b=0;
  }
    if(mouseX>=150 && mouseX<200 && mouseY>=500 && mouseY<550 ){
    r=255;
    g=165;
    b=0;
  }
    if(mouseX>=200 && mouseX<250 && mouseY>=500 && mouseY<550 ){
    r=225;
    g=255;
    b=0;
  }
    if(mouseX>=250 && mouseX<300 && mouseY>=500 && mouseY<550 ){
    r=0;
    g=128;
    b=0;
  }
    if(mouseX>=300 && mouseX<350 && mouseY>=500 && mouseY>550 ){
    r=0;
    g=255;
    b=0;
  }
    if(mouseX>=350 && mouseX<400 && mouseY>=500 && mouseY<550 ){
    r=0;
    g=191;
    b=225;
  }
    if(mouseX>=400 && mouseX<450 && mouseY>=500 && mouseY<550 ){
    r=0;
    g=0;
    b=255;
  }
    if(mouseX>=450 && mouseX<500 && mouseY>=500 && mouseY<550 ){
    r=146;
    g=7;
    b=131;
  }
    if(mouseX>=500 && mouseX<550 && mouseY>=500 && mouseY<550 ){
    r=228;
    g=0;
    b=127;
  }
    if(mouseX>=550 && mouseX<600 && mouseY>=500 && mouseY<550 ){
    r=255;
    g=228;
    b=196;
  }
  //pallette2
    if(0<=mouseX && mouseX<50 && 550<=mouseY && mouseY<600 ){
    r=255;
    g=255;
    b=255;
  }
    if(50<=mouseX && mouseX<100 && 550<=mouseY && mouseY<600 ){
    r=211;
    g=211;
    b=211;
  }
    if(100<=mouseX && mouseX<150 && 550<=mouseY && mouseY<600 ){
    r=255;
    g=192;
    b=203;
  }
    if(150<=mouseX && mouseX<200 && 550<=mouseY && mouseY<600 ){
    r=255;
    g=215;
    b=0;
  }
    if(200<=mouseX && mouseX<250 && 550<=mouseY && mouseY<600 ){
    r=209;
    g=247;
    b=113;
  }
    if(250<=mouseX && mouseX<300 && 550<=mouseY && mouseY<600 ){
    r=144;
    g=238;
    b=144;
  }
    if(300<=mouseX && mouseX<350 && 550<=mouseY && mouseY<600 ){
    r=127;
    g=255;
    b=212;
  }
    if(350<=mouseX && mouseX<400 && 550<=mouseY && mouseY<600 ){
    r=224;
    g=255;
    b=255;
  }
    if(400<=mouseX && mouseX<450 && 550<=mouseY && mouseY<600 ){
    r=100;
    g=149;
    b=237;
  }
    if(450<=mouseX && mouseX<500 && 550<=mouseY && mouseY<600 ){
    r=221;
    g=160;
    b=221;
  }
    if(500<=mouseX && mouseX<550 && 550<=mouseY && mouseY<600 ){
    r=255;
    g=127;
    b=255;
  }
    if(550<=mouseX && mouseX<600 && 550<=mouseY && mouseY<600 ){
    r=255;
    g=218;
    b=185;
  }
  fill(r,g,b,a); 
}
    
  

void keyPressed(){
  switch(key){
    //clean
    case'c':
      fill(255);
      rect(0,0,600,500);
      fill(r,g,b,a);
      break;
    //size
    case'+':
      eSize += 5;
      println(eSize);
      break;
    case'-':
      eSize -= 5;
      println(eSize);
      break;
    //color
    case'7':
      r += 50;
      g += 50;
      b += 50;
      fill(r,g,b,a);
      break;
    case'9':
      r -= 50;
      g -= 50;
      b -= 50;
      fill(r,g,b,a);
      break; 
    //alpha
    case'4':
      a += 50;
      fill(r,g,b,a);
      break;
    case'6':
      a -= 50;
      fill(r,g,b,a);
      break; 
  } 
  //size
  if(eSize < 0){
    eSize = 5;
  }
  if(eSize > 200){
    eSize = 200;
  }
  //color
  if(r<0){
    r=0;
  }
  if(g<0){
    g=0;
  }
  if(b<0){
    b=0;
  }
  if(r>255){
    r=255;
  }
  if(g>255){
    g=255;
  }
  if(b>255){
    b=255;
  }
  //alpha
  if(a<0){
    a=0;
  }
  if(a>255){
    a=255;
  }
  
    
}


