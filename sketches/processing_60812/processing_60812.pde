
float r;
float g;
float b;

void setup() {
size (600,600);
smooth ();
background(0);
noStroke ();
}

void draw(){
  fill (255,40);
  //rect (0,0,600,600);

fill(255,0,0);
rect(0,0, 20,20);

fill(0,0,225);
rect(580,580,20,20);

fill(255,255,255);
rect(580,0,20,20);

fill(0,255,0);
rect(0,580,20,20);

  if (mousePressed && mouseX <20 &&  mouseY < 20) {
    r = 255;
    g = 0;
    b = 0;
  } else if (mousePressed && mouseX >580 &&  mouseY >580) {
    r = 0;
    g = 0;
    b = 255;
  }else if (mousePressed && mouseX <20 &&  mouseY >580) {
    r = 0;
    g = 255;
    b = 0;
  }else if (mousePressed && mouseX >580 &&  mouseY <20) {
    r = 255;
    g = 255;
    b = 255;
    
  }
  fill(r,g,b);
 if (mousePressed){
  ellipse (mouseX,mouseY,20,20);}
}

