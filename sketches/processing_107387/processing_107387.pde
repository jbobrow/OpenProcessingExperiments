

PVector HEADING = new PVector(1, 0); 

int MAP_WIDTH = 64;
int MAP_HEIGHT = 32;

int TILE_EMPTY = 0;
int TILE_WALL = 1;
int TILE_ENTRANCE = 2;
int TILE_EXIT = 3;

float MAX_TALK_TIME = 10;
float MESSAGE_TIME = 2;
float WAIT_TIME = 10;
int MAX_WEIGHT = 15;
int MAX_DO_OVERS = 3;

long lastMillis = 0;

Bootup bootup;
Attract attract;
Game game;
Credits credits;
Level level;
Radio radio;
Agent agent;
Guard guard;

Screen screen;

public void setup() {
 
 size(800, 400, P2D); 
 
 bootup = new Bootup();
 bootup.setup();
 screen = bootup; 
 
}

public void draw() {
  
  // timing
  long nextMillis = millis();
  float deltaTime;
  if (0 == lastMillis) {
    deltaTime = 0;
  } else {
    deltaTime = (nextMillis - lastMillis) / 1000f;
  }
  lastMillis = nextMillis; 
  
  // update screen
  screen.update(deltaTime);
  screen.draw();
  screen = screen.next();  
  
  // clear input
  click = false;
  dragClick = false;
  
}

PVector dragVector = new PVector();
long dragMillis = 0;;
boolean dragging = false;
boolean dragClick = false;
boolean click = false;

public void mousePressed() {
  dragMillis = millis();
  dragVector.x = mouseX;
  dragVector.y = mouseY;
  dragging = false;
}

public void mouseReleased() {
  if (dragging) {
    dragClick = true;
  } else {
    click = true; 
  }
  dragging = false;
}

public void mouseDragged() {
  if ((millis() - dragMillis) > 1000) {
    dragging = true;
  }
}

class Agent {
  
  String name;
  PVector location = new PVector();  
  PVector velocity = new PVector();
  float heading = - PI / 2;
  float patience = 75;
  float fov = PI / 2;
  int teamColor;
  boolean active = false;
  boolean alert = false;
  boolean alive = true;
  float timeSpentDead = 0;
  
  Goal nextMissionGoal;
  Goal lastMissionGoal;
  
  int numGoals = 0;
  int cumWeight = 0;
  Goal nextGoal;
  Goal lastGoal;
  
  public void setup() {
    name = "Agent " + (floor(random(100)));
    teamColor = color(255, 255, 255, 255);
  }
  
  public boolean inFov(float losHeading) {
    float deltaAngle = heading - losHeading;
    float angle = abs(atan2(sin(deltaAngle), cos(deltaAngle)));
    return angle < fov;
  }
  
  public void seesOpponent(Agent opponent, float losHeading) {
    if (!opponent.alive) return;
    if (inFov(losHeading)) {
      if (null == nextGoal) {
        // can see
        if (opponent.inFov(-losHeading)) {
          // both can see
          // start fighting
          clear();
          add(new Fight(opponent));          
          
        } else {
          // takedown 
          clear();
          add(new Takedown(opponent));        
          
        }
      }
      
      nextGoal.seesOpponent(this, opponent);
         
    }
  }
  
  public void update(float deltaTimeInSeconds) {
    if (!alive) {
      // safety kludge 
      timeSpentDead += deltaTimeInSeconds;
    } else {
      timeSpentDead = 0;
    }

    // check mission goals
    if (null != nextMissionGoal) {
      nextMissionGoal.execute(this, deltaTimeInSeconds);
      if (nextMissionGoal.completed) {
        nextMissionGoal = nextMissionGoal.next;
        if (null == nextMissionGoal) {
          lastMissionGoal = null;
        } 
      }
    }

    // execute current sub goal
    if (null != nextGoal) {
      nextGoal.execute(this, deltaTimeInSeconds);  
      if (nextGoal.completed) {
        numGoals--;
        cumWeight -= nextGoal.weight;
        nextGoal = nextGoal.next;
        if (null == nextGoal) {
          lastGoal = null;
        }  
      }
      
    } else if (alive && null != nextMissionGoal) {
      // need a new sub goal
      if (random(100) > patience) {
        add(new Ask("Show me where to go next."));       
      }
      patience = constrain(patience - 10, 25, 100);
      add(new Wait(WAIT_TIME));
      
    }
    
    level.collide(location, velocity, 0.25, deltaTimeInSeconds);
        
  }
  
  public void addMission(Goal goal) {
    if (null == lastMissionGoal) {
      nextMissionGoal = goal;  
    } else {
      lastMissionGoal.next = goal; 
    }
    lastMissionGoal = goal;
    goal.next = null;
  }
 
  public void add(Goal goal) {
    if (null == lastGoal) {
      nextGoal = goal;  
    } else {
      lastGoal.next = goal; 
    }
    lastGoal = goal;
    goal.next = null;
    numGoals++;
    cumWeight += goal.weight;
       if (cumWeight > MAX_WEIGHT) {
      
    }  
  }
  
  public void clear() {
    numGoals = 0;
    cumWeight = 0;
    nextGoal = null;
    lastGoal = null; 
  }
  
  public void clearMission() {
    clear();
    nextMissionGoal = null;
    lastMissionGoal = null; 
  }
  
  public void draw() {
        
    Goal goal = nextGoal;
    while (null != goal) {
      goal.draw();
      goal = goal.next;
    }

    Goal missionGoal = nextMissionGoal;
    while (null != missionGoal) {
      missionGoal.draw();
      missionGoal = missionGoal.next;
    }
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(heading);    
    scale(0.5);
    strokeWeight(0.1);
    stroke(alive ? teamColor : 64);
    fill(64);
    ellipseMode(CENTER);
    ellipse(0, 0, 1, 1);
    if (!alert) {
      // guns holstered
      scale(0.5);
      line(1, 1, 2, 0); // in js line rounds args. seriously?
      line(2, 0, 1, -1);
     
    } else {
      // guns drawn
      scale(0.5);
      line(1, 1, 2, 1);
      line(1, -1, 2, -1);
      
    }
    popMatrix(); 

   
  }
  
}
class Attract extends Screen {
  
