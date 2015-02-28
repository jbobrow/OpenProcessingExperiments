

/* Looking to recreate a count down clock as witnessed in Star Trek: Generations
 * 
 * 2010 Robert Carlsen
 */

import java.awt.Point;
import java.util.ArrayList;

import processing.core.PApplet;
import processing.core.PFont;


public class Timer extends PApplet {
	ArrayList clock;
	int index;
	PFont bigFont, smallFont;
	
	public void setup() {
		size(500,500);
		smooth();
		
		char[] chars = {'0','1','2','3','4','5','6','7','8','9'};
		bigFont = createFont("Helvetica-Bold", 150.0f, true, chars);
		smallFont = createFont("Helvetica-Bold", 36.0f, true, chars);
		
		clock = new ArrayList(60);
		int i = 60;
		while(--i >= 0) {
			Wedge w = new Wedge();
			float a = i * TWO_PI/60.0f;
			w.angle = a;
			w.index = i; // time index
			
			clock.add(w);
		}
		
		index = 0;
	}

	public void draw() {
		background(102);
		
		Point center = new Point(width/2,height/2);
		noStroke();
		
		for(int i = 0; i < clock.size(); i++) {
                        Wedge w = (Wedge)clock.get(i);
			pushMatrix();
			translate(center.x, center.y);
			rotate(-HALF_PI); // put the wedge with angle zero at the top
			
			if(w.index == index%60)
				fill(255, 200, 200, 200);
			else if(w.index == (index/60)%60) //second()) // second, system time
				fill(255,255,255,200);
			else if(w.index == (index/3600)%60) // minute
				fill(255, 255, 200, 200);
			else
				fill(255,255,255,100);
;
			arc(0, 0, 400, 400, w.angle, w.angle+w.size);
			popMatrix();
		}
		
		index = 60*millis()/1000;
		
		//draw an ellipse to hide the moire pattern
		fill(102);
		ellipse(width/2, height/2, 210, 210);
		
		// display the time
		// seconds
		fill(255,255,255,200); // white
		textFont(bigFont);
		textAlign(CENTER);
		int sec = (index/60)%60;//second(); //clock mode
		text(nf(sec,2), width/2, height/2 + 50);
		
		// minutes
		fill(255,255,200,200); // yellow
		textFont(smallFont);
		int min = (index/3600)%60;
		text(nf(min,2), width/2, height/2 - 65);

		// millis
		fill(255, 200, 200, 200); // red
		int millis = (millis())%1000;
		text(nf(millis,3), width/2, height/2 + 90);

	}
	
	/** Defines an arc which represents a slice of time
	 * 	@author rcarlsen
	 */
	class Wedge {
		float size;
		float angle;
		int index;
		
		Wedge()
		{
			size = TWO_PI/90.0f;
			angle = 0.0f;
			index = 0;
		}
		
	}
}

