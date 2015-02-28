


float valueX = 0;
float valueY = 0;

void setup(){
 size(400, 400); 
}  

void draw() {
  if(mousePressed){
  noStroke();
  fill(random(255), random(255), random(255), 10);
  rect(0, 0, valueX, valueY);
  }
}

void mouseDragged() 
{
  valueX = valueX + 10;
  valueY = valueY + 10;
  if (valueX >= 400 || valueY >=400) {
    valueX = 0;
    valueY = 0;
  }
}

