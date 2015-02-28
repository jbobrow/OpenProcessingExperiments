
int counter;

void setup() {  
  size(440,330 );
  background(0,0);
  colorMode(HSB);
  counter = 0;
  frameRate (10);
  
}

void draw() {   
  counter++;
  noStroke();
  smooth();
  fill(random(10,255),255,random(200,255),mouseX/3+10);
  frameRate (mouseY/4);
  blendColor(1-255,50-150,ADD); 
  
  if(mousePressed == true) {
    ellipse(width/2, height/2, 100*sin(counter), 100*sin(counter));
  }
  else {
    ellipse(width/2, height/2, 580*sin(counter), 580*sin(counter));
  }
}
                
                                                                                
