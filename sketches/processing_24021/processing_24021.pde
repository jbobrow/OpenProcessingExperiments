
size(400,800);

PImage b;
b = loadImage("Gradient.png");
b.resize(width, height);
background(b);

smooth();
 
PFont font; 
 
 font=loadFont ("200.vlw");
textFont(font);
fill(256,256,256,random(80,180));
text("C", 0, random(height));

fill(256,256,256,random(80,180));
text("F", 0, random(height));

fill(256,256,256,random(80,180));
text("Y", 0, random(height));

fill(256,256,256,random(80,180));
text("D", 0, random(height));

 
font=loadFont ("45.vlw");
 
textFont(font);
fill(256,256,256,random(33,200));
text("C",random(width),random(height*0.9));
text("F",random(width),random(height*0.9));
text("F",random(width),random(height*0.9));
text("Y",random(width),random(height*0.9));
text("Y",random(width),random(height*0.9));
text("D",random(width),random(height*0.9));
text("D",random(width),random(height*0.9));

fill(240,255,240,100);
noStroke();
ellipse(width/2, height/2, width*1.5, height*0.75);

 
font=loadFont ("200.vlw");
textFont(font);
fill(0,random(120,130),random(180,190),random(180,256));
text("FYD", width*0.3, height*0.6);




