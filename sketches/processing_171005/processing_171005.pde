
int counter=0;
int i;

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  stroke(#008B8B);
  noLoop();
  
}


void draw() {  //draw function loops 
 
 for (int i=0; i<100; i++) {
 line(counter,0, width-counter, height-counter);
 line(0, counter, width-counter, height-counter);
 fill(#008B8B);
 ellipse(150,400, 50,50);
 counter=counter+10;
 }
}
