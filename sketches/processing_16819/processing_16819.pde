


ArrayList lines;

PVector[] direction =  {new PVector(1,0), new PVector(0,1), new PVector(-1, 0), new PVector(0, -1),
						new PVector(1,-1), new PVector(1, 1), new PVector(-1, 1), new PVector(-1, -1)};
int direction_num = 8;


void setup(){
	size(800, 800,P2D);
	lines = new ArrayList();
	frameRate(60);
	smooth();
}

void draw(){
	fill(255, 80);

	rect(0,0,width, height);


	if(lines.size() != 0){
		for(int i = 0; i < lines.size(); i++){
			Line l = (Line) lines.get(i);
			if(l.isDead()){
				lines.remove(i);
				i--;
			}else{
				l.update();
				l.draw();
			}

		}
	}
	
	
}

void mousePressed(){
	int mx = mouseX;
	int my = mouseY;
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
	lines.add(new Line(new PVector(mx, my)));
}


class Line{
	ArrayList locus;
	int len;
	int life;
	PVector velocity;
	

	Line(PVector p){
		len = (int)random(15, 30);
		locus = new ArrayList(len);
		locus.add(p);

		life =(int)random(20, 200);
		float v = random(20,70);
		velocity = new PVector(v, v);
	}

	boolean isDead(){
		return locus.size() <= 0 ? true: false;
	}

	void update(){
		int n = (int) random(direction_num);
		PVector d = PVector.mult( direction[n], velocity);
		if(len >= locus.size() && life > 0){
			PVector pre_line = (PVector)locus.get(locus.size() -1);
			PVector new_line = PVector.add(pre_line, d);
			locus.add(new_line);
		}else{
			PVector pre_line = (PVector)locus.get(locus.size() -1);
			PVector new_line = PVector.add(pre_line, d);
			locus.add(new_line);
			locus.remove(0);
		}
		if(life <= 0){
			locus.remove(0);
		}else{
			life--;
		}

	}
		
			

	void draw(){
		stroke(0);
		for(int i = 0; i < locus.size()-1; i++){
			PVector pre = (PVector)locus.get(i);
			PVector next = (PVector)locus.get(i+1);
			line(pre.x, pre.y, next.x, next.y);
		}
	}
}



