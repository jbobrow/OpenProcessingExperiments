

//==========================================================
// sketch: PG_PrimeSpiral.pde - by Gerd Platl
//
// Draw fermat's spiral with colorized points.
// Prime number will be highlighted.
//
// Tested with processing v1.5.1.
//
// v1.0  2012-05-14  inital release
//==========================================================
/*
links:
  http://en.wikipedia.org/wiki/Fermat's_spiral
  http://maxwelldemon.com/2012/03/18/prime-phyllotaxis-spirals/
  http://www.openprocessing.org/sketch/47647
  http://www.openprocessing.org/sketch/48677
  
tags: 
  spiral, prime numbers, prime spiral, fermat, phyllotaxis

mouse input:
  press left mouse button to change angle
  press right mouse button to zoom in/out

key commands:
  r  reset parameter
  s  save picture file as 'PrimeSpiral.png'
 +/-  change point size
*/

int maxPoint = 10000;                  // number of spiral points
color colorNP = color(255,222,222);    // white: number is a prime number
color colorN2 = color(222,55,55,64);   //   red: number can be divided by 2
color colorN5 = color(55,255,55,64);   // green: number can be divided by 5

float gr = radians(180*(3-sqrt(5)));   // golden angle = 137.50774°
float angle = gr;                      // one step rotation angle
float dotSize = 5.0;
float scaleFactor = 3.8; 
// prime data
boolean[] isAPrimeNumber = new boolean[maxPoint];
int[] primeFactor = new int[maxPoint];

//----------------------------------------------------------
void setup() 
{
  size(600, 600);
  smooth();
  background(0);
  println ("--- PG_PrimeSpiral ---");
  createPrimeData();
}

//----------------------------------------------------------
void draw() 
{
  background(0,2);
  pushMatrix();
  translate (width/2, height/2);
  int currentN = 0;
  float dist = 9999;
  float minDist = 9999;
  float radius = 0.0;
  for (int n=0; n<maxPoint; n++)
  {
    if (isAPrimeNumber[n])
      stroke(colorNP);
    else 
    {
      stroke(255,255,0, 64+int(mouseX*0.001*primeFactor[n]));
      if (primeFactor[n] == 0) stroke(colorN2);
      if (primeFactor[n] == 1) stroke(colorN5);
    }

    // radius = 0.038*n;     // linear scaling  
    radius = scaleFactor*sqrt(n+1);
    strokeWeight(dotSize + radius*0.005);
    float x1 = radius * cos(angle*n); 
    float y1 = radius * sin(angle*n); 

    point (x1,y1);   // draw spiral point

    // get nearest point number
    if (sq(x1 - mouseX+height*0.5) < 9)
    {
      float yd = sq (y1 - mouseY+width*0.5);
      if (yd < 9)
      { 
        dist = sq(x1 - mouseX+height*0.5) + yd;
        if (dist < minDist)
        {
          minDist = dist;
          currentN = n;
          //text (n,x1+3,y1-3);
        }
      }
    }
  }
  popMatrix();
  text (nf(degrees(angle),0,5)+"°", 20,20);
  if (currentN > 0) text ("n="+currentN, 20,40);
  if (mousePressed)
  { if (mouseButton == LEFT)
      angle += (mouseY-pmouseY)*0.00001;
    else 
    { scaleFactor -= (mouseY-pmouseY)*0.01;
      if (scaleFactor < 0.1) scaleFactor = 0.1;
    }
  }
}

//----------------------------------------------------------
// calculate prime data arrays
//----------------------------------------------------------
void createPrimeData()
{
  for (int n=0; n<maxPoint; n++)
  {
    isAPrimeNumber[n] = isAPrimeNumber(n);
    primeFactor[n] = getPrimeFactor(n);
    //if (n < 16)
    //println (n+": f="+primeFactor[n] +"  "+isAPrimeNumber[n]);
  }
}

//----------------------------------------------------------
// return true if number is a prime number
//----------------------------------------------------------
boolean isAPrimeNumber(int number)
{
  if ((number != 2) && (number % 2 == 0)) return false;
  if ((number != 5) && (number % 5 == 0)) return false;
  int factor = 2;
  while ((factor + 1) <= sqrt(number))
  { if (number % factor == 0) return false;
    factor++;
  }
  return true;
}

//----------------------------------------------------------
// return number of steps to find prime number
//----------------------------------------------------------
int getPrimeFactor(int number)
{
  if ((number != 2) && (number % 2 == 0)) return 0;
  if ((number != 5) && (number % 5 == 0)) return 1;
  int factor = 2;
  while ((factor + 1) <= sqrt(number))
  { if (number % factor == 0) return factor;
    factor++;
  }
  return factor;
}

//-----------------------------------
void keyPressed()
{
  if (key == '+') dotSize += 0.1;
  else if (key == '-') dotSize = constrain (dotSize-0.1, 1.0, 22);
  else if (key == 'r') { angle = gr; scaleFactor = 3.8; }  // reset parameter
  else if (key == 's') save("PrimeSpiral.png");            // save picture file
}


