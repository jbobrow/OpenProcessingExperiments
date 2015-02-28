

import controlP5.*;
import processing.core.*;
/**
One channel synthesizer using Processing,ControlP5 library and Java's Soundbank.
created on Eclipse. crammed into Processing IDE
Work In Progress.
Comments/Criticism welcome - goingkilo@gmail.com
Others  : uses deprecated Thread:suspend Thread:resume
*/

public class onesynth  extends PApplet{

	ControlP5 cp5;
	SoundThreadManager sm ;
	SingleSet s;

	public void setup(){
		size(800, 600, P3D);
		background(255);
		cp5 = new ControlP5(this);
		s = new SingleSet(this.cp5);
		s.setup(this);
	}
		
	public void draw(){cp5.draw();}

	void controlEvent(ControlEvent theEvent) {
		//println(theEvent.controller().label()+"->"+theEvent.controller().value());
	}
	public void STARTT(float f) { this.s.STARTT(f); }
	public void STOPT(float f) { this.s.STOPT(f); }	
	public void PAUSET(float f){ this.s.PAUSET(f); }
	public void UNPAUSET(float f){ this.s.UNPAUSET(f); }
	public void S2(float f) { this.s.S2(f); }
}

