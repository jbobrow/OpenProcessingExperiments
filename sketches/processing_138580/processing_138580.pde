
int subDis = 2620800;
int noSubDis = 6979200;
int treatment = 534643;
float subDispos, noSubDispos, treatmentPos;

void setup(){
  size(700,700);
  processData();
}

void draw(){
  background(40);
  noStroke();
  
  float startPos = radians(0);
  float currPos = startPos;
  
  pushMatrix();
  
  translate(width/2, height/2);
  
  rotate(currPos);
  
  fill(255);
  arc(0,0,400,400,0, subDispos);
  currPos = subDispos;
  
  rotate(currPos);
  fill(0,100,100);
  arc(0,0,400,400,0, noSubDispos);
  
  float mouseAngle = atan2(mouseY-height/2, mouseX-width/2);
  
  popMatrix();
  
//change text color
  textSize(20);
  if(mouseAngle > 0 && mouseAngle < subDispos){
    fill(255);
    text("Substance Abuse Disorder", 25, 25);
    noStroke();
    fill(255);
    arc(width/2, height/2, 450, 450, 0, subDispos);
    fill(200);
    arc(width/2, height/2, 450, 450, 0, treatmentPos);
    fill(40);
    ellipse(width/2,height/2,250,250);
  } else {
    fill(0);
    text("Substance Abuse Disorder", 25, 25);
    fill(40);
    ellipse(width/2,height/2,250,250);
  }
  
  if(mouseAngle > 0 && mouseAngle < treatmentPos){
    fill(255);
    text("Received Treatment for Substance Abuse", 25, 50);
    fill(200);
    arc(width/2, height/2, 500, 500, 0, treatmentPos);
    fill(40);
    ellipse(width/2,height/2,250,250);
  }else{
    fill(0);
    text("Received Treatment for Substance Abuse", 25, 50);
    fill(40);
    ellipse(width/2,height/2,250,250);
  }
}

void processData() {
  subDispos = calcRadians(subDis);
  noSubDispos = calcRadians(noSubDis);
  treatmentPos = calcRadians(treatment);
}

float calcRadians(float f) {
  // f = x% of grandTotal
  // x = f/grandTotal
  float percentage = (f/(subDis + noSubDis)) * 100;
  float arcDegrees = (percentage/100) * 360;
  float arcRadians = radians(arcDegrees); 
  return arcRadians;
}

void checkMousePos(float angle, String s) {
  fill(0);
  
}




