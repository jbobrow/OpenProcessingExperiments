
PFont font;

int diam = 50;

boolean circleMode;


void setup(){
  size(800, 800);
  background(255);
  
  fill(43, 24, 66);
  //rectMode(CENTER);
  //rect(150, 20, width/2, height/2);
  ellipse(width/2, height/2, diam*2, diam*2);
  
  fill(2, 236, 127);
  font = loadFont("MyriadPro-Regular-100.vlw");
  text("Click to begin", width/2-40, height/2+5);
  
  noLoop();

  
}

void draw(){
  if(circleMode==true){
  background(random(17, 43), random(24, 140), random(66, 100));
  
  noStroke();
  fill(random(234, 255), random(114, 255), random(236, 255));
  text("CLICK AGAIN TO CHANGE COLOR", width/2-100, height/4);
    
  for(int x=diam/2; x<width+diam/2; x+=diam){
    noStroke();
     if(dist(mouseX, mouseY, x, height/2)<diam/2){
     fill(random(2, 25), random(236, 255), random(127, 254)); 
    } else {
     fill(255); 
    }
    ellipse(x, height/2, diam, diam);
  }
  }
}

void mousePressed(){
  circleMode=!circleMode;
  redraw();
}



