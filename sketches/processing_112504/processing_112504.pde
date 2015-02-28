
void setup(){
  size(450,500);
  background(0,139,191);
  rectMode(CENTER); 
}

void draw(){
  background(0,139,191);
  noStroke();
  
  
  if(mousePressed == true){
    fill(255,255,255,100);
    rect(mouseX,mouseY,300,300);
  }else{
    fill(255,255,255,50);
    rect(mouseX,mouseY,100,100);
}
 
}



