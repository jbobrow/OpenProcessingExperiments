
///noise 

float x, y, oldX, oldY;
float xNoise, yNoise;
float xOffSet, yOffSet;
//


int blinkbottom = -100;

int eyewidth = 200;

int pupil = 60;

void setup () {
  size (500, 500);
  smooth ();

  ///noise 
  xNoise = random( width );
  yNoise = random( height );
  xOffSet = 0.01;  //  change this value to alter the line
  yOffSet = 0.01;  //  change this value to alter the line
}

void draw () {
  background (255);
  fill (100);
  noStroke ();

  
  float d = dist(width/2, 100, x, y);
  float m = map(d, 0, height-200, 200, 68);
  
    float p1 = map(d, 0, height-200, 59, 27);

fill(0); 
        ellipse(mouseX, mouseY, 300, 280); 

      drawNoisePoint( );

fill(255); 


  // eye balls 
    ellipse (mouseX, mouseY, eyewidth, m);

//map
  float eye1x = map (x, 0, 500, 150, 250);
  float eye1y = map (y, 0, height, 150, 250);


  eye1x = constrain (eye1x, 150, 250);




  // iris
  ellipseMode (CENTER);
  fill (94, 56);
  ellipse (mouseX+eye1x-200, mouseY+eye1y-200, 100, 100);
println(eye1x); 


  //pupils
  fill (0);
  ellipse (mouseX+eye1x -200, mouseY+eye1y-200, p1, p1);

beginShape();
vertex(mouseX -100,mouseY-80);
vertex(mouseX+100,mouseY-80);
vertex(mouseX+100,blinkbottom+mouseY+20);
vertex(mouseX+0,blinkbottom+mouseY);
vertex(mouseX-100,blinkbottom+mouseY+20);
endShape();


  if ((mousePressed == true) && (blinkbottom<68)) {
    blinkbottom+=15;
  }
  else if (blinkbottom>-100)
  {
    blinkbottom-=10;
  } 




}




void drawNoisePoint( )
{
    x = noise( xNoise )  * width ;
    y = noise( yNoise )  * height;
    ellipse( x, y, 5, 5 );
    xNoise = xNoise + xOffSet;
    yNoise = yNoise + yOffSet; 
}





