
PImage img;
PFont font;
float y1 = 60;
float y2 = 60;
float y3 = 160;
float y4 = 160;
float y5 = 160;
int d = 1;
int choice=0;
void setup(){
    size(583,389);
    font = loadFont("Silom-20.vlw");
    img = loadImage("supplies.jpg");
    background(img);
    textFont(font);
   
}
void draw(){
   image(img,0,0);
   if(mouseX>55 && mouseX< 170 && mouseY>60 && mouseY <291 ){
     choice=1;
   }
   if(mouseX>169 && mouseX< 265 && mouseY>61 && mouseY <276 ){
     choice=2;
   }
    if(mouseX>264 && mouseX< 382 && mouseY>204 && mouseY <288 ){
     choice=3;
   }
  if(mouseX>376 && mouseX< 495 && mouseY>131 && mouseY <288 ){
     choice=4;
   }
   if(mouseX>494 && mouseX< 561 && mouseY>215 && mouseY <343 ){
     choice=5;
   }
 
   if(choice ==1){
   text("Milk", 75, y1);
   text("1 3/4 cups", 60, 310);
   
   if (y1<70 && y1>=20 && d==1 ){
      y1=y1-.5;
    }
   if (y1==20.5){
     d=0;
   }
    if (y1>=20 && y1<70 && d==0 ){
      y1=y1+.5;
    }
    if (y1==60){
     d=1;
   }
   }
    if(choice ==2){
   text("Oil", 190, y2);
   text("1/2 cup", 180, 300);
   if (y2<70 && y2>=20 && d==1 ){
      y2=y2-.5;
    }
   if (y2==20.5){
     d=0;
   }
    if (y2>=20 && y2<70 && d==0 ){
      y2=y2+.5;
    }
    if (y2==60){
     d=1;
   }
   }
  if(choice ==3){
   text("Eggs", 290, y3);
   text("2", 320,310);
   if (y3<180 && y3>=130 && d==1 ){
      y3=y3-.5;
    }
   if (y3==130.5){
     d=0;
   }
    if (y3>=130 && y3<180 && d==0 ){
      y3=y3+.5;
    }
    if (y3==170){
     d=1;
   }
   }
    if(choice ==4){
   text("Flour", 430, y4);
   text("1 3/4 Cups",370,310);
   if (y4<180 && y3>=130 && d==1 ){
      y4=y4-.5;
    }
   if (y4==130.5){
     d=0;
   }
    if (y4>=130 && y3<180 && d==0 ){
      y4=y4+.5;
    }
    if (y4==170){
     d=1;
   }
   }
 
   if(choice ==5){
   text("Salt", 500, y5);
   text("1/4 Tsp",475,360);
   if (y5<180 && y5>=130 && d==1 ){
      y5=y5-.5;
    }
   if (y5==130.5){
     d=0;
   }
    if (y5>=130 && y3<180 && d==0 ){
      y5=y5+.5;
    }
    if (y5==170){
     d=1;
   }
   }
     println(d);
   
}

