
PImage blueline;
PImage orange;


void setup(){
 size(1000,1000);
  blueline = loadImage("blue_lines.jpg");
  orange = loadImage("orange.jpg");
}

void draw (){
  tint (255,50);
  image(blueline,random(0,500),random(0,800), random(25,700),random(100,150));
  tint (250,75);
  image(orange,random(0,800),random(0,800),random(75,250),random(100,200));
  fill (25,80,54,15);
  ellipse (random(25,1000),25,random(50,100),50);

  
}

