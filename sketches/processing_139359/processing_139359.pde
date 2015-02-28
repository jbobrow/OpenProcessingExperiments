
/* @pjs font="PressStart2P.ttf"; */

Menu m;
Game g;

void setup() {
  size(512,512);
  colorMode(HSB,100);
  noStroke();
  
  m = new Menu();
  g = new Game(m);
  m.setGame(g);
  m.show("start");
}

void draw() {
  if(m.running) {
    m.draw(); 
  }
  if(g.running) {
    g.draw();
  }
}

void keyPressed() {
  if(key == 'n') {
    g.start(0); 
  }
  if(m.running == true) {
    if(key == 'z') {
      m.selectNext(); 
    }
    if(key == 's') {
      m.selectPrev(); 
    }
    if(key == 'e') {
      m.selectExec(); 
    }
  }
  if(g.running == true) {
    Player p = g.currentLevel.p;
    if(key == 'z') {
      p.jump();
    }
    if(key == 's') {
      p.crouch(); 
    }
    if(key == 'd') {
      p.dash(); 
    }
    if(key == 'q') {
      p.shoot(); 
    }
  }
  
  /* debug */
  if(key == '&') {
    g.start(0); 
  }
  if(key == 'é') {
    g.start(1); 
  }
  if(key == '"') {
    g.start(2); 
  }
}
class Bloc extends Wall {
  
  int type;
  HSBColor col;
  
  Bloc(float x, float y, float w, float h) {
    super(x,y,w,h);
    this.type = BlocType.obstacle;
    this.col = new HSBColor(0,40,40);
  }
  
  Bloc(float x, float y, float w, float h, int type) {
    super(x,y,w,h);
    this.type = type;
    switch(this.type) {
      case 0 : this.col = new HSBColor(0,40,40);
                          break;
      case 1 : this.col = new HSBColor(35,100,60);
                          break;
      case 2 : this.col = new HSBColor(12,100,80);
                          break;
      case 3 : this.col = new HSBColor(0,80,40);
                          break;
    }
  }

  void update() { 
    if(this.type == 3) {
      this.x--; 
    }
  }

  void render(Scene s) {
    fill(this.col.h,this.col.s,this.col.b);
    rect(this.x+s.x,this.y,this.w,this.h); 
  }

}
static class BlocType {
  static int obstacle = 0;
  static int finishLine = 1;
  static int coin = 2;
  static int rusher = 3;
}
class Game {
  Menu menu;
  
  float score = 0.0;
  boolean running = false;
  
  ArrayList<Level> levels;
  Level currentLevel;
  int level;
  
  Game(Menu m) {
    this.menu = m;
    this.init();
  }
  
