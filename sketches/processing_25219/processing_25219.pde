

import japplemenubar.*;



	ArrayList movers = new ArrayList();
	int numParticles = 10000;

	public void setup()
	{
		
		size(500, 500);

		for (int i = 0; i < numParticles; i++)
		{
			movers.add(new Mover());
		}
	

	}

	public void draw()
	{
		ellipse(10, 10, 50, 50);
		ellipseMode(10);

		noStroke();
		background(255);
		// fill(255, 50);
		// rect(0, 0, width, height);

		for (int i = 0; i < numParticles; i++)
		{
			Mover mover = (Mover)movers.get(i);
			mover.run();
		}

	}

	class Mover
	{

		PVector location;
		PVector velocity;
		PVector acceleration;
		float mass;
		PVector randomKeyPos;
		float force;
		int r, g, b;

		Mover()
		{
			location = new PVector(random(width), random(height));
			velocity = new PVector(0, 0);
			mass = random(2, 11);
			randomKeyPos = getRandomPlace();
			force = (float)-0.01 * mass;
			r = (int)mass * 5 + 55;
			g = (int)mass * 5 + 55;
			b = (int)mass * 10 + 55;
		}

		void run()
		{
			update();
			display();
		}

		void update()
		{

			PVector mouse = new PVector(mouseX, mouseY);
			PVector mouseDir;
			PVector keyDir;

			acceleration = acceleration.mult(velocity, force);

			velocity.add(acceleration);

			if (mousePressed)
			{
				mouseDir = PVector.sub(mouse, location);
				mouseDir.normalize();

				mouseDir.div((float)2);

				acceleration = mouseDir;
				velocity.add(acceleration);
			}

			if (keyPressed)
			{

				keyDir = PVector.sub(randomKeyPos, location);
				keyDir.normalize();
				keyDir.mult((float)0.5);

				acceleration = keyDir;
				velocity.add(acceleration);
			}

			location.add(velocity);
		}

		void display()
		{
			stroke(r, g, b);
			point(location.x, location.y);
		}

		PVector getRandomPlace()
		{
			PVector randol, randor, randou, randod;

			randol = new PVector(random(100, 400), random(50, 100));
			randor = new PVector(random(100, 400), random(150, 200));
			randou = new PVector(random(100, 400), random(250, 300));
			randod = new PVector(random(100, 400), random(350, 400));

			int x = (int)random(1, 5);
			PVector rando = new PVector();
			switch (x)
			{
				case 1 :
					rando = randol;
					break;
				case 2 :
					rando = randor;
					break;
				case 3 :
					rando = randou;
					break;
				case 4 :
					rando = randod;
					break;
				default :
					break;
			}
			return rando;
		}
	}


