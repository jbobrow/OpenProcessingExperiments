

public class Bullet extends Matter {
  public PVector speed;
  public Sprite spr;
  public AudioSample[] samples;
  public int x; /* Either 1 or -1 depending on cursor relative to player */
  private boolean firstRender;
  public float y;
  private Random generator;
  
  public Bullet(PVector origin, String sprFile, int w, int h, float y,
                  int x) { /* x simply specifies direction */
    super(origin, w, h);
    this.x = x;
    this.y = y;
    speed = new PVector(x * (mouseX - origin.x), 
        sin(mouseY - origin.y / mouseX - origin.x) * 20);
    spr = new Sprite(sprFile, 2, Sprite.CENTER);
    spr.speed = 1;
    firstRender = true;
    generator = new Random();
    
    /* Sound */
    samples = new AudioSample[4];
    samples[0] = process.loadSample("pew0.mp3");
    samples[1] = process.loadSample("pew1.mp3");
    samples[2] = process.loadSample("pew2.mp3");
    samples[3] = process.loadSample("pew3.mp3");
  }
  
  private void update() {
    speed.y += .47;
    origin.add(speed);
    if (origin.y > height - 42) bulletOut = false;
  }
  
  public void render() {
    if (firstRender == true) {
      firstRender = false;
      samples[generator.nextInt(4)].trigger();
    }
    update();
    spr.render(origin);
  }
}

