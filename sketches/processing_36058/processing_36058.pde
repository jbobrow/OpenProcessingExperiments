
//Editted someones code I found while browsing. Sorry are I am unable
//to relocate it again for a reference...

void setup(){
  
 size(700,400);
 smooth();
 frameRate(30);
 
}


void draw(){
  
 background(255);
 noStroke();
 fill(255,30);
 rect(0,0,width,height);
  
   for(int L = 0; L < width; L++){ 
    line(L+=random(2,8),random(0,height),L+=random(4,6),random(0,height));
    stroke(0);
    }
 
  if((mousePressed == true)&&(mouseButton == LEFT)){
   //noLoop();
   frameRate(2);
   line(mouseX,mouseY,pmouseX,pmouseY);
   } 
    else if (mouseButton == RIGHT)
    {
    loop();
    }
 
}  

