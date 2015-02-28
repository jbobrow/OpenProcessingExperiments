
PImage detail2_3;
PImage detail2_2;
PImage detail2_1;
PImage face2;
PImage hair2;
int x,y;

void setup() {
  colorMode(HSB, 360,100,100);
  size(600,600);
  smooth();
  strokeWeight(.5);
  background(0,0,99);
  frameRate(30);
  detail2_1= loadImage("detail2_1.jpg");
  detail2_2= loadImage("detail2_2.jpg");
  detail2_3= loadImage("detail2_3.jpg");
  face2= loadImage("face2.jpg");
  hair2= loadImage("hair2.jpg");
  

  
  for(int i=0; i<10000; i++) {
    x=int( random(width));
    y=int( random(height));
    float ellSize =random(0,300);
    line(x,y,ellSize,ellSize);
    
  }
    for(int i=0; i<10000; i++) {
    x=int( random(width));
    y=int( random(height));
    float ellSize =random(0,300);
    line(2*x,y*2,ellSize,ellSize);
    
  }
}

void draw() {
  for(int i=0; i<10000; i++) {
    x=int( random(width));
    y=int( random(height));
    float ellSize =random(300,300);
    line(x,y,ellSize,ellSize);
  }
  for(int i=0; i<100000; i++) {
    x=int( random(width));
    y=int( random(height));

    color cp= hair2.get(x,y);
    float b=brightness(cp);
    if(b == 0) {
      strokeWeight(.5);
      stroke(0,0,84);
      float ellSize =random(300,300);
      line(x,y,ellSize,ellSize);
     
    }
  }
  for(int i=0; i<100000; i++) {
    x=int( random(width));
    y=int( random(height));

    color cp= face2.get(x,y);
    float b=brightness(cp);
    if(b == 0) {
      strokeWeight(.5);
      float ellSize =random(2,5);
      fill(0,0,90);
      ellipse(x,y,ellSize,ellSize);
      
     }
  }
  for(int i=0; i<100000; i++) {
    x=int( random(width));
    y=int( random(height));

    color cp= detail2_1.get(x,y);
    float b=brightness(cp);
    if(b == 0) {
      strokeWeight(.5);
      float ellSize =random(2,5);
      fill(0,0,78);
      ellipse(x,y,ellSize,ellSize);
      
    }
  }
  for(int i=0; i<100000; i++) {
    x=int( random(width));
    y=int( random(height));

    color cp= detail2_2.get(x,y);
    float b=brightness(cp);
    if(b == 0) {
      strokeWeight(.5);
      float ellSize =random(3,5);
      fill(0,0,79);
      ellipse(x,y,ellSize,ellSize);
    
    }
  }
  for(int i=0; i<1000000; i++) {
    x=int( random(width));
    y=int( random(height));

    color cp= detail2_3.get(x,y);
    float b=brightness(cp);
    if(b == 0) {
      strokeWeight(.5);
      float ellSize =random(2,3);
      fill(0,0,69);
      ellipse(x,y,ellSize,ellSize);
     
    }
  }
  
  for(int i=0;i<100; i++) {
    pushMatrix();
    translate(10*i,0);
    fill(0);
    quad(0,0,5,0,5,600,0,600);
    popMatrix();
  }

  
}


