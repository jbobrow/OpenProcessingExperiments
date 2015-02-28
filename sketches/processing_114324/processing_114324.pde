
void setup(){
  size(600,600);
  background(255);
  
}

void draw(){

   
 for(int b=1; b <=600; b+=150){
   //TOP 
   stroke(255,190,177);//white
   line(random(width),0,300,300);
   
   stroke(60,29,192.70);//pink
   line(random(width),600,300,300);
   
   //BOTTOM
   stroke(107,97,242);//light blue
   line(random(width),600,300,300);
   
   stroke(248,154,128);//dark blue
   line(random(width),0,300,300);
   
   
   //LEFT
   stroke(229,101,88);//coral
   line(0,random(height),300,300);
   
   stroke(255,144,133);//light coral
   line(0,random(height),300,300);
   
   //RIGHT
   stroke(133,219,255);
   line(600,random(height),300,300); //dark turq
   
   stroke(151,236,249);
   line(600,random(height),300,300); //light turq 
 }
   
   for(int i = 280; i <= 600-280 ; i+=6){  
    strokeWeight(1);
    stroke(248,251,203);
    line(i,i,mouseX,mouseY);
   
   
   }
 
}
