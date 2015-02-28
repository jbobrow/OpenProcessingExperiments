
float l;
float angle;
float radius = 60;
float frequency = 6;
float x;
float backdrop=0;


void setup() {
  size(840, 168);
  //background(255, 254, 150);
}

void draw() {
  background(backdrop+75, backdrop+10, backdrop+20);

  for (int i =0; i<width; i++) {

    l = 75 + sin(radians(angle))*(radius);
  }

  ellipse(x, l, 5, 5);
  angle -= frequency;
  x+=2;
  backdrop+=.5;
  radius-=.15;
  
  if(x>width){
    x=0;
    backdrop=0;
    radius=60;
    frequency=6;
  }
}



