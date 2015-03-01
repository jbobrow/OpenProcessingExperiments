
int frame=0;

void setup() {
  size(400, 400);
  background(0);
}

void draw() {

  if (frame<=40) {
    cloud();
    delay(int(random(0, 400)));
  }

  else if (frame<=44) {
    strokeWeight(int(random(0, 50)));
    background(255);
    rainDropS();
    delay(1000);
  }

  else if (frame<=70) {
    strokeWeight(int(random(0, 300)));
    background(255);
    rainDropS();
    delay(int(random(100, 250)));
  }

  else if (frame<=110) {
    strokeWeight(int(random(0, 400)));
    rainDropS();
    delay(int(random(50, 150)));
  }

  else if (frame<=140) {
    strokeWeight(int(random(0, 400)));
    rainDropS();
    ripples(230);
    delay(int(random(50, 150)));
  }

  else if (frame<=200) {
    ripples(255);
    delay(int(random(50, 100)));
  }
  else {

    flow();
    delay(10);
    vortex();
    delay(20);
  }

  frame++;
  //Reset frame when the animation end
  if (frame>230) {
    frame=0;
  }

  //saveFrame("image-####.jpg");
}

void cloud() {
  //clouds
  strokeWeight(int(random(0, 50)));
  for (int i=0;i<frame;i++) {
    stroke(255);
    //line (i*int(random(0,100)), i*int(random(0,20)),i*int(random(0,100)), i*int(random(0,20)) );
    int size=i+int(random(0, 400));
    line(0, size, i+int(random(0, 400)), size );
  }
}

void rainDropS() {
  //rain drops

  for (int i=0;i<frame;i++) {
    stroke(int(random(150, 255)), int(random(150, 255)), int(random(150, 255)), 70);
    point (i*60+int(random(0, 400)), i*60+int(random(0, 400)));
  }
}

void ripples(int Color) {
  //ripples
  noFill();
  strokeWeight(int(random(0, 10)));

  for (int i=0;i<frame; i++) {
    stroke(int(random(Color, 255)), 90);
    int size=i+5+int(random(0, 500));
    arc(200, 200, size, size, radians(i+10+int(random(0, 721))), radians(i+10+int(random(0, 721))) );
  }
}

void vortex() {
  fill(0, 30);
  strokeWeight(100);
  noStroke();
  for (int i=0;i<frame-200; i++) {
    ellipse(200, 200, i*i, i*i);
  }
}

void flow() {
  strokeWeight(1);
  for (int i=0;i<frame-200; i++) {
    for (int l=0;l<frame-200; l++) {
      stroke(0);
      line( l*l+200, i*i*l+200, i*i-200, l*l*l-200);

      arc(l*i+200, l*i+200, l*i*i, l*i*l, radians(i*l), radians(i*i));
    }
  }
}