  void init() {
    level = 0;
    levels = new ArrayList<Level>();
    
    // should be loaded from files
    Scene s = new Scene();
    
    Player p = new Player(3,13);
    
    /*JSONArray levelDatas = loadJSONArray("levels.json");
    
    for(int i = 0 ; i < levelDatas.size() ; i++) {
      JSONObject levelData = levelDatas.getJSONObject(i);
      
      ArrayList<Wall> walls = new ArrayList<Wall>();
      JSONArray wallDatas = levelData.getJSONArray("walls");
      for(int j = 0 ; j < wallDatas.size() ; j++) {
        JSONObject wallData = wallDatas.getJSONObject(j);
        walls.add(new Wall(wallData.getInt("x"),wallData.getInt("y"),wallData.getInt("w"),wallData.getInt("h")));
      }
      
      ArrayList<Bloc> blocs = new ArrayList<Bloc>();
      JSONArray blocDatas = levelData.getJSONArray("blocs");
      for(int j = 0 ; j < blocDatas.size() ; j++) {
        JSONObject blocData = blocDatas.getJSONObject(j);
        blocs.add(new Bloc(blocData.getInt("x"),blocData.getInt("y"),blocData.getInt("w"),blocData.getInt("h"),blocData.getInt("t")));
      }
      
      this.levels.add(new Level(s,p,walls,blocs));
    }*/
    
    /* level 1 */
    ArrayList<Wall> walls = new ArrayList<Wall>();
    walls.add(new Wall(0,15,128,1));
  
    ArrayList<Bloc> blocs = new ArrayList<Bloc>();
    blocs.add(new Bloc(24,14,2,1));
    blocs.add(new Bloc(36,13,1,2));
    blocs.add(new Bloc(48,13,2,1));
    blocs.add(new Bloc(60,13,2,1));
    blocs.add(new Bloc(72,14,2,1));
    blocs.add(new Bloc(84,13,1,2));
    blocs.add(new Bloc(96,13,2,1));

    blocs.add(new Bloc(49,10,1,1,2));
    blocs.add(new Bloc(61,10,1,1,2));
    blocs.add(new Bloc(96,10,1,1,2));

    blocs.add(new Bloc(108,12,1,3,BlocType.finishLine));

    this.levels.add(new Level(s,p,walls,blocs));
    
    /* level 2 */
    walls = new ArrayList<Wall>();
    walls.add(new Wall(0,15,24,1));
    walls.add(new Wall(27,15,21,1));
    walls.add(new Wall(36,15,21,2));
    walls.add(new Wall(60,15,21,2));
    walls.add(new Wall(84,15,64,2));
    
    blocs = new ArrayList<Bloc>();
    blocs.add(new Bloc(36,13,1,2));
    blocs.add(new Bloc(90,13,1,2));

    blocs.add(new Bloc(96,12,1,3,BlocType.finishLine));

    this.levels.add(new Level(s,p,walls,blocs));
    
    /* level 3 */
    walls = new ArrayList<Wall>();
    walls.add(new Wall(0,15,128,1));
    walls.add(new Wall(36,14,36,1));
    walls.add(new Wall(48,12,24,1));
    
    blocs = new ArrayList<Bloc>();
    blocs.add(new Bloc(24,13,1,2));

    blocs.add(new Bloc(96,12,1,3,BlocType.finishLine));
    
    this.levels.add(new Level(s,p,walls,blocs));
    
  }

  void start(int level) {
    this.init();
    
    this.running = true;
    this.menu.running = false;
    
    this.level = level;
    this.currentLevel = levels.get(level);
  }
  
  void end() {
    this.menu.show("over");
  }
  
  void showScore() {
    this.menu.show("score"); 
  }
  
  void increaseScore() {
    this.score += 1.0; 
  }
  
  void nextLevel() {
     int nextLevel = this.level + 1;
     this.start(nextLevel);
  }
  
  void restart() {
    this.start(this.level);
  }
  
  void removeBloc(Bloc b) {
    this.currentLevel.blocs.remove(b); 
  }
  
  void draw() {
    Scene s = this.currentLevel.s;
    Player p = this.currentLevel.p;
    ArrayList<Wall> walls = this.currentLevel.walls;
    ArrayList<Bloc> blocs = this.currentLevel.blocs;
    
    s.update();
    s.render();
    
    p.update();
    p.render(s);
    
    for(Wall w : walls) {
       w.update();
       w.render(s);
    }
    
    for(Bloc b : blocs) {
       b.update();
       b.render(s);
    }
  }
}
class HSBColor {
  float h;
  float s;
  float b;
 
  HSBColor(float h, float s, float b) {
    this.h = h;
    this.s = s;
    this.b = b;
  } 
}
class Level {
  Scene s;
  Player p;
  ArrayList<Wall> walls;
  ArrayList<Bloc> blocs;

  Level(Scene s,Player p, ArrayList<Wall> walls, ArrayList<Bloc> blocs) {
    this.s = s;
    this.p = p;
    this.walls = walls;
    this.blocs = blocs;
  }
}
class Menu {
  Game game;
  
  boolean running;
  HashMap<String,ArrayList<MenuItem>> menus;
  ArrayList<MenuItem> currentMenu;
  int currentIndex = 0;
  
