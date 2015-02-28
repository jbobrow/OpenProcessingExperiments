
float radius = 100;
PSphere ps1, ps2, ps3;

void setup()
{
	size(512, 512, OPENGL);	
	hint(DISABLE_DEPTH_TEST);
	background(255);
	noStroke();
	ps1 = new PSphere(radius*0.5, 360, 6, 70);
	ps2 = new PSphere(radius, 75, 5, 130);
	ps3 = new PSphere(radius*1.5, 45, 3, 240);
}

void draw()
{
	noStroke();
	fill(0,46);
	rect(0, 0, width, height);
	translate(width*0.5, height*0.5, 0);
	ps1.draw();
	ps2.draw();
	ps3.draw();
}
class PSphere
{
	ArrayList<PVector> vectors;
	float inc, inc2;
	float radius, pDist;
	int numAngles, angle;

	PSphere (float _radius, int _angle, int _numAngles, float _pDist)
	{
		radius = _radius;
		angle = _angle;
		numAngles = _numAngles;
		pDist = _pDist;
		inc = random(10);
		inc2 = 0.0;
	}

	void draw() 
	{
		float n1 = sin( radians(360*noise(inc)) + inc*2);
		rotateY(n1*frameCount * 0.001);
		rotateX(n1*frameCount * 0.001);
		rotateZ(n1*frameCount * 0.001);
		inc += 0.01;
		inc = inc >= 10 ? random(10) : inc;
		
		vectors = new ArrayList<PVector>();

		int i, j;
		float istep, jstep;
		istep = radians(angle)/numAngles;
		jstep = PI/numAngles;
		
		for(i=0;i<=numAngles;i++)
		{
			for(j=0;j<=numAngles;j++)
			{
				float n = radius + (noise(inc+i*j*0.1)*radius);
				
				float thisx = n*sin(istep*i)*sin(jstep*j);
				float thisy = -n*cos(jstep*j);
				float thisz = -n*cos(istep*i)*sin(jstep*j);

				pushMatrix();
				translate(thisx, thisy, thisz);
				fill(255);
				sphereDetail(5);
				sphere(3);
				popMatrix();

				if(vectors.size() > 0)
				{
					for (int _i = 0; _i<vectors.size(); _i++)
					{
						PVector p = (PVector)vectors.get(_i);
						float d = dist(thisx, thisy, thisz, p.x, p.y, p.z);
						if(d < pDist)
						{
							stroke(255, pDist+20-d);
							line(thisx, thisy, thisz, p.x, p.y, p.z);
						}
					}
				}

				vectors.add(new PVector(thisx, thisy, thisz));
			}
		}
	}
}