  public void setup() {}
  
  public void draw() {
    background(0);
    textAlign(CENTER);
    text("Infiltrators", width / 2, height / 2);
    text("<click mouse to continue>", width / 2, height / 2 + 12);
  }  
  
  public Screen next() {
    if (click) {
      game.restart();
      return game;  
    }
    return attract;
  }
  
}
class Bootup extends Screen {
  
  float percent = 0;
  boolean done = false;
  
  public void update(float deltaTimeInSeconds) {
    percent = constrain(percent + deltaTimeInSeconds * 10, 0, 100);
    if (null == attract) {
      attract = new Attract();
      attract.setup();
      percent = 10;
      
    } else if (null == game) {
      game = new Game();
      game.setup();     
      percent = 20;
      
    } else if (null == level) {
      level = new Level();
      level.setup();
      console.log(level);
      percent = 40;
      
    } else if (null == radio) {
      radio = new Radio();
      radio.setup();
      console.log(radio);
      percent = 60;
      
    } else if (null == agent) {
      agent = new Agent();
      agent.setup();
      console.log(agent);
      percent = 80;
      
    } else if (null == guard) {
      guard = new Guard();
      guard.setup();
      console.log(guard);
      percent = 90;
      
    } else if (null == credits) {
      credits = new Credits();
      credits.setup(); 
      percent = 100;
      
    } else if (percent >= 100) {
      done = true; 
      
    }
  }
  
  public void draw() {
    background(0);
    textAlign(CENTER);
    text(percent, width / 2, height / 2);
  } 
  
  public Screen next() {
    if (done) {
      return attract;
    }
    return bootup;
  }
  
}
class Credits extends Screen {
 
  public void setup() {}
  
  public void draw() {
    background(0);
    strokeWeight(1);
    stroke(255);
    fill(255);
    textAlign(CENTER);
    text("Game Over - Thanks For Playing", width / 2, height / 2);
    text("Total Radio Time: " + radio.totalTalkTime + " Play Time: " + game.totalPlayTime, width / 2, height / 2 + 12);
    text("<click mouse to continue>", width / 2, height / 2 + 24);
  }  
  
  public Screen next() {
    if (click) {
      return attract;  
    }
    return credits;
  }
 
}
class Game extends Screen {

  int doOvers = MAX_DO_OVERS;
  boolean gameOver = false; 
  boolean overLimit = true;
  int missionNumber = 0;
  float totalPlayTime = 0;  
  
  public void setup() {}
  
  public void restart() {
    gameOver = false;
    missionNumber = 0;
    radio.reset();
    agent.clearMission();
    agent.clear();
    guard.clearMission();
    guard.clear();
  }
  
  public void nextLevel() {
    
    level.initMap(missionNumber); 

    radio.reset();
    doOvers = MAX_DO_OVERS;
    overLimit = false;
    agent.clearMission();
    agent.clear();
    agent.velocity.mult(0);
    agent.active = true;
    agent.alive = true;
    guard.clearMission();
    guard.clear();
    guard.velocity.mult(0);
    guard.active = false;
    guard.alive = true;
    
    // find level start and put agent there
    boolean found = level.find(TILE_ENTRANCE, agent.location);
    
    // mission parameters: enter level
    Breach breach = new Breach();
    breach.location.set(agent.location.x, agent.location.y, 0);
    agent.addMission(breach);
            
    // mission parameters: exit level
    Exit exit = new Exit();
    level.find(TILE_EXIT, exit.location);
    // don't add exit goal yet
    
    if (1 == missionNumber) {
      
      agent.add(new Tell("This is " + agent.name + ". I've just infiltrated the compound.", false));
      agent.add(new Tell("Unfortunately this place is a maze and I'll need your help to navigate it.", false));
      agent.add(new Tell("Click on your copy of the map to give me directions.", true));
      agent.add(new Tell("If I get confused I'll check back in but we have to keep chatter to a minimum.", false));
      agent.add(new Tell("The guards will pinpoint my location if I use this channel for more than 10 seconds in one location.", false));
      agent.add(new Tell("I'm counting on you to work fast.", true));
      agent.add(new Tell("Let's do this.", false));

      guard.location.set(agent.location);
      guard.active = false;
      level.levelColor = color(64, 64, 128, 192);
     
    } else if (2 == missionNumber) {

      agent.add(new Tell("Made it.", false));
      agent.add(new Tell("There's a control panel on this level, we have to make it there first before we can exit.", true));
      agent.add(new Tell("There's a guard wandering around too, we'll have to avoid him.", true));
      agent.add(new Tell("Let's do this.", false));
      
      Terminal terminal = new Terminal();
      terminal.location.set(1.5 + floor(random(MAP_WIDTH - 2)), 1.5 + floor(random(MAP_HEIGHT - 2)), 0);
      setTile(level.playfield, floor(terminal.location.x), floor(terminal.location.y), TILE_EMPTY);
      agent.addMission(terminal);
      
      guard.location.set(terminal.location);
      guard.active = true;
      level.levelColor = color(128, 64, 128, 192);

      
    } else if (3 == missionNumber) {
      
      agent.add(new Tell("Okay.", false));
      agent.add(new Tell("The suitcase is on this level, grab it and we can get out of here.", true));
      agent.add(new Tell("I don't see any guards so this should be super easy.", true));
      agent.add(new Tell("Let's do this.", false));
      
      // be mean and put guard at exit
      guard.location.set(exit.location);
      guard.active = false;
      
      Suitcase suitcase = new Suitcase();
      suitcase.location.set(1.5 + floor(random(MAP_WIDTH - 2)), 1.5 + floor(random(MAP_HEIGHT - 2)), 0);
      setTile(level.playfield, floor(suitcase.location.x), floor(suitcase.location.y), TILE_EMPTY);
      agent.addMission(suitcase);      
      
      level.levelColor = color(64, 128, 128, 192);

    }

    agent.addMission(exit);

    agent.add(new Wait(WAIT_TIME));
    
  }
  
