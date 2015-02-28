
int max_particle = 150;
Walker []walkers = new Walker[max_particle];
Walker invader;
Boolean []processed = new Boolean[(max_particle * (max_particle - 1)) / 2];
PVector []bufferForce = new PVector[(max_particle * (max_particle - 1)) / 2];
PVector anchor;

public float global_acceleration = 0.1;
public float global_attraction = 0.3;
public float global_chaos = 15;
public int global_particles = max_particle;
public int noiseCounter = 0;
public int velNoiseCounter = 0;

PVector gravity;

float walkerSize = 8;


void setup() {
	size(400,600);
	//smooth();
	background(0);
	
	for (int i = 0; i < walkers.length ; i++)
	{
		walkers[i] = new Walker(i);
	}
	
	for (int i = 0; i < bufferForce.length ; i++)
	{
			bufferForce[i] = new PVector();
	}
	anchor = new PVector(width/2, height/2);
	gravity = new PVector(0,0.03);
	
	invader = new Walker(-1,false,3);
	
	curveTightness(20);
}

void draw() {
	noStroke();
	fill(0);
	rect(0,0,width,height);
	
	for (int i = 0; i < processed.length ; i++)
	{
		processed[i] = false;
	}
	
	for (int i = 0; i < bufferForce.length ; i++)
	{
			bufferForce[i].x = 0;
			bufferForce[i].y = 0;
	}
	
	for (int i = 0; i < global_particles ; i++)
	{
		walkers[i].walk();
		walkers[i].render();
	}
	
	invader.walk();
	invader.render();
	
	
	
	/*
	
	//stroke(170);
	stroke(255, 102, 0,90);
	strokeWeight(0.5f);
	//stroke(random(0,255),random(0,100),random(0,50));
	noFill();
	beginShape();
	curveVertex(walkers[0].location.x, walkers[0].location.y);
	for (int i = 0; i < global_particles ; i++)
	{
		curveVertex(walkers[i].location.x, walkers[i].location.y);
	}
	curveVertex(walkers[global_particles - 1].location.x, walkers[global_particles - 1].location.y);
	endShape();
*/
	
	
	//draw anchor
	/*
	noStroke();
	fill(255,0,0);
	ellipse(anchor.x,anchor.y,1,1);
	
	noFill();
	stroke(230,0,0);
	line(anchor.x - 4,anchor.y,anchor.x + 4,anchor.y);
	line(anchor.x,anchor.y - 4,anchor.x,anchor.y + 4);
	*/
}

void keyPressed()
{
}

void mousePressed()
{
	anchor.x = mouseX;
	anchor.y = mouseY;
	
	invader.location.x = mouseX;
	invader.location.y = mouseY;
	invader.velocity.x = 0;
	invader.velocity.y = 0;
	invader.locked = false;
}

void mouseDragged()
{
	anchor.x = mouseX;
	anchor.y = mouseY;
	invader.location.x = mouseX;
	invader.location.y = mouseY;
	invader.velocity.x = 0;
	invader.velocity.y = 0;
	invader.locked = false;
}

