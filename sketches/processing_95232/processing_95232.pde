
boolean button = false;

void setup(){
  size(400,400);
  smooth();
}

void draw(){
  
  background(255);
  
  //left eye
  fill(0);
  ellipse(100,200,150,200);
  
  //left white part of eye move with mouse
   if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    fill(255);
    stroke(255);
    ellipse(mouseX-90,mouseY,90,90);
  }else {
    fill(255);
    ellipse(110,200,90,90);
  }
  
  //left iris move with mouse
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    stroke(0);
    fill(0);
    ellipse(mouseX-90,mouseY,50,50);
  }else{
    stroke(0);
    fill(0);
    ellipse(110,200,50,50);
  }
  
  //left pupil move with mouse
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    fill(255);
    ellipse(mouseX-80,mouseY-10,20,20);
  }else{
    fill(255);
    ellipse(100,190,20,20);
  }

  //right eye
  fill(0);
  ellipse(300,200,150,200);
  
  //right white part of eye move with mouse
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    stroke(255);
    fill(255);
    ellipse(mouseX+90,mouseY,90,90);
  }else{
    stroke(0);
    fill(255);
    ellipse(290,200,90,90);
  }
  
  // right iris move with mouse
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    stroke(0);
    fill(0);
    ellipse(mouseX+90,mouseY,50,50);
  }else{
    stroke(0);
    fill(0);
    ellipse(290,200,50,50);
  }
  
  //right pupil move with mouse
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    fill(255);
    ellipse(mouseX+100,mouseY-10,20,20);
  }else{
    fill(255);
    ellipse(300,190,20,20);
  }
  
  if (button) {
    //left eye
    fill(0);
    ellipse(100,200,150,200);
    fill(255);
    rect(30,190,140,20);
    // right eye
    fill(0);
    ellipse(300,200,150,200);
    fill(255);
    rect(230,190,140,20);
    
  }
}

void mousePressed(){
  if(mouseX > 150 && mouseX < 250 && mouseY > 125 && mouseY < 275){
    button = !button;
  }

}
