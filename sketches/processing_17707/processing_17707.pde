

import processing.core.*;
import traer.physics.*;


ParticleSystem physics;
Particle p1,p2;
Spring spring;
PImage img;
ArrayList<NutritionalValue> nutritionalValues;
NutritionalValue selected = null;
PFont font;
int radius;

public void setup() 
{
	size(800,650);
	smooth();
	img = loadImage("banana.jpg");
	font = loadFont("RotisSemSerBol.vlw");
	physics = new ParticleSystem();
	nutritionalValues = new ArrayList<NutritionalValue>();
	radius = 120;
	createBanana();
}

public void createBanana()
{
	Particle p1,p2 = null;
	nutritionalValues.add(new NutritionalValue("Energy", "95 Kcal"));
	p1 = physics.makeParticle(1, 149, 79, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 90, 250, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)150 );
	
	nutritionalValues.add(new NutritionalValue("Proteins", "1,06 gr"));
	p1 = physics.makeParticle(1, 250, 182, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 178, 327, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)250 );
	
	nutritionalValues.add(new NutritionalValue("Carbohydrates", "20,80 gr"));
	p1 = physics.makeParticle(1, 78, 524, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 106, 323, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)130 );

	nutritionalValues.add(new NutritionalValue("Fiber", "2,55 gr"));
	p1 = physics.makeParticle(1, 235, 566, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 178, 378, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)170 );
	
	nutritionalValues.add(new NutritionalValue("Calcium", "7,30 mg"));
	p1 = physics.makeParticle(1,341, 236, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 269, 345, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)150 );	
	
	nutritionalValues.add(new NutritionalValue("Potassium", "370 mg"));
	p1 = physics.makeParticle(1,425,123, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 455, 340, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)280 );	
	
	nutritionalValues.add(new NutritionalValue("Magnesium", "36,40 mg"));
	p1 = physics.makeParticle(1, 412, 576, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 280, 408, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)200 );	
	
	nutritionalValues.add(new NutritionalValue("Vitamin A", "38 ug"));
	p1 = physics.makeParticle(1, 550, 553, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 548, 409, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)150 );		
	
	nutritionalValues.add(new NutritionalValue("Vitamin C", "11,50 mg"));
	p1 = physics.makeParticle(1, 713, 464, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 606, 311, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)150 );
	
	nutritionalValues.add(new NutritionalValue("Vitamin D", "0,3 mg"));
	p1 = physics.makeParticle(1, 519, 58, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setParticle(p1);
	p2 = physics.makeParticle(1, 629, 196, 0);
	nutritionalValues.get(nutritionalValues.size()-1).setAnchor(p2);
	p2.makeFixed();
	physics.makeSpring( p1, p2, (float)0.5, (float)0.3, (float)120 );		
}

public void draw() 
{
	background(255);
	image(img,0,0);
	
	physics.tick();

	for(int i = 0; i < physics.numberOfSprings(); i++)
	{
		Spring s = physics.getSpring(i);
		Particle p1 = s.getOneEnd();
		Particle p2 = s.getTheOtherEnd();
		line(p1.position().x(),p1.position().y(),p2.position().x(),p2.position().y());
	}
	
	
	for(int i = 0; i < physics.numberOfParticles(); i++)
	{
		Particle p = physics.getParticle(i);
		fill(212,168,37);
		if(isNutritional(p))
		{
			if(isSelected(p))
			{
				fill(0);
				ellipse(p.position().x(), p.position().y(), radius+10, radius+10);
				fill(212,168,37);
			}
			
			NutritionalValue n = getNutritionalValue(p);

			fill(212,168,37);
			ellipse(p.position().x(), p.position().y(), radius, radius);
			
			fill(0);
			int tamTitle = 16;
			String title = n.name;
			textFont(font, tamTitle);
			float constantText = 27;
			float margin = ((float)(title.length()*tamTitle) / (float)radius) * constantText;
			
			text(title, p.position().x()-margin ,p.position().y()-10);
			title = n.value;
			margin = ((float)(title.length()*tamTitle) / (float)radius) * constantText;
			text(title, p.position().x()-margin ,p.position().y()+15);
		}
		else
		{
			ellipse(p.position().x(), p.position().y(), 10, 10);
		}

	}

}	

public boolean isNutritional(Particle p)
{
	NutritionalValue n = getNutritionalValue(p);
	if(n != null)
		return true;
	else
		return false;
}

public NutritionalValue getNutritionalValue(Particle p)
{
	for(int i = 0; i < nutritionalValues.size(); i++)
	{
		NutritionalValue n = nutritionalValues.get(i);
		if(n.particle == p)
			return n;
	}		
	return null;
}

public boolean isSelected(Particle p)
{
	NutritionalValue n = getNutritionalValue(p);
	if(n == selected)
		return true;
	else 
		return false;
}

public void mousePressed()
{
	for(int i = 0; i < nutritionalValues.size(); i++)
	{
		Particle p = nutritionalValues.get(i).getParticle();
		float distance = sqrt(pow(p.position().x()-mouseX,2) + pow(p.position().y()-mouseY,2));
		if(distance < (float)radius/2)
			selected = nutritionalValues.get(i);
	}		
	
	if(selected != null)
	{
		selected.getParticle().makeFixed(); 
		selected.getParticle().position().set( mouseX, mouseY, 0 );
	}
}

public void mouseDragged()
{
	if(selected != null)
	{
		selected.getParticle().position().set( mouseX, mouseY, 0 );
	}
}

public void mouseReleased()
{
	if(selected != null)
	{
		selected.getParticle().makeFree(); 
	}
	selected = null;
}

class NutritionalValue
{
	public String name;
	public String value;
	Particle particle;
	Particle anchor;
	
	public NutritionalValue(String name, String value)
	{
		this.name = name;
		this.value = value;
		particle = null;
		anchor = null;
	}

	public void setParticle(Particle particle)
	{
		this.particle = particle;
	}
	
	public Particle getParticle()
	{
		return particle;
	}
	
	public void setAnchor(Particle anchor)
	{
		this.anchor = anchor;
	}
	
	public Particle getAnchor()
	{
		return anchor;
	}
}


