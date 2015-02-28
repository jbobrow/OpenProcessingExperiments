
float sz;
float r;
float g;
float b;


void setup(){
  size (600, 600);
  smooth ();
  noStroke ();
  frameRate (50);
}


void draw (){  
  fill(20);
  rect(0,0,width,height); 
 
  for (int i=0; i<width; i+=120){
    float sz = random(i);   
    fill (random(r),random(g),random(b));
    ellipse (mouseX+i,mouseY+i, sz, sz);
    }
}

void mousePressed() {
  for (int i=0; i<width; i+=120){
    r = random (20,255);
    g = random (0,160);
    b = random (40,120);  
  }
}

