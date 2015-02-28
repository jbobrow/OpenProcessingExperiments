
int noidea; 

void setup()
{
  background (0);
  size(400,400);
  noidea=6;
  noStroke();
  }
void draw()
{
  for(int y=0; y<width ; y+=noidea ){
  for(int x=0; x<height; x+=noidea ){
    fill(random(90,100),random(10,156),random(255), 250); 
  ellipse(x,y,noidea,noidea);
  }
}
  int a= mouseX - (mouseX % noidea);
  int b= mouseY - (mouseY % noidea);
  fill(0);
  ellipse (a,b,noidea,noidea);
}

