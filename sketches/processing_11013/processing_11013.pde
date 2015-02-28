
import processing.opengl.*;



particleHafiz pH[];

void setup()
{
  size(600,600,OPENGL);
  //noCursor();
  fill(255,0,0,50);
  smooth();
  pH=new particleHafiz[10*100];

  for(int i=0; i<pH.length; i++)
  {
    float val = random(10);
    
    if(val < 5)
    {
      pH[i]=new subP(i/5000.0,450,0,250);

    }

    else
    {
      stroke(255,0,255,50);
      pH[i]=new particleHafiz(i/5000.0,450,450);
    }
  }
}

void draw()
{
  fill(0,3);
  noStroke();
  rect(0,0,width,height);



  for(int i=0; i<pH.length; i++) 
  {
    pH[i].calculation();
    pH[i].update();
    pH[i].display();
    
  }


}







