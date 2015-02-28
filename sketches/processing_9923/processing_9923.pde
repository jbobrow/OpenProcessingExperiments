
/*
 * Blitz visualization - Creates circles in a wave pattern, with color determined by the right channel, and size with the left
 */
class Blitz extends Visualization
{

	//The increment of the visualization, the smaller this number is, the more circles will appear
	protected final int STEP = 24;

	//Protected properties for location, max size and position
	protected int _width, _height, _size, _x, _y;
	//Array of color choices
	protected color[] _colors;
	
	
	//Constructor
	public Blitz(int x, int y, int w, int h, int size, color[] c)
	{
		//Assign properties
		_width = w;
		_height = h;
		_size = size;
		_x = x;
		_y = y;
		_colors = c;
	}
	
	
	//Draw the visualization
	public void draw(float[] left, float[] right, float[] mix, float left_level, float right_level, float mix_level)
	{
		//Enable smoothing
		smooth();
		
		//Loop through data
		for(int i = 0; i < mix.length ; i += STEP)
		{
		
			//Determine x position based on current point in loop
			int x = (int)(_x + ((float)(i-mix.length / 2) / mix.length) * _width);
			//Determine y position based on level
			int y = (int)(_y + (mix[i] * (_height / 2)));
			
			//Set the ellipse mode
			ellipseMode(CENTER);
			//Determine the size of the circle
			float size = 1 + ((_size - 1) * abs(left[i]));
			
			//Get the color index
			int index = round(abs(right[i]) * _colors.length);
			
			//Ensure the index is not out of bounds
			index = index == _colors.length ? 0 : index;
			
			//Get the color to be used
			color c = _colors[index];
			
			//Remove stroke, set color, and draw the circle
			noStroke();
			fill(c);
			ellipse(x, y, size, size);			
		}
		
		//Disable smoothing
		noSmooth();
	}
	
}

