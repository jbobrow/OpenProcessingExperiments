
import java.awt.Color;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Point2D;

import processing.core.PApplet;

public class Angel {
	
	int locX, locY;
	Color faceC, bodyC, haloC, wingC;
	Circle dot;
	int currentStatus; // 0 for circle and 1 for angel
	
	public Angel() {
		
	}
	
	public Angel(int _x, int _y) {
		locX = _x;
		locY = _y;	
		faceC = new Color(239,208,209);
		bodyC = new Color(255,255,255);
		haloC = new Color(200,200,0);
		wingC = new Color(200,200,0);
		dot = new Circle(_x,_y);
		currentStatus = 0;
		
	}
	
	public void set(int _x, int _y) {
		locX = _x;
		locY = _y;
	}
	
	public void CircleToAngle() {
		currentStatus = 1;
	}
	
	public int getStatus() {
		return currentStatus;
	}

	public void toggleStatus() {
		
		if (currentStatus == 0)
			currentStatus = 1;
		else
			currentStatus = 0;
	}
	
	public void create(PApplet _p) {
		
		int unitX = 40;
		int unitY = 40;
		//save the original coordinate
		_p.pushMatrix();
		_p.translate(locX, locY);
		_p.scale(0.3f);
		_p.pushMatrix(); // pushed a matrix - translate and scale 
	
		// the current matrix is with translate and scale
		_p.fill(wingC.getRGB());	
		_p.translate(0,40);	 // translate to lower the coordinate for wings
		_p.rotate(- PApplet.PI/6); // tilt one wing to right
		_p.ellipse(unitX/2, 0, unitX, unitY/2);
		_p.rotate(PApplet.PI/6);  // rotate back to the center
		_p.rotate(PApplet.PI/6);  // tilt the other wing to left
		_p.ellipse(-unitX/2, 0, unitX, unitY/2);		 
		
		// pop the matrix with only translate and scale
		_p.popMatrix();
		
		// body of an angel
		_p.fill(bodyC.getRGB());
		_p.triangle(0, 0, -unitX+20, unitY+20, unitX-20, unitY+20);

		// face of an angel
		_p.fill(faceC.getRGB());
		_p.ellipse(0,0, unitX, unitY);

		// halo of an angel
		_p.strokeWeight(10);
		_p.noFill();
		_p.stroke(haloC.getRGB());
		_p.ellipse(0,-20, 60, 30);
		_p.noStroke();

		// pop the very original matrix
		_p.popMatrix();
	}

	

	public class Circle extends java.awt.Polygon {

		Point2D centerPt;
		Ellipse2D circle;

		public Circle(int _x, int _y) {
			centerPt = new Point2D.Float(_x,_y);
			circle = new Ellipse2D.Float(_x-5,_y-5,10,10);
		}

		public Ellipse2D getCircle() {
			return circle;
		}

		public Point2D getCenterPt() {
			return centerPt;
		}

		public void setCenterPt(int _x, int _y) {
			centerPt.setLocation((double)_x, (double)_y);
			circle.setFrame((double)_x-5,(double)_y-5, 10, 10);

		}

		public boolean contains(int _x, int _y) {
			return circle.contains(_x,_y);
		}
	}



}


