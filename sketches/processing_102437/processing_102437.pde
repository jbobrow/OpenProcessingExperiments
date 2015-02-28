
int generateColor(){
  return color(random(255), random(255), random(255));
}

void generateFlower(float x, float y, float flwrSize){
  strokeWeight(flwrSize);
  stroke(generateColor());
  translate(x, y);
  
  for(int i=0; i<10; i++){
    rotate(TWO_PI / 10);
    line(0, 0, 2 * flwrSize, 0);
  }
  
  strokeWeight(0);
  fill(generateColor());
  ellipse(0,0,1.5 * flwrSize, 1.5 * flwrSize);
}

void setup(){ 
  size(800, 600);
  background(51);
}

void draw(){
  if (mousePressed == true){
    generateFlower(mouseX,mouseY, random(6, 30));
    delay (100);
  }
else{
    noStroke();
    fill(51);
    ellipse(mouseX, mouseY, 100, 100);
  }  
}


  