  Menu() {
    this.running = false;
    this.menus = new HashMap<String,ArrayList<MenuItem>>();
    
    ArrayList<MenuItem> start = new ArrayList<MenuItem>();
    start.add(new MenuItem("2",100,200,15));
    start.add(new MenuItem("Play",100,250,5,true,0)); // 0 => start
    start.add(new MenuItem("High Scores",100,300,5,true,1)); // 1 => high score
    start.add(new MenuItem("Exit",100,350,5,true,2)); // 2 => exit
    
    this.menus.put("start",start);
    
    ArrayList<MenuItem> score = new ArrayList<MenuItem>();
    score.add(new MenuItem("You Win !",40,200,10));
    score.add(new MenuItem("Score :",100,250,5));
    score.add(new MenuItem("Next Level",100,300,5,true,3)); // 3 => next
    score.add(new MenuItem("Exit",100,350,5,true,2)); // 2 => exit
    
    this.menus.put("score",score);
    
    ArrayList<MenuItem> over = new ArrayList<MenuItem>();
    over.add(new MenuItem("Game Over",40,200,10));
    over.add(new MenuItem("Score :",100,250,5));
    over.add(new MenuItem("Restart",100,300,5,true,4)); // 4 => restart
    over.add(new MenuItem("Exit",100,350,5,true,2)); // 2 => exit
    
    this.menus.put("over",over);
    
    this.currentMenu = menus.get("start");
  } 
  
  void setGame(Game g) {
    this.game = g; 
  }
  
  void show(String menu) {
    this.currentMenu = menus.get(menu);
    
    this.running = true;
    this.game.running = false;
    
    this.currentIndex = 0;
  }
  
  void selectPrev() {
    if(this.currentIndex == this.countSelectables()-1) {
      this.currentIndex = 0; 
    } else {
      this.currentIndex++; 
    }
  }

  void selectNext() {
    if(this.currentIndex == 0) {
      this.currentIndex = this.countSelectables()-1; 
    } else {
      this.currentIndex--; 
    }
  }
  
  void selectExec() {
    int action = this.getSelectable(this.currentIndex).action;
    switch(action) {
      case 0 : this.game.start(0);
               break;
      case 2 : exit();
               break;  
      case 3 : this.game.nextLevel();
               break;
      case 4 : this.game.restart();
               break;
    }
  }
  
  int countSelectables() {
    int selectables = 0;
    for(MenuItem m : this.currentMenu) {
      if(m.selectable) selectables++;
    } 
    return selectables;
  }
  
  MenuItem getSelectable(int index) {
    int i = 0;
    for(MenuItem m : this.currentMenu) {
      if(!m.selectable) {
        index++;
      } else if(m.selectable && index == i) {
         return m;
      }
      i++;
    }
    return null;
  }
  
  void draw() {
    int index = 0;
    for(MenuItem m : this.currentMenu) {
      if(m._text.indexOf("Score :") != -1) {
        m.setText("Score : "+floor(this.game.score));
      }
      m.render();
      if(m.selectable && index == this.currentIndex) {
        m.blink = true;
      } else {
        m.blink = false; 
      }
      if(m.selectable) {
        index++;  
      }
    }
  }
}
class MenuItem {
  
  String _text;
  int x;
  int y;
  int size;
  PFont font = createFont("PressStart2P.ttf",48);
  boolean selectable;
  boolean blink = false;
  int action = -1;

  MenuItem(String text,int x, int y, int size) {
    this._text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    this.selectable = false;
  }
  
  MenuItem(String text,int x, int y, int size, boolean selectable, int action) {
    this._text = text;
    this.x = x;
    this.y = y;
    this.size = size;
    this.selectable = selectable;
    this.action = action;
  }
  
  void setText(String text) {
    this._text = text; 
  }
  
  void render() {
    textFont(font, size*5);
    if(!blink) {
      fill(0,40,40);
    } else if(blink && frameCount%90 < 45){
      fill(0,40,80);
    } else {
      fill(0,40,40);
    }
    text(this._text,x,y);
  }
}
class Player {
  float w, h;
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector gravity;
  
  boolean jumping = false;
  
  Player(float x, float y) {
    
    w = 31.0;
    h = 63.0;
    
    location = new PVector(x*32,y*32);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    
    gravity = new PVector(0,1.0);
  } 
  
  void applyForce(PVector f) {
     acceleration.add(f);
  }
  
  void applyFriction() {
    float c = 0.64;
    PVector friction = velocity.get();
    friction.mult(-1.0);
    friction.normalize();
    friction.mult(c);
    
    applyForce(friction);
  }
  
  void applyGravity() {
    
    float c = .64+(512.0 - location.y)*.00125;
    PVector force = gravity.get();
    force.normalize();
    force.mult(c);
    
    applyForce(force);
  }
 
