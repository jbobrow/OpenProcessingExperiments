
//Property of Anissa N. 
//This actually isn't what I intended to do this was actually supposed to be something for game but it turned into this... and I liked it.
//Tweak this is and play around with the colors and the numbers of triangles !!!

void setup() {
  size(800,600);
  background(0,50,250);
noStroke();
}

void draw(){
  for(int i=1;i<=200;i++){
 triangle(random(800), random(600), random(800), random(600),random(800),random(600));
 fill(random(2,255),random(2,255),random(2,255),50);
}
}
