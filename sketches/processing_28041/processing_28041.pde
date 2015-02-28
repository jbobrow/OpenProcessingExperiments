
void setup(){
  size(500, 300);
  smooth();
}
  
void draw(){
  
  if(mousePressed){
    noStroke();
    fill(0);
    rect(width/2,20,10,260);
  }
  
  else{
    stroke(255, mouseX);
  }

  line(mouseX/2, mouseY/2, mouseX, mouseY);

}



