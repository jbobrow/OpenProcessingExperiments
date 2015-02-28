
void setup ()
{
  size (450, 450);
  background (100);
  frameRate (15);
  smooth();
}

//define variables
float val = 0;
float val2 = 0;
float val3 = 0;
float centX;
float centY;
float centX2;
float centY2;
float centX3;
float centY3;
float centX4;
float centY4;
float centX5;
float centY5;
float centX6;
float centY6;
float centX7;
float centY7;
float angle;
color c;

void draw ()
{
  centX = width/2;
  centY= height/2;
  c = 255;
  angle = 0;

  background (100);
  strokeWeight(3);
  translate (0, 0);
  rotate (angle);
  
  //center circle plus radiating lines
  line ( centX, centY, centX +val, centY +val);
  line ( centX, centY, centX -val, centY +val);
  line ( centX, centY, centX +val, centY -val);
  line ( centX, centY, centX -val, centY -val);
  fill (c);
  ellipse (centX, centY, 20, 20);


  if (mousePressed == true && val < 75)

  {
    val += 1;
  }

  else if (mousePressed == false && val >0 && val2 < 1)
  {
    val -= 25;
  }

  if ( val >0)
  {
    //c = color(255,0,0);         
    // unable to get a simple change of colour of the fill so I redrew an ellipse over the existing ellipse
    fill (color(255, 0, 0));
    ellipse (centX, centY, 20, 20);
  }

  

  if (val == 75)
  {

    centX2 =centX +val;
    centY2 =centY +val;
    centX3 =centX -val;
    centY3 =centY -val;

    fill (color(255, 0, 0)); 

    //bottom right
    line ( centX2, centY2, centX2 +val2, centY2 +val2);
    line ( centX2, centY2, centX2 -val2, centY2 +val2);
    line ( centX2, centY2, centX2 +val2, centY2 -val2);
    ellipse (centX2, centY2, 20, 20); 

    //bottom left
    line ( centX3, centY2, centX3 +val2, centY2 +val2);
    line ( centX3, centY2, centX3 -val2, centY2 +val2);
    line ( centX3, centY2, centX3 -val2, centY2 -val2);
    ellipse (centX3, centY2, 20, 20); 

    //top right
    line ( centX2, centY3, centX2 +val2, centY3 +val2);
    line ( centX2, centY3, centX2 +val2, centY3 -val2);
    line ( centX2, centY3, centX2 -val2, centY3 -val2);
    ellipse (centX2, centY3, 20, 20); 

    //top left
    line ( centX3, centY3, centX3 -val2, centY3 +val2);
    line ( centX3, centY3, centX3 +val2, centY3 -val2);
    line ( centX3, centY3, centX3 -val2, centY3 -val2);
    ellipse (centX3, centY3, 20, 20);

    if (mousePressed == true && val2 < 75)

    {
      val2 += 1;
    }

    else if (mousePressed == false && val2 >0 && val3 < 1)
    {
      val2 -= 25;
    }
  }

  if (val2 == 75)
  {

    centX4 =centX2 +val2;
    centY4 =centY2 +val2;
    centX5 =centX2 -val2;
    centY5 =centY2 -val2;

    centX6 = centX3 +val2;
    centY6 = centY3 +val2;
    centX7 = centX3 -val2;
    centY7 = centY3 -val2;   

    fill (color(255, 0, 0));


    line ( centX4, centY4, centX4 +val3, centY4 +val3);
    line ( centX4, centY4, centX4 -val3, centY4 +val3);
    line ( centX4, centY4, centX4 +val3, centY4 -val3);
    ellipse (centX4, centY4, 20, 20); 

    line ( centX5, centY4, centX5 +val3, centY4 +val3);
    line ( centX5, centY4, centX5 -val3, centY4 +val3);
    ellipse (centX5, centY4, 20, 20); 

    line ( centX4, centY5, centX4 +val3, centY5 +val3);
    line ( centX4, centY5, centX4 +val3, centY5 -val3);
    ellipse (centX4, centY5, 20, 20); 


    line ( centX7, centY7, centX7 -val3, centY7 +val3);
    line ( centX7, centY7, centX7 +val3, centY7 -val3);
    line ( centX7, centY7, centX7 -val3, centY7 -val3);
    ellipse (centX7, centY7, 20, 20);


    line ( centX7, centY6, centX7 -val3, centY6 +val3);
    line ( centX7, centY6, centX7 -val3, centY6 -val3);
    ellipse (centX7, centY6, 20, 20);

    line ( centX6, centY7, centX6 -val3, centY7 -val3);
    line ( centX6, centY7, centX6 +val3, centY7 -val3);
    ellipse (centX6, centY7, 20, 20); 


    line ( centX4, centY7, centX4 +val3, centY7 +val3);
    line ( centX4, centY7, centX4 +val3, centY7 -val3);
    line ( centX4, centY7, centX4 -val3, centY7 -val3);
    ellipse (centX4, centY7, 20, 20); 
    
    line ( centX7, centY4, centX7 +val3, centY4 +val3);
    line ( centX7, centY4, centX7 -val3, centY4 +val3);
    line ( centX7, centY4, centX7 -val3, centY4 -val3);
    ellipse (centX7, centY4, 20, 20); 

    if (mousePressed == true && val3 < 75)

    {
      val3 += 1;
    }

    else if (mousePressed == false && val3 > 0)
    {
      val3 -= 25;
    }
    
    if (mousePressed == true && val3 == 75)

    {
      angle +=1 ;
    }
  }
}


