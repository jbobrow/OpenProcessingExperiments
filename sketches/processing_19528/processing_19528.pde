
PFont font;

void setup() {
  size(600,100);
  background(50);
  smooth();
  font = loadFont("SimplifiedArabicFixed-80.vlw");
  frameRate(10);
}

void draw() {
  float ran = dist(mouseX,mouseY,300,50);
  background(50);
  stroke(255);  
  fill(255,30);
  rect(10,10,580,80);
  textFont(font,40);
  fill(ran);
  float a= random(4)+78;  
  float b= random(4)+78;  
  float c= random(4)+78;  
  float d= random(4)+78;  
  float e= random(4)+78;  
  float f= random(4)+78;  
  float g= random(4)+78;  
  float h= random(4)+78;  
  float i= random(4)+78;  
  float j= random(4)+78;  
  float k= random(4)+78;
  float l= random(4)+78;
  text("C",20,a);
  text("h",44,b);
  text("l",60,c);
  text("o",80,d);
  text("e",100,e);
  text("B",140,f);
  text("l",160,g);
  text("a",180,h);
  text("n",200,i);
  text("c",220,j);
  text("h",240,k);
  text("a",260,l);
  text("r",280,a);
  text("d",300,b);
  text("'",315,c);
  text("s",330,d);
  text("P",370,e);
  text("r",390,f);
  text("o",410,g);
  text("j",430,h);
  text("e",450,i);
  text("c",470,j);
  text("t",490,k);
  text("1",520,l);
}