  public void update(float deltaTimeInSeconds) {
    
    totalPlayTime += deltaTimeInSeconds;
    
    level.update(deltaTimeInSeconds);

    if (agent.active) {
      agent.update(deltaTimeInSeconds);
    }
    if (guard.active) {
      guard.update(deltaTimeInSeconds); 
    }

    if (agent.active && guard.active) {
      PVector losDir = new PVector();
      boolean hasLos = playfieldLineOfSight(level.playfield, floor(agent.location.x), floor(agent.location.y), floor(guard.location.x), floor(guard.location.y), losDir); 
      float losHeading = losDir.heading2D();
      if (hasLos) {
        agent.seesOpponent(guard, losHeading); 
        guard.seesOpponent(agent, -losHeading);
      }
    }
    
    radio.update(deltaTimeInSeconds);
        
    // game states
    if (null == agent.nextMissionGoal) {
      missionNumber++;
      nextLevel();
      if (missionNumber > 3) {
        gameOver = true;
      }
      
    } else if (!overLimit && radio.isOverLimit()) {
      overLimit = true;
      
      // agent should do this
      agent.clear();
      agent.add(new Tell("We've used the radio too much, the guards are alerted.", false));
      agent.add(new Tell("I've either got to take the guard down with an ambush or evade capture long enough to get to the exit.", true));
      agent.add(new Tell("Your call.", false));
      
      // activate guard 
      guard.hunt(agent);
      
    } else if (!guard.alive && null == guard.nextGoal) {
      
      radio.reset();
      level.find(TILE_ENTRANCE, guard.location);
      guard.active = false;
      guard.alive = true;
      
      
    } else if (!agent.alive && agent.timeSpentDead > 5) {
      doOvers--;
      if (doOvers <= 0) {
        gameOver = true;
      } else {
        nextLevel();
      }
      
    } else if (agent.cumWeight > MAX_WEIGHT) {
      // cognitive overload
      agent.clear();
      agent.add(new Ask("Whoa, I'm getting confused here. Too many turns. Keep it simple, okay?"));
      
    }
    
    if (key == 'q') {
      // quit
      console.log("quit key pressed");
      gameOver = true;
      key = 0;
      
    } else if (key == 'g') {
      // call guard
      Path seek = searchPathTree(level.playfield, floor(guard.location.x), floor(guard.location.y), floor(agent.location.x), floor(agent.location.y), 1000);
      guard.clear();
      guard.add(new Follow(seek));
      guard.active = true;
      guard.alive = true;
//      key = 0;
      
    }    
    
  }
  
  public void draw() {
    
    background(0);
    
    level.draw();
    radio.draw();

  }  
  
  public Screen next() {
    if (gameOver) {
      return credits;  
    }
    return game;
  }
  
}
class Goal {

  PVector location = new PVector();
  boolean completed = false;
  int weight = 0;
  
  Goal next; 
    
  public void execute(Agent agent, float deltaTimeInSeconds) {}

  public void seesOpponent(Agent agent, Agent opponent) {}

  public void draw() {}

  public String getDescription() {
    return null;
  }
  
    
}

class MoveTo extends Goal {

  PVector direction = new PVector();

  public void draw() {
    pushMatrix();
    translate(location.x, location.y);
    strokeWeight(0.1);
    stroke(255);
    fill(200);
    ellipseMode(CENTER);
    ellipse(0, 0, 1, 1);
    popMatrix();
  }
 
  public void execute(Agent agent, float deltaTimeInSeconds) {
    direction.set(location);
    direction.sub(agent.location);
    if (direction.mag() < .1) {
      completed = true; 
      agent.velocity.mult(0);
      
    } else {      
      direction.normalize();
      direction.mult(2.0);
      float desiredHeading = direction.heading2D();
      agent.velocity.lerp(direction, deltaTimeInSeconds);
      agent.heading = lerp(agent.heading, desiredHeading, 0.1);  
      
    }
  }
  
}

class Follow extends MoveTo {

  Path path;
  
  public Follow(Path path) {
    this.path = path;
    this.weight = path.getNumTurns();
    Path end = path.getEnd();
    location.set(end.i + 0.5, end.j + 0.5, 0);
  }
  
  public void seesOpponent(Agent agent, Agent other) {
    agent.clear();
    agent.add(new Fight(other));
    agent.nextGoal.seesOpponent(agent, other);
  }
  
  public void draw() {
    pushMatrix();
    translate(location.x, location.y);
    strokeWeight(0.1);
    stroke(0, 255, 0);
    fill(200);
    ellipseMode(CENTER);
    ellipse(0, 0, 0.5, 0.5);
    popMatrix();

    if (null != path) {
      Path node = path;
      float alpha = 255;
      while (null != node) {
        alpha *= 0.75;
        pushMatrix();
        translate(node.i + 0.5, node.j + 0.5);
        strokeWeight(0.1);
        stroke(255, 255, 255, alpha);
        fill(200, 200, 200, alpha);
        ellipseMode(CENTER);
        ellipse(0, 0, 0.5, 0.5);
        popMatrix();
        node = node.child;
      }
    }
    
  }
 
  public void execute(Agent agent, float deltaTimeInSeconds) {
    direction.set(path.i + 0.5, path.j + 0.5, 0);
    direction.sub(agent.location);
    if (direction.mag() < .1) {
      path = path.child;
      if (null == path) {
        completed = true; 
        agent.velocity.mult(0);
      }
      
    } else {      
      direction.normalize();
      direction.mult(2.0);
      agent.velocity.set(direction);
      agent.heading = agent.velocity.heading2D();  
      
    }
  }
  
}

