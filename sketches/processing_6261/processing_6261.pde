
import java.util.ArrayList;
import java.util.HashMap;

import noc.Vector3D;
import processing.core.PApplet;
import processing.core.PImage;
import twitter4j.Trend;

public class Colony {

  private static final int FONT_SIZE = 15;
  public static final int TEXT_POINT_Y = 50;
  public static final int TEXT_POINT_X = 810;
  private static final int BACTERIAS_INITIAL_NUMBER = 70;
  private static final int MAX_AGE = 1000;
  private static final boolean DEATH_ENABLE = false;

  private ArrayList organisms;
  private HashMap hm;
  public Util util;
  private Organism mainBoid;
  public String action = "";
  private Path path;
  public boolean drawS[]; 
  public boolean drawHelp = false;
  public boolean drawDetails = false;

  public String menuSelection;

  private boolean didGoToInitialPoint = false;
  private String[] topics;

  public Colony(HashMap hm, Util util) {
    this.drawS = new boolean[11];
    drawS[1] = true;
    drawS[2] = true;
    drawS[3] = true;
    drawS[4] = true;
    drawS[5] = true;
    drawS[6] = true;
    drawS[7] = true;
    drawS[8] = true;
    drawS[9] = true;
    drawS[10] = true;
    menuSelection = "0";
    this.hm = hm;
    this.organisms = new ArrayList();
    this.util = util;
    //mainBoid = addBoid(new Vector3D(0, 0));
    this.path = new Path();
    pointsOnPath();
  }

  private void pointsOnPath() {
    path.addPoint(63,520);
    path.addPoint(74,119);
    path.addPoint(84,59);
    path.addPoint(145,34);
    path.addPoint(256,29);
    path.addPoint(332,29);
    path.addPoint(377,64);
    path.addPoint(390,118);
    path.addPoint(394,205);
    path.addPoint(398,420);
    path.addPoint(399,493);
    path.addPoint(388,540);
    path.addPoint(336,559);
    path.addPoint(232,565);
    path.addPoint(125,565);
    path.addPoint(78,541);
    path.addPoint(66,519);
    path.addPoint(65,517);
  }

  public void addInitialBacterias() {
    for (int i = 0; i < BACTERIAS_INITIAL_NUMBER; i++) {
      organisms.add(new Organism(new Vector3D(random(width), random(height)),
      3.0f, 0.1f, util.randomGroup(), floor(random(1.0f, 3.0f)), hm));
    }
  }

  public synchronized Organism addBoid(Vector3D initialPosition) {
    Organism b = new Organism(initialPosition, 3.0f, 0.1f, util.randomGroup(), PApplet.floor(random(1.0f, 4.0f)), hm);
    organisms.add(b);
    return b;
  }

  public synchronized Organism addBoid(Vector3D initialPosition, String group) {
    Organism b = new Organism(initialPosition, 1.5f, 0.1f, group, floor(random(1.0f, 4.0f)), hm);
    organisms.add(b);
    return b;
  }


  public synchronized void loop() {

    path.display();
    textFont(font, 10);
    Iterator it = organisms.iterator();
    //while(it.hasNext()){
    for (int i = 0; i < organisms.size(); i++) {
      Organism b = (Organism)organisms.get(i);
      //Organism b = (Organism)it.next();
      if (b.age > MAX_AGE && DEATH_ENABLE) {
        organisms.remove(i);
      } 
      else {
        act(b);
        if(b.group.equals("1")){
          b.selected = true;
        }
        if(checkGroupRun(b.group)){
          b.run();
        }
        mainBoid = b;
      }
    }
    
    this.displayMenu();	
//    if(organisms.size() > 120){
//      util.duplicateControl = new Vector();
//      organisms.clear();
//    }	
  }

  private boolean checkGroupRun(String group){
    boolean ret = true;
    if(group.equals("1") && drawS[1]){
      ret = true;
    } 
    else if(group.equals("2") && drawS[2]){
      ret = true;
    } 
    else if(group.equals("3") && drawS[3]){
      ret = true;
    } 
    else if(group.equals("4") && drawS[4]){
      ret = true;
    } 
    else if(group.equals("5") && drawS[5]){
      ret = true;
    } 
    else if(group.equals("6") && drawS[6]){
      ret = true;
    } 
    else if(group.equals("7") && drawS[7]){
      ret = true;
    }
    else if(group.equals("8") && drawS[8]){
      ret = true;
    }
    else if(group.equals("9") && drawS[9]){
      ret = true;
    }
    else if(group.equals("10") && drawS[10]){
      ret = true;
    }
    else {
      ret = false;
    }
    return ret;
  }

  private Vector3D locationsOrganize(Organism b) {
    String group = b.group;
    Vector3D dest = new Vector3D(0, 0);
    if (group.equals("1")) {
      dest = new Vector3D(108, 97);
    } 
    else if (group.equals("2")) {
      dest = new Vector3D(301, 83);
    }
    else if (group.equals("3")) {
      dest = new Vector3D(472, 102);
    } 
    else if (group.equals("4")) {
      dest = new Vector3D(718, 184);
    } 
    else if (group.equals("5")) {
      dest = new Vector3D(665, 386);
    } 
    else if (group.equals("6")) {
      dest = new Vector3D(498, 326);
    } 
    else if (group.equals("7")) {
      dest = new Vector3D(316, 326);
    } 
    else if (group.equals("8")) {
      dest = new Vector3D(139, 382);
    }
    else if (group.equals("9")) {
      dest = new Vector3D(188, 559);
    } 
    else {
      dest = new Vector3D(500, 556);
    }
    return dest;
  }

