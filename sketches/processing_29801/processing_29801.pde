
public class Slider {
	
	PApplet parent;
	float x, y, redX, bigX, bigY;
	boolean mouseOver = false;
	
	public Slider(PApplet p, float x, float y) {
		parent = p;
		this.x = x;
		this.y = y;
		redX = 0;
		bigX = x + 256;
		bigY = y + 18;
	}
	
	public void display(){
		parent.noStroke();
		parent.smooth();
		parent.fill(255);
		parent.rect(x, y, 255, 18);
		if (redX >= 255)
			parent.fill(0, 200, 0);
		else
			parent.fill(255, 0, 0);
		if (redX != 0) 
			parent.rect(x, y, redX, 18);
	}
	
	public void update(){
		if (parent.mouseX > x-1 && parent.mouseX < bigX && parent.mouseY > y && parent.mouseY < bigY)
			mouseOver = true;
		else 
			mouseOver = false;
		if (mouseOver && parent.mousePressed)
			redX = parent.mouseX - x;
	}
	
	public float getValue(){
		return redX;
	}

}

