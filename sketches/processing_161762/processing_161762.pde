
/**
 circle packing example for CCA students.
 @author jtnimoy
 @date 20 sep 2014
 
 If you are doing equilateral triangle packing,
 or circle packing (bubble wrap texture)
 then you might notice that the verical stride is less than
 one brick unit, as it would be if you were drawing bricks.
 This is because the circles are closer together.
 Having worked out the geometry in the past,
 the vertical stride turns out to be square root of three,
 multipled by the circle radius.
 */

size(400, 400);
noStroke();
background(95);
float diameter = 20;
float radius = diameter / 2.0;
int yCounter = 0;

//sqrt(3) was derrived from pythagorean theorem
float verticalStride = radius * sqrt (3);

for (float y=0; y<height; y+= verticalStride ) {
  for (int x=0; x<width + diameter; x+=diameter) {

    //color
    fill(
    noise(x*0.02, y*0.02, 0.0) * 50 + 100, 
    noise(x*0.02, y*0.02, 0.2) * 50 + 100, 
    noise(x*0.02, y*0.02, 0.4) * 50 + 100
      );

    pushMatrix();
    translate(x, y);
    if (yCounter%2==0) {
      //stride by half for brick-packing
      translate(diameter/2, 0);
    }
    ellipse(0, 0, diameter, diameter);
    popMatrix();
  }
  yCounter++;
}



