
PImage zi;

void setup (){
  size (1024,768);
  zi=loadImage ("14.jpg");
  noStroke();
  noLoop();
  colorMode(HSB, 255);
  smooth();
  background (zi);
}

void draw(){
  int e=5;
  for (int y=0; y<768; y+=e){
    for (int x=0; x<1024; x+=e){
      color c = zi.get(x,y);
      weaitas(x,y,c,e);
    }
  }
}

void weaitas(int x, int y, int c, int w){
  int weaita=round (random(5,30));
  for(int l=0; l<= weaita; l++){
    float h = hue(c) + random(-10, 10);
    float s = saturation(c) + random(100);
    float b = brightness(c) + random(-10, 30);
    pushMatrix();
    translate(x,y);
    fill(h,s,b);
    float k = random(2, w/2);
    ellipse(random(-w, w),random(-w, w), k*2, k*2);
    popMatrix();
  }
}

void keyPressed(){
  redraw(); 
}



