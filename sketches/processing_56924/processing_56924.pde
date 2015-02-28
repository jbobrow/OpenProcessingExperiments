
//3IC_Processing 
//by Bing X. Liu

PImage o;
PImage g;
PImage maskImg;
//PImage p;
float bar = 0.20;
color c;

void setup() {
  //  String url = "http://www.planetware.com/i/photo/la-defense-paris-prladfn1.jpg";
  //  o = loadImage(url, "png");
  o = loadImage("def.jpg");
  //  g.filter(BLUR,7);
  int _w = o.width;
  int _h = o.height;
  //  println(_w+"  "+_h);
  size (_w, _h);
  imageMode(CENTER);
  g = loadImage("goz.png");
  g.resize(_w,_h);
  maskImg = loadImage("def alpha.jpg");
}

void draw() {
    background(255);
    o.mask(maskImg);
  pushMatrix();
  if(mouseX != 0 && mouseY>=height/2)  scale(1/(0.005*mouseY));
  image(g, mouseX, mouseY , 350, 300);
  popMatrix();
  image(o, width/2, height/2, width, height+2);
}


