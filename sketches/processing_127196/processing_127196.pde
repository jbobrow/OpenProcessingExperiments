
/*@pjs preload="apple_white.png";*/
PImage img;                            //img

void setup() {
  size(450, 450);                      //Size 450-450
  background(245, 200, 222);           //Back is pink
  img = loadImage("apple_white.png");  //photo
  smooth();
  fill(0);
}
 void draw() {                         //draw
 }

 
 
 void mousePressed(){
 if( mouseButton == CENTER ) {         //When center-clicking

   tint(255, 0, 0);
   image(img, 82, 64, 33, 36);         //apple 1
   tint(255, 0, 0);
   image(img, 352, 64, 33, 36);        //apple 2
   tint(255, 0, 0);
   image(img, 82, 334, 33, 36);        //apple 3
   tint(255, 0, 0);
   image(img, 317, 301, 12, 13);       //apple 4
   
 } else if( mouseButton == RIGHT ) {   //When right-clicking

 fill(255, 0, 0);
   rect(15*13, 15*7, 15*3, 15);
   rect(15*13, 15*8, 15, 15);
   rect(15*15, 15*8, 15, 15);
   rect(15*13, 15*9, 15*3, 15);
   rect(15*13, 15*10, 15, 15);
   rect(15*4, 15*11, 15*3, 15);
   rect(15*13, 15*11, 15, 15);
   rect(15*19, 15*11, 15*3, 15);
   rect(15*4, 15*12, 15, 15);
   rect(15*6, 15*12, 15, 15);
   rect(15*19, 15*12, 15, 15);
   rect(15*21, 15*12, 15, 15);
   rect(15*4, 15*13, 15*3, 15);
   rect(15*19, 15*13, 15*3, 15);
   rect(15*4, 15*14, 15, 15);
   rect(15*6, 15*14, 15, 15);
   rect(15*19, 15*14, 15, 15);
   rect(15*19, 15*15, 15, 15);
   rect(15*12, 15*22, 15, 15);
   rect(15*12, 15*23, 15, 15);
   rect(15*12, 15*24, 15, 15);
   rect(15*12, 15*25, 15, 15);
   rect(15*17, 15*25, 15*3, 15);
   rect(15*12, 15*26, 15, 15);
   rect(15*17, 15*26, 15, 15);
   rect(15*19, 15*26, 15, 15);
   rect(15*12, 15*27, 15, 15);
   rect(15*17, 15*27, 15*3, 15);
   rect(15*17, 15*28, 15, 15);
   rect(15*17, 15*29, 15*4, 15);
   }
 }

 void mouseReleased(){
 if( mouseButton == CENTER ) {         //When center-clicking

 fill(0);
 rect(15*5, 15*4, 15*3, 15*3);
 rect(15*23, 15*4, 15*3, 15*3);
 rect(15*5, 15*22, 15*3, 15*3);
 rect(15*21, 15*20, 15, 15);
   
 }
 
 }
 
