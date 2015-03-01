
void setup(){
  size(1000,750);
  rectMode(CENTER);
}

void draw(){
  background(0, mouseX/4, mouseY/3);
  for (int i=0; i<500; i++){
    fill(mouseX/10 + mouseY/10, mouseX/20 + mouseY/20, mouseX/5 + mouseY/5);
    ellipse(width/(i+1)*2, height/(i+1)*2, width/10+(mouseX+1), height/10+(mouseY+1));
     if(mouseX >= width/2){
       fill (mouseX-width/2, mouseY-height/2, 0);
       rect(random(width), random(height), random(i), random(i));
     }
 }
}


