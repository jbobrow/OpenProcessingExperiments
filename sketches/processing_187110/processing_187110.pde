
//original author: Su Hyum Nam
//tweak assignment Dani licata


void setup(){
  size (640,480);

}

void draw() {
  background (255);
  // and && or||
  

  if (mouseX < width/2 && mouseY< height/2){
    fill (255,0,0);
    rect (0,0,width/2, height/2);
  }
  
if (mouseX < width/2 && mouseY > height/2){
    fill (255,0,0);
    rect (0,height/2,width/2, height/2);
}
 if (mouseX > width/2 && mouseY < height/2){
    fill (255,0,0);
    rect (width/2,0,width/2, height/2);
 }
 if (mouseX > width/2 && mouseY > height/2){
    fill (255,0,0);
    rect (width/2,height/2,width/2, height/2);
  }
}
