
void setup() {
  size(300, 300);
  
}
  void draw(){
    int x = 0;
    background(0);
    fill(255,255,255);
    rect(width-200,height-275,100,250);
    
    
    fill(0);
    ellipseMode(CENTER);
    ellipse(width/2,height/4,50,50);
    
    fill(0);
    ellipseMode(CENTER);
    ellipse(width/2,height/2,50,50);
    
    fill(0);
    ellipseMode(CENTER);
    ellipse(width/2,height/2+height/4,50,50);
   
 
   
   if (mouseY > 200) {
      fill(0,255,0);
     ellipseMode(CENTER);
    ellipse(width/2,height/2+height/4,50,50);
   }
   //green light//
   
   if (mouseY < 100) {
    fill(255,0,0);
     ellipseMode(CENTER);
     ellipse(width/2,height/4,50,50);
   }
   //red light//



     
   
 
    if(mousePressed){//when the mouse is pressed the light will turn yellow//
    fill(255,255,0);
     ellipseMode(CENTER);
     ellipse(width/2,height/2,50,50);
   
     
    }
    }
 
  
  


