
void setup(){
  size(450,500);
  background(0,139,191);  
}

void draw(){
  ellipse(width/2,400,30,30);
  fill(#FF7D03);
  stroke(255,255,255);
  strokeWeight(3);
 
  
  
  if(mousePressed == true){
    fill(255,255,255);
    textSize(100);
    text("WAIT", width/4,height/2);

  }
}



