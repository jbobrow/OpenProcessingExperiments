
float R = 0;

void setup() {
  size(250, 250);
  smooth();
  noStroke();
  rectMode(CENTER);
  frameRate(24);
}

void draw() {
  fill(0,10);
  strokeWeight(0);
  rect(width/2, height/2,width,height);
  R+=.1;

  translate(width/2, height/2);
  rotate(R);
  
  translate(20,20);
  rotate(R*-1);

  translate(0,0);
  rotate(R*-.1);

stroke(255,0,255,95);
strokeWeight(2);
line(50,50,-50+R,-50);

stroke(255,0,0,95);
line(-50,-50,0+R,0+R);

stroke(0,100,255,95);
line(0+R,0+R*2,0+R*.5,0+R);

translate(0,0);
  rotate(R*-1);

stroke(50,255,50,95);
line(0+R*-.5,0+R*-1,0+R*.5,0+R);

}

void keyPressed(){
  if (key=='s'){
    saveFrame("spiralines.png");
  }
}


