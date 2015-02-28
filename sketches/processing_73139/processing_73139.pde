
//Abby Zhang mod 4,5 CP1
//http://abbyzhang.webs.com/

int x, y;
void setup()
{
  size(300,300);
}
void draw()
{
  stroke(0);
  fill(0,0,0,10);
  rect(0,0,300,300);
}  
void mouseDragged()
{
   stroke(15,250,60);
  line(mouseX,50-mouseY,50-pmouseX,pmouseY);
    stroke(15,67,250);
  line(mouseX,100-mouseY,100-pmouseX,pmouseY);
   stroke(255);
  line(mouseX,300-mouseY,300-pmouseX,pmouseY);
  stroke(226,15,250);
 line(mouseX,mouseY,20,20);
 stroke(159,15,250);
 ellipse(300-mouseX,mouseY,50,50);
 stroke(51,39,162);
 ellipse(mouseX,300-mouseY,50,50);
 y=y+20;
}
