
// Kurt Ralske
// January 2013

// Example: reading data from a text file

String[] data;
float counter = 0.;
float t = 0.3;
float danceFactor = 2;
 color cc;

void setup() {
    size(800,800,P3D);
    smooth();
    stroke(0, 50);
    background(255);

    
    // Load text file as an array of Strings
    data = loadStrings("data.txt");  
    frameRate(1500);
}

void draw() 
{
   
    // Each line is split into an array of floating point numbers.
   float[] values_old = float(split(data[(int) counter], "," ));
   float[] values_new = float(split(data[(int) counter + 1], "," )); 
  
    // interpolate (slide) between old and new values
    float xx = lerp(values_old[0], values_new[0], counter % 1.0);
    float yy = lerp(values_old[1], values_new[1], counter % 1.0);
    float zz = lerp(values_old[2], values_new[2], counter % 1.0);
  
    // The 3 values in the array are used to draw circles.
     xx += random(-danceFactor, danceFactor);
     yy += random(-danceFactor, danceFactor);
     stroke(0,random(40,60));
    line(width/2,height/2, xx, yy); 
    line(xx,yy,xx += random(-60,60),yy += random(-60,60));
  
    pushMatrix();
    translate(xx, yy, zz);
    cc = color(zz* random(20,80),zz*4,0,zz*30);
    fill(cc);
    strokeWeight(1.5);
    stroke(0,random(30,80));
    box(zz);
    popMatrix();
    
    stroke(cc,random(80));
    line(width/2,height/2,random(0,800),random(0,800));
   // line(width/2,height/2,random(0,800),random(0,800));
    
    counter += t;
    if(counter >= (data.length - 2) ) counter = 0;

}


