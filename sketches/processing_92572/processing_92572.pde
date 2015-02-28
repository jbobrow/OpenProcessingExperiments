
void setup (){
size (500,500, P3D);
background(255);
smooth();
frameRate(5);

}

void draw(){
  strokeWeight(1);
  stroke (random (255), random (225), random(255), random (255));
  for(int i=0; i<1000; i++){
  line(0, 0+i*10, 500, 0+i*10);
  
  
  if (mousePressed){
    stroke (random (255), random (225), random(255), random (255));
  }else{
    stroke(random(255));
  }
  line(mouseX, mouseY-width/2, mouseX+width/2, mouseY);
  }
}
  
  
  
 


