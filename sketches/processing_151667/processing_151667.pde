

//instead of using the keyboard to change frame_rate_value, use the mouse

int frame_rate_value;

void setup() {
 size(600, 390);
 frame_rate_value = 16;
 background(0);
}

void draw() {
 background(0);
 int num = 20;
 int margin = 0;
 float gutter = 0; //distance between each cell
 float cellsize = ( width - (2 * margin) - gutter * (num - 1) ) / (num - 1);
 int circleNumber = 0; // counter
 for (int i=0; i<num; i++) {
  for (int j=0; j<num; j++) {
   circleNumber = (i * num) + j; //cf w2_04
   float tx = margin + cellsize * i + gutter * i;
   float ty = margin + cellsize * j + gutter * j;
   movingCircle(tx, ty, cellsize, circleNumber);
  }
 }
}

void movingCircle(float x, float y, float size, int offset) {
 float circlePeriod = (float)frame_rate_value;
 float circleAge = (float)((frameCount + offset) % (int)circlePeriod) / circlePeriod;
 float circleSize = size * 2.0 * sin(circleAge * HALF_PI);
 strokeWeight(2);
 stroke(random(153,255),random(51,255),random(0,255), lerp(255, 0, circleAge)); //random warm colors
 fill(lerp(128, 0, circleAge), lerp(120, 0, circleAge));
 ellipse(x-size/2, y-size/2, circleSize, circleSize);
}

void mouseDragged() {
 float x = map (mouseX, 0, width, 2, 120); //option 2
 frame_rate_value = round(x/9)+3;
 println("Current frame Rate is: " + frame_rate_value);
}

