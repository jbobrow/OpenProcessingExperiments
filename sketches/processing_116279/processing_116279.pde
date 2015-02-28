
int spot = 60;
int h = 30;
String quote = "Please insert text here";

void setup(){
  size(240,120);
  //background(204);
  smooth();
  strokeWeight(3.3);  
  textSize(10);
}

void draw(){
  background(204);
  stroke(102);
  fill(150);  
  if (mousePressed){
    if (mouseButton == LEFT){
      stroke(0);
      fill(255);
    } else {
      stroke(255);
      fill(0);
    }    
  }   
 if (keyPressed){
  saveFrame();
 } 
  //quad(0,spot, width,spot, width, spot + h, 0, spot + h);
  rect(0,spot, width, h);
  line(0,spot,width,spot);
  line(spot,0,spot,height);
  text(quote, width/3, height/2-5);
  
}
