
void setup(){
  size(300, 300);
  background(random(255),random(255),random(255));
 
}
void draw(){
   ellipse(mouseX, mouseY, 10, 10);
  fill(random(255),random(255),random(255));
   if(mousePressed) {
     fill(0);
     stroke(0);
    }else{
     fill(random(255),random(255),random(255));
      stroke(250);
    }
    quad(mouseX, mouseY, width/2, height/2, 250, 250, 30, 76);
    fill(random(255),random(255),random(255));
}
