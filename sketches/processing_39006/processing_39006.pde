
PImage b1, w1, b2, w2, b3, w3, b4, w4, b5, w5;
float dia;
float value1, value2, value3, value4, value5, value6, value7, value8, value9, value10;
float d, d2, d3, d4, d5, d6, d7, d8, d9, d10; 
boolean t =true, t2=true, t3=true, t4=true; 

void setup()

{
  noStroke();
  smooth();
    imageMode (CENTER);
  b1=loadImage ("1b.jpeg");
  w1=loadImage ("1w.jpeg");
  b2=loadImage ("2b.jpeg");
  w2=loadImage ("2w.jpeg");
  b3=loadImage ("3b.jpeg");
  w3=loadImage ("3w.jpeg");
  b4=loadImage ("4b.jpeg");
  w4=loadImage ("4w.jpeg");
  b5=loadImage ("5b.jpeg");
  w5=loadImage ("5w.jpeg");
  value4=255;
  value6=255;
  value8=255;
  value10=255;
  size (200, 540);
  dia=60;
}

void draw ()
{

  button1();
  button2();
  button3();
  button4();
  button5();
}

void button1()
{

  d= dist (50, 50, mouseX, mouseY);
  if ((d<=dia/2) & (mousePressed))
  {
    value1=255;
  }
  else
  {
    value1=0;
  }
  d2= dist (150, 50, mouseX, mouseY);

  if ((d2<=dia/2) & (mousePressed))
  {
    value2=0;
  }
  else
  {
    value2=255;
  }
  fill (value1);
  ellipse (50, 50, dia, dia);
  fill (value2);
  ellipse (150, 50, dia, dia);

  //symbols

  image (b1, 50, 50);
  image (w1, 150,50);
}

void button2()
{
  //mouse clicked
  fill (value3);
  ellipse (50, 150, dia, dia);

  fill (value4);
  ellipse (150, 150, dia, dia);
    //symbols

  image (b2, 50, 150);
  image (w2, 150,150);
  
}
void button3()
{
  //mouse released
  fill (value5);
  ellipse (50, 250, dia, dia);
  fill (value6);
  ellipse (150, 250, dia, dia);
      //symbols
  image (b3, 50, 250);
  image (w3, 150,250);
}
void button4()
{

  //mouse clicked perm
  fill (value7);
  ellipse (50, 350, dia, dia);
  fill (value8);
  ellipse (150, 350, dia, dia);
        //symbols
  image (b4, 50, 350);
  image (w4, 150,350);
}
void button5()
{
  //mouse released perm
  fill (value9);
  ellipse (50, 450, dia, dia);
  fill (value10);
  ellipse (150, 450, dia, dia);
          //symbols
  image (b5, 50, 450);
  image (w5, 150,450);
}
void mousePressed ()
{
  d3= dist (50, 150, mouseX, mouseY);
  if ((d3<=dia/2) && (t=t))
  {
    value3=255;
    t=!t;
  }
  else if ((d3<=dia/2) && (t=!t))
  {
    value3=0;
    t=t;
  }

  d4= dist (150, 150, mouseX, mouseY);
  if ((d4<=dia/2) && (t2=t2))
  {
    value4=0;
    t2=!t2;
  }
  else if ((d4<=dia/2) && (t2=!t2))
  {
    value4=255;
    t2=t2;
  }
  //for buttons 4
  d7= dist (50, 350, mouseX, mouseY);
  if (d7<=dia/2) 
  {
    value7=255;
  }
  d8= dist (150, 350, mouseX, mouseY);
  if (d8<=dia/2) 
  {
    value8=0;
  }
}

void mouseReleased ()
{
  d5= dist (50, 250, mouseX, mouseY);
  if ((d5<=dia/2) && (t3=t3))
  {
    value5=255;
    t3=!t3;
  }
  else if ((d5<=dia/2) && (t3=!t3))
  {
    value5=0;
    t3=t3;
  }
  d6= dist (150, 250, mouseX, mouseY);
  if ((d6<=dia/2) && (t4=t4))
  {
    value6=0;
    t4=!t4;
  }
  else if ((d6<=dia/2) && (t4=!t4))
  {
    value6=255;
    t4=t4;
  }
  //for button 5
  d9= dist (50, 450, mouseX, mouseY);
  if (d9<=dia/2) 
  {
    value9=255;
  }
  d10= dist (150, 450, mouseX, mouseY);
  if (d10<=dia/2) 
  {
    value10=0;
  }
}
          
                
