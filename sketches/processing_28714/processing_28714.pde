
import java.awt.Color; //for translation utils

//globals
Cell[][] grid;
int cols = 60;
int rows = 60;
float increment = 0.01;

void setup() {
	frameRate(25);
	size(600,600);
	grid = new Cell[cols][rows];
	for (int i = 0; i < cols; i++) {
		for (int j = 0; j < rows; j++) {
			float randomHue = random(TWO_PI);
			int x = i * 10;
			int y = j * 10;
			int _width  = 10;
			int _height = 10;
			grid[i][j] = new Cell(x, y, _width, _height, randomHue);
		}
	}
}

void draw() {
	background(0);
	for (int i = 0; i < cols; i++) {
		for (int j = 0; j < rows; j++) {
			
			Cell currentCell = grid[i][j];
			
			int left    = i-1;
			int right   = i+1;
			int above   = j-1;
			int below   = j+1;

			if(left < 0)    left = 59;
			if(left > 59)   left = 0;
			if(right < 0)   right = 59;
			if(right > 59)  right = 0;
			if(above < 0)   above = 59;
			if(above > 59)  above = 0;
			if(below < 0)   below = 59;
			if (below > 59) below = 0;
			
			float col1 = grid[left][j].hueInRadians;
			float col2 = grid[right][j].hueInRadians;
			float col3 = grid[i][above].hueInRadians;
			float col4 = grid[i][below].hueInRadians;
			float averageHue =  (col1 + col2 + col3 + col4) / 4;

			if(averageHue > currentCell.hueInRadians) 
				currentCell.hueInRadians = averageHue + increment;
			else if(averageHue < currentCell.hueInRadians) 
				currentCell.hueInRadians = averageHue + increment;

                        //random agitation
                        if(random(1.0) > 0.999) currentCell.hueInRadians = 0;
                        	
			currentCell.update();
			currentCell.display();
		}
	}
}
//helper class
class Cell {
	
	public float hueInRadians = 0;
	
	private int x = 0;
	private int y = 0; 
	private int _width = 0;
	private int _height = 0;
	private int colour = 0;
	private float _saturation = 1.0;
	private float _brightness = 1.0;

	Cell(int x, int y, int _width, int _height, float hueInRadians) {
		
		this.x = x;
		this.y = y;
		this._width = _width;
		this._height = _height;
		this.hueInRadians = hueInRadians;
		update();
	} 
	public void update() {
		float boundHue = bound(this.hueInRadians);
		this.colour = Color.HSBtoRGB(boundHue, _saturation, _brightness);
                //this.colour = Color.HSBtoRGB(hueInRadians, _saturation, _brightness);
	}
	public void display() {
		stroke(255);
		fill(this.colour);
		rect(x, y, _width, _height);
	}
	private float bound(float _hue)
	{
		float boundHue = _hue;
		while (boundHue > TWO_PI) boundHue -= TWO_PI;
		while (boundHue < 0) boundHue += TWO_PI;
                return boundHue;
	}
}

