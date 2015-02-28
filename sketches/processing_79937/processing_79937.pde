
// draws points around a circle


// Global variables
float r1 = 200;      // Radius of first circle
float r2 = 220;      // Radius of second circle

// determines the randomness
float diff = (r2 - r1)/4;

int numPoints = 15;   // Number of points on the circle

//float angle=TWO_PI/(float)numPoints; // Calculate the angle seperating each point

float angle = 0;

float[][] xyArray_inner;   // Declare an array
float[][] xyArray_outer;   // Declare an array


void setup(){

  background(255);
  size(600,600); // Window height
  smooth();
  
}

void draw(){     
  
  fill(255,255);
  rect(0,0,width,height);

 // CREATE A LIST OF x & y CO-ORDINATES
  xyArray_inner = new float [numPoints][2]; // Setup the array dimensions
  xyArray_outer = new float [numPoints][2]; // Setup the array dimensions

//    angle = angle * random(1.0,1.005);
    angle = angle + 0.01;
    println(angle);
  
  
  // for each point on the circle
  for(int i=0;i<numPoints;i++) { 
    
   
    // calculate the X&Y co-ordinates
    float x = r1*sin(angle*i)+width/2 + random(-diff,diff);
    float y = r1*cos(angle*i)+height/2 + random(-diff,diff);

    float x2 = r2*sin(angle*i)+width/2 + random(-diff,diff);;
    float y2 = r2*cos(angle*i)+height/2 + random(-diff,diff);;

    xyArray_inner[i][0] = x; // Store the x co-ordinate in the array
    xyArray_inner[i][1] = y; // Store the y co-ordinate

    xyArray_outer[i][0] = x2; // Store the x co-ordinate in the array
    xyArray_outer[i][1] = y2; // Store the y co-ordinate
    
    // print the xy co-ordinates
    //println(x + "  " + y);
    
    //line(width/2,height/2,x,y);
  /*  float f = (i*255/numPoints);
   // println(f);
    stroke(f);*/
    
    stroke(0);
    strokeWeight(2);
    
    // connect inside and outside vertices
    line(x,y,x2,y2);
    
    fill(0);
    ellipse(x,y,5,5);
    ellipse(x2,y2,5,5);
    
   // 0point(x,y);
   
  }
  
  //stroke(150);
  // connect points around circle with lines
  for (int i=0;i<numPoints-1;i++){
   
    /*float f = (i*255/numPoints);
    println(f);
    stroke(f);*/
    stroke(0);
    
   // inner circle 
   
   float x1 = xyArray_inner[i][0];
   float y1 = xyArray_inner[i][1];

   float x0 = xyArray_inner[i+1][0];
   float y0 = xyArray_inner[i+1][1];

   line(x0,y0,x1,y1);
  
   // outer circle

   float x1o = xyArray_outer[i][0];
   float y1o = xyArray_outer[i][1];

   float x0o = xyArray_outer[i+1][0];
   float y0o = xyArray_outer[i+1][1];
   
   line(x0o,y0o,x1o,y1o);

  }

/*   // connect first and last
 
   float x1 = xyArray_inner[0][0];
   float y1 = xyArray_inner[0][1];

   float x0 = xyArray_inner[numPoints-1][0];
   float y0 = xyArray_inner[numPoints-1][1];

   line(x0,y0,x1,y1);
  

   // connect first and last
  
   float x1o = xyArray_outer[0][0];
   float y1o = xyArray_outer[0][1];

   float x0o = xyArray_outer[numPoints-1][0];
   float y0o = xyArray_outer[numPoints-1][1];
   
   line(x0o,y0o,x1o,y1o);
  */ 
   delay(50);
  
  
   //numPoints = numPoints - 1;
}


