
PImage img;

void setup(){
 size(700,650);
 background(255);
 smooth();
 img = loadImage("BBLL.gif"); //source from http://s7d2.scene7.com/is/image/Fathead/75-75016C_Bruce_Lee_prod?        layer=comp&wid=500&hei=500&fmt=jpeg&qlt=95,1&op_sharpen=1&resMode=bicub&op_usm=0.5,0.2,0,0&iccEmbed=0&bgc=0xdedede&bgColor=0xdedede

}

void draw(){
  background(255);
  
  for (int a=25 ; a<700; a=a+25){ 
  for(int b =25; b<650; b=b+25){
     strokeWeight(10);
     stroke(#FF2F05);
     point(a,b);
  }                      // one of the background which is full of red dots
 }
 
 for (int c=40; c<690; c=c+40){
   for(int d = 40; d<400; d=d+40){
     stroke(#88D3FA);
     ellipse(c,d,60,60);
   }                    // the upper part of the background which is full of blue ellipses
 }

  tint(#FA00C4,200);   // the right Bruce Lee
  image(img,270,20); 
  
  tint(#000EFC,200);   // the left Bruce Lee
  image(img,-170,20);
  
  tint(#FAFF0D,200);   // the yellow Bruce Lee
  image(img,-20,20);

  
  tint(#3EFF05,200);   // the green Bruce Lee
  image(img,150,20);
  
  noTint();            // the one who moves with no effect by following the mouse
  image(img,mouseX,mouseY);
  
}

