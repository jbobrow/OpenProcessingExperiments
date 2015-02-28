
void setup()
{
    size(300,200);
    smooth();
    noFill();
    strokeWeight(5);
    background(255);
    }
    
void draw()
{
    background(255);
    stroke(0,0,255);
    //Azul
    ellipse(100,90,70,70);
    stroke(255,255,0);
    //Amarillo
    ellipse(130,140,70,70);
    stroke(0);
    //Negro
    ellipse(160,90,70,70);
    stroke(0,255,0);
    //Verde
    ellipse(190,140,70,70);
        
    int i,j;
    //ramdom sobre x
    i=int (random(300));
    //ramdom sobre y    
    j=int (random(200));
    if((i!=220) && (j!=90))
    {
      stroke(255,0,0);//Rojo
      ellipse(i,j,70,70);
      }
      else
      {
        stroke(250,0,0);//Rojo
        ellipse(220,90,70,70);
        noLoop();
      }
  }


