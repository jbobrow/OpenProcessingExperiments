
void setup(){
  size(500, 500);
  background(250);
 
}
void draw(){
   ellipse(mouseX, mouseY, 10, 10);
  fill(0);
   if(mousePressed) {
     fill(0);
     stroke(0);
    }else{
     fill(250);
      stroke(0);
    }
    quad(mouseX, mouseY, width/2, height/2, 250, 250, 30, 76);
    if(mousePressed){
    fill(250);
    stroke(0);
    }else{
    fill(0);
    stroke(250);
}
}
