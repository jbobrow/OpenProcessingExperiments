
//Ken Rivera
//Accidently delted the other project

int c;
void setup()
{
 size(1000,500);
 c = 35;
 noStroke();
 smooth();
}
void draw() 
{
  ellipse(mouseX,mouseY,100,100);
  for(int y=0; y<height; y+=c){
  for(int x=0; x<width; x+=c){
 fill(random(166),random(163),random(216),20);
 ellipse(x,y,c,c);
  }
  }


}

