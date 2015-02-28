
/* 
Synthfield
==========

a synthPond (http://apps.stfj.net/synthPond/) inspired sketch
version 20121229001 (in very alpha stage ;) )

Usage:
------
 * Key "0": delete all nodes
 * Key "1": affector node creating mode (click to create)
 * Key "2": reflector node creating mode (click to create)
 * Key "8": delete node (click to delete)
 * Key "9": edit node (click to edit)
 * Key "s" or "S" (only in edit mode): increase selected node's pitch
 * Key "a" or "A" (only in edit mode): decrease selected node's pitch
 * Key "w" or "W" (only in edit mode): increase selected node's note
 * Key "q" or "Q" (only in edit mode): decrease selected node's note
 * Cursor keys (only in edit mode): move selected node

Todo:
-----
 * Rotator node
 * Make some noise (with Minim 2.1.0 beta)
*/

ArrayList nodes = new ArrayList(); //Nodes
ArrayList waves = new ArrayList(); //Waves (created by nodes)
Timer metronome;
float basefreq = 8.1758;
color bg = color(32); //Background color
color axcl = color(192); //Axis color
color ndcl = color(240); //Node	border's color
float bpm = 120.0; //Beat (1/4th note) per minute
float beattime = 1000.0 * 1.0 / (bpm / 60.0); //Time between beats (1/4th note)
float ticktime = beattime/4; //Time between 1/16th note
int tick = 0; //Tick counter
//Modes: 
// 0 - create affector: emit waves
// 1 - create reflector: emit waves if a wave reach it
// 2 - create rotator: create a pivot node and rotate the node around it
// 8 - remove node
// 9 - edit node
int mode = 0;
int selnode = -1; //Selected node
int lastselnode = -1; //Selected node

void setup() {
	size(480,480);
	frameRate(30);
	metronome = new Timer(int(ticktime));
	metronome.start();
}

void draw() {
	translate (width/2,height/2);
	background(bg);
	//Update waves
	for (int j = waves.size()-1; j >= 0; j--) {
		Wave wave = (Wave) waves.get(j);
		wave.display();
		if (wave.power<=0) {
			waves.remove(j);
		} 
	}
	//Create waves
	if (metronome.isFinished()) {
		tick++;
		for (int i = nodes.size()-1; i >= 0; i--) {
			Node node = (Node) nodes.get(i);
			if (tick % node.note == 0) {
				//Affector node
				if (node.type == 0) {
					waves.add(new Wave(node.xpos,node.ypos,node.pitch));
				}
				//Reflector node
				if (node.type == 1) {
					if (node.activated) {
						waves.add(new Wave(node.xpos,node.ypos,node.pitch));					
					}
				}
			}
		}
		metronome.start();
	}
	//Update nodes
	for (int i = nodes.size()-1; i >= 0; i--) {
		Node node = (Node) nodes.get(i);
		//Reflector node
		if (node.type == 1) {
			for (int j = waves.size()-1; j >= 0; j--) {
				Wave wave = (Wave) waves.get(j);
				//Activating reflector nodes (if a wave reach it)
				if (dist(node.xpos,node.ypos,wave.xpos,wave.ypos) < float((2*node.radius)+wave.radius) && dist(node.xpos,node.ypos,wave.xpos,wave.ypos) != 0) {
					node.activated = true;
					node.acttime = millis();
				} else {
					//Deactivating delay
					if ((millis() - node.acttime) > (beattime * 4))
						node.activated = false;						
				}
			}
		}
		//Rotating node
		if ((node.type == 2) && (node.rotnode != -1)) {
			Node rotnode = (Node) nodes.get(node.rotnode);
			line (node.xpos,node.ypos,rotnode.xpos,rotnode.ypos);
		}
		node.display();
	}
	axis();
}

//Draw axis
void axis() {
	stroke(axcl);
	strokeWeight(1);
	//Y-axis
	for (int y=-width/2; y<=width/2; y+=2) {
		point (0,y);
		if (y%(width/20)==0) {
			line (-5,y,5,y);
		}
	}
	//X-axis
	for (int x=-height/2; x<=height/2; x+=2) {
		point (x,0);
		if (x%(height/20)==0) {
			line (x,-5,x,5);
		}
	}
}

//Distance calculation
float dist (int x1,int y1,int x2,int y2) {
	float distance = sqrt(pow ((x1 - x2),2) + pow ((y1 - y2),2));
	return distance; 
}

