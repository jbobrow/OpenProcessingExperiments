
void setup(){
  background(0);
  size(400,800);
  smooth();
  colorMode(HSB,360,100,100,100);
  noFill();
  strokeWeight(.2);
}

void draw(){
  //rainbow background
  for(int i = 0; i < width;i++){
   float colorValue = map(i,0,width,0,360); 
   stroke(colorValue,100,100);
   line(i,0,i,height);
   println(i); 
  }
  
  //coincentric ellipses
  //for(int i = 0; i < 200;i++){
  //ellipse(mouseX,mouseY,i*5,i*5);
  //}
   
  for (int i = 0; i< 100;i++){
  line(mouseX,mouseY,mouseX^i,mouseY^i); 
  }
}






