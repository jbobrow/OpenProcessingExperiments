
class Bouton {
	PImage img;
	float x,y,w,h;
  	float s = 1; // s veut dire Scale
  	float max_s = 1.05;
	
	Bouton (float _x, float _y, PImage _img) {
		img = _img;
		x = _x;
		y = _y;
	}
	
	boolean estOver(){
		return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
	}
	
	void draw(){
		if (estOver())
	    {
	      if (s < max_s)  {
	        s += 0.01;
	      }
	      cursor(ARROW);
	    }
	    else
	    {
	      if (s > 1.0) {
	        s -= 0.01;
	      }
	    }
	    scale(s);
	    imageMode(CENTER);
	    image(img, this.x / s, this.y / s);
	    imageMode(CORNER);
	    popMatrix();
	}
}

