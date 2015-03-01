
/******************************
 * One Click Game
 *  A game to implement a bare minimum game loop
 *******************************/

static int SPLASH_SCENE_STATE = 0;  
static int MENU_SCENE_STATE = 1;
static int GAME_SCENE_STATE = 2;
static int VICTORY_SCENE_STATE = 3;
static int LOSING_SCENE_STATE = 4;
static int NUM_STATES = 5;
SceneManager scene_manager;
  
void setup() {
  size(300,300);
  scene_manager = new SceneManager();
  scene_manager.setupScenes();
}

void draw() {
   scene_manager.draw(); 
}

void keyPressed() {
   scene_manager.keyPressed(); 
}

void mousePressed() {
  scene_manager.mousePressed();
}


// SceneManager handles scenes and their transitions
class SceneManager {
  int current_scene;
  Scene scenes[];
  Scene scene;
 
  SceneManager() {
    scenes = new Scene[NUM_STATES];
  }
 
  void setupScenes() {
    scenes[SPLASH_SCENE_STATE] = new SplashScene();
    scenes[MENU_SCENE_STATE] = new MenuScene();
    scenes[GAME_SCENE_STATE] = new GameScene();
    scenes[VICTORY_SCENE_STATE] = new VictoryScene();
    scenes[LOSING_SCENE_STATE] = new LosingScene();
    scene = scenes[SPLASH_SCENE_STATE];
  }
 
 void updateScene(int new_scene) {
   //println("Updating scene from " + current_scene + " to " + new_scene);
   scene.close();
   scene = scenes[new_scene];
   scene.init();
   
  }
 
  void draw() {
    if( scene.changeScene()) {
      updateScene(  scene.nextScene() ); 
    }
    
    scene.draw();
  }

  void keyPressed() {
    scene.keyPressed();
  }
  
  void mousePressed() {
    scene.keyPressed();
  }
  
}



// Scene is an abstract class
class Scene {
  int next_scene;
  
  void draw() {}
  void keyPressed() {}
  void mousePressed() {}
  void close() {}
  
  int nextScene() { return next_scene; }
  boolean changeScene() { return next_scene >= 0; }
  
  // Called at the beggining of each scene
  void init() {
    next_scene = -1;
  }
}


// Class for splashscreen scene
class SplashScene extends Scene {
  PFont f; 
  
  SplashScene() {
      initFonts();
  }

  void draw() {  
      background(255);
      textFont(f,16);                 
      fill(0);                        
      text("Splash!",width/2-50,height/2-25); 
    
  }
  
  void initFonts() {
    f = createFont("Arial",16,true); 
  }
  
  void keyPressed() {
    next_scene = MENU_SCENE_STATE;
  }
}


class MenuScene extends Scene  {
  PFont f; 
 
  int t;
 
  MenuScene() {
      initFonts();
  }

  void draw() {  
     t++;
     background(255);
     textFont(f,16);                 
     fill(0);                        
     text("Menu!",width/2-50,height/2-25); 
    
     // "Event Handling"
     if(t > 500) { next_scene = SPLASH_SCENE_STATE; }
  }
  
  void initFonts() {
    f = createFont("Arial",16,true); 
  }
  
  void init() {
    t=0; 
    super.init();
  }
  
  void keyPressed() {
    next_scene = GAME_SCENE_STATE;
  }
  
}

class GameScene extends Scene  {
 PFont f; 
 int t;
 
 GameScene() {
      initFonts();
  }

  void draw() {  
    t++;
     background(255);
     textFont(f,16);                 
     fill(0);                        
     text("Click To win!",width/2-50,height/2-25); 
     
     // event handling
     if( t > 500 ) {
       next_scene = LOSING_SCENE_STATE;
     }
  }
  
  void initFonts() {
    f = createFont("Arial",16,true); 
  }
  
  void keyPressed() {
    next_scene = VICTORY_SCENE_STATE;
  }
  
  void init() {
     t = 0; 
     super.init();
  }
}

class VictoryScene extends Scene  {
 PFont f; 
 
 VictoryScene() {
      initFonts();
  }

  void draw() {  
     background(255);
     textFont(f,16);                 
     fill(0);                        
     text("Victory!!",width/2-50,height/2-25); 
    
  }
  
  void initFonts() {
    f = createFont("Arial",16,true); 
  }
  
  void keyPressed() {
    next_scene = MENU_SCENE_STATE;
  }
  
}

class LosingScene extends Scene  {
 PFont f; 
 
 LosingScene() {
      initFonts();
  }

  void draw() {  
     background(255);
     textFont(f,16);                 
     fill(0);                        
     text("You Lose!!",width/2-50,height/2-25); 
    
  }
  
  void initFonts() {
    f = createFont("Arial",16,true); 
  }
  
  void keyPressed() {
     next_scene = MENU_SCENE_STATE;
  }
  
}

