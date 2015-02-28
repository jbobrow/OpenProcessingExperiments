
class HUDManager {
  HUDWorker workerHud;
  int hud_type;
  Player player;
  PGraphics img;
  
  HUDManager(Player player_) {
    player = player_;
    workerHud = new HUDWorker(player); 
    img = createGraphics(game_width,hud_height,P2D); 
    img.beginDraw();
    img.background(50,50,50);
    img.endDraw();
  }
  
  void click() {
    workerHud.click();
  }
  
  void tic() {
    workerHud.tic();
    updateHUD();
  }
  
  void updateHUD() {
    img.beginDraw();
    img.background(50,50,50);
    if (player.selected.size() > 0) {
      
      workerHud.drawHUD(img);
    }
    img.endDraw();
  }
  
}

class HUDWorker {
  ArrayList buttons;
  Label mouse_label;
  Label worker_position;
  Label resources;
  
  int standard_button_width = 50;
  int standard_button_height = 20;
  Player player;
  
  HUDWorker(Player player_) {
    player = player_;
    buttons = new ArrayList();
    //labels = new ArrayList();
    buttons.add(new Button(edge,edge,standard_button_width,standard_button_height,"+Wall",player));
    buttons.add(new Button(edge,int(edge*1.5)+standard_button_height,standard_button_width,standard_button_height,"+Base",player));
    
    buttons.add(new Button(edge*2+standard_button_width,edge,standard_button_width,standard_button_height," Attack",player));
    buttons.add(new Button(edge*2+standard_button_width,int(edge*1.5)+standard_button_height,standard_button_width,standard_button_height," Patrol",player));
    
    buttons.add(new Button(edge*3+standard_button_width*2,edge,standard_button_width,standard_button_height," Forage",player));
    
    mouse_label = new Label(edge*4+standard_button_width*3,edge,standard_button_width,standard_button_height,"x,y:","0x0",player);
    worker_position = new Label(edge*4+standard_button_width*3,int(edge*1.5)+standard_button_height,standard_button_width,standard_button_height,"worker x,y:","0x0",player);
    
    resources = new Label(int(game_width*.8),edge,standard_button_width,standard_button_height,"resources:","0",player);
  }
  
  void tic() {
    Location mouse = new Location(mouseX,mouseY,0,0);
    mouse.toGrid();
    mouse_label.content = String.valueOf(mouse.x) + "x" + String.valueOf(mouse.y);
    if (player.selected.size() > 0){
      Location loc = new Location(   ((Worker) player.selected.get(0)).x , ((Worker) player.selected.get(0)).y , 0 , 0);
      loc.toGrid();
      worker_position.content = String.valueOf(loc.x) + "x" + String.valueOf(loc.y);
    }
    resources.content = String.valueOf(int(player.resources));
  }
  
  void click() {
    for (int i=0;i<buttons.size();i++) {
      ((Button) buttons.get(i)).click();
    }
  }
  
  void drawHUD(PGraphics img) {
    for (int i=0;i<buttons.size();i++) {
      ((Button) buttons.get(i)).drawButton(img);
    }
    //mouse_label.drawLabel(img);
    //worker_position.drawLabel(img);
    
    //Draw selection rectangle
    img.stroke(70,70,70);
    img.fill(40,40,40);
    img.rect(game_width*.3-edge*2,edge,game_width*.30,hud_height-edge*2);
    int x = int(game_width * .30);
    int y = edge*3;
    
    for (Worker s:player.selected) {
      s.drawWorker(img,x,y);
      x = x + 20;
      //println("                                                    drawing worker");
    }
    
    resources.drawLabel(img);
  }
}
/* */
class Label {
  int x, y;
  int butwidth;
  int butheight;
  
  color basecolor;
  color highlightcolor;
  color currentcolor;
  
  boolean locked;
  boolean over = false;
  boolean pressed = false; 
  PFont font;  
  String label;
  String content;

  Player player;
  Label(int x_, int y_, int butwidth_, int butheight_, String label_, String content_, Player player_) {
    x = x_;
    y = y_;
    butwidth = butwidth_;
    butheight = butheight_;
    label = label_;
    content = content_;
    
    highlightcolor = color(153); 
    basecolor = color(102);
    currentcolor = basecolor;
    font = createFont("FFScala", 12);
    textFont(font);
    player = player_;
  }
  
  void drawLabel(PGraphics img) {
   // println("drawing button: " + x + "," + y + "  " + butwidth + "x" + butheight);
    img.beginDraw();
    img.stroke(0);
    img.fill(currentcolor);
    img.rect(x+butwidth+20, y, butwidth*1.5, butheight);
    img.fill(255,255,255);
    img.text(label,x+2,y+butheight-5);
    img.text(content,x+butwidth+25,y+butheight-5);
    img.endDraw();
  }
}
/* */
class Button
{
  int x, y;
  int butwidth;
  int butheight;
  
  color basecolor;
  color highlightcolor;
  color currentcolor;
  
  boolean locked;
  boolean over = false;
  boolean pressed = false; 
  PFont font;  
  String label;

  Player player;
  
  Button(int x_, int y_, int butwidth_, int butheight_, String label_, Player player_) {
    x = x_;
    y = y_;
    butwidth = butwidth_;
    butheight = butheight_;
    label = label_;
    
    highlightcolor = color(153); 
    basecolor = color(102);
    currentcolor = basecolor;
    font = createFont("FFScala", 12);
    textFont(font);
    player = player_;
  }
  
  void update() 
  {
    if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() 
  {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }    
  }

  boolean over() 
  { 
    return true; 
  }

  boolean overRect() 
  {
    if (mouseX >= x && mouseX <= x+butwidth && 
      mouseY-game_height >= y && mouseY-game_height <= y+butheight) {
      return true;
    } 
    else {
      return false;
    }
  }

  void drawButton(PGraphics img) {
   // println("drawing button: " + x + "," + y + "  " + butwidth + "x" + butheight);
    img.beginDraw();
    img.stroke(0);
    if (overRect()) {
      img.fill(highlightcolor);
    } else {
      img.fill(currentcolor);
    }
    img.rect(x, y, butwidth, butheight);
    img.fill(255,255,255);
    img.text(label,x+2,y+butheight-5);
    img.endDraw();
  }
  
  void click() {
    if (overRect()) {
      if (label.equals("+Wall")) {
        if (player.command == 2) {
          player.command = 0;
          player.world.buildingmanager.clearPlans();
        } else {
          player.command = 2;
          player.world.buildingmanager.planBuilding(1);
        }
 
      } else if (label.equals("+Base")) {
        if (player.command == 2) {
          player.command = 0;
          player.world.buildingmanager.clearPlans();
        } else {
          player.command = 2;
          player.world.buildingmanager.planBuilding(2);
        }
 
      } else if (label.equals(" Patrol")) {
        if (player.command == 1) player.command = 0;
        else {
          player.command = 1;
          player.world.buildingmanager.clearProjectedBuildings();
        }
      }
    }
    println("HUD command: " + player.command);
  }

}

