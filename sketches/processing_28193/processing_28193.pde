
int gross=25;
int klein=15;
float a=0;
float inc=TWO_PI/10;

void setup()
{
  size(500,500);
  background(255);
  smooth();
}

void draw()
{
  background(255);
  randomSeed(mouseX);
  for(int i=50;i<=(width-50);i=i+50)
   {
     for(int j=50;j<=(height-50);j=j+50)
     {
       stroke(random(0,255));
       ellipse(i+sin(a),j,gross,gross);
       
      noStroke();
      fill(random(0,255),random(0,255),random(0,255));
      ellipse(i+sin(a),j,klein,klein);
      noFill();
      a=a+inc; //inc Zahl wird erhöt
      
     }
    }
  
}

