
float angle = 0;
float speed = 0.02;
int a;
int h;
float modulo;
int var = 1;

void setup() {
  size (500, 500);
  smooth();
  background(255);
  stroke(0);
  strokeWeight(3);
  fill(100);

  h = height/10;


  for (int i=h; i<=height; i+=h) {
    rect(0, i-h, width, i);
  }
}

void draw() {
  if (var>0) {
    fill(100);
  }

  else if (var<0) {
    fill(200);
  }

  a=0;


  if (angle<PI/2-speed) {
    float delta = h*abs(cos(angle));
    background(255);
    rect(0, delta, width, h-2*delta);

    for (int i=0; i<height-h; i+=h) {
      rect(0, delta+i, width, h);
    }

    angle+=speed;
  }

  if (angle>=PI/2-speed && angle<PI/2) {
    float delta = h*abs(cos(angle));
    background(255);
    rect(0, delta, width, h-2*delta);

    for (int i=0; i<height-h; i+=h) {
      rect(0, delta+i, width, h);
    }

    angle+=speed;
    var*=-1;
  }

  for (float step=PI/2; step<20*PI/2; step+=PI) {
    modulo = ((step*2/PI)-1) % 4;

    if (modulo == 0) {
      if (angle>step && angle<=step+PI/2) {
        float delta = h*abs(cos(angle));
        rect(0, a, width, delta);
        angle+=speed;
      }



      else if (angle>step+PI/2 && angle<=step+PI) {
        float delta = h*abs(cos(angle));
        rect(0, a+h, width, h-delta);
        angle+=speed;
      }

      a+=2*h;
    }

    else if (modulo != 0) {
      if (angle>step && angle<=step+PI) {
        float delta = h*abs(cos(angle));
        angle+=speed;
      }
    }
  }

  if (angle>=10*PI) {
    a=0;
    angle=0;
  }
}   


