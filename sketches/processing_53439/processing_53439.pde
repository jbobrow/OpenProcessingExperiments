
float d;
float x,y;
int threshold;
int prevMillis=0;

void setup()
{
  size(500, 500);
  smooth();
  threshold = 200;
}

void draw()
{
  background(255);
  noStroke();
  


  d = dist(width/2, height/2, mouseX, mouseY);

  translate(width/2, height/2);
 

  if (d<=10)
  {
    beginShape();
    for (int i=0;i<360;i+=10) {


      y = sin(radians(i))*10;//other than circle, ref to math equations!!
      x = cos(radians(i))*10;
      fill(255, 0, 0);
      //ellipse(x,y,30,30);
      x+=random(-4, 4);
      y+=random(-4, 4);
      vertex(x, y);
  
    }
    endShape();
   
  }
  else if ((d>10) && (d<=30))
  {
      beginShape();
      for (int i=0;i<360;i+=20) {


        y = sin(radians(i))*10;//other than circle, ref to math equations!!
        x = cos(radians(i))*10;
        fill(255, 0, 0);
        //ellipse(x,y,30,30);
        x+=random(-3, 3);
        y+=random(-3, 3);
        vertex(x, y);
      }
      endShape();
    }
    else if ((d>30) && (d<=100))
    {
      
      beginShape();
      for (int i=0;i<360;i+=30) {


        y = sin (radians(i))*10;//other than circle, ref to math equations!!
        x = cos (radians(i))*10;
        fill(255, 0, 0);
        //ellipse(x,y,30,30);
        x+=random(-2, 2);
        y+=random(-2, 2);
        vertex(x, y);
      }
      endShape();
    }
    else if ((d>100) && (d<=180))
    {
      
      beginShape();
      for (int i=0;i<360;i+=40) {


       y = sin (radians(i))*10;//other than circle, ref to math equations!!
        x = cos (radians(i))*10;
        fill(255, 0, 0);
        //ellipse(x,y,30,30);
        x+=random(-1, 1);
        y+=random(-1, 1);
        vertex(x, y);
      }
      endShape();
    }
     
else
    {
        //other than circle, ref to math equations!!
        x = 0;
        y = 0;

        
        fill(255, 0, 0);
        ellipse(x,y,20,20);

       
      }
      
    

  }