void keyPressed() {
  switch(key) {
    
  case '!':              //Reset
  background(245, 200, 222);
  break;
  
  case 'j':              /////Typing [Jobs & Wozniak 1976] < j >/////
 fill(0);
 rect(15*1, 15*1, 15, 15);
 rect(15*1, 15*3, 15, 15);
 rect(15*6, 15*12, 15, 15);
 rect(15*7, 15*12, 15, 15);
 rect(15*9, 15*12, 15, 15);
 rect(15*0, 15*28, 15, 15);
 rect(15*0, 15*29, 15, 15);
 rect(15*3, 15*24, 15, 15);
 rect(15*9, 15*23, 15, 15);
 rect(15*12, 15*23, 15, 15);
 rect(15*14, 15*12, 15, 15);
 rect(15*21, 15*29, 15, 15);
 rect(15*14, 15*27, 15, 15);
 rect(15*16, 15*27, 15, 15);
 rect(15*3, 15*8, 15*7, 15);
 rect(15*20, 15*0, 15*2, 15);
 rect(15*11, 15*1, 15*2, 15);
 rect(15*22, 15*23, 15*5, 15);
 rect(15*17, 15*29, 15*4, 15);
 rect(15*26, 15*24, 15*2, 15);
  break;
  
  case 'o':              /////Typing [Jobs & Wozniak 1976] < o >/////
 fill(0);
 rect(15*5, 15*18, 15*2, 15);
 rect(15*9, 15*18, 15, 15);
 rect(15*13, 15*18, 15, 15);
 rect(15*8, 15*17, 15, 15);
 rect(15*13, 15*17, 15*3, 15);
 rect(15*17, 15*17, 15, 15);
 rect(15*13, 15*21, 15, 15);
 rect(15*26, 15*21, 15, 15);
 rect(15*3, 15*25, 15, 15);
 rect(15*9, 15*25, 15, 15);
 rect(15*11, 15*8, 15, 15);
 rect(15*13, 15*8, 15, 15);
 rect(15*3, 15*10, 15*3, 15);
 rect(15*19, 15*11, 15*3, 15);
 rect(15*21, 15*17, 15*2, 15);
 rect(15*27, 15*19, 15, 15);
 rect(15*3, 15*20, 15*7, 15);
 rect(15*28, 15*13, 15, 15);
 rect(15*28, 15*17, 15, 15);
 rect(15*28, 15*20, 15, 15);
 rect(15*28, 15*24, 15, 15);
 rect(15*11, 15*19, 15, 15);
 rect(15*16, 15*19, 15, 15);
  break;
  
  case 'b':              /////Typing [Jobs & Wozniak 1976] < b >/////
 fill(0);
 rect(15*17, 15*25, 15*3, 15);
 rect(15*22, 15*25, 15*2, 15);
 rect(15*7, 15*14, 15*3, 15);
 rect(15*12, 15*14, 15, 15);
 rect(15*14, 15*14, 15*2, 15);
 rect(15*17, 15*14, 15, 15);
 rect(15*18, 15*19, 15*2, 15);
 rect(15*23, 15*19, 15, 15);
 rect(15*25, 15*19, 15, 15);
 rect(15*2, 15*2, 15, 15);
 rect(15*2, 15*6, 15, 15);
 rect(15*2, 15*9, 15, 15);
 rect(15*9, 15*4, 15, 15);
 rect(15*13, 15*4, 15*4, 15);
 rect(15*21, 15*4, 15, 15);
 rect(15*23, 15*4, 15*3, 15);
 rect(15*27, 15*4, 15, 15);
 rect(15*2, 15*14, 15, 15);
  break;
    
  case 's':              /////Typing [Jobs & Wozniak 1976] < s >/////
 fill(0);
 rect(15*21, 15*26, 15, 15);
 rect(15*24, 15*26, 15, 15);
 rect(15*12, 15*11, 15, 15);
 rect(15*13, 15*11, 15, 15);
 rect(15*16, 15*11, 15, 15);
 rect(15*18, 15*11, 15, 15);
 rect(15*3, 15*21, 15, 15);
 rect(15*9, 15*21, 15, 15);
 rect(15*11, 15*21, 15, 15);
 rect(15*9, 15*21, 15, 15);
 rect(15*5, 15*28, 15, 15);
 rect(15*12, 15*26, 15, 15);
 rect(15*16, 15*26, 15, 15);
 rect(15*17, 15*26, 15, 15);
 rect(15*19, 15*26, 15, 15);
 rect(15*17, 15*28, 15, 15);
 rect(15*20, 15*28, 15, 15);
 rect(15*23, 15*28, 15, 15);
 rect(15*25, 15*28, 15, 15);
  break;
    
  case '&':              /////Typing [Jobs & Wozniak 1976] < & >/////
 fill(0);
 rect(15*12, 15*20, 15*3, 15);
 rect(15*19, 15*20, 15, 15);
 rect(15*21, 15*20, 15, 15);
 rect(15*13, 15*9, 15*3, 15);
 rect(15*17, 15*9, 15, 15);
 rect(15*19, 15*9, 15, 15);
 rect(15*5, 15*24, 15*3, 15);
 rect(15*9, 15*24, 15, 15);
 rect(15*11, 15*24, 15, 15);
 rect(15*12, 15*24, 15, 15);
 rect(15*29, 15*19, 15, 15);
 rect(15*29, 15*21, 15, 15);
 rect(15*29, 15*26, 15, 15*2);
 rect(15*29, 15*29, 15, 15);
 rect(15*8, 15*10, 15*2, 15);
 rect(15*4, 15*11, 15*3, 15);
 rect(15*7, 15*11, 15, 15);
 rect(15*10, 15*11, 15, 15);
 rect(15*28, 15*7, 15, 15);
 rect(15*28, 15*10, 15, 15);
 rect(15*28, 15*26, 15, 15);
 rect(15*29, 15*2, 15, 15);
 rect(15*29, 15*4, 15, 15);
 rect(15*23, 15*20, 15*2, 15);
 rect(15*27, 15*20, 15, 15);
 rect(15*16, 15*18, 15*8, 15);
 rect(15*26, 15*18, 15, 15);
  break;

  case 'w':              /////Typing [Jobs & Wozniak 1976] < w >/////
 fill(0);
 rect(15*16, 15*21, 15, 15);
 rect(15*18, 15*21, 15*2, 15);
 rect(15*23, 15*21, 15, 15);
 rect(15*7, 15*28, 15*2, 15);
 rect(15*10, 15*28, 15, 15);
 rect(15*12, 15*28, 15, 15);
 rect(15*15, 15*28, 15*2, 15);
 rect(15*0, 15*15, 15, 15);
 rect(15*0, 15*17, 15, 15);
 rect(15*0, 15*19, 15, 15);
 rect(15*3, 15*29, 15*2, 15);
 rect(15*7, 15*29, 15, 15);
 rect(15*10, 15*29, 15*2, 15);
 rect(15*14, 15*29, 15, 15);
 rect(15*11, 15*3, 15*3, 15);
 rect(15*15, 15*3, 15*2, 15);
 rect(15*16, 15*5, 15*3, 15);
 rect(15*13, 15*7, 15*3, 15);
 rect(15*16, 15*7, 15*2, 15);
 rect(15*0, 15*21, 15, 15);
  break;

  case 'z':              /////Typing [Jobs & Wozniak 1976] < z >/////
 fill(0);
 rect(15*19, 15*15, 15, 15);
 rect(15*21, 15*15, 15*2, 15);
 rect(15*26, 15*15, 15*2, 15);
 rect(15*16, 15*12, 15, 15);
 rect(15*18, 15*12, 15, 15);
 rect(15*19, 15*12, 15, 15);
 rect(15*21, 15*12, 15, 15);
 rect(15*15, 15*15, 15*2, 15);
 rect(15*18, 15*15, 15, 15);
 rect(15*5, 15*16, 15*7, 15);
 rect(15*15, 15*16, 15, 15);
 rect(15*18, 15*16, 15*2, 15);
 rect(15*24, 15*16, 15*2, 15);
 rect(15*11, 15*0, 15*4, 15);
 rect(15*16, 15*0, 15, 15);
 rect(15*22, 15*11, 15, 15);
 rect(15*24, 15*12, 15*2, 15);
  break;

  case 'n':              /////Typing [Jobs & Wozniak 1976] < n >/////
 fill(0);
 rect(15*15, 15*24, 15*6, 15);
 rect(15*23, 15*24, 15, 15);
 rect(15*19, 15*7, 15, 15);
 rect(15*21, 15*7, 15, 15);
 rect(15*27, 15*7, 15, 15);
 rect(15*24, 15*11, 15, 15);
 rect(15*26, 15*11, 15*2, 15);
 rect(15*21, 15*5, 15, 15);
 rect(15*23, 15*5, 15*3, 15);
 rect(15*27, 15*6, 15, 15);
 rect(15*3, 15*7, 15, 15);
 rect(15*9, 15*7, 15, 15);
 rect(15*11, 15*7, 15, 15);
 rect(15*0, 15*0, 15, 15);
 rect(15*0, 15*3, 15, 15);
 rect(15*23, 15*29, 15, 15);
 rect(15*25, 15*29, 15*2, 15);
 rect(15*3, 15*12, 15, 15);
 rect(15*4, 15*12, 15, 15);
  break;

  case 'i':              /////Typing [Jobs & Wozniak 1976] < i >/////
 fill(0);
 rect(15*19, 15*14, 15, 15);
 rect(15*20, 15*14, 15*2, 15);
 rect(15*27, 15*14, 15, 15);
 rect(15*18, 15*22, 15*7, 15);
 rect(15*27, 15*22, 15, 15);
 rect(15*3, 15*23, 15, 15);
 rect(15*5, 15*23, 15*3, 15);
 rect(15*24, 15*0, 15, 15);
 rect(15*27, 15*0, 15, 15);
 rect(15*7, 15*15, 15, 15);
 rect(15*11, 15*15, 15, 15);
 rect(15*27, 15*16, 15, 15);
 rect(15*3, 15*17, 15*2, 15);
 rect(15*5, 15*1, 15, 15);
 rect(15*8, 15*1, 15, 15);
 rect(15*3, 15*6, 15, 15);
 rect(15*5, 15*6, 15*3, 15);
 rect(15*9, 15*6, 15, 15);
 rect(15*11, 15*6, 15*4, 15);
 rect(15*17, 15*6, 15, 15);
 rect(15*1, 15*6, 15, 15);
 rect(15*1, 15*8, 15, 15);
 rect(15*2, 15*22, 15, 15);
 rect(15*2, 15*26, 15, 15);
 rect(15*2, 15*28, 15, 15);
  break;
  
  case 'a':              /////Typing [Jobs & Wozniak 1976] < a >/////
 fill(0);
 rect(15*13, 15*23, 15, 15);
 rect(15*15, 15*23, 15, 15);
 rect(15*20, 15*23, 15, 15);
 rect(15*11, 15*10, 15*2, 15);
 rect(15*13, 15*10, 15, 15);
 rect(15*18, 15*10, 15*6, 15);
 rect(15*26, 15*10, 15*2, 15);
 rect(15*21, 15*3, 15, 15);
 rect(15*27, 15*3, 15, 15);
 rect(15*17, 15*1, 15*2, 15);
 rect(15*20, 15*1, 15, 15);
 rect(15*25, 15*1, 15, 15);
 rect(15*28, 15*1, 15, 15);
 rect(15*3, 15*2, 15*7, 15);
 rect(15*3, 15*4, 15, 15);
 rect(15*5, 15*4, 15*3, 15);
 rect(15*11, 15*26, 15, 15);
 rect(15*12, 15*27, 15, 15);
 rect(15*17, 15*27, 15*3, 15);
 rect(15*20, 15*27, 15, 15);
 break;

  case 'k':              /////Typing [Jobs & Wozniak 1976] < k >/////
 fill(0);
 rect(15*19, 15*13, 15*3, 15);
 rect(15*22, 15*13, 15, 15);
 rect(15*24, 15*13, 15, 15);
 rect(15*11, 15*25, 15, 15);
 rect(15*12, 15*25, 15, 15);
 rect(15*14, 15*25, 15*2, 15);
 rect(15*3, 15*26, 15*7, 15);
 rect(15*15, 15*8, 15, 15);
 rect(15*17, 15*8, 15, 15);
 rect(15*19, 15*8, 15, 15);
 rect(15*21, 15*8, 15*7, 15);
 rect(15*4, 15*13, 15*3, 15);
 rect(15*10, 15*13, 15*3, 15);
 rect(15*6, 15*17, 15, 15);
 rect(15*22, 15*27, 15, 15);
 rect(15*25, 15*27, 15, 15);
 rect(15*11, 15*9, 15, 15);
  break;

  case '1':              /////Typing [Jobs & Wozniak 1976] < 1 >/////
 fill(0);
 rect(15*11, 15*2, 15, 15);
 rect(15*14, 15*2, 15*4, 15);
 rect(15*21, 15*2, 15*7, 15); 
 rect(15*3, 15*3, 15, 15);
 rect(15*9, 15*3, 15, 15);
 rect(15*0, 15*8, 15, 15);
 rect(15*0, 15*10, 15, 15);
 rect(15*0, 15*11, 15, 15);
 rect(15*0, 15*13, 15, 15);
 rect(15*1, 15*10, 15, 15);
 rect(15*1, 15*12, 15, 15);
 rect(15*1, 15*14, 15, 15);
 rect(15*1, 15*17, 15, 15);
 rect(15*0, 15*22, 15, 15);
 rect(15*0, 15*24, 15, 15);
 rect(15*0, 15*25, 15, 15);
 rect(15*0, 15*26, 15, 15);
 rect(15*28, 15*1, 15, 15);
 rect(15*29, 15*7, 15, 15*4);
 rect(15*9, 15*0, 15, 15);
  break;
  
  case '9':              /////Typing [Jobs & Wozniak 1976] < 9 >/////
 fill(0);
 rect(15*27, 15*5, 15, 15);
 rect(15*19, 15*6, 15, 15);
 rect(15*29, 15*15, 15, 15);
 rect(15*29, 15*17, 15, 15);
 rect(15*3, 15*0, 15*2, 15);
 rect(15*7, 15*0, 15, 15);
 rect(15*21, 15*6, 15, 15);
 rect(15*23, 15*6, 15*3, 15);
 rect(15*0, 15*5, 15, 15);
 rect(15*27, 15*12, 15, 15);
 rect(15*3, 15*13, 15, 15);
 rect(15*27, 15*27, 15, 15);
  break;
  
  case '7':              /////Typing [Jobs & Wozniak 1976] < 7 >/////
 fill(0);
 rect(15*3, 15*22, 15, 15);
 rect(15*5, 15*22, 15*3, 15);
 rect(15*9, 15*22, 15, 15);
 rect(15*12, 15*22, 15, 15);
 rect(15*14, 15*22, 15*3, 15);
 rect(15*17, 15*13, 15, 15);
 rect(15*4, 15*14, 15, 15);
 rect(15*6, 15*14, 15, 15);
 rect(15*3, 15*15, 15*2, 15);
  break;
  
  case '6':              /////Typing [Jobs & Wozniak 1976] < 6 >/////
 fill(0);
 rect(15*1, 15*20, 15, 15);
 rect(15*1, 15*23, 15, 15);
 rect(15*1, 15*25, 15, 15);
 rect(15*3, 15*5, 15, 15);
 rect(15*5, 15*5, 15*3, 15);
 rect(15*9, 15*5, 15, 15);
 rect(15*13, 15*5, 15, 15);
 rect(15*1, 15*29, 15, 15);
 rect(15*2, 15*16, 15, 15*4);
 rect(15*27, 15*26, 15, 15);
 rect(15*3, 15*27, 15, 15);
 rect(15*5, 15*27, 15, 15);
 rect(15*9, 15*27, 15, 15);
  break;
   }
  
}
  


