
float x= -100;float y= 0;
void setup()
{
noStroke();
  size(200,200);
  noLoop();

}
void draw() {
 background(51);
 funcionCuadratica();
 }
 void funcionCuadratica() {
   x=x+1;
      if (x< 100) {
   y=(x*x)/50;
          }
          else{
          x=-100;
        }
     fill(245,22,22);  
   ellipse(x+100, y, 8, 8);

 }
 void mouseClicked() {
  loop();
}

void mousePressed () {
  noLoop();
}