class Fight extends MoveTo {
  
  float fightTime = 0;
  float warmUp = 0;
  Agent opponent;
  PVector lastSeenAt = new PVector();
  boolean shooting = false;
  
  public Fight(Agent opponent) {
    this.opponent = opponent;
  }  
  
  public void seesOpponent(Agent agent, Agent other) {
    if (opponent != other) return;
    lastSeenAt.set(other.location);
  }
  
  public void execute(Agent agent, float deltaTimeInSeconds) {
    // kludge
    location.set(agent.location);
    
    // fight until win
    if (!opponent.alive) {
      agent.alert = false;
      completed = true;
      return; 
    }
    
    // keep fighting
    fightTime += deltaTimeInSeconds;
    warmUp += deltaTimeInSeconds;
    
    agent.alert = true;
    boolean los = playfieldLineOfSight(level.playfield, floor(agent.location.x), floor(agent.location.y), floor(lastSeenAt.x), floor(lastSeenAt.y), direction);
    float distance = direction.mag();
    if (distance < 1) {
      if (fightTime > 1 && random(100) > 50) {
        fightTime = 0;
        
        // struggle for a bit then execute throw for knockout
        direction.fromAngle(random(TWO_PI));
        direction.normalize();
        direction.mult(3.0);
        opponent.clear();
        opponent.velocity.set(direction);
        opponent.add(new Knockout());
        
      }
      
    } else {

      // shooting and dodging
      shooting = false;
      
      // Kludgey circle strafe
      agent.heading = direction.heading2D();
      float theta = sin(fightTime) > 0 ? HALF_PI : - HALF_PI;
      float tx = direction.x;
      direction.x = direction.x * cos(theta) - direction.y * sin(theta);
      direction.y = tx * sin(theta) + direction.y * cos(theta);
      direction.normalize();
      direction.mult(2.0);
      agent.velocity.set(direction);

      if (warmUp > 0.5 && warmUp < 1.0 && random(100) > 50 && los) {
          shooting = true;
          opponent.clear();
          opponent.velocity.set(direction);
          opponent.add(new Knockout());
          
      } else if (warmUp >= 1.0) {
          warmUp = 0;
          shooting = false; 
          
      }
      
    }
    
  }
  
  public void draw() {
    
    if (shooting) {
      // more bad last minute kludges to get gunpoint
      direction.set(lastSeenAt);
      direction.sub(location);
      direction.normalize();
      direction.mult(0.6);
      
      strokeWeight(0.1);
      stroke(255, 0, 255, 192 * cos(warmUp));
      line(location.x + direction.x, location.y + direction.y, lastSeenAt.x, lastSeenAt.y);
    }
    
  }
  
}

class Takedown extends Fight {
  
  float takedownTime = 0;

  public Takedown(Agent opponent) {
    super(opponent);
  }  

  public void execute(Agent agent, float deltaTimeInSeconds) {
    if (!opponent.alive) {
      agent.alert = false;
      completed = true;
      return; 
    }
    
    takedownTime += deltaTimeInSeconds;
    
    if (takedownTime > 3) {
      agent.alert = false;
      completed = true;
      return; 
    }
    
    direction.set(lastSeenAt);
    direction.sub(agent.location);
    float distance = direction.mag();
    if (distance < 1) {
      agent.alert = true;
      
      // try to take down
      opponent.clear();
      opponent.add(new Knockout());
      
    } else {
      agent.alert = false;

      // quickly move towards
      direction.set(lastSeenAt);
      direction.sub(agent.location);
      direction.normalize();
      direction.mult(3);
      agent.heading = direction.heading2D();
      agent.velocity.set(direction);
      
    }
  }
  
}

class Knockout extends Goal {

  float knockoutTime = 0;
  public void execute(Agent agent, float deltaTimeInSeconds) {
      agent.alert = false;
      agent.alive = false;
      knockoutTime  += deltaTimeInSeconds;
      if (knockoutTime > 5) {
        completed = true;
      }
  }
  
}
class Ambush extends Goal {

  public Ambush() {}
  
  public void execute(Agent agent, float deltaTimeInSeconds) {
    println("ambush mode");
    float distance = agent.location.dist(guard.location);
    if (distance < 1) {
      println("super awesome takedown!"); 
    } else {
      println("waiting for ambush");
    }
  }
  
}

class Tell extends Goal {
  
  String statement;
  boolean showMap;
  
  public Tell(String statement, boolean showMap) {
    this.location.set(agent.location); // KLUDGE
    this.statement = statement; 
    this.showMap = showMap;
  }
  
  public void execute(Agent agent, float deltaTimeInSeconds) {
    radio.add(new Message(statement, true, !showMap));
    completed = true;
  }
  
}

class Ask extends Goal {
  
  String question;
  
  public Ask(String question) {
    this.location.set(agent.location);// KLUDGE
    this.question = question; 
  }
  
  public void execute(Agent agent, float deltaTimeInSeconds) {
    radio.add(new Message(question, false, false));
    completed = true;
  }
  
}

class Wait extends Goal {
 
  float timeLeft;
  
  public Wait(float waitTime) {
    this.location.set(agent.location); // KLUDGE
    this.timeLeft = waitTime; 
  }
  
  public void execute(Agent agent, float deltaTimeInSeconds) {
    if (!radio.isActive()) timeLeft -= deltaTimeInSeconds;
    completed = (timeLeft <= 0) || (next != null); // I've got a new goal
  }
 
}

/**
 * Mission goal
 */
class Breach extends Goal {

    public void execute(Agent agent, float deltaTimeInSeconds) {
      completed = location.dist(agent.location) < .1;
    }

    public String getDescription() {
      return "Breach the facility"; 
    }
  
    public void draw() {
      pushMatrix();
      translate(location.x, location.y);
      strokeWeight(0.1);
      stroke(0, 255, 0);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, 2, 2);
      popMatrix();
    }

}

