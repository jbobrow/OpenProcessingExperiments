
void setup(){
  stroke(255);
  strokeWeight(4);
  background(0,0,0);
  size(500,445);
}
void draw(){
  var dx = random(-100,100);
  var dy = random(-100,100);
  fill(random(220), random(155), random(100));
  textSize(40)
 text("Chiara, \nJasmin, \nAna-Sofia",mouseX,mouseY);
  fill (0, 0, 0, 10);
  noStroke();
  rect (0, 0, width, height);
}
