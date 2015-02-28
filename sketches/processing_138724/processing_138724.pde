
int screenW, screenH, screenD, smallBodyCount, bigBodyCount;
ArrayList<AstronomicalObject> system;

public void init(){
 // to make a frame not displayable, you can
 // use frame.removeNotify()

 frame.removeNotify();
 frame.setUndecorated(true);

 // addNotify, here i am not sure if you have
 // to add notify again.
 //  frame.addNotify();
 // frame.removeNotify();
 super.init();
}

void setup() 
{
	frameRate(30);
	//screenW = 854;
	//screenH = 480;
	screenW = displayWidth;
	screenH = displayHeight;
	frame.setLocation(0,0);
	screenD = screenH;
	smallBodyCount = 1000;
	bigBodyCount = 0;
	size(screenW, screenH, P3D);
	//smooth();
	system = new ArrayList<AstronomicalObject>();
	for (int i = 0; i < smallBodyCount; ++i)
	{
		system.add(new AstronomicalObject((int)random(1,5),5));
	}
	for (int i = 0; i < bigBodyCount; ++i)
	{
		system.add(new AstronomicalObject((int)random(5,15),15,screenW/2,screenH/2,-screenD/2));
	}
}

void draw()
{
	background(200);
	//lights();
	for (int i = 0; i < screenW; i+=25)
	{
		stroke(204);
		line(i, screenH, 0, i, screenH, -screenD);
		line(i, 0, 0, i, 0, -screenD);
	}
	for (int i = 0; i < screenH; i+=25)
	{
		line(0, i, 0, 0, i, -screenD);
		line(screenW, i, 0, screenW, i, -screenD);
	}
	for (int i = 0; i < screenW; i+=25)
	{
		line(i, 0, -screenD, i, screenH, -screenD);
	}
	//sphereDetail(10);
	for (AstronomicalObject a : system)
	{
		for (AstronomicalObject b : system)
		{
			if (a == b) continue;
			else
			{
				a.update(b);
			}
		}
	}
	saveFrame("D:/DOCUMENTS/sketchbook/gravity/frames/line-######.jpg");
}


public class AstronomicalObject implements ICollidable
{
	PVector position, velocity, acceleration;
	int mass, radio;
	float angle;
	color myColor;

	public AstronomicalObject ()
	{
		position = new PVector(random(screenW/4,screenW*3/4),random(screenH/4,screenH*3/4),random(-screenW/4,-screenW*3/4));
		velocity = new PVector(0,0,0);
		acceleration = new PVector (0,0,0);
		mass = (int)random(5,15);
		radio = (int)random(5,mass*3);
		myColor = color(100);
	}

	public AstronomicalObject(int mass, int radio)
	{
		position = new PVector(random(screenW/4,screenW*3/4),random(screenH/4,screenH*3/4),random(-screenW/2,screenW/2));
		velocity = new PVector(0,0,0);
		acceleration = new PVector (0,0,0);
		this.mass = mass;
		this.radio = radio;
		myColor = color(100);
	}
	public AstronomicalObject(int mass, int radio, float x, float y, float z)
	{
		position = new PVector(x,y,z);
		velocity = new PVector(0,0,0);
		acceleration = new PVector (0,0,0);
		this.mass = mass;
		this.radio = radio;
		myColor = color(255,100,50);
	}	

	public void update(AstronomicalObject a)
	{
		angle = PVector.angleBetween(this.position,a.position);
		if (position.x >= a.position.x)
		{
			acceleration.x -= cos(angle);
		}
		else
		{
			acceleration.x += cos(angle);
		}
		if (position.y >= a.position.y)
		{
			acceleration.y -= sin(angle);
		}
		else
		{
			acceleration.y += sin(angle);
		}
		if (position.z >= a.position.z)
		{
			acceleration.z -= tan(angle);
		}
		else
		{
			acceleration.z += tan(angle);
		}
		acceleration.setMag( (0.005)*a.mass*this.mass/(this.position.dist(a.position)*this.position.dist(a.position)));
		velocity.add(acceleration);
		position.add(velocity);

        display();
	}

	private void display()
	{
		pushMatrix();
		translate(position.x, position.y, position.z);
		noStroke();
		fill(myColor);
  		//sphere(radio);
  		ellipse(0, 0, radio, radio);
		popMatrix();
	}

	public boolean hasCollide(Object o)
	{
		return true;
	}

}
public interface ICollidable
{
	public boolean hasCollide(Object o);
}