/**
 * Mission goal
 */
class Exit extends Goal {
  
    public void execute(Agent agent, float deltaTimeInSeconds) {
      completed = location.dist(agent.location) < .5;
    }
  
    public String getDescription() {
      return "Get to the exit"; 
    }
  
    public void draw() {
      pushMatrix();
      translate(location.x, location.y);
      strokeWeight(0.1);
      stroke(255, 0, 0);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, 2, 2);
      popMatrix();
    }

}

/**
 * Mission goal
 */
class Terminal extends Goal {

    public void execute(Agent agent, float deltaTimeInSeconds) {
      completed = location.dist(agent.location) < .1;
    }

    public String getDescription() {
      return "Hack the terminal"; 
    }
  
    public void draw() {
      pushMatrix();
      translate(location.x, location.y);
      strokeWeight(0.1);
      stroke(0, 0, 255);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, 2, 2);
      popMatrix();
    }

}

/**
 * Mission goal
 */
class Suitcase extends Goal {

    public void execute(Agent agent, float deltaTimeInSeconds) {
      completed = location.dist(agent.location) < .1;
      if (completed && !guard.active) {
        // send the guard out
        guard.hunt(agent);  
      }
    }

    public String getDescription() {
      return "Get the suitcase"; 
    }
  
    public void draw() {
      pushMatrix();
      translate(location.x, location.y);
      strokeWeight(0.1);
      stroke(0, 0, 255);
      noFill();
      ellipseMode(CENTER);
      ellipse(0, 0, 2, 2);
      popMatrix();
    }

}
class Guard extends Agent {
  
   public void setup() {
    name = "Guard " + (floor(random(100)));
    teamColor = color(255, 0, 0, 255);
  }
   
  public void update(float deltaTimeInSeconds) {

    if (active && alive && null == nextGoal) {
      // go patrol
      PVector target = new PVector();
      level.random(TILE_EMPTY, target);
      Path seek = searchPathTree(level.playfield, floor(location.x), floor(location.y), floor(target.x), floor(target.y), 1000);
      clear();
      add(new Follow(seek));
    }
    
    super.update(deltaTimeInSeconds);

  }
  
  public void hunt(Agent agent) {
    Path seek = searchPathTree(level.playfield, floor(guard.location.x), floor(guard.location.y), floor(agent.location.x), floor(agent.location.y), 1000);
    clear();
    add(new Follow(seek));
    active = true;
    alive = true;
  }
  
}
class Level {
 
  float top;
  float left;
  float bottom;
  float right;
  float w;
  float h;
  float leftMargin = 15;
  float topMargin = 15;
  float rightMargin = 15;
  float bottomMargin = 15;
  float levelScale = 50;
  float cursorX;
  float cursorY;
  int levelColor = color(64, 64, 128, 192);
  Path path;
  boolean zoom = false;
  
  int[] playfield;
  float[] activityLevels;
  
  public void setup() {
    
    playfield = new int[MAP_WIDTH * MAP_HEIGHT];
    
    resize(MAP_WIDTH, MAP_HEIGHT);
    
  }
  
  public void resize(float x, float y) {
    
    levelScale = lerp(levelScale, zoom ? 50 : ((height - (topMargin + bottomMargin)) / MAP_HEIGHT), 0.1);

    w = MAP_WIDTH * levelScale;
    h = MAP_HEIGHT * levelScale;    
                
    left = lerp(constrain((width / 2) - x * levelScale, width - rightMargin - w, leftMargin), left, 0.1);
    top = lerp(constrain((height / 2) - y * levelScale, height - bottomMargin - h, topMargin), top, 0.1);
    bottom = top + h;
    right = left + w;
    
  }
  
  public void initMap(int number) {
    generateMap(playfield, number);
  }
  
  public boolean find(int tile, PVector location) {
    int idx = findTile(playfield, tile, 0);
    if (idx < 0) return false;
    int j = floor(idx / MAP_WIDTH);
    int i = idx - (j * MAP_WIDTH);
    location.x = i + 0.5;
    location.y = j + 0.5;
    return true;
  }
  
  public void random(int tile, PVector location) {
    int idx = findRandomTile(playfield, tile);
    int j = floor(idx / MAP_WIDTH);
    int i = idx - (j * MAP_WIDTH);
    location.x = i + 0.5;
    location.y = j + 0.5;
  }
  
  public void collide(PVector location, PVector velocity, float radius, float deltaTimeInSeconds) {
    float lx = location.x + velocity.x * deltaTimeInSeconds;
    float ly = location.y + velocity.y * deltaTimeInSeconds;
    if (TILE_WALL == getTile(playfield, floor((lx - radius)), floor(ly))) {
      lx = ceil(lx - 1) + radius;
       
    }
    if (TILE_WALL == getTile(playfield, floor((lx + radius)), floor(ly))) {
      lx = floor(lx + 1) - radius;

    }
    if (TILE_WALL == getTile(playfield, floor(lx), floor((ly - radius)))) {
      ly = ceil(ly - 1) + radius;
       
    }
    if (TILE_WALL == getTile(playfield, floor(lx), floor((ly + radius)))) {
      ly = floor(ly + 1) - radius;
      
    }
    location.x = lx;
    location.y = ly;
  }
  
