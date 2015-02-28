
PImage img;
int eSize = 4;
int eSize2 = 3;
int x,y;
int c;

 
void setup() {
  size(450, 450);
  //background(255);
  noStroke();
  smooth();
   fill(0);
   
  img = loadImage("apple2.png");
  
  c = 0;
  x = width/2;
  y = height/2;
}

 
void draw() {
  
  ellipse(width/2, height/2, mouseX, mouseY);　// 円の動き
  fill(100, c, 150);
  image(img, 0, 0, 450, 450);　// 画像
  
  for(int y = 0; y <= height; y +=10){ 
  for(int x = 0; x <= width; x += 10){
    ellipse(x, y, eSize2, eSize2);
  }
}
  
}
void mouseMoved(){
  c ++;
  if(c > 255){
    c = 255;
  }  
}　　　// マウススライド


void mouseDragged(){
  c --;
  if(c < 10){
    c = 10;
  }
}　　　// マウスドラッグ

void keyPressed() { 

     background(37,99,113); 
 switch(key) { 
        case 'a':
      strokeWeight(1);
      stroke(255,c,c);
      break;　　// 枠あり
      
      case 'A':
      noStroke();
      break;　　// 枠なし
 }
}


