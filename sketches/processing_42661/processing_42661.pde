
          int i = 10;

void setup(){
  size(400,380);
  background(255);
  smooth();
}

void draw(){
  //background(0);
  stroke(0);
  strokeWeight(1);
  
  
  
  for(i=30; i<=70; i= i+10){
    line(0,i,400,1+i);
  }
  
  for(i=100; i<=140; i= i+10){
    line(0,i,400,1+i);
  }
  
  for(i=170; i<=210; i= i+10){
    line(0,i,400,1+i);
  }
  
  for(i=240; i<=280; i= i+10){
    line(0,i,400,1+i);
  }
  
  for(i=310; i<=350; i= i+10){
    line(0,i,400,1+i);
  }
  
  
  if (mousePressed && (mouseButton == LEFT)){
    stroke(0);
    fill(0);
    smooth();
    ellipse(mouseX, mouseY,3,3);
    }else if (mousePressed && (mouseButton == RIGHT)){
      fill(255);
      noStroke();
      ellipse(mouseX, mouseY, 20,20);
    }
  
}
            
