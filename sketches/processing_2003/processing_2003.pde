
/**
 * Magic Snail
 * Based in "StoryingInput" sketch from the examples
 *
 * (cc) Alejandro Zahler, 2009
 */
 
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];

void setup() 
{
  size(400, 400);
  smooth();
  noStroke();
  fill(255, 153); 

}

void draw() 
{
  background(0);  //51
  
  // Reads throught the entire array
  // and shifts the values to the left
  for(int i=1; i<num; i++) {
    mx[i-1] = mx[i];
    my[i-1] = my[i];
  } 
  // Add the new values to the end of the array
  mx[num-1] = mouseX;
  my[num-1] = mouseY;

  for(int i=0; i<num; i++) {

    float inc = TWO_PI*0.05;    // periodity of circles' path. Period = 20

   float factorX =(num-i)+(mx[num-1]/width)*20;  // 80 max
   
   float factorY =(num-i)+(my[num-1]/height)*20;  // 80 max
  
  // The x and y positions, plus the sinusoidal deviation.
  //***
  // The sinusoidal element decreases as i increases. In this way
  // the path of the circles converge.
   float ellipseX=mx[i]+factorX*sin(inc*i); // +/-80 + [0 to width]
   float ellipseY=my[i]+factorY*cos(inc*i); // +/-80 + [0 to height]
   
   // The R and G channels depend on the position of the circle
   // (including the sinusoidal component).
   // Also, it is influenced by random elemnent that give an idea of movement.
   // The range of each of these n is [0..255] +/- 20
   int colorR= int(ellipseX/(width+70)*255 + random(-20, 20));
   int colorG= int(ellipseY/(height+70)*255 + random(-20, 20));
   
   // The color for B channel is just a combination of R and G
   // channels.
   
   fill(colorR, colorG, (ellipseX+ellipseY)*0.5+100+random(-20, 20), 153);
    ellipse(ellipseX, ellipseY, i/2, i/2);
   
  }

}

