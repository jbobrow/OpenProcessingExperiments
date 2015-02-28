
Game game;

void setup() {
  size(800, 600);
  game = new Game();
  game.setScreen(new BallScreen(game));
}

void draw() {
  game.drawGame();
}

void keyPressed() {
  if(game.getScreen() instanceof BallScreen) {
    if(key == 'a' || key == 'A') {
      game.setScreen(new RainScreen(game));
    }
  } else if (game.getScreen() instanceof RainScreen) {
    if(key == 'a' || key == 'A') {
      game.setScreen(new BallScreen(game));
    }
  }
}
public class BallScreen extends Screen {
  private static final int BALL_RADIUS = 40;
  
  PVector position;
  PVector velocity;
  
  public BallScreen(Game game) {
    super(game);
    position = new PVector(width / 2, height / 2);
    
    int xDir = ((int)random(2) > 0) ?  1 : -1;
    int yDir = ((int)random(2) > 0) ?  1 : -1;
    
    velocity = new PVector((int)random(100, 200) * xDir, (int)random(100, 200) * yDir, 0);
    
    fill(255, 150, 100);
    noStroke();
  }
  
  public void update(float delta) {
    position.add(PVector.mult(velocity, delta));
    
    if(position.x > width - BALL_RADIUS) {
      position.x = width - BALL_RADIUS;
      velocity.x *= -1;
    }
    if(position.x < BALL_RADIUS) {
      position.x = BALL_RADIUS;
      velocity.x *= -1;
    }
    if(position.y > height - BALL_RADIUS) {
      position.y = height - BALL_RADIUS;
      velocity.y *= -1;
    }
    if(position.y < BALL_RADIUS) {
      position.y = BALL_RADIUS;
      velocity.y *= -1;
    }
  }
  
  public void present() {
    background(0);
    ellipse(position.x, position.y, BALL_RADIUS * 2, BALL_RADIUS * 2);
  }
}
public class Game {
  private Screen screen;
  private long startTime;
  
  public Game() {
    startTime = millis();
  }
  
  public void drawGame() {
    float delta = (millis() - startTime) / 1000.0f;
    startTime = millis();
    
    update(delta);
    present();
  }
  
  private void update(float delta) {
    if(screen != null) {
      screen.update(delta);
    }
  }
  
  private void present() {
    if(screen != null) {
      screen.present();
    }
  }
  
  public void setScreen(Screen screen) {
    this.screen = screen;
  }
  
  public Screen getScreen() {
    return screen;
  } 
}
public class RainScreen extends Screen {
  ArrayList<Raindrop> raindrops;
  float rainTick = 0;
  
  public RainScreen(Game game) {
    super(game);
    
    raindrops = new ArrayList<Raindrop>();
    
    for(int i = 0; i < 10; i++) {
      raindrops.add(new Raindrop());
    }
    
    fill(100, 100, 255);
    noStroke();
  }
  
  public void update(float delta) {
    rainTick += delta;
    while(rainTick > 0.1f) {
      if(raindrops.size() < 500) {
        for(int i = 0; i < 10; i++) {
          raindrops.add(new Raindrop());
        }
      }
      rainTick -= 0.1f;
    }
    
    for(Raindrop raindrop : raindrops) {
      raindrop.update(delta);
      if(raindrop.position.y - raindrop.thisWidth / 2 > height) { 
        raindrop.reset();
      }
    }
  }
  
  public void present() {
    background(0);
    for(Raindrop raindrop : raindrops) {
      ellipse(raindrop.position.x, raindrop.position.y, raindrop.thisWidth, raindrop.thisHeight);
    }
  }
}
public class Raindrop {
  public PVector position;
  public PVector velocity;
  public int thisWidth, thisHeight;
  
  public Raindrop() {
    int randomNum = (int) random(10);
    thisWidth = randomNum + 6;
    thisHeight = (int) (thisWidth * 1.3);
    
    position = new PVector(random(width), -thisHeight / 2);
    velocity = new PVector(0, (randomNum + 12) * 12);
  }
  
  public void update(float delta) {
    position.add(PVector.mult(velocity, delta));
  }
  
  public void reset() {
    int randomNum = (int) random(10);
    thisWidth = randomNum + 6;
    thisHeight = (int) (thisWidth * 1.3);
    
    position.set(random(width), -thisHeight / 2);
    velocity.set(0, (randomNum + 12) * 12);
  }
}
public abstract class Screen {
  protected Game game;
  
  public Screen(Game game) {
    this.game = game;
  }
  
  public abstract void update(float delta);
  public abstract void present();
}


