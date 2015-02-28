
/* 
@pjs preload="images/coin.png, images/button.png, images/0.png, images/1.png, images/2.png, 
                 images/3.png, images/4.png, images/5.png, images/6.png, images/7.png, images/8.png, images/9.png"; 
                 crisp="true";
*/                 
Player player;
Drawer drawer;

void setup() {
  // Setting up background and colors
  background(0);
  size(640, 480);
  stroke(255);

  int a_width = arena_width();
  int c_width = cell_width();
  int a_height = arena_height();
  int c_height = cell_height();
  int max_grid_x = max_grid_X();
  int max_grid_y = max_grid_Y();
  player = new Player(a_width, c_width, a_height, c_height, max_grid_x, max_grid_y);
  drawer = new Drawer(player);
}

void draw() {
  if (player.getState() == Player.SIMULATING) 
    player.simulate();
  if (player.getState() == Player.TIMEOUT) {
    player.advanceScorer();
  }
  drawer.drawit(player.get_a_width(), player.get_c_width(), player.get_a_height(), player.get_c_height());
  if (player.getState() == Player.FINISHED) {
    noLoop();
  }
}

void mousePressed() {
  player.play();
}

public class Button {

  // Constructor
  public Button(int x, int y, int wd, int ht, String txt) {
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    this.txt = txt;
    button_image = loadImage("images/button.png");
  }

  // drawit
  public void drawit(int a_width, int c_width, int a_height, int c_height) {
    stroke(255);
    fill(0);
    image(button_image, x, y, wd, ht);
    textSize(20);
    text(txt, x + 3 * c_width, (int)(y + 1.5 * c_height));
  }
  
  // check if mouse-cliked inside the button
  public boolean mouseClickedInside() {
    return (mouseX >= x && mouseX <= x + wd && mouseY >= y && mouseY <= y + ht);
  }
  
  //private
  private int x;
  private int y;
  private int wd;
  private int ht;
  private String txt;
  private PImage button_image;
}

public class Drawer {
  // Constructor
  public Drawer(Player p) {
    player = p;
    coin_image = loadImage("images/coin.png");
  }

  // drawit
  public void drawit(int a_width, int c_width, int a_height, int c_height) {
    // Setting up background and colors
    background(0);
    size(640, 480);
    stroke(255);

    // Draw all the cells
    for (int i = c_width; i < a_width; i += c_width) {
      line(i, c_height, i, a_height - c_height);
    }
    for (int i = c_height; i < a_height; i += c_height) {
      line(c_width, i, a_width - c_width, i);
    }

    // Draw coins in cells
    boolean[][] alive = player.getAlive();
    boolean[][] ever_alive = player.getEverAlive();
    for (int i = 0; i < alive.length; i++) {
      for (int j = 0; j < alive[i].length; j++) {
        if (ever_alive[i][j]) {
          fill(75, 75, 75);
          rect(i * c_width, j * c_height, c_width, c_height);
        }
        if (alive[i][j]) {
          imageMode(CORNER);
          image(coin_image, i * c_width, j * c_height, c_width, c_height);
        }
      }
    }
    
    // Draw the buttons
    player.get_play_button().drawit(a_width, c_width, a_height, c_height);
    player.get_undo_button().drawit(a_width, c_width, a_height, c_height);
    player.get_reset_button().drawit(a_width, c_width, a_height, c_height);

    // Draw the timer
    player.getTimer().drawit(a_width, c_width, a_height, c_height);
    
    // Draw the scorer
    player.getScorer().drawit(a_width, c_width, a_height, c_height);
  }

  //private
  private Player player;
  private PImage coin_image, button_image;
}

import java.util.ArrayList;

public class Player {

  // Constants
  final static int INIT = 0;
  final static int PLAYING = 1;
  final static int SIMULATING = 2;
  final static int TIMEOUT = 3;
  final static int FINISHED = 4;

  final static int MAX_TIMER = 100;

