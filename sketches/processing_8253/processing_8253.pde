
class Blobb extends Particle
{
	int detail;
	float dia;
	float radius;
	PVector rotationSpeed = new PVector(random(-radians(1), radians(1)), random(-radians(1), radians(1)), random(-radians(1), radians(1)));
	PVector angles = new PVector(0,0,0);
	
	Blobb(float radius, PVector pos)
	{
		super(pos);
		this.detail = (int)random(2, 6);
		this.dia = random(100, 400);
		this.radius = radius;
	}
	
	void move()
	{
		pos.x+=(random(-4, 4));
		pos.y+=(random(-4, 4));
		pos.z+=(random(-4, 4));
		
		angles.x+=rotationSpeed.x;
		angles.y+=rotationSpeed.y;
		angles.z+=rotationSpeed.z;
		
		pos.x = constrain(pos.x, -radius+dia, radius-dia);
		pos.y = constrain(pos.y, -radius+dia, radius-dia);
		pos.z = constrain(pos.z, -radius+dia, radius-dia);
	}
	
	void drawDof(String mode)
	{
		calcDof();
		noFill();
		strokeWeight(dofi.x*2);
		if(mode=="RED")
			stroke(255, 0, 0, dofi.y/2);
		else if(mode=="GREEN")
			stroke(0, 160, 255, dofi.y/2);
		else
			stroke(255, dofi.y/2);
		
		pushMatrix();
		translate(pos.x, pos.y, pos.z);
		rotateX(angles.x);
		rotateY(angles.y);
		rotateZ(angles.z);
		sphereDetail(detail);
		sphere(dia);
		popMatrix();
	}
}

