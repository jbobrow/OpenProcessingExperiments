
PFont kartika48;
void setup() {
  size(500,500);
  smooth();
  kartika48 = loadFont("Kartika-Bold-48.vlw");
}

void draw() {
  background(255);
  fill(113,91,62);
  textFont(kartika48, 50);
  int a = 1;
  float ease = .001;
  a += (mouseY - a) * ease;
 
  
  char[] word = {'A','f','t','e','r','s','h','o','c','k','s'};
  textAlign(LEFT);
  for(int i =0; i < word.length; i++) {
      if(dist(mouseX,mouseY,pmouseX,pmouseY) == 0) {
        text(word[i], 1+(30*i+2*(random(i-1,i+1))),height/2+(random(-2,2)*a));
      }
      else if(dist(mouseX,mouseY,pmouseX,pmouseY) > 0) {
        text(word[i], 35*i,height/2);
      }
  }
}

