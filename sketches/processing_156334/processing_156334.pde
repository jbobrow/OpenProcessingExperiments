
void setup(){
  size(300,300);
 }
void draw(){
  background(80);
  if (mousePressed){
  fill(80,230,0);
  rect(mouseX,90,70,70);
  rect(mouseX+100,90,70,70);
  fill(0);
  ellipse(mouseX+80,200,20,20);
  
  } else {
  fill(0,80,200);
  ellipse(mouseX,90,70,70);
  ellipse(mouseX+100,90,70,70);
  fill(0,0,0,80);
  ellipse(mouseX+50,200,70,70);
  fill(80,230,0);
  rect(mouseX-10,80,20,20);
  rect(mouseX+90,80,20,20);
  
    
  }
}


