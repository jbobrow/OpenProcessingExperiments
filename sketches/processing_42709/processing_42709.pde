
PImage ima1;
PImage ima2;
PFont myfont;
PFont myfont2;

void setup(){
size(804,416);
ima1=loadImage("moon.jpg");
image(ima1,0,0);

ima2=loadImage("tri2.png");
image(ima2,0,0);

myfont=loadFont("KozGoPr6N-Bold-48.vlw");
myfont2=loadFont("KozMinPro-Medium-48.vlw");
}

void draw (){ 
  tint(10,150,150,10);
  image(ima1,0,0);
  image(ima2,250,mouseY,335,289); 
  textFont(myfont);

  

  textSize(70);
  text("Smack",40,230);
  textFont(myfont2);
  textSize(50);
  text("Your Head",550,230);
}

