
float G = 10;
float c = 0.01; 
ParticleSystem particles;
Attractor attractor;
Attractor attractor2;
Attractor attractor3;
int numParticles = 5000;
float windMag = 0.004;
FlowField flow;


void setup(){ 
	size(800,600); 
	attractor = new Attractor(new PVector(width/2, height/2,0), 20);
	particles = new ParticleSystem(numParticles, attractor);
	attractor2 = new Attractor(new PVector(width/4, height/4,0), 40);
	attractor3 = new Attractor(new PVector(width/4*3, height*3/4,0), 1000);
	frameRate(25);
	flow = new FlowField(15);
	noSmooth();	
}
 
void draw()
{ 
	
	
	background(0);

 
 	
	if (frameCount%300 == 0)
	{
		flow.init();
	}
	particles.applyAttract(attractor, G);
	particles.applyAttract(attractor2,G);
	if (mousePressed)
	{
		if (mouseButton == LEFT)
		{
		attractor3.pos.x = mouseX;
		attractor3.pos.y = mouseY;
		particles.applyAttract(attractor3,G);
		}
		if (mouseButton == RIGHT)
	 	{
		attractor3.pos.x = mouseX;
		attractor3.pos.y = mouseY;
		particles.applyAttract(attractor3,-G);
		}
	}
		
	particles.applyWind(flow, windMag);
	particles.applyFriction(c);
	particles.update();
	particles.checkDead(attractor);
	attractor.draw();
	attractor2.draw();
	particles.draw();

} 
class Attractor
{
	float mass;
	PVector pos;
	
	Attractor(PVector _pos, float _mass)
	{
		pos = _pos.get();
		mass = _mass;
	
	}
	
	void draw()
	{
		ellipse(pos.x, pos.y, mass, mass);
	}
}

class FlowField {

  // A flow field is a two dimensional array of PVectors
  PVector[][] field;
  int cols, rows; // Columns and Rows
  int resolution; // How large is each "cell" of the flow field

  FlowField(int r) {
    resolution = r;
    // Determine the number of columns and rows based on sketch's width and height
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }

  void init() {
    // Reseed noise so we get a new flow field every time
    noiseSeed((int)random(10000));
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        // Use perlin noise to get an angle between 0 and 2 PI
        float theta = map(noise(xoff,yoff),0,1,-1.0*TWO_PI,TWO_PI);
        // Polar to cartesian coordinate transformation to get x and y components of the vector
        field[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }
  
  PVector lookup(PVector lookup) {
    int i = (int) constrain(lookup.x/resolution,0,cols-1);
    int j = (int) constrain(lookup.y/resolution,0,rows-1);
    return field[i][j].get();
  }


 void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawVector(field[i][j],i*resolution,j*resolution,resolution-2);
      }
    }

  }

  // Renders a vector object 'v' as an arrow and a location 'x,y'
  void drawVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(100);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    popMatrix();
  }
}
class Particle
{
	PVector pos;
	PVector acc;
	PVector vit;
	
	float mass;
	
	int lifespan;
	
	
	
	Particle()
	{
		pos = new PVector(random(0, width),random(0,height),0);
		acc = new PVector(0,0,0);
		vit = new PVector(0,0,0);
		mass = 0.1;
		lifespan = round( random(400,1000) );
		
	}

	
	Particle(PVector _pos, PVector _vit) // constructeur attracteur
	{
		pos = _pos.get();
		acc = new PVector(0,0,0);
		vit = _vit.get();
		vit.mult(1.5);
		lifespan = round( random(400,1000) );
		mass = 0.1;
		
		
		///
		//c = color(50+50*sin(PI*pos.x/width), 127, 255*sin(PI*pos.y/width));
		
		//
	}
	
	void applyForce(PVector force)
	{
		PVector f = PVector.div(force, mass);
		acc.add(f);
	}
	
