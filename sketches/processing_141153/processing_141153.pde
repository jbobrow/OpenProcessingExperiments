
void setup()
{
  size( 1300, 700 );
  background( 255, 255, 153);
  smooth();
  frameRate(60);
}
 
void draw()
{
  noStroke();
  fill(255,255,153,30);
  rect(0,0,1300,700);
  noFill();
  stroke(mouseX/7,0,mouseY/3);
  strokeWeight(5);
 bezier(0,100,mouseX-100,mouseY,mouseX+100,mouseY,1300,100);
 bezier(0,200,mouseX-100,mouseY,mouseX+100,mouseY,1300,200);
 bezier(0,300,mouseX-100,mouseY,mouseX+100,mouseY,1300,300);
 bezier(0,400,mouseX-100,mouseY,mouseX+100,mouseY,1300,400);
 bezier(0,500,mouseX-100,mouseY,mouseX+100,mouseY,1300,500);
 bezier(0,600,mouseX-100,mouseY,mouseX+100,mouseY,1300,600);
 bezier(0,0,mouseX,mouseY-100,mouseX,mouseY+100,50,700);
 bezier(200,0,mouseX,mouseY-100,mouseX,mouseY+100,250,700);
 bezier(400,0,mouseX,mouseY-100,mouseX,mouseY+100,450,700);
 bezier(600,0,mouseX,mouseY-100,mouseX,mouseY+100,650,700);
 bezier(800,0,mouseX,mouseY-100,mouseX,mouseY+100,850,700);
 bezier(1050,0,mouseX,mouseY-100,mouseX,mouseY+100,1050,700);
 bezier(1250,0,mouseX,mouseY-100,mouseX,mouseY+100,1250,700);
 noStroke();

}
