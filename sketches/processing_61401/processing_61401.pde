
PFont f; 
PFont d; 
PImage m; 
PImage x; 

void setup() {
   size(600,600); 
   f = loadFont("CurlzMT-48.vlw");
   d = loadFont("Chalkduster-48.vlw");
   m = loadImage("enom_girl.jpg");
   x = loadImage("lin.jpg");
}

void draw () {
  tint(10,190,110);
  image(x,200,90,m.width/2,m.height/2);
  image(m ,mouseX,mouseY);
  
  textSize(48);
  textFont(f);
  fill(20,20,310);
  text("? ? ?", mouseX, mouseY);
  textFont(d);
  fill(100,500,0);
  text("w h a t", 133, 133, 4);
  
}

