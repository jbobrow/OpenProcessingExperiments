
PFont font;

void setup(){
 font=loadFont("Bodoni-Bold-48.vlw");
 size(250, 250);
 smooth();
 textAlign(CENTER);
 frameRate(60);
 textFont(font);
  
}

void draw(){
 for(int x=0; x<width; x+=8)
 if(x%4==0){ //adds
 noStroke();
 fill(x);
 
 textSize(40);
 text("7", random(1, 250), x);
 
 fill(0, 2);
 
 textSize(120);
 float q = 90;
 float w = 45;
 text("m6h", q, 105+w);
 text("1e7", q, 215+w);
 
 fill(0, 2);
 
 textSize(40);
 float a = 220;
 float s = 20;
 
 text("m6h", a, 5+s);
 text("1e7", a, 35+s);
 
 }
}

