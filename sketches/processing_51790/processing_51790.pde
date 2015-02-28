
PImage p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15;
PFont font1;
/*
String q1 = "The universe is not required to be in perfect harmony with human ambition -CS";
String q2 = "For small creatures such as we the vastness is bearable only through love -CS";
String q3 = "The universe seems neither benign nor hostile, merely indifferent -CS";
String q4 = "Somewhere, something incredible is waiting to be known - CS";
String q5 = "My goal is simple. It is a complete understanding of the universe, why it is as it is and why it exists at all - SH";
String q6 = "Not only does God play dice, but... he sometimes throws them where they cannot be seen - SH";
String q7 = "To confine our attention to terrestrial matters would be to limit the human spirit - SH";
String q8 = "We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special - SH";
*/

void setup() {
  size(600, 600);
  p1 = loadImage("p1.png");
  p2 = loadImage("p2.png");
  p3 = loadImage("p3.png");
  p4 = loadImage("p4.png");
  p5 = loadImage("p5.png");
  p6 = loadImage("p6.png");
  p7 = loadImage("p7.png");
  p8 = loadImage("p8.png");
  p9 = loadImage("p9.png");
  p10 = loadImage("p10.png");
  p11 = loadImage("p11.png");
  p12 = loadImage("p12.png");
  p13 = loadImage("p13.png");
  p14 = loadImage("p14.png");
  p15 = loadImage("p15.png");  
  frameRate(0.3);
  imageMode(CENTER);
 font1 = loadFont("235MKSDUltraLightAl-48.vlw");

}
  
void draw() {
  background(0);
 
    float x1 = random(width);
    float x2 = random(width);
  float x3 = random(width);
  float x4 = random(width);
  
 
  float x12 = random(width);
  float x13 = random(width);
  float x14 = random(width);
  float x15 = random(width);
 
  float y5 = random(height);  
  float y6 = random(height);  
  float y7 = random(height);  
  float y8= random(height);
 float y9 = random(height);  
  float y10 = random(height);  
  float y11 = random(height);  


  
  float d = random(50, 100);
  pushMatrix();
  image(p1, x1, 30, d, d);
  image(p2, x2, 30, d, d);
  image(p3, x3, 30, d, d);
  image(p4, x4, 30, d, d);
  image(p5, width-30, y5, d, d);
  image(p6, width-30, y6, d, d);
  image(p7, width-30, y7, d, d);
  image(p8, 30, y8, d, d);
  image(p9, 30, y9, d, d);
  image(p10, 30, y10, d, d);
  image(p11, 30, y11, d, d); 
    image(p12, x12, height-30, d, d); 
  image(p13, x13, height-30, d, d); 
  image(p14, x14, height-30, d, d); 
  image(p15, x15, height-30, d, d); 
popMatrix();

  for(int i=1; i<30;i++){
    //for(int j=1; j<30; j++){
         tint(255,100-i);
  PImage crop= get();
  image(crop, width/2, height/2, width-40*i, height-40*i);
    }
   pushMatrix ();
   

  /*
  text (fire, random (width), 330, 500, 300);
  text (sky, random (width), 350, 500, 300);
  text (water, random (width), 386, 500, 300);
  */
  
  

  String[] words = {   "The universe is not required to be in perfect harmony with human ambition -CS", "For small creatures such as we the vastness is bearable only through love -CS", "The universe seems neither benign nor hostile, merely indifferent -CS","Somewhere, something incredible is waiting to be known -CS","My goal is simple. It is a complete understanding of the universe, why it is as it is and why it exists at all -SH",
"Not only does God play dice, but... he sometimes throws them where they cannot be seen -SH", "To confine our attention to terrestrial matters would be to limit the human spirit -SH", "We are just an advanced breed of monkeys on a minor planet of a very average star. But we can understand the Universe. That makes us something very special -SH" };
int index = int(random(words.length));  // same as int(random(4))
println(words[index]);
  textFont (font1);
  fill(255);
  textSize(30);
   textAlign(CENTER);
  text (words[index], 75, height/2-50, 400, 600);
  popMatrix();  
  

  }
  

 





