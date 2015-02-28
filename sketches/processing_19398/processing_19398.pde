
Jelly[] jelly = new Jelly[200];

void setup() {
  size(600,600);
  smooth();
  noStroke();
  
  for (int i = 0; i < jelly.length; i++) {
   jelly[i] = new Jelly(random(width),random(height),random(229),0,255);
 }
}

void draw() {
  background(0);
  
  for (int j = 0; j < jelly.length; j++) {
    jelly[j].show();
    jelly[j].move();


}
}

void mousePressed() {
    Jelly b = new Jelly (mouseX,mouseY,random(255),234,0);
     jelly = (Jelly[]) append(jelly,b);
  }



