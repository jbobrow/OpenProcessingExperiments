
float r; //RGB AND ALPHA
float g;
float b;
float a;
float SR; //Size Rectangle
float RA; //First rotation
float rotation =.1;

float sizer;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  frameRate(22);
  smooth();  
  if ((keyPressed = true) && (key == '1')) //ELLIPSE BRUSH
  {
    noStroke();
    if (mousePressed)
    {
      r = random(250);
      g = random(250);
      b = random(250);
      a = random(250);
      fill(r, g, b, a);
      ellipse(mouseX, mouseY, 20, 20);
    }
  } //END ELLIPSE BRUSH

  if ((keyPressed = true) && (key == '2')) //BRUSH 2
  {
    noStroke();
    if (mousePressed)
    {
      r = 250;
      g = random(250);
      b = random(250);
      a = 30;
      for (int i = 0; i <100; i++)
      {
        SR = SR +.01;
        fill(r, g, b, a);
        rect(mouseX, mouseY, SR, SR);
        if (SR >= 100)
        {
          SR = 1;
        }
      }
    }
  } //END  BRUSH 2

  if ((keyPressed = true) && (key == '3')) //BRUSH 3
  {
    stroke(0);
    if (mousePressed)
    {
      r = 10;
      g = random(100);
      b = random(250);
      a = random(100);
      fill(r, g, b, a);
      stroke(random(255));
      line(250, 250, mouseX, mouseY);
      noStroke();
      ellipse(mouseX, mouseY, 30, 30);
    }
  }//brush 3 end

  if ((keyPressed = true) && (key == '4')) //BRUSH 4
  {
    if(mousePressed)
    {
      for(float x = 0; x<=500; x+=100)
      {
        for(float y= 6; y<=500; y+=100)
        {
          frameRate(100);
          r = 230;
          g = random(244);
          b = random(70);
          a= 5;
          stroke(r,g,b,a);
          line(x,y, mouseX,mouseY);
        }
      }
     }
   }//END BRUSH 4
   
   if ((keyPressed = true) && (key == '5')) //BRUSH 5
  {
    if(mousePressed)
    {
      for(float z = 0; z < 250; z+=400) //rate
      {
        r = random(220);
        g = random(30);
        b = random(240);
        a = 50;
        stroke(r,g,b, 65);
        noFill();
        ellipse(mouseX, mouseY, sizer,sizer);
        sizer = sizer + 6; // rate
        if(sizer >= 200)
        {
          sizer = 1;
        if(z>= 250)
        {
          z= 0;
        }
        
      }
     }
   }
 } //END BRUSH 5
 
 if ((keyPressed = true) && (key == '6'))
 {
   if(mousePressed)
   {
     translate(mouseX,mouseY);
     for(float j= 0; j < 100; j+=2) //creates multiple shapes
     {
     noStroke();
     fill(250, 210, 220, 15);
       ellipse(mouseX, mouseY, 15,15);
     fill(255, 15);
       ellipse(mouseX -20, mouseY-10, 5,5);
      stroke(30, 30, 20, 50);
       line(mouseX, mouseY, pmouseX-10, pmouseY-40);
       fill(50,50,254,5);
       stroke(100, 200, 250, 100);
      rect(mouseX-20,mouseY-50, 20,20);
       
       
      rotate(rotation);
      rotation+=.05;
      if(rotation >= 300)
      {
        rotation = 0;
      }
     }
   }
 }//end brush 6
 
  if ((keyPressed = true) && (key == '7')) //Erasure
  {
    fill(255);
    rect(-10,-10, 600,600);
  }
  
  
}


