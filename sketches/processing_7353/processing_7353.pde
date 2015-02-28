
// Wanted to make this a subclass of PGraphics, but had instantation problems
// despite following recommendations at
// http://dev.processing.org/reference/core/javadoc/processing/core/PGraphics

class PerlinField {
	int w;
	int h;
	PApplet parent;
	PVector acceleration;
	PVector velocity;
	PVector location;
	PVector scale;
	public int octaves;
	public float falloff;
	PImage canvas;
	
	PerlinField(int _w, int _h, PApplet _parent) {
		println("perlin field constructor");

		parent = _parent;
		w = _w;
		h = _h;

		canvas = createImage(w, h, RGB);

		acceleration = new PVector(0, 0);
		velocity = new PVector(0, 0);
		location = new PVector(0, 0);
		scale = new PVector(.05, .05);	
	
		println(getNoiseValue(3, 3));
		
		println(scale.x);
	}
	
	void tick() {
		update();
		render();
	}
	
	void update() {
		// set the velocity
		velocity.add(acceleration);
		location.add(velocity);
	}
	
	void render() {
		canvas.loadPixels();
	  for (int x = 0; x < w; x++) {
    	for (int y = 0; y < h; y++) {
				canvas.pixels[(y * w) + x] = color(getNoiseValue(x, y) * 255);
			}
		}
		canvas.updatePixels();
		parent.image(canvas, 0, 0);
	}
	
	float getNoiseValue(int x, int y) {

		noiseDetail(octaves, falloff);
		return noise( ((float)x * scale.x) + location.x, ((float)y * scale.y) + location.y);
	}
	
}

