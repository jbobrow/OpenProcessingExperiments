
//M. Kontopoulos, 2011
//Combination of the "nervous", "jittery" example and a scale experimentation.
//Note that I'm not using the scale() function, but doing it manually with a scalar variable. 

float x, y;
void setup()
{
  size(600, 600);
  smooth();
  //  x = width/2;
  //  y = height/2;
  strokeWeight(0.2);
  
}
void draw(){
  fill(0, 20);
  rect(0, 0, width, height);
  stroke(200);
  noFill();

float a = 0.0;
float inc = TWO_PI/25.0;

  for (int x=100; x<=width; x+=150)
  {
    for (int y=100; y<=height; y+=150)
    {

      //See the other programs for a detailed description of MAP and CONSTRAIN
      float mouseDist = dist(mouseX, mouseY, x, y);
      float mappedNum = map(mouseDist, 200, 0, 0, 10);
      float num = constrain(mappedNum, 0, 10);

      //The amount to scale will be based on the results of the MAP function. 
      //This way, we can down-sample from 200->0  to between -5->5, proportionally. 
      float xscaler = map(mouseDist, 200,0, -5, 5);
      float yscaler = map(mouseDist, 200,0, -5, 5);

      x+=xscaler;
      y+=yscaler;

      //Draw the MK
      //Added a random offset between -5 and 5, to create jitter.
scale(1.05);
beginShape();
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-328.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-217.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-217.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
endShape();

//left parenthesis shadows
beginShape();
vertex(x-249.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-217.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-217.0+random(-num, num), y-220.0+random(-num, num)+sin(a)*40.0);
vertex(x-241.0+random(-num, num), y-220.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
endShape();

beginShape();
vertex(x-173.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-163.0+random(-num, num), y-335.0+random(-num, num)+sin(a)*40.0);
vertex(x-163.0+random(-num, num), y-183.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
endShape();

beginShape();
vertex(x-173.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-163.0+random(-num, num), y-335.0+random(-num, num)+sin(a)*40.0);
vertex(x-241.0+random(-num, num), y-335.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
endShape();

//right parenthesis main
beginShape();
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-325.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-325.0+random(-num, num), y-328.0+random(-num, num)+sin(a)*40.0);
vertex(x-173.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-327.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-282.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-282.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-206.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
endShape();

//right parenthesis shadows
beginShape();
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-325.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-336.0+random(-num, num), y-167.0+random(-num, num)+sin(a)*40.0);
vertex(x-258.0+random(-num, num), y-167.0+random(-num, num)+sin(a)*40.0);
vertex(x-249.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
endShape();

beginShape();
vertex(x-325.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
vertex(x-325.0+random(-num, num), y-328.0+random(-num, num)+sin(a)*40.0);
vertex(x-336.0+random(-num, num), y-316.0+random(-num, num)+sin(a)*40.0);
vertex(x-336.0+random(-num, num), y-167.0+random(-num, num)+sin(a)*40.0);
vertex(x-325.0+random(-num, num), y-174.0+random(-num, num)+sin(a)*40.0);
endShape();

beginShape();
vertex(x-248.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-282.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
vertex(x-282.0+random(-num, num), y-281.0+random(-num, num)+sin(a)*40.0);
vertex(x-259.0+random(-num, num), y-281.0+random(-num, num)+sin(a)*40.0);
vertex(x-248.0+random(-num, num), y-295.0+random(-num, num)+sin(a)*40.0);
endShape();

a = a + inc;
    }
  }
}
     
//Export TIF files to the sketch folder.
void mousePressed()
{
  saveFrame("nervous-##.tif");
}


