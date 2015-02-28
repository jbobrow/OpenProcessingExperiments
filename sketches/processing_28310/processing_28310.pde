
PImage Engie;
float x, y, dx, dy, easing;

void setup(){
  size(600,600);
  Engie = loadImage("Engie.gif");
  imageMode(CENTER);
  x = 0;
  y = 0;
  easing = .05;
}

void draw (){
  //background (255,0,0);
  fill(0,0,255,10);
  rect(0,0,width,height);
  dx = mouseX - x;
  dy = mouseY - y;
  
  x = x + dx*easing;
  y = y + dy*easing;
  tint(random(255),random(255),random(255));
  image(Engie,x,y);
}

void keyPressed(){
  if (key == 's'){
    save("dernspahz.tif");
    println("DANGIT");
  }
}