  private synchronized void act(Organism b) {
    if (action.equals("organize")) {
      Vector3D dest = locationsOrganize(b);
      b.seek(dest);
    } 
    else if (action.equals("stopAll")) {
      b.stop();
    } 
    else if (action.equals("follow")) {
      b.follow(mainBoid);
    } 
    else if (action.equals("goRound")) {
      b.goRound(mainBoid);
    } 
    else if (action.equals("followPath")) {
      followPath(b);
    } 
    else if(action.equals("killAll")) {
      this.organisms.removeAll(organisms);
      action = "wander";
    } 
    else if(action.equals("wander")) {
      b.wander();
    } 
    else {
      b.wander();
    }
    if(!action.equals("followPath")){
      didGoToInitialPoint = false;
      b.isLabelEnable = false;
    }
  }

  private void followPath(Organism b){
    b.acceleration.normalize();
    b.velocity.normalize();
    moveEverybody();
    obstacle(b);
    printLabel(b);
    b.follow(path);
    if(b.stopped){
      if(st.blockade){
        b.acceleration.limit(10);
        b.acceleration.add(new Vector3D(100,0));
        b.velocity.limit(100);
        b.velocity.add(new Vector3D(100,0));
        b.velocity.normalize();
        b.acceleration.normalize();
        b.stopped = false;	
        st.blockade = false;
      }
    }
  }

  private void printLabel(Organism b) {
    float up = 60;
    float down = 550;
    float left = 300;
    float right = 425;
    if(b.location.x > left && b.location.x < right
      && b.location.y > up && b.location.y < down){
      b.isLabelEnable = true;
    } 
    else {
      b.isLabelEnable = false;
    }
  }

  private void moveEverybody() {
    if(!didGoToInitialPoint){
      for (int i = 0; i <this.organisms.size(); i++) {
        Organism b = (Organism)organisms.get(i);
        b.location.x = 50;
        b.location.y = 50;
      }
      didGoToInitialPoint = true;
    }

  }

  public void obstacle(Organism b){
    float up = 15;
    float down = 40;
    float left = 200;
    float right = 205;
    if(b.location.x > left && b.location.x < right
      && b.location.y > up && b.location.y < down){
      b.stop();
    }
  }

  public void setAction(String action) {
    this.action = action;
  }
  
  public void removeAllFromGroup(String group){
    for (int i = 0; i < organisms.size(); i++) {
      Organism org = (Organism)organisms.get(i);
      if(org.group.equals(group)){
        organisms.remove(i);
      }
    }
  }

  public void updateTopics(String[] topics, int rateLimitRemaining) {
    this.topics = topics;
  }

  public void displayMenu(){
    int currentX = 10;
    int currentY = 90;

    PImage aux;

    textFont(font, 15);
    text(organisms.size() + " organisms", 800 + currentX + 15, currentY - 25);

    if(this.topics == null){
      textFont(fontMenu,14);
      text("acquiring information...", 800 + currentX, currentY);
    } 
    else {
      for(int i = 1; i <= 10; i++){
        String trendTitle = topics[i-1].split("OR")[0].trim();
        aux = (PImage)hm.get("ic" + i);
        pushMatrix();
        translate(800 + currentX,currentY);
        image(aux, 0, 0);
        if(menuCollision(800 + currentX,currentY,200,40)){
          menuSelection = i + "";
        }
        fill(255);
        textFont(fontMenu,14);
        text(trendTitle, 40, 20);
        if(!drawS[i]){
          stroke(255);
          color c = color(200, 0, 0, 70);
          fill(c);
          rect(-10,-5, 200, 40);
        }
        popMatrix();       
        currentY = currentY + 40;
      }

      if(menuCollision(930,525,70,30)){
        menuSelection = "help";
      } 
      else if(menuCollision(910,560,80,30)){
        menuSelection = "details";
      }

      if(drawHelp){
        image(help, 26,21);
      } 
      else if (drawDetails){
        image(details, 26,21);
      }





      //      for (int i = 0; i < 6; i++) {
      //        String trendTitle = topics[i].getQuery().split("OR")[0].trim();
      //        nextY = FONT_SIZE + TEXT_POINT_Y + (i+1)*FONT_SIZE;
      //        noStroke();
      //        fill(pallette[i]);
      //        rect(TEXT_POINT_X, nextY - FONT_SIZE + 4, 20, FONT_SIZE);
      //        fill(255);
      //        textFont(fontMenu,14);
      //        text(trendTitle, TEXT_POINT_X + 25, nextY);
      //      }

    }
    //text(this.rateLimitRemaining + " RLR", TEXT_POINT_X, nextY + FONT_SIZE);		
  }

  private boolean menuCollision(int X, int Y, int thX, int thY) {
    boolean ret = false;
    float boundXR = X + thX;
    float boundXL = X;// - thX;
    float boundYU = Y;// - thY;
    float boundYD = Y + thY;
    if(mouseX > boundXL && 
      mouseX < boundXR && 
      mouseY > boundYU &&
      mouseY < boundYD){
      ret = true;
    }
    return ret;
  }

}





