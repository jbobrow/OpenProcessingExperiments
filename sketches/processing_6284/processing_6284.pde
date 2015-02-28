
import java.util.ArrayList;
import java.util.HashMap;

import noc.Vector3D;
import processing.core.PApplet;
import processing.core.PImage;
import twitter4j.Trend;

public class Colony {

  private static final int FONT_SIZE = 15;
  //public static final int TEXT_POINT_Y = 50;
  //public static final int TEXT_POINT_X = 810;
  //private static final int BACTERIAS_INITIAL_NUMBER = 70;
  private static final int MAX_AGE = 1000;
  private static final boolean DEATH_ENABLE = false;

  private ArrayList organisms;
  private HashMap hm;
   
  private Organism mainBoid;
  private Path path;
  
  public String action = "";
  public String menuSelection;

  public boolean drawS[]; 
  public boolean drawHelp = false;
  public boolean drawAbout = false;  
  public boolean drawDetails = false;

  public int selectedOrganisms = 0;

  private boolean didGoToInitialPoint = false;
  
  private String[] topics;

  public Colony(HashMap hashMap) {
    drawS = new boolean[12];
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
    drawS[11] = true;
    menuSelection = "0";
    hm = hashMap;
    organisms = new ArrayList();
    path = new Path();
    path.pointsOnPath();
  }

// public void addInitialBacterias() {
//    for (int i = 0; i < BACTERIAS_INITIAL_NUMBER; i++) {
//      organisms.add(new Organism(new Vector3D(random(width), random(height)),
//      3.0f, 0.1f, util.randomGroup(), floor(random(1.0f, 3.0f)), hm));
//    }
//  }

//  public synchronized Organism addBoid(Vector3D initialPosition) {
//    Organism b = new Organism(initialPosition, 3.0f, 0.1f, util.randomGroup(), PApplet.floor(random(1.0f, 4.0f)), hm);
//    organisms.add(b);
//    return b;
//  }

  public synchronized Organism addBoid(Vector3D initialPosition, String group) {
    Organism b = new Organism(initialPosition, 1.5f, 0.1f, group, floor(random(1.0f, 4.0f)), hm);
    organisms.add(b);
    return b;
  }

  public synchronized void loop() {
    selectedOrganisms = 0;
    //path.display();
    //textFont(font, 10);
    
    for (int i = 0; i < organisms.size(); i++) {
      Organism b = (Organism)organisms.get(i);
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
          selectedOrganisms = selectedOrganisms + 1;
        }
        mainBoid = b;
      }
    }

    displayMenu();
    	
    if(organisms.size() > 400){
      util.duplicateControl = new Vector();
      organisms.clear();
    }
    	
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
    else if(group.equals("11") && drawS[11]){
      ret = true;
    }
    else {
      ret = false;
    }
    return ret;
  }

  private Vector3D separateGroups(Organism b) {
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
    if (action.equals("separateGroups")) {
      Vector3D dest = separateGroups(b);
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
    else if (action.equals("paradeMode")) {
      paradeMode(b);
    } 
    else if(action.equals("killAll")) {
      organisms.removeAll(organisms);
      action = "wander";
    } 
    else if(action.equals("wander")) {
      b.wander();
    } 
    else {
      b.wander();
    }
    if(!action.equals("paradeMode")){
      didGoToInitialPoint = false;
      b.isLabelEnable = false;
    }
  }

  private void paradeMode(Organism b){
    b.acceleration.normalize();
    b.velocity.normalize();
    moveToInitParade();
    stopPointParade(b);
    printLabelForParade(b);
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

  private void printLabelForParade(Organism b) {
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

  private void moveToInitParade() {
    if(!didGoToInitialPoint){
      for (int i = 0; i <organisms.size(); i++) {
        Organism b = (Organism)organisms.get(i);
        b.location.x = 50;
        b.location.y = 50;
      }
      didGoToInitialPoint = true;
    }
  }

  public void stopPointParade(Organism b){
    float up = 15;
    float down = 40;
    float left = 200;
    float right = 205;
    if(b.location.x > left && b.location.x < right
      && b.location.y > up && b.location.y < down){
      b.stop();
    }
  }

  public void setAction(String action_) {
    action = action_;
  }

  public void removeAllFromGroup(String group){
    for (int i = 0; i < organisms.size(); i++) {
      Organism org = (Organism)organisms.get(i);
      if(org.group.equals(group)){
        organisms.remove(i);
      }
    }
  }

  public void updateTopics(String[] topics_) {
    topics = topics_;
  }

  public void displayMenu(){
    int currentX = 10;
    int currentY = 68;

    PImage aux;

    if(topics == null){
      textFont(font,14);
      text("acquiring information...", 800 + currentX, currentY);
    } 
    else {
      textFont(font, 15);
      text(selectedOrganisms + " organisms", 800 + currentX + 15, currentY - 10);
      for(int i = 1; i <= 11; i++){
        String trendTitle = topics[i-1].split("OR")[0].trim();
        aux = (PImage)hm.get("ic" + i);
        pushMatrix();
        translate(800 + currentX,currentY);
        image(aux, 0, 0);
        if(menuCollision(800 + currentX,currentY,200,40)){
          menuSelection = i + "";
        }
        fill(255);
        textFont(font,14);
        text(trendTitle, 40, 20);
        if(!drawS[i]){
          strokeWeight(1);
          stroke(255);
          color c = color(200, 0, 0, 70);
          fill(c);
          rect(-10,-5, 200, 40);
        }
        if(i == 1){
          strokeWeight(2);
          line(4,36,180,36);
        }
        popMatrix();       
        currentY = currentY + 40;
      }

      if(menuCollision(934,503,56,26)){
        menuSelection = "help";
      } 
      else if(menuCollision(917,534,74,24)){
        menuSelection = "about";
      } 
      else if(menuCollision(911,562,78,29)){
        menuSelection = "details";
      }

      if(drawHelp){
        image(help, 26,21);
      } 
      else if (drawAbout){
        image(about, 26,21);
      } 
      else if (drawDetails){
        image(details, 26,21);
      }

    }

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





