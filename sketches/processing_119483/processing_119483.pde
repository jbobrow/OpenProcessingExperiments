
float a;
Color c;
void setup() {
  size(700, 50);
  stroke(255);
  a = 0;
    background(51);
    textSize(36);
textAlign(CENTER,CENTER);
      text("LOADED", width/2,height/2);



}

void draw() {

  stroke(c);
  line(a, height, a, 0);  
  a = a - 2;
  if (a < 0) { 
  c= color(random(255), 156, random(255));
    a = width; 
  }

}
