
float redValue = 0;
float greenValue = 0;
float blueValue = 0;

void setup(){
  size(1024,500);
  background(255);
  fill(0);
  smooth();
}

void draw(){
  redValue = random(255);
  greenValue = random(255);
  blueValue = random(255);
  
  stroke(redValue,greenValue,blueValue);
/*  
  if(mousePressed==false){
    triangle(mouseX,mouseY,width/2,height/2,pmouseX,pmouseY);
  }
  
  else{
    background(0);
    fill(0);
  }
*/
  if(mousePressed){
    background(0);
    fill(0);
  }
  else{
//    colorMode(HSB,360,200,200);
    fill(redValue,greenValue,blueValue,100);
    triangle(mouseX,mouseY,width/2,height/2,pmouseX,pmouseY);
  }
  
}
