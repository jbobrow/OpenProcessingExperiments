
float x = 8;
float y = 2;
float SPa =5;
float SPb =10;
void setup () {
size(500,500);
noStroke();
}
void draw (){
fill(250,250,250);

  fill(0);
  ellipse(250,250,x,y);
   x=x+SPa;
  y=y+SPb;
}

