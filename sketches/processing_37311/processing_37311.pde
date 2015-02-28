
//Chinese Calligraphy Program
//Hold right click to draw
//Let go to draw nothing 


void setup()
{
  size (500,500);
  background (255,217,0);
}

void draw()
{
  if(mousePressed){
    strokeWeight(random(13));
  line(pmouseX,pmouseY,mouseX,mouseY);
  }
}


