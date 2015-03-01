
/////課題4/////
/*@pjs preload="kadai4-1.jpg;*/
int x,y,w,r,b,g,a,eSize;
PImage photo;

void setup() {
  size(500, 500);
  photo = loadImage("kadai4-1.jpg");
  image(photo, 0, 0);
  noStroke();
  smooth();
   
  r=0;
  b=0;
  g=0;
  a=175;
  eSize=10;
}
 
void draw(){
}

void keyPressed(){
   
  //alp
  if(key == CODED) {
/////リセット/////
 if(keyCode == SHIFT){
   image(photo, 0, 0);
    }
  }
   
   
  switch(key) {
/////紅葉(赤)/////
    case 'r':
      r=255;
      g=0;
      b=0;
      a=175;
      break;
/////紅葉(オレンジ)/////
      case 'o':
      r=224;
      g=67;
      b=9;
      a=175;
      break;
/////紅葉(黄)/////
      case 'y':
      r=255;
      g=255;
      b=0;
      a=175;
      break;
/////葉っぱ/////
    case 'g':
      r=40;
      g=178;
      b=8;
      a=175;
      break;
/////青/////
    case 'b':
      r=0;
      g=0;
      b=255;
      a=175;
      break;
/////桜/////
    case 's':
      r=255;
      g=121;
      b=190;
      a=175;
      break;
/////雪/////
    case 'w':
      r=240;
      g=240;
      b=240;
      a=175;
      break;
      
/////黒/////
    case 'k':
      r=0;
      g=0;
      b=0;
      a=175;
      break;
      
      case '4':
      eSize=20;
      break;
      
      case '3':
      eSize=10;
      break;
      
      case '2':
      eSize=5;
      break;
 }
 }
/////丸/////
void mouseDragged() {
  fill(r,g,b,a);
    noStroke();
    ellipse(mouseX,mouseY,eSize,eSize);
/////スプレー/////
  if(key == '1'){
    noStroke();
    rect(mouseX+random(5,30),mouseY-random(5,30),random(2,20),random(2,20));
    rect(mouseX-random(5,30),mouseY+random(5,30),random(2,20),random(2,20));
    rect(mouseX+random(5,30),mouseY+random(5,30),random(2,20),random(2,20));
    rect(mouseX-random(5,30),mouseY-random(5,30),random(2,20),random(2,20));
  }
}


