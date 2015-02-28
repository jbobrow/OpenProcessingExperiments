
float a=1,b,i,h;
void setup(){size(400,400);smooth();h=width/2;}
void draw(){background(255);noFill();
  beginShape();
  for(i=1;i<a;i++){b=(i/cos(a)*20);
    vertex(sin(b)*h+h,cos(b)*h+h);
  }
  endShape();
  a+=.01;
}

