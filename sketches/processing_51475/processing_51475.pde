

void setup(){
  background(0);
  size(500,500);
  smooth();
  colorMode(HSB,360,100,100,100);
  noFill();
 
}
  
void draw(){
   //rainbow
  for(int i = 0;i < width; i++){
  float colorValue = map(i, 0,width,0,360);
  stroke(colorValue,100,100);
  line(i,0,i,height);

  println(i);
  }
  
  fill(57,10);


  float speedX = abs(mouseX-pmouseX);
  for(int i = 0;i< speedX;i++){
    strokeWeight(.5);
  ellipse(mouseX,mouseY,i*5,i*5);
  }
   //multiply line 100X
  for(int i = 0; i<100; i++){
    float colorValue = map(i, 0,width,0,360);
    stroke(colorValue,100,100);
    line(mouseX,mouseY,i*5,i*5);
    println(i);
  }
 
}  
  

