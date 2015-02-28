
//first work I did from scratch (despite being uploaded later)
//lots of "magic numbers" because it was mostly just testing stuff, and thus specific numbers weren't that important.

int width = 800;
int height = 600;

int redxpos = (width/2)+(width/8);
int redypos = (height - 350);
int redwid = 125;
int redheight = 250;
boolean redOver = false;
float r = 60;
float g = 60;
float b = 60;
color redc = color (r+80, g, b);


void setup() {
  colorMode(RGB,800);
  size (width,height);
  background(#000000);
  noStroke();
  noCursor();  
    fill(#FAF597);
    rect((width/2)-(width/32),0,width/8,height);
    //redc
    fill(redc);
    rect(redxpos,redypos,redwid,redheight);
    fill(#204B08);
    ellipse(width-50,height-150,150,300);

}
void draw() {
  {if (mouseX > redxpos && mouseX < redxpos+redwid && mouseY > redypos && mouseY < redypos+redheight) 
  {r=r+5; g-=2; b+=2; fill(r,g,b); rect(redxpos,redypos,redwid,redheight); resetcolor();}
  else {fill(redc); rect(redxpos,redypos,redwid,redheight); r=15;}}
  {stroke(255);fill(255);
  point (mouseX,mouseY);}
}

void resetcolor() {
  if (r+g+b > 900)
    {r = 15;
     g = 15;
     b = 15;}
    else {r=r; g=g; b=b;}
}




