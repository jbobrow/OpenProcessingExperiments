
PImage img;


void setup() {
 size(500,305);
 loadPixels(); 
loadAnImage();
 //noLoop();
}


void loadAnImage(){
 int rndImg = floor(random(1,12));
 img = loadImage(rndImg+".jpg");
 img.loadPixels(); 
}

void drawQuadran(){
  strokeWeight(1);
  stroke(133, 160);//transparent grey shows well...
  line(0, height/2, width, height/2); //hori
  line(width/2, 0, width/2, height); //verti
  
  
   stroke(140, 200);
   strokeWeight(4);
  line(mouseX, (height/2)+10, mouseX, (height/2)-10); //hori
  line((width/2)+10, mouseY,(width/2)-10, mouseY) ; //hori

}



//COLOR CONVERSION
//////////////////////////////////////////////////////////
/* math src: http://www.quasimondo.com/archives/000696.php
Well, here is a little alternative method: whilst working 
with the YUV colorspace I figured that since Y contains all
the luminance information, the U + V channels must thus 
contain the hue and saturation. And it turns out that indeed
when looking at u and v as the coordinates of a vector, its
angle will represent the hue and its length will be the saturation.
So a formula that does not need any min/max and 
ifs to convert rgb to hsl looks like this:

In this case hue will be between -Pi and Pi and saturation 
will be between 0 and 1/sqrt(2), so you might want to multiply
the saturation by sqrt(2) to get it in a range between 0 and 1. */

// r,b and b are assumed to be in the range 0...1
color rgb_hsl(color thePix){
  
   float r = red(thePix)/255;
   float g = green(thePix)/255;
   float b = blue(thePix)/255;
  float lumi =  r * 0.299 + g * 0.587 + b * 0.114;
  float u = - r * 0.1471376975169300226 - g * 0.2888623024830699774 + b * 0.436;
  float v =   r * 0.615 - g * 0.514985734664764622 - b * 0.100014265335235378;
  float hue1 = atan2( v, u ); //atan2 return between pi and -pi in processing.
  float sat = sqrt( u*u + v*v );
  sat = sat * sqrt(2); //we want it to rather vary between 0 and 1...
  hue1 = (hue1 + PI ) / (2 * PI);// we set back the hue on a 0 to 1 scale as well.
  color theHslColor = color(hue1*255, sat*255, lumi*255);
  return theHslColor;
}//end of rgb-hsl function


color hsl_rgb(color theHSL){//function that revert an HSL color object to regular RGB one.
  // hue is an angle in radians (-Pi...Pi)
  // for saturation the range 0...1/sqrt(2) equals 0% ... 100%
  // luminance is in the range 0...1
      float hue1 = red(theHSL)/255;
      float sat = green(theHSL)/255;
      float luminance = blue(theHSL)/255;
      hue1 = (hue1 * (2*PI))-PI; //revert the friendly presentation of hue...
      sat = sat / sqrt(2);
     float u = cos( hue1 ) * sat;
     float  v = sin( hue1 ) * sat;
     float  r =  luminance  + 1.139837398373983740  * v;
     float  g = luminance  - 0.3946517043589703515  * u - 0.5805986066674976801 * v;
     float  b = luminance + 2.03211091743119266 * u;
     color theRgbColor = color(r*255, g*255, b*255);
  return theRgbColor;
}//end of HSL to RGB


/////////////////////////////////////////////////////////////




void mousePressed() {
 // redraw(); //now we loop..
 loadAnImage();
}


void draw() {

float r = random(255);
 float g = random(255);
 float b = random(255);
 //r =g =b = 99;
 color theColor = color(r,g,b);
 background(theColor); 
 


for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;
      
      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r2 = red(img.pixels[loc]);
      float g2 = green(img.pixels[loc]);
      float b2 = blue(img.pixels[loc]);
      
      // Image Processing would go here
      // If we were to change the RGB values, we would do it here, before setting the pixel in the display window.
      
      color theHSL = rgb_hsl(img.pixels[loc]); //can't be used as a color directly, only as a 3 chanel math object...
      //Transformations happens here.
      //cursor in the middle will be neutral...
      //the scale will be of 2 (minus 1 to 1), on both axis, we'll then offset of one to center...
      float extraSat = ((float(mouseX) / width) *1)-0.5;//we go easier with the sat...
      float extraLumi = ((float(mouseY) / height) *2)-1;
      float newLumi = (blue(theHSL)/255) - extraLumi;
      float newSat = (green(theHSL)/255) + extraSat;
       newLumi = constrain(newLumi, 0, 1);
       newSat = constrain(newSat, 0, 1);
       
      theHSL = color(red(theHSL), newSat*255, newLumi*255 );
      
      color theRGB = hsl_rgb(theHSL); //we return in RGB mode to show the pixel.
     
      color theFinalColor = theRGB; //by default...
    
     //check if a key is pressed, and only show this channel if it's pressed...
     if (keyPressed == true) {
       if(key == 'h' || key == 'H'){
         theFinalColor = color(red(theHSL),red(theHSL),red(theHSL));
       }else if(key == 's' || key == 'S'){
         theFinalColor = color(green(theHSL),green(theHSL),green(theHSL));
       }else if(key == 'l' || key == 'L'){
         theFinalColor = color(blue(theHSL),blue(theHSL),blue(theHSL));
       }else if(key == 'r' || key == 'R'){
         theFinalColor = color(red(theRGB));
       }else if(key == 'g' || key == 'G'){
         theFinalColor = color(green(theRGB));
       }else if(key == 'b' || key == 'B'){
         theFinalColor = color(blue(theRGB));
       }//if all keys...
     }else{
     theFinalColor = theRGB;
     }
      
      // Set the display pixel to the image pixel
      pixels[loc] = theFinalColor;
    }
  }
  updatePixels();
  drawQuadran();


}// end draw...


