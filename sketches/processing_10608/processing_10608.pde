
private BasicSmoke smok;
private BasicSmoke smok2;

public static float vfloatCurrentTargetSpeed = 0.3f;
public static float vdoubleCurrentTargetSpeed = 0.3f;

void setup() {
        
        print(this.getClass().getName());
  
	size(320,240);
	background(0);
	stroke(0);
	smooth();
        smok = new BasicSmoke(this, 1500, false);
	smok.setColor(0, 200, 255);
	
	smok2 = new BasicSmoke(this, 500, true);
	smok2.setColor(255, 50, 0);
}

void draw() {
	
	fill(0,45);
	noStroke();
	rect(0,0,width,height);
	//background(255);

	float rmx = (float) mouseX / (float) width;
	float rmy = (float) mouseY / (float) height;
	float rpmx = (float) pmouseX / (float) width;
	float rpmy = (float) pmouseY / (float) height;
		
	smok.update(rmx, rmy, rpmx, rpmy);
	//smok2.update(rmx+0.05f, rmy, rpmx+0.05f, rpmy);
		
}


public class BasicSmoke {
	
	private float red = 0;
	private float green = 0;
	private float blue = 0;
	
	private PApplet parent;
	private ArrayList grains;
	
	private vdouble ma;
	
	private boolean continuous;
	private int numGrains;
	
	public BasicSmoke(PApplet parent, int numGrains, boolean continuous) {
		this.parent = parent;
		this.continuous = continuous;
		this.numGrains = numGrains;
		grains = new ArrayList();
		if (continuous) {
			for (int i=0; i<numGrains; i++) {
				grains.add(new Grain(0.5f, 0.5f));
			}
		}
		ma = new vdouble(-Math.PI*0.5, true);
		ma.isAngle(true);
	}
	
	public void update(float x, float y, float px, float py) {
		
		float d = 0;
		double a = 0;
		if (px > 0 && py > 0 && (px != x|| py != y)) {
			d = PApplet.dist(x,y,px,py);
			a = Math.atan2( y - py, x - px );
			ma.set(a);
		} else {
			ma.set(-Math.PI*0.5 + (Math.random()*0.05 - 0.025));
		}
		
		ma.update();
		
		if (px > 0 && py > 0 && (px != x|| py != y)) {
			if (!continuous && grains.size() < numGrains) { 
				Grain g = new Grain(x, y);
				g.set(x,y, ma.get());
				grains.add(g);
			} else if (!continuous) {
				for (int i=0; i<grains.size(); i++) {
                                        Grain g = (Grain) grains.get(i); 
					if (g.getEnergy() < 0) {
						g.set(x,y, ma.get());
						break;
					}
				}
			}
		}
		
		/*
		parent.noFill();
		parent.stroke(255,0,255);
		parent.line(
				(float) parent.width*0.5f, (float) parent.height*0.5f,
				(float) parent.width*(0.5f + (float) Math.cos(ma.get())*0.05f),
				(float) parent.height*(0.5f + (float) Math.sin(ma.get())*0.05f)
		);
		*/
		
		parent.noStroke();
		for (int i=0; i<grains.size(); i++) {
			Grain g = (Grain) grains.get(i); 
			g.update();
			if (parent.pmouseX > 0 && parent.pmouseY > 0) {
				if (continuous) {
					if (g.getEnergy() < 0) {
						g.set(x,y, ma.get());
					}
				}
			} else {
				if (continuous) {
					if (g.getEnergy() < 0) {
						g.set(0.5f, 0.5f);
					}
				}
			}
			if (g.getEnergy() > 0) {
				parent.fill(red, green, blue ,10f*g.getEnergy());
				parent.ellipse(g.getX()*(float) parent.width, g.getY()*(float) parent.height, (30f*(1f-(g.getEnergy()*g.getEnergy())))+4f, (30f*(1f-(g.getEnergy()*g.getEnergy())))+4f);
			}
			
		}
	}
	
	public void setColor(float red, float green, float blue) {
		this.red = red;
		this.green = green;
		this.blue = blue;
	}
	
}

public class Grain {
	
	private float energy = 1;
	
	private vdouble a;
	private vfloat d;
	
	private float x;
	private float y;
	
	public Grain(float x, float y) {
		set(x, y);
	}
	
	public void set(float x, float y) {
		this.energy = 1;
		this.x = x;
		this.y = y;
		a = new vdouble(-Math.PI*0.5 + (Math.random()*0.05 - 0.025), true);
		a.isAngle(true);
		a.setSpeed(0.04f);
		d = new vfloat((float) (0.001 + Math.random()*0.002), true);
		d.setSpeed(0.1f+(float) (Math.random()*0.09));
	}
	
