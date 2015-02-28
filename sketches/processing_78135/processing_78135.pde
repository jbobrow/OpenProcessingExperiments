
//definitions for the sketch
void setup(){
  size(300,200);
  
  background(29, 52, 203);
}

void draw(){
 
  //bedingung was gemacht wird wenn maus gedrückt
  if(mousePressed){
    ellipse(mouseX, mouseY, 40, 30);
    fill(0,255,0);
  }else{
    
    ellipse(mouseX, mouseY, 10, 60);
    fill(255);
  }
  //mouseX
  //mouseY   wo die Mouse sich befindet
  
  
}
