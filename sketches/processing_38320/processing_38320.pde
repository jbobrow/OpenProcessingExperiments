
int exercise = 3;
int counter;

void setup() {
  size(500,500);
  background(#000000);
  counter = 0;
}

void draw() {
  if(key == '1') {
    exercise = 1;
  }
  else if(key == '3') {
    exercise = 3;
  }
  counter++;
  background(#000000);
  int n = 10;
  float interval;
  
  smooth();
  
  switch(exercise) {
    case 1:
      interval = width/n;
      stroke(0, 255,255);
      strokeWeight(1);
      for(int i = 0; i < n; i++) {
        line( i*interval,0,width,i*interval);
      }
    break;
    case 3:
      fill(#ffffff);
      noStroke();
      float radInterval = (PI)/n;
      int margin = 50;
      interval = (width-2*margin) / n;
      int circPadding = 4;
      float circRadius = (interval-2*circPadding)/2;
      for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
          arc(margin+interval*i+circPadding+circRadius,
              margin+interval*j+circPadding+circRadius,
              circRadius*2, circRadius*2,
              i*radInterval+j*radInterval+(.15*counter),
               i*radInterval+j*radInterval + PI+(.15*counter));
        }
      }
    break; 
  } 
}
                
