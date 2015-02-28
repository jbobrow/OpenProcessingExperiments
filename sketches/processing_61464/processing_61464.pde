
PFont a;
PFont b;
float ab=mouseX;
void setup()
{
  frameRate(14);
  size(400,400);
  background(#ffffff);
  
}
  
 void draw()

{
   background(#ffffff);
   
   if(mousePressed){
 fill(random(255),random(255),random(255));
  a=loadFont("FuturaLT-Book-48.vlw");
  textFont(a);
  
  rotate(ab);
  ab=ab+0.1;

  
text ("Gonz ",random(400),random(400));



fill(random(255),random(255),random(255));
  a=loadFont("FuturaLT-Book-48.vlw");
  textFont(a);
text ("MR",random(400),random(400));
   }

}