  // Constructor
  public Player(int a_width, int c_width, int a_height, int c_height, int max_grid_x, int max_grid_y) {
    this.a_width = a_width;
    this.c_width = c_width;
    this.a_height = a_height;
    this.c_height = c_height;
    this.max_grid_x = max_grid_x;
    this.max_grid_y = max_grid_y;
    alive = new boolean[max_grid_x+2][max_grid_y+2];
    ever_alive = new boolean[max_grid_x+2][max_grid_y+2];
    
    for (int i = 0; i < max_grid_x; i++) {
      for (int j = 0; j < max_grid_y; j++) {
        alive[i][j] = false;
        ever_alive[i][j] = false;
      }
    }
    last_X = new ArrayList();
    last_Y = new ArrayList();

    // Create initial state
    state = INIT;

    // Create buttons  
    int button_x = a_width;
    int play_y = c_height;
    int undo_y = c_height * 4;
    int reset_y = (int)(c_height * 7.5);
    int button_width = width - a_width - c_width;
    int button_height = c_width * 2;
    play_button = new Button(button_x, play_y, button_width, button_height, "Play");
    undo_button = new Button(button_x, undo_y, button_width, button_height, "Undo");
    reset_button = new Button(button_x, reset_y, button_width, button_height, "Reset");

    // Create timer
    int timer_x = a_width;
    int timer_y = (int)(a_height * 0.9);
    timer = new Timer(timer_x, timer_y, MAX_TIMER);
    
    // Create Scorer
    int scorer_x = a_width;
    int scorer_y = (int)(a_height * 0.5);
    scorer = new Scorer(scorer_x, scorer_y, 2 * c_width, 2 * c_height);
  }

  // Getters
  public int get_a_width() { 
    return a_width;
  }
  public int get_c_width() { 
    return c_width;
  }
  public int get_a_height() { 
    return a_height;
  }
  public int get_c_height() { 
    return c_height;
  }
  public boolean[][] getAlive() { 
    return alive;
  }
  public boolean[][] getEverAlive() { 
    return ever_alive;
  }
  public Button get_play_button() { 
    return play_button;
  }
  public Button get_undo_button() { 
    return undo_button;
  }
  public Button get_reset_button() { 
    return reset_button;
  }
  public Timer getTimer() { 
    return timer;
  }
  public Scorer getScorer() { 
    return scorer;
  }
  public int getState() {
    return state;
  }
  // Place a coin on cell
  public void placeCoin() {
    if (state != PLAYING) return;
    int c_width = cell_width();
    int c_height = cell_height();
    int i = (int) (mouseX /  c_width);
    int j = (int) (mouseY / c_height);
    alive[i][j] = true;
    ever_alive[i][j] = true;
    last_X.add(0, i);
    last_Y.add(0, j);
  }

  // Responds to undo press by user
  public void undo() {
    if (state != PLAYING) return;
    int lx = last_X.get(0);
    int ly = last_Y.get(0);
    alive[lx][ly] = false;
    ever_alive[lx][ly] = false;
    last_X.remove(0);
    last_Y.remove(0);
  }

  // Responds to reset pressed by user
  public void reset() {
    if (state != PLAYING) return;
    for (int i = 0; i < max_grid_x; i++) {
      for (int j = 0; j < max_grid_y; j++) {
        alive[i][j] = false;
        ever_alive[i][j] = false;
      }
    }
    while (!last_X.isEmpty ()) {
      last_X.remove(0);
      last_Y.remove(0);
    }
  }

  // Check if a cell is alive
  private boolean isAlive(int c_i, int c_j) {
    int alive_neighbors = 0;
    
    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i == 0 && j == 0) {
          continue;
        }
        int new_ci = (c_i + i) % max_grid_x;
        int new_cj = (c_j + j) % max_grid_y;
        // Adjust the indices if out of arena
        if (new_ci < 1) {
          new_ci += max_grid_x;
        }
        if (new_cj < 1) {
          new_cj += max_grid_y;
        }

