
//Project 2
//Copyright Colleen Clifford Dec 2013, Pittsburgh, PA

int a, y, z;
float[] prismX = {100, 300, 500};

void setup()
{
  size (600, 600, P3D);
  frameRate(30);
}

void draw()
{
  background(0);
  title();
  showLights1();
  showLights2();
  showLights3();
  theEnd();
  prisms(prismX);
  
  
}

void theEnd()
{
  if( a==18)
  {
   ambientLight(255, 255, 255);
   textSize(40);
   text( "THE END", width/3, 150, 100); 
 }
}
void showLights3()
{
  if (a==11)
  {
    pointLight(255, 255, 255, 300, 300, 10);
    text( "point light: center, center, z = 10", 115, 500, 0);
    println("pointLight(255, 255, 255, 300, 300, 10)");
  }
  if (a==12)
  {
    pointLight(255, 255, 255, 300, 300, 100);
    text( "point light: center, center, z = 100", 115, 500, 0);
    println("pointLight(255, 255, 255, 300, 300, 100)");
  }
  if (a==13)
  {
    lightFalloff(2.0, .005, 0.0);
    pointLight(255, 255, 255, 300, 300, 100);
    text( "point light: same, with fallout", 150, 500, 0);
    println("lightFalloff(2.0, .005, 0.0)");
  }
  if (a==14)
  {
    lightFalloff(.8, .0001, 0.00001);
    pointLight(255, 0, 0, 20, 300, 10);
    text( "point light: red, left, center, center", 150, 500, 0);
    println("lightFalloff(.8, .0001, 0.00001)"+
            "pointLight(255, 0, 0, 20, 300, 10)");
  }
  if (a==15)
  {
    lightFalloff(.6, .0001, 0.00001);
    pointLight(0, 0, 255, 300, -50, 30);
    text( "point light: blue, center, top, front", 150, 500, 0);
    println("lightFalloff(.6, .0001, 0.00001)"+
            "pointLight(0, 0, 255, 300, -50, 30)");
  }
   if (a==16)
  {
    lightFalloff(.8, .0001, 0.00001);
    pointLight(0, 255, 0, 300, 700, 50);
    text( "point light: green, center, bottom, front", 150, 500, 0);
    println("lightFalloff(.8, .0001, 0.00001)"+
            "pointLight(0, 255, 0, 300, 700, 50)");
  }
  if (a==17)
  {
    lightFalloff(.4, .00001, 0.000001);
    pointLight(255, 255, 255, 300, 300, -150);
    text( "point light: center, center, back", 150, 500, 0);
    println("lightFalloff(.4, .0001, 0.00001)"+
            "pointLight(255, 255, 255, 300, 300, -150)");
  }
}

void showLights2()
{
  if (a==5)
  {
   directionalLight(255, 255, 255, -1, 0, 0);
   text( "directional light: right, middle, middle", 100, 500, 0);
   println("directionalLight(255, 255, 255, -1, 0, 0)");
  }
   if (a==6)
  {
   directionalLight(255, 255, 255, 0, 0, -1);
   text( "directional light: center, middle, front", 100, 500, 0);
   println("directionalLight(255, 255, 255, 0, 0, -1)");
  }
   if (a==7)
  {
   directionalLight(255, 255, 255, 1, 0, 0);
   text( "directional light: left, middle, middle", 100, 500, 0);
   println("directionalLight(255, 255, 255, 1, 0, 0)");
  }
    if (a==8)
  {
   directionalLight(255, 255, 255, 1, 0, 1);
   text( "directional light: left, middle, back", 100, 500, 0);
   println("directionalLight(255, 255, 255,  1, 1, 1)");
  }
   if (a==9)
  {
   directionalLight(255, 255, 255, 1, 0, 0);
   text( "directional light: left, middle, middle", 100, 500, 0);
   println("directionalLight(255, 255, 255,  1, 1, 0)");
  }
  if (a==10)
  {
   directionalLight(255, 255, 255, 1, 0, -1);
   text( "directional light: left, middle, front", 100, 500, 0);
   println("directionalLight(255, 255, 255,  1, 1, -1)");
  }
}

void showLights1()
{
  ambientLight(0, 0, 0);
  if (a==1)
  {
   ambientLight(255, 255, 255); 
   textSize(20);
   text( "ambient light", 250, 500, 0);
   println("ambientLight(255, 255, 255);");
  }
  if (a==2)
  {
   ambientLight(0, 0, 255); 
   text( "ambient light: blue", 200, 500, 0);
   println("ambientLight(0, 0, 255);");
  }
   if (a==3)
  {
   ambientLight(255, 0, 0); 
   text( "ambient light: red", 200, 500, 0);
   println("ambientLight(255, 0, 0);");
  }
   if (a==4)
  {
   ambientLight(0, 255, 0);
   text( "ambient light: green", 200, 500, 0);
   println("ambientLight(0, 255, 0);"); 
  }
}

void title()
{
  if( a==0)
  {
  textSize(24);
  text( "a slideshow of lights", width/3, 70, -5);
  textSize(30);
  text( "CLICK TO TURN THE LIGHTS ON", width/7, 150, -5);
  textSize (20);
  text( "just keep clicking right click takes you back", 100, 500, -5);
  text( "note that objects are white", 170, 540, -5);
  text( "check the console", 225, 580, -5);
  }
}

void prisms(float[] posX)
{
 for (int i =0; i< posX.length; i++)
  {
  y= 300;
  z= -5;
  pushMatrix();
  translate(posX[i], y, z);
  rotateY (radians (frameCount));
  box(80, 250, 80);
  popMatrix();
  }
}

void mouseClicked()
{
  a++;
  if (mouseButton ==RIGHT)
  {
    a= a-2 ;
  }
  println(a);
}



