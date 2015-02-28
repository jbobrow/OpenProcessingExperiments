
int timeColor1 = 1000;
int timeColor2 = 1000;
//int timeColor3 = 200

int lastColor;
boolean Color1 = true;

void setup() {
  smooth();
  size (800,800);
  background(0);
  frameRate(50);
  
  lastColor = millis();
  
  
}

void draw() {
  stroke(255);
  //stroke(random(255), random(255),random(255));
  strokeWeight(15);
  line(pmouseX,pmouseY,mouseX,mouseY);
  
   if(mousePressed){
   background(0);
 }
  
  if(Color1 == true){
  //change line color
  stroke(0255,0);
  
  if(timeColor1 < millis() - lastColor){
    Color1 = false;
    lastColor = millis();
}
  
  
}else{
  stroke(random(255), random(255),random(255));
  strokeWeight(15);
  line(pmouseX,pmouseY,mouseX,mouseY);
  
  if(timeColor2 < millis() - lastColor){
    Color1 = true;
    lastColor = millis();
    
   
}
}
}





