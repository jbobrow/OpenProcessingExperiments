
void setup() {
  size (1000,1000);
  frameRate (999999999);
  background (0);
}
  void draw(){
stroke (0,random (255),0);
line (500,500,random(1000),random(1000));
stroke (random (255),0,0);
line (500,500,random(1000),random(1000));
stroke (0,0,random(255));
line (500,500,random(1000),random(1000));

stroke (0,random (255),0);
line (250,250,random(500),random(500));
stroke (random (255),0,0);
line (250,250,random(500),random(500));
stroke (0,0,random(255));
line (250,250,random(500),random(500));

stroke (0,random (255),0);
line (750,750,random(500,999),random(500,999));
stroke (random (255),0,0);
line (750,750,random(500,999),random(500,999));
stroke (0,0,random(255));
line (750,750,random(500,999),random(500,999));

stroke (0,random (255),0);
line (250,750,random(500),random(500,999));
stroke (random (255),0,0);
line (250,750,random(500),random(500,999));
stroke (0,0,random(255));
line (250,750,random(500),random(500,999));

stroke (0,random (255),0);
line (750,250,random(500,999),random(500));
stroke (random (255),0,0);
line (750,250,random(500,999),random(500));
stroke (0,0,random(255));
line (750,250,random(500,999),random(500));
}

