
float x1 = 200.0;
float y1 = 25.0;
float cx1 = 187.5;
float cy1 = 150.0;
float cx2 = 50.0;
float cy2 = 187.5;
float x2 = 200.0;
float y2 = 300.0;
int  i =0;
int  k=0;

void setup() {
  size(400,400);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
    
  translate(width/2,height/2);
  rotate(random(i-k));
    
  fill(random(i-k));
    
  bezier(162.5,0,+12.5,50,150,12.5,(x2),(y2));
  bezier(-100,0,-12.5,50,-150,12.5,(x2),(y2));

  i+=1;
  k-=1;
    
  if (i >300) {
    i -= 1;
    k += 1;
  }
}

