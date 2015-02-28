



void setup() {
size(250,250);
}
   
void draw() {
  background(2,50,120);
  for(int x=50; x<250; x=x+30){
   for(int y=50; y<250; y=y+30){
     pushMatrix();
     translate(x,y);
     scale(0.3);
     rotate(radians(frameCount/4));
     my_draw();
     popMatrix();
       
   }
  }
 }
    
void my_draw() {
//얼굴
strokeWeight(5);
fill(220,10,50);
ellipse(100,100,150,150);
 
  
//눈1
 
strokeWeight(3);
fill(0,0,0);
ellipse(145,100,20,20);
  
strokeWeight(1);
fill(255);
  
//눈2
strokeWeight(3);
fill(0,0,0);
ellipse(50,100,20,20);
  
strokeWeight(1);
fill(255);
ellipse(45,102,5,5);
  
  
//코
fill(100,50,50);
ellipse(100,120,10,10);
  
//입
strokeWeight(2);
line(88,143,100,150);
line(100,150,112,143);
}

                
                
