
class Cell {
	float x,y;
	float w,h;
	int state;
	
	Cell(float x_, float y_, float w_, float h_) {
		x = x_;
		y = y_;
		w = w_;
		h = h_;
		state = 0;
	}
	
	void click(int mx, int my){
		if (turn == 9) {
			turn++;
		}
		if (state == 0) {
			if ((mx > x) && (mx < (x+w) ) && (my > y) && (my < (y+h) )) {
				state = turn % 2 + 1;
				println("Turn: " + turn + " State: " + state);
				turn++;
			}
		} 
	}
	
	void display() {
		stroke(255);
		fill(0);
		rect(x,y,w,h);
		float spacer = w/10;
		
		if (state == 0) {
			// Don'd do anything
		} else if (state ==1) {
			noFill();
			ellipse(x+w/2,y+h/2,w-spacer*2,w-spacer*2);
		} else if (state == 2) {
			stroke(255);
			line(x+spacer,y+spacer,x+w-spacer,y+h-spacer);
			line(x+spacer,y+h-spacer,x+w-spacer,y+spacer);
		}
	}
}

