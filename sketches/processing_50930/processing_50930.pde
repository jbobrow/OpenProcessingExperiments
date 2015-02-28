
size(500,500);



background(#708090);
fill(0,12);
stroke(50,100);


for(int i=+10; i<width; i+=8) // "local"
{
  for(int j=+10; j<height; j+=7)
{
float r = random(40);
rotate(QUARTER_PI/PI);
smooth();
noFill();
strokeWeight(1);
stroke(0,255,0);
rect(i,j, 2, r);
fill(0,200);
r=random(2);
rotate(90);
rect(j,i, 2,10);




 }
}