class Node {
	boolean activated = false; //Reactor node activated?
	int acttime; //Reactor node activated time in ms
	boolean selected = false; //Node selected for editing?
	int xpos,ypos; //Position of the node
	int radius = 10; //Radius of the node
	int pitch;
	int note; //1-16: 1 = 1/16th, 2 = 1/8th, 4 = 1/4th, 8 = 1/2nd, 16 = 1/1st
	int type; //Node type: 0-affector, 1-reactor, 2 rotator
	int rotnode; //Rotated node's number
	float freq;
	Node (int x, int y) {
		xpos = x;
		ypos = y;
		pitch = 69; //440 Hz
		note = 4;
		freq = basefreq*pow(2,pitch/12); //MIDI pitch to freq
		switch (mode) {
			//affector
			case 0:
				type=0;
			break;
			//Reactor
			case 1:
				type=1;
				activated=false;
			break;
			//Rotator
			case 2:
				type=2;
				activated=false;
				rotnode = -1;
			break;
		}
	}
	void display() {
		ellipseMode(RADIUS);
		rectMode(RADIUS);
		if (selected) {
			strokeWeight(2);
		} else {
			strokeWeight(1);
		}
		colorMode(HSB, 127);
		fill(pitch,127,127,95);
		stroke(ndcl);
		switch (type) {
			//affector
			case 0:
				ellipse (xpos,ypos,radius,radius);
			break;
			//Reactor
			case 1:
				beginShape();
					vertex(xpos,ypos+radius);
					vertex(xpos+radius,ypos);
					vertex(xpos,ypos-radius);
					vertex(xpos-radius,ypos);
				endShape(CLOSE);
			break;
			//Rotator pivot
			case 2:
				rect(xpos,ypos,radius,radius);
			break;
		}
		fill(ndcl);
		noStroke();
		switch (note) {
			case 2:
				ellipse (xpos,ypos,radius/5,radius/5);
			break;
			case 4:
				ellipse (xpos,ypos-radius/3,radius/5,radius/5);
				ellipse (xpos,ypos+radius/3,radius/5,radius/5);
			break;
			case 8:
				ellipse (xpos-radius/3,ypos+radius/3,radius/5,radius/5);
				ellipse (xpos+radius/3,ypos+radius/3,radius/5,radius/5);
				ellipse (xpos,ypos-radius/3,radius/5,radius/5);
			break;
			case 16:
				ellipse (xpos-radius/3,ypos-radius/3,radius/5,radius/5);
				ellipse (xpos+radius/3,ypos-radius/3,radius/5,radius/5);
				ellipse (xpos-radius/3,ypos+radius/3,radius/5,radius/5);
				ellipse (xpos+radius/3,ypos+radius/3,radius/5,radius/5);
			break;
		}
	}
}

class Wave {
	int xpos,ypos;
	int radius;
	int power;
	int pitch;
	Wave (int x, int y, int p) {
		xpos = x;
		ypos = y;
		pitch = p;
		radius = 10;
		power = 100;
	}
	void display() {
		colorMode(HSB, 127);
		stroke(pitch,127,127,power);
		strokeWeight(1);
		noFill();
		ellipse (xpos,ypos,radius,radius);		
		radius++;
		if (radius>30) {
			power--;
		}
	}
}

class Timer {
	int savedTime; // When Timer started
	int totalTime; // How long Timer should last
	Timer(int tempTotalTime) {
		totalTime = tempTotalTime;
	}
	// Starting the timer
	void start() {
		// When the timer starts it stores the current time in milliseconds.
		savedTime = millis(); 
	}
	// The function isFinished() returns true if 5,000 ms have passed. 
	// The work of the timer is farmed out to this method.
	boolean isFinished() { 
		// Check how much time has passed
		int passedTime = millis()- savedTime;
		if (passedTime > totalTime) {
			return true;
		} else {
			return false;
		}
	}
}

