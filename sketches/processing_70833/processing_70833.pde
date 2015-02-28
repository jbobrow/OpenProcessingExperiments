
void setup(){
  size(1000,800);
  colorMode(HSB,100);
  background(0);
  smooth();
  noStroke();
}

void draw (){
  if (mousePressed && mouseX < 500 && mouseX > 50){
    fill(random(50)+50,random(100),random(40)+60,10) ;
    ellipse(mouseX,mouseY,random(100),random(100));
    fill(random(50),random(100),random(100));
    ellipse((mouseX+500),mouseY,random(100),random(100));
  }
}

