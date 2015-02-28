
void setup() {
  size(600,600);
 rectMode(CENTER);
  
}

void draw() {

  rect(width/2,height/2,100,100);
  rect(width/8,height/8,100,100);
  rect(7*width/8,7*height/8,100,100);
  
  if(mousePressed == true){
    fill(255,0,0);
  }else{
    fill(255);
  }
  
  
}