	public void set(float x, float y, double a) {
		set(x, y);
		this.a.force(a);
		this.a.set(-Math.PI*0.5 + (Math.random()*0.05 - 0.025));
	}
	
	public void update() {
		a.update();
		d.update();
		x += Math.cos(a.get())*d.get();
		y += Math.sin(a.get())*d.get();
		energy -= d.get()*2f;
	}
	
	public void update(float sourcex, float sourcey, double sourcea, float sourced) {
		update();
		//a.set(sourcea);
		//d.set(sourced);
	}

	public float getEnergy() {
		return energy;
	}

	public float getX() {
		return x;
	}

	public float getY() {
		return y;
	}
		
}

public interface vfloatparent {

	public float getfloatspeed();
	
}

public class vfloat {
	
	private vfloatparent parent = null;

	private float target;
	private float current;
	private float additionalTarget;
	private float additional;
	
	private float speed;
	
	public vfloat(float value, boolean startAtTarget) {
		this.target = value;
		if (startAtTarget) { this.current = value; } 
		else { this.current = 0; }
		this.additionalTarget = 0;
		this.additional = 0;
		this.speed = vfloatCurrentTargetSpeed;
	}
	
	public vfloat(vfloatparent parent, float value, boolean startAtTarget) {
		this.parent = parent;
		this.target = value;
		if (startAtTarget) { this.current = value; } 
		else { this.current = 0; }
		this.additionalTarget = 0;
		this.additional = 0;
		this.speed = vfloatCurrentTargetSpeed;
	}
	
	public void update() {
		additional = 0;
		if (current != (target+additionalTarget)) { 
			if (parent != null) {
				current += ((target+additionalTarget)-current) * speed * parent.getfloatspeed();
			} else {
				current += ((target+additionalTarget)-current) * speed;
			}
		
		}
	}
	
	public void set(float value) {
		this.target = value;
	}
	
	public void add(float value) {
		this.target += value;
	}
	
	public void force(float value) {
		this.target = value;
		this.current = value;
	}
	
	public void pervertCurrent(float value) {
		this.current = value;
	} 
	
	public void setAdditionalTarget(float value) {
		this.additionalTarget = value;
	}
	
	public void setAdditional(float value) {
		this.additional += value;
	}
	
	public float getCurrent() {
		return current;
	}
	
	public float get() {
		return current + additional;
	}

	public void setSpeed(float speed) {
		this.speed = speed;
	}

}

public interface vdoubleparent {

	public double getdoublespeed();
	
}

public class vdouble {

	private vdoubleparent parent = null;
	
	private double target;
	private double current;
	private double additionalTarget;
	private double additional;
	
	private double speed;
	
	private boolean angle;
	
	public vdouble(double value, boolean startAtTarget) {
		this.angle = false;
		this.target = value;
		if (startAtTarget) { this.current = value; } 
		else { this.current = 0; }
		this.additionalTarget = 0;
		this.additional = 0;
		this.speed = vdoubleCurrentTargetSpeed;
	}
	
	public vdouble(vdoubleparent parent, double value, boolean startAtTarget) {
		this.parent = parent;
		this.angle = false;
		this.target = value;
		if (startAtTarget) { this.current = value; } 
		else { this.current = 0; }
		this.additionalTarget = 0;
		this.additional = 0;
		this.speed = vdoubleCurrentTargetSpeed;
	}
	
	public void update() {
		if (current != target) { 
			if (angle) {
				double c1 = Math.cos(current);
				double s1 = Math.sin(current);					
				double s2 = Math.sin(target+additionalTarget);
				double c2 = Math.cos(target+additionalTarget);
				if (parent != null) {
					c1 += (c2 - c1) * speed * parent.getdoublespeed();
					s1 += (s2 - s1) * speed * parent.getdoublespeed();
				} else {
					c1 += (c2 - c1) * speed;
					s1 += (s2 - s1) * speed;
				}
				current = Math.atan2(s1, c1);
			} else {
				if (parent != null) {
					current += (target-current) * speed * parent.getdoublespeed();
				} else {
					current += (target-current) * speed;
				}
			}
		}
		additional = 0;
	}
	
	public void set(double value) {
		this.target = value;
	}
	
	public void add(double value) {
		this.target += value;
	}
	
	public void force(double value) {
		this.target = value;
		this.current = value;
	}
	
	public void pervertCurrent(double value) {
		this.current = value;
	} 
	
	public void setAdditional(double value) {
		this.additional += value;
	}
	
	public void setAdditionalTarget(double value) {
		this.additionalTarget = value;
	}
	
	public double getCurrent() {
		return current;
	}
	
	public double get() {
		return current+additional;
	}

	public void setSpeed(float speed) {
		this.speed = speed;
	}

	public void isAngle(boolean angle) {
		this.angle = angle;
	}

}

