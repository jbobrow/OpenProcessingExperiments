
void setup(){
  size(400,400);
}

void draw(){
  

  if(mousePressed == true){
    if(mouseX < width/2 && mouseY < height/2){
      fill(255, 170, 83);
      rect(0,0,width/2, height/2);
    }
      if(mouseX > width/2 && mouseY <height/2){
       fill(92, 107, 189);
       rect(width/2, 0, width/2, height/2);
     }
       if(mouseX > width/2 && mouseY > height/2){
         fill (90, 189, 40);
         rect(width/2, height/2, width/2, height/2);
       }
       if(mouseX< width/2 && mouseY >height/2){
         fill(234, 252, 120);
         rect(0, height/2, width/2, height/2);
    }
  }
    else{
      background(192);
      //line(width/2, 0, width/2, height);
      //line(0,height/2, width, height/2);
    }
  
}


