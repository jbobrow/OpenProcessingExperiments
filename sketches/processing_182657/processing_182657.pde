
size(400,700); background(21,163,235);
//sea
stroke(255);strokeWeight(3);

for(int i = 100; i <= 200; i += 25) 
{ for(int j = 400; j <= 590; j += 25) {
  line(i,j,i+200,j);
}
}
//triangles
noStroke();fill(21,163,235);
triangle(100,400,200,600,0,600);
triangle(300,400,200,600,600,600);
triangle(300,400,500,600,600,300);
//boat
fill(255);
triangle(200,410,170,390,230,390);
rect(160,390,40,20);
stroke(255);
line(190,400,190,360);
rect(190,360,20,10);
//sun
stroke(255,241,89);noFill();
for(int i = 0; i <= 200; i += 10)
{
ellipse(400,0,i,i);
}