  public void update(float deltaTimeInSeconds) {
  
    if (radio.isModal()) {
      
      // zoom by radio focus
      zoom = radio.next.zoom;

    }
          
    resize(agent.location.x, agent.location.y);

    cursorX = (mouseX - left) / levelScale;
    cursorY = (mouseY - top) / levelScale;
         
    if (!radio.isModal() && mouseX > (width / 2 - 50) && mouseX < (width / 2 + 50) && mouseY < topMargin && click) {
      
      // zoom click
      zoom = !zoom;
      
    } else if (cursorX >= 0  && cursorX < MAP_WIDTH && cursorY >= 0 && cursorY < MAP_HEIGHT) {
  
        float targetX = floor(cursorX) + 0.5;
        float targetY = floor(cursorY) + 0.5;
        float sourceX = (null != agent.lastGoal) ? agent.lastGoal.location.x : agent.location.x;
        float sourceY = (null != agent.lastGoal) ? agent.lastGoal.location.y : agent.location.y;

        if (!dragging && !dragClick) {
          
          path = searchPathTree(playfield, floor(sourceX), floor(sourceY), floor(targetX), floor(targetY), 20);
  
          if (null != path && click) {
            // go to path
            Follow follow = new Follow(path);
            agent.add(follow); 
            if (radio.isOverLimit()) {
              guard.hunt(agent); 
            }
          }
          
        } else {

          float hideX = (dragVector.x - left) / levelScale;
          float hideY = (dragVector.y - top) / levelScale;
          
          
          path = searchPathTree(playfield, floor(sourceX), floor(sourceY), floor(hideX), floor(hideY), 20);
  
          if (null != path && dragClick) {
            // go to hide spot and set up ambush
            Follow follow = new Follow(path);
            agent.add(follow);
            Ambush ambush = new Ambush();
            ambush.location.set(targetX, targetY, 0);
            agent.add(ambush); 
            if (radio.isOverLimit()) {
              guard.hunt(agent); 
            }
          }
          
        }

    }  
  }
  
  public void draw() {

    pushMatrix();     
    
    translate(left, top);    
    scale(levelScale);
    // draw corridors
    
    noStroke();
    fill(64, 255, 64);

    for (int i = 0; i < MAP_WIDTH; i++) {
      for (int j = 0; j < MAP_HEIGHT; j++) {
        int tile = getTile(playfield, i, j);
        if (TILE_WALL != tile) {
          float x = i;
          float y = j;
          rect(x, y, 1, 1);
        }
      }
    }
    
    // draw floors
    noStroke();
    fill(levelColor);
    
    for (int i = 0; i < MAP_WIDTH; i++) {
      for (int j = 0; j < MAP_HEIGHT; j++) {
        int tile = getTile(playfield, i, j);
        if (TILE_WALL != tile) {
          float x = i;
          float y = j;
          rect(x, y, 1, 1);
        }
      }
    }

    // draw path
    if (!radio.isModal()) {
      if (null != path) {
        Path node = path.child;
        float alpha = 255;
        while (null != node) {
          alpha *= 0.9;
          pushMatrix();
          strokeWeight(0.1);
          stroke(255, 255, 255, alpha); 
          fill(64, 64, 64, alpha); 
          translate(node.i + 0.5, node.j + 0.5);
          ellipseMode(CENTER);
          ellipse(0, 0, 0.5, 0.5);
          popMatrix();
          node = node.child;
        }
      }
    }
    
    // draw agent on this map
    if (agent.active) {
      agent.draw();
    }
    
    // draw guard on this map
    if (guard.active) {
      guard.draw();
    }
    
    popMatrix();
    
    // draw zoom bar
    if (!radio.isModal()) {
      noStroke();
      fill(255);
      rect(width / 2 - 50, 0, 100, topMargin);
      stroke(0);
      fill(0);
      textAlign(CENTER);
      text(zoom ? "ZOOM OUT" : "ZOOM IN", width / 2, 12);
    }
    
    // heading pointer
    if (dragging) {
      strokeWeight(1);
      stroke(255, 0, 0);
      line(dragVector.x, dragVector.y, mouseX, mouseY); 
    }
    
  }
  

  
}

public void generateMap(int[] playfield, int number) {
  
  randomSeed(number);
  
  createMaze(playfield);
  //clearMap(playfield);
  
}

/**
 * check line of sight
 */
public boolean playfieldLineOfSight(int[] playfield, int fromI, int fromJ, int toI, int toJ, PVector direction) {
  
  float dx = toI - fromI;
  float dy = toJ - fromJ;
  float distance = sqrt((dx * dx) + (dy * dy));
  
  float ddx = dx / distance;
  float ddy = dy / distance;
  
  float x = fromI;
  float y = fromJ;
  
  for (int n = 0; n < distance; n++) {
    x = x + ddx;
    y = y + ddy;
    int idx = indexOf(floor(x), floor(y));
    if (TILE_WALL == playfield[idx]) {
      return false; 
    }
  }
  
  if (null != direction) {
    direction.x = dx;
    direction.y = dy;
  }
  
  return true;
  
}

/**
 * convert map x, y to index
 */
public int indexOf(int i, int j) {
  return i + j * MAP_WIDTH;
}

public void setTile(int[] playfield, int i, int j, int tile) {
  playfield[i + j * MAP_WIDTH] = tile;
}

public int getTile(int[] playfield, int i, int j) {
  if (i < 0 || i >= MAP_WIDTH || j < 0 || j >= MAP_HEIGHT) return TILE_WALL;
  return playfield[i + j * MAP_WIDTH];
}

public int tileAdd(int idx, int di, int dj) {
  return idx + di + dj * MAP_WIDTH;
}

public int findTile(int[] playfield, int tile, int offset) {
  for (int i = offset; i < playfield.length; i++) {
    if (tile == playfield[i]) {
      return i;
    }
  }
  return -1;
}

public int findRandomTile(int[] playfield, int tile) {
  while (true) {
    int idx = floor(random(playfield.length));
    if (tile == playfield[idx]) {
      return idx; 
    }
  }
}

/**
 * Clear map with walls, entrance and exit.
 */
public void clearMap(int[] playfield) {

  for (int i = 0; i < MAP_WIDTH; i++) {
    for (int j = 0; j < MAP_HEIGHT; j++) {
      setTile(playfield, i, j, TILE_EMPTY);
    }  
  } 
  
  for (int i = 0; i < MAP_WIDTH; i++) {
    setTile(playfield, i, 0, TILE_WALL);
    setTile(playfield, i, MAP_HEIGHT - 1, TILE_WALL);
  }
  
  for (int j = 0; j < MAP_HEIGHT; j++) {
    setTile(playfield, 0, j, TILE_WALL);
    setTile(playfield, MAP_WIDTH - 1, j, TILE_WALL);
  }  
  
  int entrance = floor(random(MAP_WIDTH - 2)) + 1;
  setTile(playfield, entrance, MAP_HEIGHT - 1, TILE_ENTRANCE);

  int exit = floor(random(MAP_WIDTH - 2)) + 1;
  setTile(playfield, exit, 0, TILE_EXIT);

}

