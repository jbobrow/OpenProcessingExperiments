
float r = 80;
float theta = PI;     //start position. 0 starts at 3 o'clock
					  //PI at 9 o'clock
float drawSpeed = 0.20;  //the higher the value the faster 0.1 is very fast
float spiralCoil = -0.20; //the lower the value the tighter the coil
boolean clockwise = false;  

void setup()
{
  size(400, 400);
  background(255);
  smooth(5);


}

void draw()
{

	 //offset 0,0 to be in the center of the screen
 	 translate(width/2, height/2);
 
	
	float x = r* cos(theta);
	float y = r * sin (theta);
	noStroke();
	fill(0);
	ellipse(x, y,6,6);
	if (r>0) {
		if (clockwise) {
			theta += drawSpeed;
	    } else {
	    	theta -= drawSpeed;
	    }
		r -= spiralCoil;
		println("stop");
	}
}

void mouseDragged()
{
// code that happens when the mouse moves
// with the button down
}

void mousePressed()
{
// code that happens when the mouse button
// is pressed
}

void mouseReleased()
{
// code that happens when the mouse button
// is released
}



