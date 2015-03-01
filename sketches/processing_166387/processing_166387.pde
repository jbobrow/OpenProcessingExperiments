

void setup() {
    //size width, height)
    size(500,500);

   
  noStroke();  
}

void draw() {
  //ellipse (x,y,width,height)
   //width & height are variables which hold the size of your sketch
   //mouseX & mouseY are the actual mouse position
  
  fill(200,30);
   rectMode(CENTER);  
  rect(width/2,height/2,width,height);
  
    
    if(mousePressed){
    fill(180,50,100);
   rect(mouseX, mouseY, 250,20);
   
    }else {
      noStroke();
      fill(30,120,124);
      ellipse(mouseX,mouseY, 40,40);
    
     
   }
}


