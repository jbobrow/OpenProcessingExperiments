
PImage face;
void setup(){
 size(200,200);
 face = loadImage("face.gif");
}

void draw(){
 background(255);
 for( int a=0; a<360; a=a+10 ) {
   float x = 100+sin(radians(a))*(80-a*0.1);
   float y = 100+cos(radians(a))*(80-a*0.1);
   pushMatrix();
   translate(x,y);
   image(face,-10,-10);
   popMatrix();
 }
}



