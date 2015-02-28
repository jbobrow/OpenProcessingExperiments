
int dm = 150; //from 0 to 6500
int ds = 150; //from 0 to 6500


void setup() {  
  size(600, 600);
  background(154, 18, 18);
  smooth();
  }
    
void draw() {  
   background(154, 18, 18);
   
 fill(255,255,255);
 if(dist(mouseX,mouseY,width/2,height/2) < 50){
    noStroke();
    ellipse(dm, ds, mouseX , mouseY);
    ellipse(dm , ds, mouseX, mouseY);
   }
        
   if(mousePressed){
   }else{
      
       background(154, 18, 18);
       fill(255);
       noStroke(); 
       float a=dist(50, 50, mouseX, mouseY);
       float b=dist(100, 100, mouseX, mouseY);
       ellipse(250, 250, a*2,a*3);
   
       
      // 25% opacity.
     fill(15, 78, 208, 63);
     ellipse(350 , 350, b*3, b*4);
     
    // 25% opacity.
     fill(15, 78, 208, 63);
     ellipse(370 , 370, b*2, b*3);
     
      // 25% opacity.
     fill(15, 78, 208, 63);
     ellipse(400 , 400, b, b*2);
   }
  
}
