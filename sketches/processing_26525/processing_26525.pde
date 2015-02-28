
void setup(){
  size(440,339);
  frameRate(10);
  background(#d1c0ac);
  PImage img;
  imageMode(CENTER);
  img = loadImage("lightball.png");
  image(img, height/2,width/2);
  
 //poem font
  fill(255,70);
  PFont font;
  font = loadFont("Renaissance-Regular-48.vlw");
  textFont(font, 32);
  text("All that is bright must fade,",35,75);
  fill(255,100);
  textFont(font, 40);
  text("The brightest", 90,125);
  fill(255,150);
  text("still the fleetest",220,155);
  
  //background texture font
   PFont font2;
  font2 = loadFont("Renaissance-Regular-100.vlw");
  textFont(font2, 100); 
  fill(255,40);
  text("All that is sweet was made", 0,220); 
  text("But to be lost when sweeteest.",-30,270);
  
  textFont (font2, 20);
  fill(255,200);
  text("Robert Bulwer-Lytton", 15,290);

}

void draw(){
  
  stroke(255,random(150));
  strokeWeight(0.5);
  smooth();
  line(height/2,width/2,mouseX,mouseY);

}


