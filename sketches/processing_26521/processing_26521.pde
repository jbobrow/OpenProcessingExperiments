


int x, y, px, py;
int xo,xf,yo,yf;
float c,d,ic,id;
void setup()

{ 
  x=0;
  y=0;
  px=x; // previos x e y
  py=y; 

  xo=0;
  xf=1;
  yo=0;
  yf=1;

  c= 0.1; //trasf
  d= 0.1;
  ic= 0.2;
  id= 0.2;

  size (192,157);
  background (0);
  smooth();
}


void draw()
{

  {  
    pushMatrix();
    translate(x,y);
    scale(c,d);


    fill(237,231,66);
    strokeWeight(1);
    smooth();
    ellipse(100, 70, 20, 90);


    fill(255);
    stroke(1);
    smooth();
    ellipse(50, 142, 60, 60);
  
  
    stroke(1);
    smooth();
    ellipse(120, 15, 60, 60);


    fill(237,231,66);
    strokeWeight(2);
    smooth();
    ellipse(200, 70, 20, 90);

    fill(255,255,255);
    stroke(1);
    ellipse(250, 142, 60, 60);
    smooth();
    
    fill(25,88,60);
    stroke(1);
    ellipse(180, 15, 60, 60);
    smooth();

    fill(25,88,60);
    stroke(0);
    smooth();
    ellipse(170, 80, 5, 10);

    fill(25,88,60);
    stroke(0);
    smooth();
    ellipse(170, 80, 5, 10);

    fill(25,88,60);
    stroke(0);
    smooth();
    ellipse(130, 80, 5, 10);

    fill(237,231,66);
    strokeWeight(2);
    smooth();
    ellipse(250, 150, 40, 40);


    fill (19* 255 /140,220,0);
    strokeWeight(0);
    ellipse(0, 0, 20, 20);
    
    
    fill(255);
    stroke(1);
    ellipse(180, 15, 60, 60);
    smooth();


    fill(0); // relleno del pelo negro
    stroke(1);
    ellipse(180, 15, 40, 40);
    smooth();


    fill(255); // relleno del pelo blanco little
    stroke(1);
    ellipse(180, 15, 20, 20);
    smooth();


    fill(0); // relleno del pelo right side
    stroke(1);
    ellipse(120, 15, 40, 40);
    smooth();


    fill(255); // relleno del pelo right blanco little
    stroke(1);
    ellipse(120, 15, 20, 20);
    smooth();


    fill(237,231,66);
    strokeWeight(2);
    smooth();
    ellipse(50, 150, 40, 40);

    fill(255);
    stroke(1);
    smooth();
    ellipse(150, 140, 35, 10);



    fill (9*255,0,0); // roja boca
    stroke(1);
    smooth();
    ellipse(150, 140, 25, 10);


    fill(255);
    stroke(1);
    smooth();
    ellipse(130, 80, 20, 10);

    fill(255);
    stroke(1);
    smooth();
    ellipse(125, 80, 20, 15);


    fill(255,255,255);
    stroke(1);
    smooth();
    ellipse(175, 80, 20, 15);


    fill(25,88,60);
    stroke(0);
    smooth();
    ellipse(125, 80, 10, 10);


    fill(25,88,60);
    stroke(0);
    smooth();
    ellipse(175, 80, 10, 10);


    fill(0);
    stroke(1);
    smooth();
    ellipse(50, 142, 25, 25);


    fill(0);
    stroke(1);
    smooth();
    ellipse(250, 142, 25, 25);



    //for( int b = 1; b < 10; b++)
    fill (9*255,0,0);
    stroke(2);
    rect(0, 0, 30, 30);



    x+=round(random(xo,xf));
    y+=round(random(yo,yf));


    if(x<0)
    {
      xo=0; 
      xf=1;
    }

    if (x>width)
    { 
      xo= -1; 
      xf=0;
    }


    if(y<0)
    {
      yo=0; 
      yf=1;
    }

    if (y> height)
    { 
      yo= -1; 
      yf=0;
      c+=ic;
      if ((c<0.5) || (c>2))
        ic=-ic;
      d+=id;
      if ((d<0.5) || (d>2))
        id=-id;
    }
    popMatrix();
  }
}


