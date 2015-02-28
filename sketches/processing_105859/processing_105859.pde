
int arraySize = 0;
int[] x = new int[arraySize];
int[] y = new int[arraySize];
int[] x2 = new int[arraySize];
int[] y2 = new int[arraySize];


void setup () {
  size(700, 500);
//  for (int i=0; i<arraySize; i++) {
//    x[i] = int(random(100, 400));
//    y[i] = int(random(200, 300));
//  
//    x2[i] = int(random(300, 600));
//    y2[i] = int(random(200, 300));
//  }
}

int s;
int time;
void draw () {

 time = int(millis()/1000);
 println(time);
 if(time != s){
   println("                 "+time);
   x = append(x, int(random((width/2)-time,(width/2)+time)));
   y = append(y, int(random((height/2)-time,(height/2)+time)));
   x2 = append(x2, int(random((width/4)-time, (width/4)+time)));
   y2 = append(y2, int(random((height/4)-time, (height/4)+time)));
 }
 s = time;
// 
 
//println(time);


  background(220);
//  float time = (millis()/1000.0);
//  int arraySize = 10;
  for (int i=0; i < x.length; i++) {
    x[i] += int(random(-5, 5));
    y[i] += int(random(-5, 5));
    //  println(x[i]);
    colorMode(HSB, 360, 100, 100);
    fill(random(60, 120), 80, 80, 100);
    ellipse(x[i], y[i], random(20, 40), random(20, 40));
//  }
//  for (int i=0; i<x2.length; i++) {
    x2[i] += int(random(-5, 5));
    y2[i] += int(random(-5, 5));
    //  println(x[i]);
    colorMode(HSB, 360, 100, 100);
    fill(random(300, 360), 80, 80, 100);
    ellipse(x2[i], y2[i], random(20, 40), random(20, 40));
  }
}
