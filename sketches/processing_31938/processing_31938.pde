

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
   ellipse(mouseX,mouseY,60,60);
   
    if (mousePressed == true); 
     hey = random(1,255);
     hi = random(1,255);
     hoo = random(1,255);
 
 }
 

  



