
//Eugene Liang, Doubling Shapes, CP1, Mods 16-17


void setup()
{
  size (600,600,P3D);
  frameRate(0.5);
  lights();
}

int change = 1;
int i = 2;

void draw()
{
  background(int(random(255)),int(random(255)),int(random(255)));
  int s = int(random(10,30));
  
  while(i <= change)
  {
    pushMatrix();
    fill(int(random(255)),int(random(255)),int(random(255)));
    ellipse(int(random(600)),int(random(600)),s,s);
    translate(int(random(600)),int(random(600)),int(random(-200,10)));
    box(int(random(27,40)));
    translate(int(random(-600)),int(random(-600)),int(random(200,-10)));
    popMatrix();
    i++;
}
  
  if (i > change)
  {
    change = change*2;
  }
  
  if (i >= 1024)
  {
    change = 1;
    i = 2;
    
  }
  fill(255,0,0);
  textSize(30);
  print(change/2 +" ");
  text(change/2, 50, 50);
  
  if (change/2 <= 1)
  {
    background(int(random(255)),int(random(255)),int(random(255)));
  }
}
