
size(400,400);
background(255);

float x,y,dia;

smooth();
noStroke();
for(int i=0; i < 25; i++){ 
  fill(0,230,255,100);
  x = random(width);
  y = random(height);
  dia = random(10,80);
  ellipse(x,y,dia,dia);
  fill(255);
  ellipse(x+dia*0.2,y-dia*0.2,dia*0.2,dia*0.2);
}

