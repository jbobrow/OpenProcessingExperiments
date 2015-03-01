

void setup (){
  size(500,500);
  frameRate(3);}
  void draw(){
    rect(100,100,300,300);
    
if (mouseY>100 & mouseY<400 & mouseX>100 & mouseX<400 ){
  fill(mouseX,mouseY,mouseX*mouseY/1000);

}else {fill(0,0,0);
}}



