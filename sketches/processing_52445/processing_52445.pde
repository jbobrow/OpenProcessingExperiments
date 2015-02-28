
void setup()
{
size(600,600);
background (255);
colorMode(HSB);


arc (30,42,10, 20, 30, PI/2);
fill(1,2,100);

for (int i= 0; i < width; i+=125){
  if(i%5==0);
  color c1 = color(204, 153, 0);
  color c2 = #FFCC00;
  noStroke();
  fill(c1);
  rect(i, 0, 25, 100);
  rect (i,600,25,100);
  fill(c2);
  rect(i+25, 0, 25, 100);
  rect(i+25, 600, 25, 100);
  color c3 = get(10, 50);
  fill(c3);
  rect(i*50, 0, 50, 100);
  rect(i/50, 600, 50, 100);
}

}

void draw()
{
    rect(random(0,600),random(0,600),random(10,30),random(10,30));
    fill(random(299-90));
    rect(random(0,600),random(0,600),random(10,30),random(10,30));

  for (int i= 0; i < width; i+=125){
  if(i%5==0);
  color c1 = color(204, 153, 0);
  color c2 = #FFCC00;
  noStroke();
  fill(c1);
  rect(i, 0, 25, 100);
  rect (i,600,25,100);
  fill(c2);
  rect(i+25, 0, 25, 100);
  rect(i+25, 600, 25, 100);
  color c3 = get(10, 50);
  fill(c3);
  rect(i*50, 0, 50, 100);
  rect(i/50, 600, 50, 100);
}
}


