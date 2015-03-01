


void setup() {
    //size width, height)
    size(500,500);
    background(200); //set background gr
    
   rectMode(CENTER); 
    
  noStroke(); 
}
 
void draw() {
  //ellipse (x,y,width,height)
   //width & height are variables which hold the size of your sketch
   //mouseX & mouseY are the actual mouse position
   
  fill(200,30);
   rectMode(CENTER); 
  rect(width/2,height/2,width,height);
   
     
    if(mousePressed==true){
    fill(255);
   rect(mouseX, mouseY, 1000,100);
    
    }else {
      noStroke();
      fill(0,500);
      rect(mouseX,height/2, mouseY/2+10, mouseY/2+10);
     int inverseX = width-mouseX;
     int inverseY = height-mouseY;
     rect(inverseX,height/2,(inverseY/2)+10, (inverseY/2)+10);
   }
}