class Wall {
 
  int ci;
  int oi;
  
  public Wall(int from, int di, int dj) {
    this.ci = tileAdd(from, di, dj);
    this.oi = tileAdd(ci, di, dj); 
  }
  
}

public boolean inBounds(int idx) {
  int j = floor(idx / MAP_WIDTH);
  int i = floor(idx - j * MAP_WIDTH);
  return 0 < i && (MAP_WIDTH - 1) > i && 0 < j &&  (MAP_HEIGHT - 1) > j;
}

public boolean onMap(int idx) {
  int j = floor(idx / MAP_WIDTH);
  int i = idx - j * MAP_WIDTH;
  return 0 <= i && MAP_WIDTH > i && 0 <= j &&  MAP_HEIGHT > j;
}

public void addRandomWall(ArrayList<Wall> s, Wall w) {
  if (s.size() > 0) {
    int r = floor(random(s.size()));
    Wall d = s.get(r);
    s.set(r, w);
    s.add(d);
  } else {
    s.add(w);
  }
}

/**
 * Note this is making a crappy maze
 */ 
public void createMaze(int[] playfield) {
    ArrayList<Wall> wallList = new ArrayList<Wall>();
    boolean[] visited = new boolean[playfield.length];
    
    for (int i = 0; i < MAP_WIDTH; i++) {
      for (int j = 0; j < MAP_HEIGHT; j++) {
        if (0 == i || MAP_WIDTH - 1 == i || 0 == j || MAP_HEIGHT - 1 == j) {
          visited[indexOf(i, j)] = true;
        }
        setTile(playfield, i, j, TILE_WALL);
      }  
    } 
    
    int entrance = floor(random(MAP_WIDTH - 2)) + 1;
    setTile(playfield, entrance, MAP_HEIGHT - 1, TILE_ENTRANCE);
  
    // start at entra    
    int pick = indexOf(entrance, MAP_HEIGHT - 1);
    visited[pick] = true;
    wallList.add(new Wall(pick, 0, -1));

    while (wallList.size() > 0) {
      Wall wall = wallList.remove(wallList.size() - 1);
      
      if (!visited[wall.oi]) {
    
        int left = tileAdd(wall.ci, -1, 0);
        int right = tileAdd(wall.ci, 1, 0);
        int up = tileAdd(wall.ci, 0, -1);
        int down = tileAdd(wall.ci, 0, 1);
      
        playfield[wall.ci] = TILE_EMPTY;

        visited[left] = true;
        visited[tileAdd(wall.ci, -1, -1)] = true;
        visited[right] = true;
        visited[tileAdd(wall.ci, -1, 1)] = true;
        visited[up] = true;
        visited[tileAdd(wall.ci, 1, -1)] = true;
        visited[down] = true;
        visited[tileAdd(wall.ci, 1, 1)] = true;

        if (inBounds(left) && TILE_WALL == playfield[left]) {
          addRandomWall(wallList, new Wall(wall.ci, -1, 0));
        }
        if (inBounds(right) && TILE_WALL == playfield[right]) {
          addRandomWall(wallList, new Wall(wall.ci, 1, 0));
        }      
        if (inBounds(up) && TILE_WALL == playfield[up]) {
          addRandomWall(wallList, new Wall(wall.ci, 0, -1));
        }      
        if (inBounds(down) && TILE_WALL == playfield[down]) {
          addRandomWall(wallList, new Wall(wall.ci, 0, 1));
        }      
      }
    } 
    
    // find the empty tile nearest the top
    int exit = findTile(playfield, TILE_EMPTY, 0);
    while (exit > MAP_WIDTH) {
      exit = tileAdd(exit, 0, -1);
      setTile(playfield, exit, 0, TILE_EMPTY);       
    }
    setTile(playfield, exit, 0, TILE_EXIT);

}
class Message {
  
  String text;
  boolean modal;
  boolean zoom;
  float timeLeft;
  Message next;
 
  public Message(String text, boolean modal, boolean zoom) {
    this.text = text;
    this.modal = modal;
    this.timeLeft = MESSAGE_TIME;
    this.zoom = zoom;
  }
 
  public void decrement(float deltaTimeInSeconds) {
    timeLeft = constrain(timeLeft - deltaTimeInSeconds, 0, MAX_TALK_TIME);
  }
  
}
/**
 * Binary Heap Javascript code courtesy CC license 3.0
 * http://eloquentjavascript.net/appendix2.html
 */
 
/**
 * Good old fashioned A*
 */
public Path searchPathTree(int[] playfield, int fromI, int fromJ, int toI, int toJ, int limit) {
  boolean[] visited = new boolean[playfield.length];
  ArrayList<Path> paths = new ArrayList<Path>();
  
  Path root = new Path(null, fromI, fromJ, toI, toJ);
  while (root.distance > 0 && limit > 0) {
    --limit;
    
    int idx = indexOf(root.i, root.j);
    visited[idx] = true;
    
    int left = tileAdd(idx, -1, 0);
    if (onMap(left) && !visited[left] && TILE_WALL != playfield[left]) {
      insertPath(paths, new Path(root, root.i - 1, root.j, toI, toJ));  
    }
    int right = tileAdd(idx, 1, 0);
    if (onMap(right) && !visited[right] && TILE_WALL != playfield[right]) {
      insertPath(paths, new Path(root, root.i + 1, root.j, toI, toJ));  
    }
    int up = tileAdd(idx, 0, -1);
    if (onMap(up) && !visited[up] && TILE_WALL != playfield[up]) {
      insertPath(paths, new Path(root, root.i, root.j - 1, toI, toJ));  
    }
    int down = tileAdd(idx, 0, 1);
    if (onMap(down) && !visited[down] && TILE_WALL != playfield[down]) {
      insertPath(paths, new Path(root, root.i, root.j + 1, toI, toJ));  
    }
    
    if (paths.size() == 0) {
      break;
    }
    root = popPath(paths);
    
  }
  
  return root.link();
  
}

