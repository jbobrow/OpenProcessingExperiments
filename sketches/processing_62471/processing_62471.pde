
boolean myswitch=false;
float gray=0;
void setup(){
size(400,400, P3D);
noStroke();
smooth();
sphereDetail(100);
}
void draw(){
  float x=mouseX;
  float y=mouseY;
  float ix=width-mouseX;
  float iy=height-mouseY;
background(gray+100, gray+150, gray+70);
noStroke();
  pushMatrix();
  stroke(#5096AB);
  strokeWeight(1);
  fill(#FFFFFF);
  translate(200,200, 200);
  sphere(50);
  popMatrix();
  strokeWeight(15);
  stroke(#524300);
  line(200, 400, 200, 300);
  fill(#524300);
  ellipse(200, 300, 50, 100);
{
for (int i=100;i<=100;i=i+100)
{
fill(#8F999C);
 stroke(#495052);
ellipse(mouseX+i,mouseY, 10, 300);
ellipse(mouseX,mouseY+120, 200, 50);

}
}
if (myswitch==true)
{

    for (int l=1; l < 400; l=l+5) {  
    int mX = mouseX;
    int mY = mouseY;
    if (mX < 200)
    {
    fill(#00FF3C); 
    textSize(60);
    text("BAD SHOT... ", 0, 50); 
    stroke(#000000);
    fill(#FF0505);
    ellipse(75, 100, 25, 25); 
    ellipse(50, 100, 25, 25);
    strokeWeight(5);
    line(50, 150, 75, 150); 
    }
    else
    {
    fill(#00FFFF);
    textSize(60);
    text("HOLE IN ONE!", 0, 50); 
    fill(#403B3D); 
    ellipse(200, 350, 300, 100);
   }
}
}
}
void mousePressed(){
myswitch=true;

}

void mouseReleased(){
myswitch=false;

}




