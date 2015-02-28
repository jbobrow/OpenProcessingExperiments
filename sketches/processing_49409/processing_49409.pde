
//Angie Fu
//1.17.2012

size (500, 500);
smooth();

noFill();

for (int i = 10; i < width; i= i+5)

{
  stroke(255-i/2);
  ellipse(width/2, height/2, i, i);
}