	void applyWind(FlowField flow, float c)
	{
		PVector wind = flow.lookup(pos);
		wind.mult(c);
		applyForce(wind);	
	}	
	void applyFriction(float c)
	{
		float dragMag = magSq(vit);
		PVector drag = vit.get();
		drag.mult(-1);
		drag.normalize();
		drag.mult(c);
		drag.mult(dragMag);
		acc.add(drag);
	}
	

	
	void update()
	{
		lifespan--;
		vit.add(acc);
		pos.add(vit);
		acc.mult(0);	
	}	
	
	
	boolean isDead()
	{
		boolean ret = false;
		if (lifespan < 0)
			ret= true;
		if (lifespan >= 0)
		{
			if (pos.x > width | pos.x < 0 | pos.y < 0 | pos.y > height)
				ret= true;
			else
				ret= false;
		}
		return ret;
	}
	
	void applyAttract(Attractor attr, float G)
	{
		PVector pos1    = attr.pos.get();
		float 	mass1   = attr.mass;
		PVector f  	= PVector.sub(pos1, pos);
		float distance  = magSq(f);
		distance 		= constrain(distance, 2000,10000*1000);

		f.normalize();
		float strength  = G*mass*mass1/(distance);
		f.mult(strength);
	
		applyForce(f);
	}
	
	float magSq(PVector v)
	{
		return v.x*v.x+v.y*v.y+v.z*v.z;
	}
	
	void draw()
	{
		pushMatrix();
		stroke(100);
		ellipse(pos.x, pos.y, 1, 1);
		line(pos.x, pos.y, pos.x - 2*vit.x, pos.y - 2*vit.y);
		popMatrix();
/*		int x = pos.x;
		int y = pos.y;
	if ((x >= 0) && (x < width-1) && (y >= 0) && (y < height-1)) {
      int currC = currFrame[(int)x + ((int)y)*width];
      currFrame[(int)x + ((int)y)*width] = c;
	}*/
}
}
		
	
	
class ParticleSystem
{
	ArrayList<Particle> particles;
	Attractor attr;
	PVector gravity = new PVector(0, 1, 0);
	
	// variables forces
	
	ParticleSystem(int numParticles)
	{
		particles = new ArrayList();
		for (int i = 0; i< numParticles; i++)
		{
			particles.add(new Particle());	
		}
	}
	
	ParticleSystem(int numParticles, Attractor attractor)
	{
		attr = attractor;
		float radius = attractor.mass;
		particles = new ArrayList();
		PVector p = new PVector(0,0,0);
		PVector v = new PVector(0,0,0);
		float r ;
		for (int i = 0; i< numParticles; i++)
		{
			r = random(0,1);
			p.set( cos(TWO_PI*r), sin(TWO_PI*r),0 );
			p.mult(radius/2);
			p.add( attractor.pos );
			v = PVector.sub(p, attractor.pos);
			v.normalize();
			v.mult(5);
			particles.add(new Particle(p, v));	
		}
	}
	void applyForce(PVector force)
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.applyForce(force);	
		}		
	}
	

	
	void applyGravity()
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.applyForce(gravity);	
		}	
	}
	
	void applyWind(FlowField flow, float c)
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.applyWind(flow, c);	
		}
	}
	
	void applyFriction(float c)
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.applyFriction(c);	
		}
	}
	
	void addParticle(Attractor attr, int nbr)
	{
		attr = attractor;
		float radius = attractor.mass;
		PVector p = new PVector(0,0,0);
		PVector v = new PVector(0,0,0);
		float r ;
		for (int i = 0; i< nbr;i++)
		{
			r = random(0,1);
			p.set( cos(TWO_PI*r), sin(TWO_PI*r),0 );
			p.mult(radius/2);
			p.add( attractor.pos );
			v = PVector.sub(p, attractor.pos);
			v.normalize();
			v.mult(5);
			particles.add(new Particle(p, v));	
		}
	}
	
	void checkDead(Attractor attr)
	{
		int nbr=0;
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			if (particle.isDead())
			{
				particles.remove(i);	
				nbr++;
			}
		}
		
		if (nbr > 0)
	 		addParticle(attr, nbr);
	}
	
	void applyAttract(Attractor attract, float G)
	{
		
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.applyAttract(attract, G);	
		}
	}
	
	void update()
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.update();	
		}
	}
	
	void draw()
	{
		for (int i = 0; i<particles.size(); i++)
		{
			Particle particle = (Particle) particles.get(i);
			particle.draw();
		}
	}
		
}


