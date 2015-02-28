
//z3421188 Interactive Eyes
void setup(){
  size(600,500);
  smooth();
  noCursor();
  shapeMode(CENTER); 
  frameRate(24);
}
 
void draw() {
  background(242, 176, 176, 10);
  //text
  fill(0, 0, 0);
  text("Mouse press to blink", 5, 15); 
  //mouse condition 
  if(mousePressed== false){
  //shapes
    fill(255);
    ellipse(225,243,130,110);
    ellipse(375,243,130,110);
    fill(random(255), random(255), random(255));
    ellipse((mouseX/20)+225,(mouseY/30)+230,60,60);
    ellipse((mouseX/20)+375,(mouseY/30)+230,60,60);
    fill(0);
    ellipse((mouseX/20)+225,(mouseY/30)+230,30,30);
    ellipse((mouseX/20)+375,(mouseY/30)+230,30,30);
    fill(255);
    ellipse((mouseX/20)+225,(mouseY/30)+220,5,5);
    ellipse((mouseX/20)+375,(mouseY/30)+220,5,5);
  } 
  
  else {
    fill(0);
    ellipse(225,243,130,110);
    ellipse(375,243,130,110);
  }
}


