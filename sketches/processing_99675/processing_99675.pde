
//declaraciÛn de variables eje
int size = 30;
float xpos = 200;//elipse
float ypos = 0;
float x1pos = 200;
float y1pos = 0;

//variables de direcciÛn
int xdirection = 1;
int ydirection = 1;
int x1direction = 1;
int y1direction = 1;

//variables de velocidad
float xspeed = 1.7;
float yspeed = 2.6;
float x1speed = 3.4;
float y1speed = 4.9;
float r=1;

float radio=60;
int op=1;
//int cont=0;
float cont=0;
int cont2=0;
int op2=0;
int op3=0;


void setup()
{
  size (1000, 1000);
  //frameRate(27);//web fps
  frameRate(300);//web fps

  //posiciÛn inicial de las variables
  //xpos = mouseX;
  //ypos = mouseY;
  x1pos = x1pos;
  y1pos = y1pos;
  background(020, 100, 150);
}
void draw()
{
  
  if(op3==0)
  {
    background(020,100,150);
  }
  
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );  
  x1pos = x1pos +( x1speed * x1direction );
  y1pos = y1pos + ( y1speed * y1direction );

  //condicionales de regreso
  if (xpos > 800-radio/2 || xpos < 0+radio/2 )
  {
    xdirection *= -1;
  }
  if (ypos > 400 || ypos < 0)
  {
    ydirection *= -1;
  }
  if (x1pos > 800 || x1pos < 0)
  {
    x1direction*= -1;
  }
  if (y1pos > 400 || y1pos < 0)
  {
    y1direction *= -1;
  }

  //figuras
  //  rect(mouseX-size/2 ,mouseY-size/2,size,size);
  //  if ((xpos < 400)&&(xpos > 0))
  //    {
  //      xspeed = 10 ; //velocidad de este segmento
  //     // fill(0,0,0,100); //color de la figura en este segmento
  //      fill(random(150, 250),random(150, 250),random(150, 250),0);
  //    }

  //  ellipse(xpos,400,radio,radio);
  //  if ((x1pos < 133)&&(x1pos > 0))
  //    {
  //      x1speed = 0.5;
  //      fill(250,100,150,100);
  //    }
  //  if ((x1pos < 266) && (x1pos > 133))
  //    {
  //      x1speed = x1speed +2;
  //      fill(0,070,050,100);
  //    }
  //  if ((xpos > 266)&&(xpos < 400))
  //    {
  //      x1speed = x1speed +1;
  //      fill(280,0,100,100);
  //    }

    
    //xspeed = xspeed +10;
    //yspeed = yspeed +7;
    x1speed = x1speed+20;
    y1speed = y1speed+20;

    size=50;
    radio=random(2, 80);

    //background(250,250,250);

    pushMatrix();

    //translate(mouseX, mouseY);
    translate(width/2, height/2);
    rotate(radians(cont));
    rect(cont2, cont2, size, size);


    pushMatrix();

    translate(0, 0);
    rotate(radians(cont));
    ellipse(80, 80, size/2, size/2);
    //rect(0,0,size,size);

    popMatrix();

    popMatrix();




  

    if (cont2<=300 && op2==0)
    {
      cont2++;
      //cont2=50;
      if (cont2==300)
      {
        op2=1;
      }
    } 
    if (cont2>=0 && op2==1)
    {
      cont2--;
      if (cont2==0)
      {
        op2=0;
      }
    }
    
      cont=cont+r;

    fill(random(150, 200), random(150, 200), random(150, 200), 100);



  if (mousePressed) 
  {
    
   // r=random(0.1,50);
 
    op3=1;


    //      ellipse(xpos,400,60,60);
    //      if ((xpos < 800)&&(xpos > 0))
    //      {
    //        
    //        fill(random(0, 250),random(0, 250),random(0, 250),100); //color de la figura en este segmento
    //      }
  } 
  else
  {
    x1speed = x1speed;

op3=0;
    if (size<=100 && size >=5 && op==1)
    {
      size = size + 5;
      if (size==100)
      {
        op=2;
      }
    }
    if (size<=100 && size >=5 && op==2)
    {
      size = size - 5;
      if (size==5)
      {
        op=1;
      }
    }

    cont=0;
    cont2=0;
  }
}



