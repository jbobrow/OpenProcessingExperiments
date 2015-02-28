

import java.util.ArrayList;

import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

import processing.opengl.*;

	VerletPhysics2D physics;

	int total = 2000;

	ArrayList particles = new ArrayList();
	ArrayList points = new ArrayList();


	public void setup() {

		size(900, 500, P2D);

		background(0);

		physics = new VerletPhysics2D();
		physics.setDrag(0.65f);
		physics.setWorldBounds(new Rect(-10, -10, width + 20, height + 20));

		for (int a = 0; a < 15; a++) {
			AttractorPoint point = new AttractorPoint();
			point.x = random(width / 2 - 100, width / 2 + 100);
			point.y = random(height / 2 - 100, height / 2 + 100);
			point.speedY = random(-1, 1) * 15;
			point.speedX = random(-1, 1) * 15;
			point.width = width + 20;
			point.height = height + 20;
			point.size = 2;
			points.add(points.size(), point);
			point.center = new Vec2D(width / 2, height / 2);
			point.attractor = new AttractionBehavior(point.center, random(150,
					350), -3f);
			physics.addBehavior(point.attractor);
		}

		for (int i = 0; i < total; i++) {
			Particle p = new Particle(Vec2D.randomVector().scale(10)
					.addSelf(random(width), random(height)));
			physics.addParticle(p);

			p.init();
			particles.add(particles.size(), p);
		}
	}

	public void draw() {

		background(0);

		noStroke();

		physics.update();

		for (int b = 0; b < height; b++) {
			if (b % 5 == 0) {
				noFill();
				strokeWeight(1);
				stroke(30);
				line(0, b, width, b);
			}
		}

		for (int i = 0; i < particles.size(); i++) {
			Particle p = (Particle) particles.get(i);
			p.draw();
		}

		for (int a = 0; a < points.size(); a++) {
			AttractorPoint point = (AttractorPoint) points.get(a);
			point.center.set(point.x, point.y);
			point.draw();
		}


	}


class Particle extends VerletParticle2D {

	Vec2D[] steps;
	Vec2D v;

	private int i;

	private float alpha, alphaSpeed, size;

	private float prevX;
	private float prevY;

	float r, g, b;

	Particle(Vec2D loc) {
		super(loc);
	}

	public void init() {

		alphaSpeed = random(2, 10);

		size = random(1, 3);

		int total = (int) random(2, 20);
		steps = new Vec2D[total];

		for (int a = 0; a < steps.length; a++) {
			steps[a] = new Vec2D(x, y);
		}

		i = 0;
		alpha = 0;
	}

	public void draw() {

		if (i == steps.length - 1) {

			steps[i].x = x;
			steps[i].y = y;

			for (int a = 0; a < steps.length - 1; a++) {
				Vec2D v = (Vec2D) steps[a];
				Vec2D v2 = (Vec2D) steps[a + 1];
				v.x = v2.x;
				v.y = v2.y;
			}

			if (alpha < 255) {
				alpha += alphaSpeed;
			}

		} else {
			i++;
			steps[i].x = x;
			steps[i].y = y;
		}

		if ((y > height) || (y <= -10) || (x > width) || (x <= -10)) {
			set(new Vec2D(
			random(width / 2 - 50, width / 2 + 50),
		    random(height / 2 - 50, height / 2 + 50)));
			update();
			init();
			draw();

		} else {

			for (int a = 0; a < steps.length - 1; a++) {

				Vec2D v = (Vec2D) steps[a];
				Vec2D v2 = (Vec2D) steps[a + 1];

				b = map(v.y, 50, height, 0, 250);
				g = map(v.x, 50, width, 0, 50);
				r = 140;

				noFill();
				strokeWeight(size);
				stroke(r, g, b, alpha - ((255 / steps.length) * a));
				line(v2.x, v2.y, v.x, v.y);

			}

		}

	}
}

class AttractorPoint {

	float x;
	float y;
	float speedX;
	float speedY;
	float width;
	float height;
	int size;
	Vec2D center;
	AttractionBehavior attractor;

	public void draw() {

		x = x + speedX;
		y = y + speedY;

		if ((x > width - size) || (x <= 0)) {
			speedX = -speedX;
		}

		if ((y > height - size) || (y <= 0)) {
			speedY = -speedY;
		}

	}

}