/**
 * Make a heap of an arraylist
 */
public void insertPath(ArrayList<Path> paths, Path path) {
  paths.add(path);
  bubbleUpPath(paths, paths.size() - 1);
}

public void bubbleUpPath(ArrayList<Path> paths, int n) {
  Path path = paths.get(n);
  while (n > 0) {
    int pn = Math.floor((n + 1) / 2) - 1;
    Path parent = paths.get(pn);
    if (path.distance >= parent.distance) {
      break; 
    }
    paths.set(pn, path);
    paths.set(n, parent);
    n = pn;
  }
}

public void sinkDownPath(ArrayList<Path> paths, int n) {
  int length = paths.size();
  Path path = paths.get(n);
  while (true) {
    int c2n = (n + 1) * 2;
    int c1n = c2n - 1;
    Path swap = null;
    int sn = 0;
    if (c1n < length) {
      Path c1 = paths.get(c1n);
      if (c1.distance < path.distance) {
        swap = c1;
        sn = c1n;
      }
    }
    if (c2n < length) {
      Path c2 = paths.get(c2n);
      if (c2.distance < (null == swap ? path.distance : swap.distance)) {
        swap = c2;
        sn = c2n;
      }
    }
    
    if (null == swap) break;
    
    paths.set(n, swap);
    paths.set(sn, path);
    n = sn;
  }
} 

public Path popPath(ArrayList<Path> paths) {
  Path result = paths.get(0);
  Path end = paths.remove(paths.size() - 1);
  if (paths.size() > 0) {
    paths.set(0, end);
    sinkDownPath(paths, 0);
  }
  return result;
}

class Path {
  
 int i;
 int j;
 float distance;
 Path parent;
 Path child;
 
 public Path(Path parent, int fromI, int fromJ, int toI, int toJ) {
  
  this.parent = parent;
  this.i = fromI;
  this.j = fromJ;
  float dx = toI - fromI;
  float dy = toJ - fromJ;
  this.distance = sqrt((dx * dx) + (dy * dy));
  
 }
  
 public boolean equals(Object b) {
   if (null == b) return false;
   if (! (b instanceof Path) ) return false;
   Path p = (Path) b;
   return i == p.i && j == p.j; 
 }
 
 public int hashCode() {
   return indexOf(i, j);  
 }
 
 public int getNumTurns() {
   int turns = 0;
   Path r = this;
   int di = 0;
   int dj = 0;
   while (null != r.child) {
     int ndi = r.i - r.child.i;
     int ndj = r.j - r.child.j;
     if (di - ndi != 0 || dj - ndj != 0) {
       turns++; 
     }
     di = ndi;
     dj = ndj;
     r = r.child;
   }
   return turns;
 }
 
 public Path getEnd() {
    Path r = this;
   while (null != r.child) {
     r = r.child;
   }
   return r;
 }
 
 public Path link() {
   Path r = this;
   while (null != r.parent) {
     r.parent.child = r;
     r = r.parent;
   }
   return r;
 }
  
}
class Radio {
  
  Message next = null;
  Message lastGoal = null;
  
  float talkTime = 0;
  float totalTalkTime = 0;
 
  public void setup() {

  }

  public void reset() {
    talkTime = 0;  
    next = null;
    lastGoal = null;
  }
  
  public boolean isModal() {
    return null != next && next.modal;  
  }

  public boolean isOverLimit() {
    return talkTime > MAX_TALK_TIME;  
  }

  public boolean isActive() {
    return (null != next); 
  }
  
  public void add(Message message) {
    if (null == lastGoal) {
      next = message;  
    } else {
      lastGoal.next = message; 
    }
    lastGoal = message;
    message.next = null;
  }
  
  public void update(float deltaTimeInSeconds) {
    if (!isActive()) return;
    
    if (!next.modal) {
      talkTime += deltaTimeInSeconds;
      totalTalkTime += deltaTimeInSeconds;
    }

    next.decrement(deltaTimeInSeconds);
    if (!(next.timeLeft > 0)) {
      next = next.next;
    }
    
    if (null == next) {
      lastGoal = null; 
    }
    
  } 
  
  public void draw() {
    
    // timer
    pushMatrix();
    translate(width - 40, height - 40);
    stroke(255, 255, 255, 200);
    strokeWeight(2);
    ellipseMode(CENTER);
    ellipse(0, 0, 60, 60);
    
    // 10S MARK
    rotate(- 2 * PI / 3);
    stroke(255, 0, 0, 200);
    line(0, 0, 0, 30);

    // TALK TIME
    rotate(talkTime * PI / 30f - PI / 3);
    stroke(255, 255, 255, 200);
    beginShape(TRIANGLES);
    vertex(-1, 0);
    vertex(0, 30);
    vertex(1, 0);
    endShape();


    popMatrix();

    if (isActive()) {
      pushMatrix();
      translate(width / 2, height * 3 / 4);
      float tw = textWidth(next.text);
      noStroke();
      fill(64, 64, 64, 220);
      rect(-tw / 2 - 12, -12, tw + 24, 24);
      stroke(255);
      fill(255);
      text(next.text, 0, 0); 
      popMatrix();
    }
  }
  
}
class Screen {
  
  public Screen() {}
  
  public void setup() {}
  
  public void update(float deltaTimeInSeconds) {}
  
  public void draw() {
    background(0); 
  }
  
  public Screen next() {
    return this;
  }  
  
}


