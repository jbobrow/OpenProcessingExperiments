

 float hey = 21;
 float hi = 15;
 float hoo = 191;
 
 
 void setup() {
   size(500,500);
   background(255);
 }
 void draw(){
 
   smooth();
   
   noStroke();
   fill(hey,hi,hoo,120);
   ellipseMode(CENTER);
   ellipse(mouseX,mouseY,20,20);
 }
    void mousePressed() {
     if(hey == 21)  
       hey = random(1,255);
     if(hi == 15)   
       hi = random(1,255);
     if(hoo == 191) 
       hoo = random(1,255);
 
 }
 

  



