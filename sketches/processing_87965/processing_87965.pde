
int counter;

void setup() {  size(250, 250);
  background(0);
  link("http://www.google.pl","_new");
  
  frameRate(2);  //baby don't hurt me!
  
}

void draw() {
  fill(255);
  rect(random(0,width),random(0,width),random(0,100),random(0,100));
  link("http://www.google.pl","_new");
}
