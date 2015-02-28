
//Y.Okamoto 20140225
//The influences from one point.

//global variables
color strokeColor =color(0,10);

//setup()
void setup(){
  size(800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
}

//draw()
void draw(){
if(mousePressed){
  pushMatrix();
  translate(width/2,height/2);
  int circleResolution =(int)map(mouseY, 0, height, 2, 10);
  int radius = mouseX;
  float angle = TWO_PI/circleResolution;

//style
  strokeWeight(1);
  stroke(strokeColor);  
  
  beginShape();
  for (int i=0; i<=circleResolution; i++){
    line(random(10), random(10), mouseX, mouseY);
    ellipse(mouseX, mouseY,random(20), random(20));   
    float x = 0 + cos(angle*i) * radius;
    float y = 0 + sin(angle*i) * radius;
 } 
  endShape();
  popMatrix();
}  
}

//keyPressed()
void keyReleased(){
 if (key == DELETE || key ==BACKSPACE) background(360);
 if (key =='s'|| key=='S') saveFrame("screenshot.png");
 
 switch(key){
 case '1':
    strokeColor =color(67,73,99,10);
    break;
 case '2':
    strokeColor =color(312,73,99, 10);
    break;
 case '3':
    strokeColor =color(105,73,99, 10);
    break; 
 case '4':
    strokeColor =color(348,73,99, 10);
    break;
 case '5':
    strokeColor =color(274,73,99, 10);
    break;  

 }
}
