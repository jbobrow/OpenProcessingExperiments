
/* We set num to -270 so our points start outward, then go towards the middle, then spread out. */
float num = 0;

void setup(){
  size(640, 640);
  /* Set up the draw screen appearence. */
  background(0);
  stroke(0, 150, 255, 50);
}

void draw(){
  translate(width/2, height/2);
  for(int i = 0; i < 360; i+=12){
    /* We have see how x and y work before. However notice we multiply them by num. This makes the points spread out */
    float x = sin(radians(i+num)) * 200;
    float y = cos(radians(i/x-num)) * x;
    point(-x, y);
    point(-y, x);
    point(x, -y);
    point(y, -x);
  }
  /* End the animation. Also for more detail make the addition to "num" smaller like 0.2. */
  if(num < 360) num += 0.5;
}


