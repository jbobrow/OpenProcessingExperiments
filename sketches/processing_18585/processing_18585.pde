
float x=250;
float y=0;
float b=255;
void setup(){
  size(250,250);
  background(250);
  smooth();
  noStroke();
    fill(#9E5ED3,3);
}
void draw(){

  ellipse(x,x,25,25);
    ellipse(x,x,65,125);
        ellipse(x,x,125,65);
         ellipse(x,y,25,25);
    ellipse(x,y,65,125);
        ellipse(x,y,125,65);
     
    rect(y,y,60,25);
        rect(y,y,25,60);
               
                                rect(y,x,60,-25);
                                        rect(y,x,25,-60);

}
void mouseReleased(){
  x-=25;
  y+=20;
  b-=20;
}

