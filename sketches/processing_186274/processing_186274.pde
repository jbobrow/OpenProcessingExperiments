
void setup(){
 size(640,480); 
}  

void draw(){
  background(255);
  strokeWeight(.2);
  line(width/2,0,width/2,height);
  line (0, height/2, width, height/2);
  //&& : AND / ||:OR
  
  if (mouseX < width/2 && mouseY < height/2){
    fill(255,0,0);
    rect(0,0,width/2, height/2);
    fill(255,255,0);
    text("TOP LEFT!",width/4-30, height/4,60,30);
  }else if (mouseX < width/2 && mouseY > height/2){
    fill(255,0,0);
    rect(0,height/2,width/2, height/2);
    fill(0,255,0);
    text("BOTTOM LEFT!",width/4-30, height/4*3,60,30);
  }else if(mouseX > width/2 && mouseY < height/2){
   fill(255,121,240);
    rect(width/2,0,width/2, height/2);
  }else{
    fill(216,252,138);
    rect(width/2,height/2,width/2, height/2);
  }
}
