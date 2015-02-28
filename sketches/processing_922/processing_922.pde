
import controlP5.*;

int max_particle = 50;
Walker []walkers = new Walker[max_particle];
PVector anchor;
ControlP5 controlP5;

ControlWindow controlWindow;
public float global_acceleration = 0.1;
public float global_attraction = 0.3;
public float global_chaos = 15;
public int global_particles = 5;
public int noiseCounter = 0;
public int velNoiseCounter = 0;



void setup() {
	size(800,600);
	smooth();
	background(0);
	
	controlP5 = new ControlP5(this);
	controlP5.setAutoDraw(false);
	controlWindow = controlP5.addControlWindow("controlP5window",100,100,250,150);
	controlWindow.setBackground(color(40));
	Controller attraction_slider = controlP5.addSlider("global_acceleration",0,1,global_acceleration,10,10,100,10);
	Controller adjust_slider = controlP5.addSlider("global_attraction",0,1,global_attraction,10,30,100,10);
	Controller step_slider = controlP5.addSlider("global_chaos",0,40,global_chaos,10,50,100,10);
	Controller particle_slider = controlP5.addSlider("global_particles",1,max_particle,global_particles,10,70,100,10);
	
	attraction_slider.setWindow(controlWindow);
	adjust_slider.setWindow(controlWindow);
	step_slider.setWindow(controlWindow);
	particle_slider.setWindow(controlWindow);
	
	
	for (int i = 0; i < walkers.length ; i++)
	{
		walkers[i] = new Walker();
	}
	
	anchor = new PVector(width, height);
	
	
}

void draw() {
	noStroke();
	fill(0,50);
	rect(0,0,width,height);
	
	for (int i = 0; i < global_particles ; i++)
	{
		walkers[i].walk();
		walkers[i].render();
	}
	
	//draw anchor
	noStroke();
	fill(255,0,0);
	ellipse(anchor.x,anchor.y,1,1);
	noFill();
	stroke(230,0,0);
	line(anchor.x - 4,anchor.y,anchor.x + 4,anchor.y);
	line(anchor.x,anchor.y - 4,anchor.x,anchor.y + 4);
	
}

void keyPressed()
{
	if (key == 'c' || key == 'C')
	{
		//cameraMode = !cameraMode;
	}
}

void mousePressed()
{
	anchor.x = mouseX;
	anchor.y = mouseY;
}

void mouseDragged()
{
	anchor.x = mouseX;
	anchor.y = mouseY;
}

