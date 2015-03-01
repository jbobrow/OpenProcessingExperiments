
/*kjm 
*Future Learn Monash Creative Coding
*Week 3 array of ellipses starting in a random positiom
*Moving in a random direction
*Reversing direction at edge of screen
*Drawing a line between centre points if overlapping. White or black if evnen or odd
*/

float[] xEllipse; //x position of ellipse
float[] yEllipse; // y position of ellipse
float rad; //radius of ellipse
float[] dxEllipse; // small change in x
float[] dyEllipse; // small change in y 
float speedx; // speed of circles not used
float speedy; // not used
float proximity; // if distance between two ellipses < proximity do something



int numArray;


void setup() {
  size (500, 500);
  
  numArray = 15; //100;
  
  xEllipse = new float[numArray]; // x position of ellipse
  yEllipse = new float[numArray]; // y position of ellipse
  rad = random(30,100);
  dxEllipse = new float[numArray];
  dyEllipse = new float[numArray];
  
  proximity = rad; // white line if circles overlap. 

    
  for (int i = 0; i<numArray; i++) {
    
    xEllipse[i] = random(10, (width-10));
    yEllipse[i] = random(10, (height-10));
    dxEllipse[i] = random (-1,1);
    dyEllipse[i] = random (-1,1);
    
   frameRate (20);   
  }
  
}

void draw () {
  background (#36076A); //(#501DCB);
  
  
  for (int i =0; i<numArray; i++) {
    xEllipse[i] += dxEllipse[i];
    yEllipse[i] += dyEllipse[i];


// bounce off the sides of the window
    if (xEllipse[i] > width  || xEllipse[i] < 0 ) {
      dxEllipse[i] = dxEllipse[i] > 0 ? -random(1) : random(1);
    }

    if (yEllipse[i] > height || yEllipse[i] < 0 ) {
      dyEllipse[i] = dyEllipse[i] > 0 ? -random(1) : random(1);
    }    
    
    stroke(255); // white outline to ellipses
    fill (random(255),random(255),random(255),80); // inside this loop each ellipse a different colour
   
    ellipse(xEllipse[i],yEllipse[i], rad,rad); // draw ellipse random size and position
  } 
    // draw line between midpoint of ellipses
    for (int i=0; i<numArray; i++) {
      for (int j=0; j<i; j++) {
        float dist = dist(xEllipse[i], yEllipse[i], xEllipse[j], yEllipse[j]);
        if (dist < proximity) {
          if (i%2 == 0 || j%2==0) {
            stroke(255,255,255, 90); // white line if even opacity 90
          } 
          else {
            stroke(0,0,0,90); // black line if odd opacity 90
          }
          line(xEllipse[i], yEllipse[i], xEllipse[j], yEllipse[j]  );
        }
      } 
  
   } 

}
