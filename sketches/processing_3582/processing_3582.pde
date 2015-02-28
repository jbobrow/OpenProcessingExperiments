
void setup(){
  size(500,500,P3D);
}

void draw(){
 
  
  for(float i = 10; i <500; i+=5){
    for(float e = 50; e < 500; e +=25){
   translate(70,mouseY,mouseX); 
rotateX(millis()/500); 
rotateY(millis()); 
fill(random(300),random(170),random(500),200); 
box(e/i + 10); 
}
}
}

