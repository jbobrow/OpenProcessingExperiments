
float r;
float g;
float b;
float a;
float x;
float y;
float v;
float z;
float count;
float state;

void setup() {
  size(1000,800);
  smooth();
  background(255);
  state = 0;
}

void draw() {
  
  a = random(255); 
  strokeWeight(5);
  fill(0);
  ellipse(500,400,v,z);
  //tranparency
  noStroke();
  fill(255,255,255,150);
  rect(0,0,width,height);
  
  fill(r,g,b,a);
  ellipse(mouseX,mouseY,x,y);
  stroke(r,g,b,a);
  fill(r,g,b,a);
  line(500,400,mouseX,mouseY);
  
  if (mouseX<width/2 && mouseY<height/2) {
    r=r+1;
    if (r>255){
      r=255;
    }
    g=g+1;
    if (g>255){
      g=255;
    }
    b=0;
  } else if (mouseX<width/2 && mouseY>height/2) {
    r=r+1;
    if (r>255){
      r=255;
    }
    g=0;
    b=b+1;
    if (b>255){
      r=255;
    }
  } else if (mouseX>width/2 && mouseY<height/2) {
    r=0;
    g=g+1;
    if (g>255){
      g=255;
    }
    b=b+1;
    if (b>255){
      b=255;
    }
  } else if (mouseX>width/2 && mouseY>height/2) {
    r=random(255);
    g=random(255);
    b=random(255);
  }
    
    count++;
    state = count;
    if (state <= 150){
       x = 50 + state;
       y = 50 + state;
       v = 200 - state;
       z = 200 - state;
    } else if (state > 150){
      x = 200 - (state-150);
      y = 200 - (state-150);
      v = 50 + (state-150);
      z = 50 + (state-150);
    } 
    if (state >= 300){
      state = 0;
      count = 0;
    }
}


