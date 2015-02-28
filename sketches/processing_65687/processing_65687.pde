
PImage bg;
PImage prince;
PImage math;
PImage light;
PImage old;
PImage rose;

PFont font;
String text1="Once upon a time there was a little prince who lived on a planet that was scarcely any bigger than himself, and who had need of a sheep...";
String text2="He said:If someone loves a flower, of which just one single blossom grows in all the millions and millions of stars, it is enough to make him happy just to look at the stars. He can say to himself, Somewhere, my flower is there…";
String text3="But he left her, went to many places and met many people.";
String text4="Only the children know what they are looking for. They waste their time over a rag doll and it becomes very important to them; and if anybody takes it away from them, they cry…";

float v;
 
 
void setup() {
  size(600, 300);
  smooth();
  bg = loadImage("bg.jpg");
  prince = loadImage("prince.png");
  rose = loadImage("rose.png");
  light = loadImage("light.png");
  math = loadImage("math.png");
  old = loadImage("old.png");
  
  
  font = loadFont("SavoyeLetPlain-48.vlw");
  textFont(font);
  
  frameRate(60);
}
 
void draw() {
  background(0);
  image(bg,0,0);
  
  if(v==460){
    v=0;
  }else if (v<190)
  {
     
    pushMatrix();
    translate(450,250);
    rotate(PI/3-PI*v/322);
    scale(1+v/300);
    image(prince,-150,-202,300,316);
    popMatrix();
    textSize(24);
    text(text1,50,50,250,150);  
    
  }else if (v>=190 && v<460)
  {
    
    pushMatrix();
    translate(-150,300);
    rotate(PI/8+PI*v/660);
    scale(1+v/400);
    image(rose,-204,-196,250,263);
    popMatrix();
    textSize(24);
    text(text2,300,50,250,150);    
  }
  v++;
}

