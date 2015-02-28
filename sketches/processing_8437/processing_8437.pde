
/*
  Daniel "weseven" Simionato, 2010.
  
*/


PImage gsybe;

class Circle{
  float xpos;
  float ypos;
  float dim;
  
  Circle(float x, float y, float d){
    xpos = x;
    ypos = y;
    dim = d;
  }
  
  void display(){
    fill(30, 20, 55, 50);
    ellipse(xpos, ypos, dim, dim);
  }
  
  void setdim(float newdim){
    dim = newdim;
  }

};

  
Circle c;
Circle[] t;

int traildim = 40;//# of circles in the trail
int currentindex = 0;// last circle that has been painted
int trailcounter = 1;//set to 1 so we skip the first frame
float circledim = 50;//circle dimension

boolean start = false;

float g = 128;
float b = 128;

void setup() {
  size(600, 600, P2D);
  stroke(128, 128, 0, 100);
  
  gsybe = loadImage("liftyr_hires.jpg");
  gsybe.resize(width, height);
  
  t = new Circle[traildim];
  
  //initializing (with null dimension) to prevent segfaults
  for(int i=0; i<traildim; i++){
    c = new Circle(mouseX, mouseY, 0);
    t[i] = c;
  }
  
  background(gsybe);
  
  noSmooth();
  noLoop();
}

void draw() {
  if(start){  
    background(20, g, b);
    //for every circle c in the trail
    for(int i=0; i< traildim; i++){
      c = t[i];
      c.setdim(c.dim*0.98);
      c.display();
    }
  }
}

void mouseMoved(){
  if(start){ //this shouldn't be needed, but if the mouse is moved before 
             //the image is actually set as background, we get a colour 
    if(trailcounter==0){  
      g = (5*mouseX/12); // 5/12 -> 250/600 . using mouseX/width*255 apparently didn't work
      b = (5*mouseY/12);
      
      background(30, g, b);
      if(currentindex > (traildim -1))
        currentindex = 0;
      t[currentindex] = new Circle( mouseX, mouseY, circledim);
      
      currentindex++;
      trailcounter = 4;//we add one circle (and change background) every 3 movements
    }
    trailcounter--;
  }
}

void mousePressed(){
  if(!start){
    start=true;
    loop();
  }
  else{
    start=false;
    noLoop();
  }
}



