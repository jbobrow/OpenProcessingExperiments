
class Asteroid extends FlyingObject {
	Polygon vertices;
	AsteroidFactory.Next next;
	int explodeSound;
	
    public Asteroid(AsteroidFactory.InitParams options, Polygon vertices, int points, AsteroidFactory.Next next, int explodeSound) {
    	super(options.x, options.y, vertices.getBounds().width, vertices.getBounds().height, options.dx, options.dy);
    	this.vertices = vertices;
    	this.points = points;
    	this.next = next;
    	this.explodeSound = explodeSound;
    }

	public boolean intersects(FlyingObject other) {
		if (other instanceof Asteroid) return false;
		return super.intersects(other);
	}
	
	public void collide(FlyingObject other, List add) {
		super.collide(other, add);
		
		sounds.explode(explodeSound);
		//println("blowing up asteroid sized" + this.explodeSound);
		
		if (next != null)
			next.go(this, add);
	}
	
    public void draw() {
        stroke(255);
        noFill();
        translate(x, y);
        beginShape();
		for (int i = 0 ; i < vertices.npoints ; i++)
			vertex(vertices.xpoints[i], vertices.ypoints[i]);
		endShape(CLOSE);
    }
}

