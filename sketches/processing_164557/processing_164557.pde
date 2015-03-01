
void setup(){
size(500,400);
background(245,245,125);

}
void draw(){
  if(!mousePressed){
  filter(INVERT);
  }
    if(mousePressed){
  noStroke();
  fill(mouseY,random(255),random(255));
  rect(mouseX+random(-25,25),mouseY+random(-25,25),random(5,10),random(5,10));
    }
filter(ERODE);
  fill(random(255),255,random(255),16);
  noStroke();
  rect(random(100,400),random(100,300),50,50);
  fill(132,240,215);
  filter(POSTERIZE, 4);
strokeWeight(2);
stroke(132,240,215);
  fill(240,132,157);
  ellipse(250,200,mouseY,mouseX);
}
