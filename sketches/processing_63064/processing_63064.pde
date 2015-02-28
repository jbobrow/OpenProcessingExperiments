
size(400,400);
background(235);
smooth();

noFill();
strokeWeight(.25);

for (int i = 10; i <width; i=i+15)
{
    quad(i, i+5, i+10, i+15, i+5, i+5, i-5, i-5);
    quad(i+15, i+5, i+25, i+15, i+20, i+5, i+10, i-5);
    quad(i-15, i+5, i-5, i+15, i-10, i+5, i-20, i-5);
  }

fill(96, 250, 205, 5);
noStroke();

for(int i = 10; i<width; i=i+15)
{
  ellipse(width/2, height/2, i, i);
}



