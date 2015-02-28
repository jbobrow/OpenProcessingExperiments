
void setup()

{

  size(300,300);

  

  faceDrawing(width/2,220);

  faceDrawing(70,70);

  faceDrawing(220,70);

}




void faceDrawing(int a, int b)

{

  fill(100,150,150);

  ellipse(a,b,100,100);

  arc(a-35,b-35,20,20,radians(128),radians(320));

  arc(a+35,b-35,20,20,radians(220),radians(410));

  fill(0);

  ellipse(a-20,b-20,10,10);

  ellipse(a+20,b-20,10,10);

  

  noFill();

  arc(a-10,b+5,10,10,PI,PI*2);

  arc(a+10,b+5,10,10,PI,PI*2);

  arc(a,b+15,40,40,0,PI);

  

}
