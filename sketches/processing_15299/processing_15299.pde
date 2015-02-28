
PImage smiley;
PImage amiley;
PImage dmiley;

void setup(){
  size(200,200);
  smiley = loadImage("images-2.jpeg");
  amiley = loadImage("Unknown.jpeg");
  dmiley = loadImage("images-1.jpeg");
}

void draw(){
  
  tint(255,244,11,44);
  image(smiley,1,1);
  image(dmiley,1,1);
  image(amiley,1,1);
  
}




