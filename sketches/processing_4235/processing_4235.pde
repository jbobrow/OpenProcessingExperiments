
int i, j, b, a=400;
PFont font;

void setup(){
  size(a,a);
  b = a;
  noStroke();
  font = loadFont("c.vlw"); 
  frameRate(25);
}

void draw(){
  for(i=0; i++ < b/30;){
    for(j=0; j++ < b/50;){
      fill(sin(a++) * b, sin(a++) * b, sin(a++) * b);
      rect(0, i * random(500), a, 10 * j);
    }
  }
  fill(78, 68, 217, 255);
  rect(25, 25, 350, 350);
  fill(164, 154, 243, 255);
  textFont(font, 14);
  text("Loading", 30, 37); 
}



