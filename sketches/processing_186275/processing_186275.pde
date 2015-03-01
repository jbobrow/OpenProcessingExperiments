
void setup(){ 
  size(640,480);
}
void draw(){
  background(255);
  line(width/2,0,width/2,height);
    line(0,height/2,width,height/2);
  // && : AND
  //|| : OR
  if (mouseX < width/2 && mouseY < height/2){
    
    fill(255,0,0);
    rect(0,0,width/2, height/2);
    //Top Right
  }else if (mouseX < width/2 && mouseY > height/2){
    fill(0,0,255);
    rect(0,height/2,width/2, height/2);
//Bottom Left
  }else if (mouseX > width/2 && mouseY < height/2){
    fill(255,255,0);
    rect(width/2,0,width/2, height/2);
    //Top Right
    }else if (mouseX > width/2 && mouseY > height/2){
    fill(0,255,0);
    rect(width/2,height/2,width/2, height/2);
    //Bottom Right
}
}
