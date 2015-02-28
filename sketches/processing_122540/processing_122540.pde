
int x,y;
int c;
int timer = 0;
  
void setup() {
  size(600, 600);
  background(37,99,113);
  noStroke();
  frameRate(20);
  smooth();
   
  c = 0;
  x = width/2;
  y = height/2;
}
  
void draw() {
  ellipse(width/2, height/2, mouseX, mouseY);
  fill(c, c, 100);
}
 
void mouseMoved(){　　//  円が黄色に変化します。
  c ++;
  if(c > 255){
    c = 255;
  } 
}
 
void mouseDragged(){　　//　円が紺色に変化します。
  c --;
  if(c < 10){
    c = 10;
  }
}
 
void keyPressed() {
     background(37,99,113);
     switch(key) {
       
      case 'a':       //　枠線なしの状態にリセットされます。
      noStroke();
      break;
        
      case 'b':　　　　//　黄緑の枠線
      strokeWeight(1);
      stroke(80,200,80);
      break;
       
      case 'B':　　　//　　黄緑の太枠
      strokeWeight(30);
      stroke(80,200,80);
      break;
       
      case 'c':　　　　//　　紺の状態：赤の枠線　黄色の状態：赤の枠線
      strokeWeight(1);
      stroke(255,c,c);
      break;
       
      case 'C':　　　//　　紺の状態：赤の太枠　黄色の状態：白の太枠
      strokeWeight(30);
      stroke(255,c,c);
      break;
       
      case 'd':　　　　//　　紺の状態：黒の枠線　　黄色の状態：白の枠線
      strokeWeight(1);
      stroke(c);
      break;
             
      case 'D':　　//　　紺の状態：黒の太枠　　黄色の状態：白の枠線
      strokeWeight(30);
      stroke(c);
      break;
       
  }
}

