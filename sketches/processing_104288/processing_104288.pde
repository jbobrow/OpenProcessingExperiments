
Maxim maxim = new Maxim(this);
Game game;

void setup() {
  size(800, 600, P3D);
  game = new Game();
  game.setScreen(new GameScreen(game, maxim));
}

void draw() {
  game.run();
}
public class Game {
  //delegates tasks to active screen
  //allows for easy transition between screens
  
  private Screen screen;
  private long startTime;
  
  public Game() {
    startTime = millis();
  }
  
  //main game loop
  public void run() {
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
public class GameScreen extends Screen {
  private float pitch, yaw;
  
  AudioPlayer player;
  
  public GameScreen(Game game, Maxim maxim) {
    super(game);
  }
  
  public void update(float delta) {
    pitch += delta;
    yaw += delta;
  }
  
  public void present() {
    camera(0, 0, 0, 0, 0, -1, 0, 1, 0);
    background(0);
    noStroke();
    
    lights();
    
    translate(0, 0, -300);
    rotateY(pitch);
    rotateX(yaw);
    box(100);
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


