
float a=0;
float c=0;
float speed;
float scale;
float t;
float s;

void setup() {
  size(300, 600);
  background(0);
}

void draw() {
  stroke(255);
  strokeWeight(.1);
  stroke(s);
  line(0, height, width/2, a);
  line(width, height, width/2, a);
  strokeWeight(1);
  stroke(255,50,200);
  triangle(0, 0, width/2, a, width, 0);
  fill(c*2, c, c, 50);


  if (a<height) {
    speed+=.01;
    scale+=.01;
    s++;
  }
  else {
    speed=0;
    scale=0;
  }

  println(frameCount);

  if (frameCount<500) {
    c+=.5;
    t += speed;
    a= pow(t, scale);
    println("Exponential");
  }
  else if (frameCount<1100) {
    c=200;
    //    t += speed;
    //    a=height/(1+exp(-t));
    //    println("Sigmoid");

    t+=speed*2;
    a=log(t)*scale;
  }
  else if (frameCount<1600) {
    c-=.1;
    t+=speed;
    a= t*scale;
    println("Linear");
  }

  else if (frameCount<1900) {
    a=height;
    c=10;
  }
  else if (frameCount>2000) {
    exit();
  }
}



