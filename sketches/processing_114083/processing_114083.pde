

void setup(){
  size(700,700);
  background(6,108,1);

}

void draw(){
  background(255);
  line(width/2,0,width/2,height);
  stroke(255);
  strokeWeight(20);
  line(0,height/2,width,height/2);
  
  if(mousePressed == true) {
  if(mouseX < width/2 && mouseY < height/2){
  fill(random(10),random(100),random(255));
  rect(0,0,width/2,height/2);


}
  else if (mouseX > width/2 && mouseY < height/2) {
  fill(random(50),random(80),random(90));
  rect(width/2,0,width/2,height/2);
  

}
  else if (mouseX < width/2 && mouseY > height/2) {
  fill(random(100),random(150),random(170));
  rect(0,width/2,height/2,width/2);
 

}
  else if (mouseX > width/2 && mouseY > height/2) {
  fill(random(150),random(200),random(255));
  rect(width/2,height/2,width/2,height/2);


}
  }else{
  background(192);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  }
}


