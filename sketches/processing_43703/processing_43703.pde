
MapEditObj mapEditObj;
import controlP5.*;
ControlP5 controlP5;

mapEdit MapEdit;
objEdit ObjEdit;
readSprSheet ReadSprSheet;
sideBar SideBar;
configWalkable ConfigWalkable;
button Button;
NotificationHandle NotificationHandler;

Textfield MapName;
Textfield TargetMap;

void setup() {

  frameRate(20);
  size(900, 640);
  
  SideBar = new sideBar();

  controlP5 = new ControlP5(this);

  MapName = controlP5.addTextfield("MapName", width-250, height-170, 200, 20);
  MapName.setFocus(true);

  TargetMap = controlP5.addTextfield("TargetMap", width-250, height-130, 200, 20);

  NotificationHandler = new NotificationHandle();
  MapEdit = new mapEdit();
  ObjEdit = new objEdit();

  ReadSprSheet = new readSprSheet();
}

void draw() {
  // == requests the map editor render the tiles
  MapEdit.renderTiles();
  // == renders sidebar
  SideBar.rend();
  // == calls notification to display if one is available
  NotificationHandler.notifi();
}


class mapEdit {
  MapEditObj[][] mapEditObj = new MapEditObj[32][47];
  int[][] mapArr = new int[32][47];
  mapEdit() {
    println("Map init.");
    
    for (int i=0; i < mapEditObj.length; i++) {
      for (int j=0; j < mapEditObj[i].length; j++) {
        this.mapEditObj[i][j] = new MapEditObj(20*j, 20*i, 20, 20);
        //  println("Creating Tile"+i+" - "+j);
      }
    }
    // =========== READ PREVIOUS MAP


    String lines[] = split(loadStrings("maps/Level2.map")[0], "]["); 
    String RGBval[] = split(lines[0], ","); 
    String NextMap = lines[1]; 
    String goals[] = split(lines[2], "#"); 
    String walkable[] = split(lines[3], "#"); 
    String layerOne[] = split(lines[4], "#"); 
    
    
    MapName.setValue("Level2");
    TargetMap.setValue(NextMap);

    for (int i=0; i < goals.length; i++) {
      String[] goalTiles = split(goals[i], ",");
      for (int j=0; j < goalTiles.length; j++) {
        this.mapEditObj[i][j].goal = Integer.parseInt(goalTiles[j]);
      }
    }
    for (int i=0; i < walkable.length; i++) {
      String[] walkableTiles = split(walkable[i], ",");
      for (int j=0; j < walkableTiles.length; j++) {
        this.mapEditObj[i][j].walkable = Integer.parseInt(walkableTiles[j]);
      }
    }
    for (int i=0; i < layerOne.length; i++) {
      String[] lineSprs = split(layerOne[i], ",");
      for (int j=0; j < lineSprs.length; j++) {
        this.mapEditObj[i][j].sprite.SpriteNo = Integer.parseInt(lineSprs[j]);
      }
    }

  }
  public void renderTiles() {
    fill(10, 40, 10, 255);
    rect(0, 0, width, height);
    fill(75, 154, 73, 255);
    for (int i=0; i < mapEditObj.length; i++) {
      for (int j=0; j < mapEditObj[i].length; j++) {
        this.mapEditObj[i][j].buildObj();
      }
    }
  }
}

class objEdit {
  MapEditObj curSel;
  int myBrush = 0;
  int myBrushSize = 1;
  int editing = 0;

  objEdit() {
  }
  public void setBrush(int BrushNum) {
    myBrush = BrushNum;
  }
  public void delIt(MapEditObj cur) {
    curSel = cur;
    switch(editing) {
    case 0:
      cur.setWalkable(1);
      break;
    case 1:
      cur.setSprite(0);
      break;
    case 2:
      cur.setGoal(0);
      break;
    }
  }
  public void setIt(MapEditObj cur) {
    curSel = cur;
    switch(editing) {
    case 0:
      cur.setWalkable(0);
      break;
    case 1:
      cur.setSprite(myBrush);
      break;
    case 2:
      cur.setGoal(1);
      break;
    }
  }
}

class MapEditObj {
  float x, y, w, h;
  color colour;
  Sprite sprite;
  int walkable=1;
  int goal=0;

  MapEditObj(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    colour = color(204, 198, 138);
    sprite = new Sprite(0, x, y, "s", "s");
  }
  public void setColor(color newCol) {
    colour = newCol;
  }
  public void setSprite(int SpriteNo) {
    sprite.SpriteNo=SpriteNo;
  }
  public void setWalkable(int walkable) {
    if (this.walkable!=walkable)
      this.walkable=walkable;
  }
  public void setGoal(int goal) {
    println("Setting goal"+goal);
    if (this.goal!=goal)
      this.goal=goal;
  }
  public void buildObj() {
    fill(colour);
    if ((dist(mouseX, mouseY, x+w/2, y+h/2)<(w/2)*ObjEdit.myBrushSize)&&mouseX<width-300) {

      stroke(114, 108, 48);
      if (mousePressed && (mouseButton == LEFT)) {
        ObjEdit.setIt(this);
      } 
      else if (mousePressed && (mouseButton == RIGHT)) {
        ObjEdit.delIt(this);
      }
    }
    else
      stroke(90, 188, 98);

    fill(65, 194, 113, 255);
    rect(x, y, w, h);
    if (this.sprite.SpriteNo>=0)
      this.sprite.Make();

    if (this.walkable==0&&ObjEdit.editing==0)
    {
      fill(255, 60, 60, 90);
      rect(x, y, w, h);
    }
    if (this.goal==1&&ObjEdit.editing==2)
    {
      fill(60, 60, 255, 90);
      rect(x, y, w, h);
    }
  }
}


