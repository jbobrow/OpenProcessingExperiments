
//Roberta
//Reforço 4
size(200, 200);
background(255, 50, 90);

smooth();
noStroke();
for (int i= 50; i<160; i+=25)
  for (int j= 50; j<200; j+=25)
  {
    ellipse(i, 60, 40, 40);
    fill(0, 255, 0, 160-i*i/120);
  }

for (int a= -100; a<180; a+=15)
{
  ellipse(100+a, 100+a*a/100, 5, 5);
  fill(0, 255, 0);
}
