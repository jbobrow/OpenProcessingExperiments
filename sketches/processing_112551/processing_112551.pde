
void setup(){
size(600, 600); 
background(21,232,181);
rectMode(CENTER);
fill(47,168,222);
}

void draw(){
background(240,56,56);
stroke(mouseX,mouseY,237);

  
  rect(300,300,200,200);
  
  rect(mouseX, mouseY, 200, 100); 
  
  if(mousePressed == true){ 
 fill(56,81,240);
}else{
  fill(56,232,240);
}
  
  
  
}
