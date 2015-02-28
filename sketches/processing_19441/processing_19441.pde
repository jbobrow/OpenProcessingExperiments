
PFont font;
float x = 25;
float y = 25;
float x2 = 20;
float y2 = 20;
float x3 = 15;
float y3 = 15;
float sw = 0.5;
 
void setup(){
  size(250,250);
  smooth();
   font=loadFont("Baskerville-Bold-48.vlw");
  background(255);
  textFont(font);
}
 
void draw(){
  fill(7,41,10,20);
 rect(0,0,width,height);
 strokeWeight(1);
 ellipseMode (CENTER);
 ellipse (125,125,50,50);
 ellipse (125,125,150,150);
 ellipse (125,125,250,250);
 line(125,0,125,250);
 line(0,125,250,125);
 frameRate(80);
   
  noFill();
  strokeWeight(1.5);
  x += 15;
  y+=15;
  x2 += 10;
  y2+=10;
 x3 += 5;
  y3 = 5;
  
  noStroke();
  
 stroke(0,252,39,60);
  ellipse(pmouseX, pmouseY, x, y);
    
 stroke(0,252,39,60);
  ellipse(pmouseX, pmouseY, x2, x2);
  
  stroke(0,252,39,60);
  ellipse (pmouseX, pmouseY,x3,x3);
}

void mouseClicked(){
  x = 0;
  y = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
   
  sw += 5;
 PFont font;
  font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("M", 10, 70);


  font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("9", 120, 50);

font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("P", 210, 70);

font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("1",20,210);

font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("R", 110, 230);

font=loadFont("Baskerville-Bold-48.vlw");
textFont(font);
fill(0,252,39,120);
text("5", 210, 210);
}