void mouseClicked() {
	//Create node
	if ((mode == 0) || (mode == 1) || (mode == 2)) {
		if (nodes.size()==0) {
			nodes.add(new Node(mouseX-(width/2),mouseY-(height/2)));
		} else {
			int j = 0;
			for (int i = nodes.size()-1; i >= 0; i--) {
				Node node = (Node) nodes.get(i);
				if (dist(node.xpos,node.ypos,mouseX-(width/2),mouseY-(height/2)) < float((2 * node.radius)+4)) {
					j++;
				}
			}
			if (j == 0) {
				nodes.add(new Node(mouseX-(width/2),mouseY-(height/2)));
			}
		}
	}
	//Remove node
	if (mode == 8) {
		for (int i = nodes.size()-1; i >= 0; i--) {
			Node node = (Node) nodes.get(i);
			if (dist(node.xpos,node.ypos,mouseX-(width/2),mouseY-(height/2)) < float(2 * node.radius)) {
				nodes.remove(i);
			}
		}
	}
}

void mousePressed() {
	//Select node
	if (mode==9) {
		for (int i = nodes.size()-1; i >= 0; i--) {
			Node node = (Node) nodes.get(i);
			if (dist(node.xpos,node.ypos,mouseX-(width/2),mouseY-(height/2)) < float(2 * node.radius)) {
				//If we select a node before...
				if (lastselnode != -1) {
					Node oldnode = (Node) nodes.get(lastselnode);
					//If the old node is an rotator pivot...
					if (oldnode.type == 2) {
						//The rotator pivot's rotating node
						oldnode.rotnode = i;
					}
				}
				node.selected = true;
				selnode = i;
				lastselnode = selnode;
			} else {
				node.selected = false;
				selnode = -1;
			}
		}
	}	
}

void mouseDragged() {
	for (int i = nodes.size()-1; i >= 0; i--) {
		Node actnode = (Node) nodes.get(i);
		//Selected node?
		if (actnode.selected) {
			for (int j = nodes.size()-1; j >= 0; j--) {
				Node node = (Node) nodes.get(j);
				//If no collision with other nodes
				if (dist(node.xpos,node.ypos,mouseX-(width/2),mouseY-(height/2)) > float(2 * node.radius)) {
					actnode.xpos = mouseX-(width/2);
					actnode.ypos = mouseY-(height/2);
				}
			}
		}
	}
}

void mouseReleased() {
	selnode = -1;
}

void keyPressed() {
	switch (key) {
		case '0':
			for (int i = nodes.size()-1; i >= 0; i--) {
				nodes.remove(i);
			}
		break;
		case '1':
			mode = 0;
		break;
		case '2':
			mode = 1;
		break;
		case '3':
			mode = 2;
		break;
		case '8':
			mode = 8;
		break;
		case '9':
			mode = 9;
		break;
			
	}
	if (mode==9) {
		for (int i = nodes.size()-1; i >= 0; i--) {
			Node actnode = (Node) nodes.get(i);
			if (actnode.selected) {
				//Pitch
				if ((key == 's') || (key == 'S')) {
					actnode.pitch--;
					actnode.pitch=constrain(actnode.pitch,0,127);
				}
				if ((key == 'a') || (key == 'A')) {
					actnode.pitch++;
					actnode.pitch=constrain(actnode.pitch,0,127);
				}
				//Note
				if ((key == 'q') || (key == 'Q')) {
					actnode.note = actnode.note/2;
					actnode.note = constrain(actnode.note,1,16);
				}
				if ((key == 'w') || (key == 'W')) {
					actnode.note = actnode.note*2;
					actnode.note = constrain(actnode.note,1,16);
				}
				//Moving with cursor keys
				for (int j = nodes.size()-1; j >= 0; j--) {
					Node node = (Node) nodes.get(j);
					if (key == CODED) {
						if (keyCode == UP) {
							if ((dist(node.xpos,node.ypos,actnode.xpos,(actnode.ypos-1)) > float(2 * node.radius)) || (i == j)) {
								actnode.ypos--;
							}
						}
						if (keyCode == DOWN) {
							if ((dist(node.xpos,node.ypos,actnode.xpos,(actnode.ypos+1)) > float(2 * node.radius)) || (i == j)) {
								actnode.ypos++;
							}
						}
						if (keyCode == LEFT) {
							if ((dist(node.xpos,node.ypos,(actnode.xpos-1),actnode.ypos) > float(2 * node.radius)) || (i == j)) {
								actnode.xpos--;
							}
						}
						if (keyCode == RIGHT) {
							if ((dist(node.xpos,node.ypos,(actnode.xpos+1),actnode.ypos) > float(2 * node.radius)) || (i == j)) {
								actnode.xpos++;
							}
						}
					}
				}
			}
		}
	}
}



