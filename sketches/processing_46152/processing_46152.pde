
PImage treebark;
PImage treebark2;

void setup(){
  size(900,900);
  treebark = loadImage("Tree Bark 1.jpg");
  treebark2 = loadImage("Tree Bark 2.jpg");
  noStroke();
}

void draw(){
  tint(random(0,255),random(0,155),20,random(30,50));
  image(treebark,mouseY,mouseX,random(0,200),random(0,500));
  tint(random(0,255),100,210,80);
  image(treebark2,mouseX,mouseY,random(0,300),random(0,700));
  fill(200,15,random(0,160),random(0,50));
  ellipse(random(0,900),random(0,400),random(30,300),random(60,560));
  
}

