
// Kurt Ralske
// January 2013

// Example: reading data from a text file

String[] data;
float counter = 0.;
float t = 0.3;

void setup() {
    size(500,700);
    smooth();
   
    background(0);
    
    // Load text file as an array of Strings
    data = loadStrings("data.txt");  
   

}

void draw() 
{
     translate(width/2, height/2);        
    // Each line is split into an array of floating point numbers.
   float[] values_old = float(split(data[(int) counter], "," ));
   float[] values_new = float(split(data[(int) counter + 1], "," )); 
  
    // interpolate (slide) between old and new values
    float xx = lerp(values_old[0], values_new[0], counter % 1.0);
    float yy = lerp(values_old[1], values_new[1], counter % 1.0);
    float zz = lerp(values_old[2], values_new[2], counter % 1.0);
  
 
    // The 3 values in the array are used to draw circles.
    //ellipse(xx, yy, zz, zz);
     stroke(255, 50);
    noFill();
    line(0, 0, xx, yy);
    int fcolor = (int)map( random(-150., 250), 0, width, 255, 50 );
   fill(fcolor, random( 250), random( 250), 10); 
   
   
    bezier(xx + width/10 , yy + (height/10), xx, yy, zz/5 - xx, zz/5 - yy, zz/5 - xx, zz/5 - yy);
     stroke(255, 100);
    fill(255);
    
    line(xx, yy, xx + random(-90,90), yy + random(-90,90));
    line((xx - zz * 5), (yy- zz * 5),(xx - zz * 5) + random(-90,90), (yy- zz * 5) + random(-90,90));

    
    
    counter += t;
    if(counter >= (data.length - 2) ) counter = 0;

}



