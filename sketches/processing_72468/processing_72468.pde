
float x=0;
float y= 0;
int t = 0;
int centre = 0;

void setup(){
  size(600,600);
  background(0);
  smooth();
  colorMode(RGB);
  noLoop();
}


void draw(){
  while (centre<350){
    createCircle();
    createRectangles();
  }
}

void createRectangles(){
  rect(width/2 - 4 ,height/2 - 4,8,8);
  for(int t= 0; t <360; t+=1) {
    x = centre * cos(radians(t));
    y = centre * sin(radians(t));

    rect(width/2+x - 4 ,height/2+y -4 ,7,7);
    fill(random(255),random(255),random(255));
    noStroke();
  }
  centre+=10;
}

void createCircle(){ 
  ellipse(width/2,height/2,8,8);
  for(int t= 0; t <360; t+=1) {
    x = centre * cos(radians(t));
    y = centre * sin(radians(t));

    ellipse(width/2+x,height/2+y,8,8);
    fill(random(255),(255),(255));
    stroke(random(255),random(255),random(255));
    strokeWeight(2);
  }
  centre+=20;
}