  void update() {
    
    location.x += 3;
    
    applyFriction();
    
    velocity.add(acceleration);
    velocity.limit(128.0);
    location.add(velocity);
    acceleration.mult(0);
    
    /* collision vs murs */
    Wall bottom = touchBottom();
    Wall top = touchTop();
    Wall right = touchRight();
    
    /* collision vs blocs */
    Bloc b = touch();
    if((b != null && (b.type == BlocType.obstacle || b.type == BlocType.rusher)) || location.y >= 512.0 || right != null) {
      g.end();
    } else if(b != null && b.type == BlocType.finishLine) {
      g.showScore(); 
    } else if(b != null && b.type == BlocType.coin) {
      g.removeBloc(b);
      g.increaseScore(); 
    }
    
    if(bottom != null && top == null) {
        //velocity.y *= -1.0;
        location.y = bottom.y-h;
        if(jumping) {
          jumping = !jumping;
        }
    } else {
      applyGravity(); 
    }
    
    if(top != null && bottom == null) {
      velocity.mult(.5);
      location.y = top.y+top.h;
    }
  }
  
  Wall touchRight() {
    for(Wall w : g.currentLevel.walls) {
      boolean bottom = location.y+h < w.y+14.0;
      boolean top = location.y > w.y+w.h-14.0;
      boolean left = location.x+this.w > w.x+w.w;
      boolean right = location.x+this.w < w.x;
      
      if(!(bottom || top || left || right)) {
        return w; 
      }
    }
    return null;
  }
  
  Wall touchBottom() {
    for(Wall w : g.currentLevel.walls) {
      boolean bottom = location.y+h < w.y;
      boolean top = location.y+h > w.y+w.h;
      boolean left = location.x > w.x+w.w;
      boolean right = location.x+this.w < w.x;
      if(!(bottom || top || left || right)) {
        return w; 
      }
    }
    return null;
  }
  
  /* too sensitive */
  Wall touchTop() {
    for(Wall w : g.currentLevel.walls) {
      boolean bottom = location.y < w.y;
      boolean top = location.y > w.y+w.h;
      boolean left = location.x > w.x+w.w;
      boolean right = location.x+this.w < w.x;
      if(!(bottom || top || left || right)) {
        return w; 
      }
    }
    return null;
  }
  
  Bloc touch() {
    for(Bloc b : g.currentLevel.blocs) {
      boolean bottom = location.y+h < b.y;
      boolean top = location.y > b.y+b.h;
      boolean left = location.x > b.x+b.w;
      boolean right = location.x+this.w < b.x;
      if(!(bottom || top || left || right)) {
        return b; 
      }
    }
    return null;
  }
  
  void jump() {
    if(!jumping) {
      velocity.y = 0.0;
      acceleration.y = -24.0;
      jumping = true;
    }
  }
  
  void crouch() {
      float tmp = this.w;
      this.w = this.h;
      this.h = tmp;
      if(this.w > this.h) {
        location.y += 32;
      } else {
        location.y -= 32;
      }
  }
  
  void dash() {
    
  }
  
  void shoot() {
    
  }
  
  void render(Scene s) {
    if(w < h) {
      fill(0,50,65);
      rect(location.x+s.x,location.y,32,32);
      fill(55,50,65);
      rect(location.x+s.x,location.y+32,32,32); 
    } else {
       fill(0,50,65);
      rect(location.x+s.x,location.y,32,32);
      fill(55,50,65);
      rect(location.x+s.x+32,location.y,32,32); 
    }
  }
}
class Scene {
  
  float x;
  
  Scene() {
    x = 0.0;
  }
 
  void update() {
    this.x -= 3;
  }
  
  void render() {
    fill(0,0,100);
    rect(0,0,512,512);
    for(int i = 0 ; i < 32 ; i++) {
      for(int j = 0 ; j < 32 ; j++) {
        
        float x = 16.0+(.5+.5*cos(i*TWO_PI/32.0-this.x*.01))*16.0;
        
        if(j>x) {
          fill(10,100,10,20);
          rect(i*16.0,j*16.0,16.0,16.0);
        }
      } 
    }
  }
}
class Wall {
  
  float x,y,w,h;
  
  Wall(float x, float y, float w, float h) {
    this.x = x*32;
    this.y = y*32;
    this.w = w*32;
    this.h = h*32;
  }
  
  void update() { }
  
  void render(Scene s) {
    fill(0,20,20);
    rect(x+s.x,y,w,h); 
  }
}


