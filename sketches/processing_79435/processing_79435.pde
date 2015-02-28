
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;
import controlP5.*;

int guiX, guiY, guiScale;
float guiStrength;

SpringMesh sm;
VerletParticle2D pDrag;
boolean isDragging;

void setup() {
	size(800, 800);
	colorMode(RGB, 255);
	smooth();

	initGUI();
	initPhysics();

	sm = new SpringMesh(guiX, guiY, guiScale, guiStrength);
	pDrag = new VerletParticle2D(0, 0);
	isDragging = false;
}

void draw() {
	background(224);

	pushMatrix();
	translate(width/2, height/2);
	
	noStroke();
	fill(160);
	if (isDragging) {
		pDrag.lock();
		pDrag.x = mouseX-width/2;
		pDrag.y = mouseY-height/2;
		ellipse(pDrag.x, pDrag.y, 16, 16);
	}

	stroke(32);
	sm.update();
	sm.render();

	stroke(128);
	line(24-width/2, height/2-24, width/2-24, height/2-24);
	popMatrix();
}

void mousePressed() {
	Vec2D loc = new Vec2D(mouseX-width/2, mouseY-height/2);
	VerletParticle2D p = sm.getNearestParticle(loc);

	if (dist(loc.x, loc.y, p.x, p.y) < 12) {
		isDragging = true;
		pDrag = p;
	}
}

void mouseReleased() {
	isDragging = false;
	if (pDrag != sm.ps.get(0) && pDrag != sm.ps.get(sm.dimX-1)) {
		pDrag.unlock();
	}
}

