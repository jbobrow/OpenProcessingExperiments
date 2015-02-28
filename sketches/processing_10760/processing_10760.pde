
	void setup() {
		size(300, 300);
		background(color(0));
		stroke(color(255));
		smooth();
		
	}

	
	void draw() {
		float scale = 0.6f - (mouseY-height/2)*0.2f/height;
		float rot = (mouseX-width/2)*0.3f/width;
		
		background(0);
		paintLunarLander(width/2,height/2,scale,rot);
	}


	private void paintLunarLander(int x, int y, float scale, float rot) {
		pushMatrix();
		translate(x, y);
		scale(scale);
		rotate(rot);
		
		strokeWeight(2);
		noFill();
		arc(0,-40,85,120,-PI*1.25f, PI*0.25f);

		strokeWeight(1);
		ellipse(15,-55,18,18);
		ellipse(-15,-55,18,18);

		strokeWeight(1.5f);
		line(-35,25,-30,3);
		line(35,25,30,3);
		line(-30,3,30,3);
		rect(-35,25,70,45);
		line(-5,70,-10,87);
		line(5,70,10,87);
		line(-10,87,10,87);
		
		line(-20,-93,20,-93);
		line(-35,-73,35,-73);
		
		line(42,-50,50,-52);
		line(42,-47,50,-45);
		line(50,-52,50,-45);
		line(-42,-50,-50,-52);
		line(-42,-47,-50,-45);
		line(-50,-52,-50,-45);
		
		
		fill(color(255));
		arc(-80,95,40, 5, 0, PI);
		arc(0,95,40, 5, 0, PI);
		arc(80,95,40, 5, 0, PI);
		strokeWeight(2.5f);
		line(-80,95,-60,45);
		line(0,95,0,45);
		line(80,95,60,45);
		strokeWeight(1.5f);
		line(-60,45,-35,30);
		line(-60,45,-35,65);
		line(-75,85,-35,65);
		line(0,45,-15,30);
		line(0,45,15,30);
		line(0,45,15,65);
		line(0,45,-15,65);
		line(0,85,15,65);
		line(0,85,-15,65);
		line(60,45,35,30);
		line(60,45,35,65);
		line(75,85,35,65);
		
		popMatrix();
	}


