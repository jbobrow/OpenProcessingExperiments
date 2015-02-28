
void setup(){
  size(400,400);
  println("Test without releasing the mouse");

}
void draw(){
    line(width/2,0,width/2,height);
    line(0,height/2,width,height/2);
    
      if(mousePressed == true){
      if(mouseX < width/2 && mouseY < height/2){
        fill (random(255),random(255),random(255),random(200));
        rect(0,0,width/2,height/2);
      }
    else if(mouseX > width/2 && mouseY < height/2) {
      fill(random(255),random(255),random(255),random(200));
      rect(width/2,0,width/2,height/2);
    }
     else if(mouseX > width/2 && mouseY > height/2) {
       fill(random(255),random(255),random(255),random(200));
       rect(width/2,height/2,width/2,height/2);
     }
     else if(mouseX < width/2 && mouseY > height/2) {
       fill(random(255),random(255),random(255),random(200));
       rect(0,width/2,height/2,width/2);
     }
      }else{
        background(192);
        line(width/2,0,width/2,height);
        line(0,height/2,width,height/2);}
    
}
