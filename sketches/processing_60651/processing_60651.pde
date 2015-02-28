
color c1,c2,c3,c4,c5;

float h,w;

void setup(){
  size(200, 200);
  colorMode(HSB,360,100,100,100);
  background(168,22,100);
  
  w = width/2;
  h = height/2;
  
  smooth();
  
}

void draw () {
  stroke(0,0,100);
  background(168,8,100);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  
  if(mouseX <= w && mouseY <= h) {
    fill(0,23,100);
    noStroke();
    rect(0,0, w, h);
  } else if(mouseX >= w && mouseY <= h) {
    fill(121,23,100);
    noStroke();
    rect(w,0,w,h);
  } else if(mouseX <=w && mouseY >= h) {
    fill(219,23,100);
    noStroke();
    rect(0,h,w,h);
  } else if(mouseX >= w && mouseY >= h){
    fill(58,23,100);
    noStroke();
    rect(w,h,w,h);
  }

}