        if (alive[new_ci][new_cj]) {
          alive_neighbors++;
        }
      }
    }
    return ((alive[c_i][c_j] && alive_neighbors == 2) || alive_neighbors == 3);
  }


  public void simulate() {
    if (state != SIMULATING) return;
    boolean temp_alive[][] = new boolean[max_grid_x+2][max_grid_y+2];
    for (int i = 1; i <= max_grid_x; i++) {
      for (int j = 1; j <= max_grid_y; j++) {
        if (isAlive(i, j)) {
          temp_alive[i][j] = true;
          if (!ever_alive[i][j]) {
            ever_alive[i][j] = true;
            scorer.incrementMaxScore();
          }
        }
        else
          temp_alive[i][j] = false;
      }
    }  
    arrayCopy(temp_alive, alive);
    // Advance time for timer, check if it has timed out and set the state
    if (timer.isTimeout()) 
      state = TIMEOUT;
    else
      timer.advanceit();
  }

  // All interactions with mouse pressed
  public void play() {
    if (state != INIT && state != PLAYING) return;
    
    if (play_button.mouseClickedInside()) {
      state = SIMULATING;
    }
    else if (undo_button.mouseClickedInside()) {
      state = PLAYING;
      undo();
    }
    else if (reset_button.mouseClickedInside()) {
      state = PLAYING;
      reset();
    }
    else if (mouseX >= c_width && mouseX <= a_width - c_width && mouseY >= c_height && mouseY <= a_height - c_height) {
      state = PLAYING;
      placeCoin();
    }
  }
  
  // Advance scorer after timeout
  public void advanceScorer() {
    scorer.incrementScore();
    if (scorer.getScore() == scorer.getMaxScore()) 
      state = FINISHED;
  }
  
  
  // Private
  // Dimensions of grid
  private int max_grid_x, max_grid_y;
  // Dimensions of arena
  private int a_width, a_height;
  // Dimensions of cell
  private int c_width, c_height;

  // Arrays to check if a cell is dead/alive
  private boolean alive[][];
  private boolean ever_alive[][];
  private ArrayList<Integer> last_X, last_Y;

  // Maintain the state
  private int state;
 
  // Buttons
  private Button play_button, undo_button, reset_button;

  // Timer to check if game has ended
  private Timer timer;
     
  // Scorer
  private Scorer scorer;
}

public class Scorer {

  public Scorer(int x, int y, int wd, int ht) {
    this.x = x;
    this.y = y;
    this.wd = wd;
    this.ht = ht;
    score = 0;
    coin_image = loadImage("images/coin.png");
    digit_images = new PImage[10];
    for (int i = 0; i < 10; i++)
      digit_images[i] = loadImage("images/" + i + ".png");
  }

  // Getter
  public int getScore() { 
    return score;
  }
  
  public int getMaxScore() { 
    return max_score;
  }
  
  public void incrementScore() {
    score++;
  }

  public void incrementMaxScore() {
    max_score++;
  }
  
  public void drawit(int a_width, int c_width, int a_height, int c_height) {
    fill(0);
    stroke(0);
    int s = score;
    int[] digits = new int[0];
    while (s >= 0) {
      digits = append(digits, s % 10);
      s = (int)(s / 10);
      if (s == 0)
        break;
    }
    
    image(coin_image, x, y, c_width * 2, c_height * 2);
    for (int j = digits.length - 1; j >= 0; j--) {
       image(digit_images[digits[j]], x + (digits.length - j) * wd, y, wd, ht);
     }
  }

  // Private
  private int x;
  private int y;
  private int wd;
  private int ht;
  private int score;
  private int max_score;
  private PImage coin_image;
  private PImage[] digit_images;
}

public class Timer {
  // Constructor
  public Timer(int x, int y, int max_value) {
    this.x = x;
    this.y = y;
    this.max_value = max_value;
    this.curr_value = 0;
  }

  //drawit
  public void drawit(int a_width, int c_width, int a_height, int c_height) {
    textSize(20);
    fill(255);
    text("Time", x, y);
    fill(0, 255, 0);
    rect(x, y + c_height, (int)( (width - a_width - c_width) * (max_value - curr_value) / max_value), c_height);
  }
  
  // advance timer
  public void advanceit() {
    curr_value++;
  }
  
  // check if it is timed out
  public boolean isTimeout() {
    return (curr_value >= max_value);
  }
  
  //private
  private int x, y;
  private int max_value, curr_value;
}

int arena_width() {
  return (int)(width * 0.75);
}

int arena_height() {
  return height;
}

int cell_width() {
  return 16;
}

int cell_height() {
  return (int)(cell_width() * float(arena_height()) / float(arena_width()));
}

int max_grid_X() {
  return (int)(arena_width() / cell_width()) - 2;
}

int max_grid_Y() {
  return (int)(arena_height() / cell_height()) - 2;
}

int min_grid_X() {
  return 1;
}

int min_grid_Y() {
  return 1;
}




