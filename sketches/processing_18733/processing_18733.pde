
float X = 20;
float Y = 230;
float Xblue = 125;
float Yblue = 230;
float Xgreen = 230;
float Ygreen = 230;
float S = 20;

void setup () {
size(250,250);
background(0);
smooth();
stroke(255);
fill(255,0,0);
ellipse (X,Y,S,S);
fill(0,0,255);
ellipse(Xblue,Yblue,S,S);
fill(0,255,0);
ellipse(Xgreen,Ygreen,S,S);
}

void draw() {
  fill (255,0,0);
  ellipse(X++,Y--,20,20);
fill(0,0,255);
ellipse(Xblue,Yblue--,S,S);
fill(0,255,0);
ellipse(Xgreen--,Ygreen--,S,S);
 }



