

	PGraphics graphics;
	private PGraphics mask;

	 void setup() {
		super.setup();
		size(500,500);
		background(0);
		noStroke();
		
		imageMode(CENTER);
		mask = createMask();
		
		
	}
	

	public void draw() {
		fill(0,3);
		rect(0, 0, width, height);
		PGraphics particle = createParticle(mask);
		int size = (int)random(width);
		blend(particle, 0, 0, particle.width, particle.height, (int)random(width)-size/2, (int)random(height)-size/2, size, size, ADD);
	}
	
	private PGraphics createParticle(PGraphics mask) {
		PGraphics particle = createGraphics(mask.width, mask.height, P2D);
		particle.beginDraw();
		particle.background(random(5,255),random(5,255),random(5,255));
		particle.mask(mask);
		particle.endDraw();
		return particle;
	}
	private PGraphics createMask() {
		PGraphics graphics = this.createGraphics(100, 100, P2D);
		float blurLevel = 3f;
		graphics.beginDraw();
		graphics.fill(255);
		graphics.noStroke();
		graphics.ellipse(graphics.width/2, graphics.height/2, graphics.width/blurLevel, graphics.height/blurLevel);
		graphics.filter(BLUR, blurLevel);
		graphics.endDraw();
		return graphics;
	}

