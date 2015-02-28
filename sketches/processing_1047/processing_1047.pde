
class WorldField
{
	ArrayList things;
	
	WorldField()
	{
		things = new ArrayList();
	}
	
	public void addThings(int num)
	{
		for (int i = 0; i < num ; i++)
		{
			things.add(new Thingy(new PVector(random(0,width),random(0,height))));
		}
	}
	
	public void addThing(Thingy th)
	{
		things.add(th);
	}
	
	public void update()
	{
		for (int i = 0; i < things.size() ; i++)
		{
			Thingy t = (Thingy)things.get(i);
			
			if (t.dead)
			{
				t.loc = new PVector(random(width),random(height),random(0,1) * -2);
				t.live();				
			}
			else
			{
				PVector force = PVector.sub(t.loc, new PVector(mouseX,mouseY,-10));	
				
				PVector dis = force.get();
				dis.z = 0;
				
				float d = dis.mag();
				
				if (d < 2)
				{
					d = 2;
				}
				
				force.mult(9000.0 / sq(d));			
				t.applyForce(force);
						
				t.update();
			}
		}
	}
	
	public void display()
	{
		for (int i = 0; i < things.size() ; i++)
		{
			Thingy t = (Thingy)things.get(i);
			t.display();
		}
	}
}

