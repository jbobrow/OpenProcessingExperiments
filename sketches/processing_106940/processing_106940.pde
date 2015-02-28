
void setup() {  //setup function called initially, only once
  size(350, 250);
  }
  
void draw() {  //draw function loops 
    background(100,255,400)
    ellipse(20+mouseX,20+mouseY,100,100);
    
   if(mousePressed){
       fill(150,0,200);
   } else{
       fill(255,255,200);
  }
  rect(20+mouseX,50+mouseY,10,30);
  
  if(mousePressed){
     fill(200,0,150);
  }
  else{
     fill(200,255,255);
  }
}
