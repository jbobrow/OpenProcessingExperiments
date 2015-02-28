
class Edge {
  private State to;
  private int[] weight;
  
  public Edge(State to, int[] weight) {
    this.to = to;
    this.weight = weight;
  }
  
  public State getTo() { return to; }
  public int[] getWeight() { return weight; }
  
  /*
   * Takes oldPoint and apply this edges weight to it, returning the new transformed point
   */
  public int[] applyWeight(int[] oldPoint) {
     return new int[] {
       oldPoint[0] + weight[0],
       oldPoint[1] + weight[1] };       
  }
}

class State {
  private  HashMap outgoingEdges = new HashMap();  // maping of edge end state id to edge
  private ArrayList outgoingEdgeIds = new ArrayList();  // list of all outgoing edge id's from this state
  private int id;
  
  public State(int id) { this.id = id; }
  public int getId() { return id; }
  
  /*
   * Adds an edge to this state. 
   */  
  public State addEdge(State to, int[] weight) {
    Edge out = new Edge(to, weight);
    outgoingEdges.put(to.getId(), out);
    outgoingEdgeIds.add(to.getId());
    return this;
  }
  
  public State getState(State state) {
    return ((Edge)outgoingEdges.get(state.getId())).getTo(); 
  }
  public State getState(int stateId) {
    return ((Edge)outgoingEdges.get(stateId)).getTo(); 
  }
  
  public Edge getEdge(State state) {
     return (Edge)outgoingEdges.get(state.getId()); 
  }
  public Edge getEdge(int stateId) {
     return (Edge)outgoingEdges.get(stateId); 
  }
  
  /*
   * Gets a outgoing Edge by index, where 0 <= index < this.size()
   */
  public Edge getEdgeByIndex(int index) {
    return (Edge)outgoingEdges.get(outgoingEdgeIds.get(index));
  }
  
  public int outgoingSize() { return outgoingEdgeIds.size(); }
  public ArrayList getEdgeIds() { return outgoingEdgeIds; }
  
  public Edge pickRandomEdge() {
     return (Edge)outgoingEdges.get(outgoingEdgeIds.get(int(random(0, outgoingEdgeIds.size()))));
  }
}

class StateMachine {
  protected State[] states;
  
  /*
   * states: the number of states in the state machine. States MUST be numbered 0 .. states
   */
  public StateMachine(int states) {
    this.states = new State[states];
    for (int i = 0; i < states; i++) {
      this.states[i] = new State(i);
    }
  }
    
  public StateMachine addEdge(State from, State to, int[] weight) {
     states[from.getId()].addEdge(to, weight);
     return this;
  }
  public StateMachine a(State from, State to, int[] weight) {
    return addEdge(from, to, weight);
  }
  
  public StateMachine addEdge(int from, int to, int[] weight) {
     states[from].addEdge(states[to], weight);
     return this; 
  }
  public StateMachine a(int from, int to, int[] weight) {
    return addEdge(from, to, weight);
  }
  
  public StateMachine add0Edge(int from, int to) {
    states[from].addEdge(states[to], new int[] {0, 0});
    return this;
  }
  public StateMachine a0(int from, int to) {
    return add0Edge(from, to);
  }
  
  public State getState(int state) {
    return states[state]; 
  }
  
  /*
   * Gets a random edge
   */
  public Edge pickRandomEdge(int fromState) {
     return states[fromState].pickRandomEdge();
  } 
  
  /*
   * Takes two states, the previous and next, and moves the currentPoint according
   * to the weight of the edge between the two states returning
   * the new point
   */   
  public int[] movePoint(int previousState, int nextState, int[] currentPoint) {
     return states[previousState].getEdge(nextState).applyWeight(currentPoint);
  }
}

/*
 * Provides a method to walk (though a variety of methods)
 * though a state machine, keeping track of the current state and current (x, y) point
 */
class SMWalker {
  private int[] previousPoint;
  public int[] getPreviousPoint() { return previousPoint; }
  
  private int previousState;
  private int getPreviousState() { return previousState; }
  
  private StateMachine stateMachine;
  
 public SMWalker(int startState, int[] startPoint, StateMachine stateMachine) {
   previousPoint = startPoint;
   previousState = startState;
   this.stateMachine = stateMachine;
 }
 
  /**
   * returns the NextPoint according to a random move on the state machine. the next point
   * is bounded by the screen width and height so any illigal moves wont be used
   * this can cause a stack overflow possibly
   */
  public int[] next() {
     Edge nextEdge = stateMachine.pickRandomEdge(previousState);
     int[] nextPoint = nextEdge.applyWeight(previousPoint);
     
     if (nextPoint[0] > 0 && nextPoint[0] < width && nextPoint[1] > 0 && nextPoint[1] < height) {
       previousState = nextEdge.getTo().getId();
       previousPoint = nextPoint;
       return nextPoint;
     } else {
       return next();
     }
  }
  
  /*
   * Gives the next point that is closest to the target x and y values
   */
  public int[] targetedNextPoint(int targetX, int targetY) {
     int currentLowestState = previousState;
     int[] currentLowestPoint = previousPoint;
     double lowestDistance = 100000;
     State state = stateMachine.getState(previousState);
     for (int i = 0; i < state.outgoingSize(); i++) {
       Edge potentialEdge = state.getEdgeByIndex(i);
       int[] potentialNext = potentialEdge.applyWeight(previousPoint);
        double distance = sqrt(sq(potentialNext[0] - targetX) + sq(potentialNext[1] - targetY));        
        if (distance < lowestDistance) {
           currentLowestState = potentialEdge.getTo().getId();
           currentLowestPoint = potentialNext;
           lowestDistance = distance;
        }
     }     

     previousState = currentLowestState;
     previousPoint = currentLowestPoint;
     return currentLowestPoint;
  }
  
  public int[] targetedNextPoint(int targetX, int targetY, int maxChoises) {
     int currentLowestState = previousState;
     int[] currentLowestPoint = previousPoint;
     double lowestDistance = 100000;
     int choises = stateMachine.getState(previousState).outgoingSize() < maxChoises ? stateMachine.getState(previousState).outgoingSize() : maxChoises;
     State state = stateMachine.getState(previousState);
     for (int i = 0; i < choises; i++) {
        Edge potentialNextEdge = state.pickRandomEdge();
        int[] potentialNext = potentialNextEdge.applyWeight(previousPoint);
        double distance = sqrt(sq(potentialNext[0] - targetX) + sq(potentialNext[1] - targetY));
        
        if (distance < lowestDistance) {
           currentLowestState = potentialNextEdge.getTo().getId();
           currentLowestPoint = potentialNext;
           lowestDistance = distance;
        }
     }     

     previousState = currentLowestState;
     previousPoint = currentLowestPoint;
     return currentLowestPoint;    
  }
}

class FadingWalk {
  private double fadeRate;
  private int[][] walk;
  private double currentColor = 0.0;
  
  public boolean finished = false;
  
  /*
   *  fadeRate: amount to fade by each time draw is called
   */
  public FadingWalk(double fadeRate, int walkLength, SMWalker walker) {
    this.fadeRate = fadeRate;
    
    walk = new int[walkLength][2];
    for (int i = 0; i < walkLength; i++) {
      walk[i] = walker.next(); 
    }
    
    finished = false;
  }
  
  public void draw() {
    if (currentColor < 255.0) {
      currentColor += fadeRate;
      stroke((int)(currentColor));
      for (int i = 1; i < walk.length; i++) {
        line(
          walk[i-1][0], walk[i-1][1],
          walk[i][0], walk[i][1]);     
      }
    } else {
      finished = true; 
    }
  }
}

class Trail {
  private int maxAge;
  protected int[][] tail;
  private SMWalker walker;
  protected int currentHead = 0;
  private double colorIncrement;

  public Trail(int maxAge, SMWalker walker) {
    this.maxAge = maxAge;
    tail = new int[maxAge][2];
    this.walker = walker;
    for (int i = 0; i < maxAge; i++) {
      tail[i] = walker.getPreviousPoint();
    }
    colorIncrement = (1.0 / (maxAge * 1.0)) * 255;
  } 
  
  public void next() {
    currentHead = (currentHead + 1) % maxAge;
    tail[currentHead] = walker.next(); 
  }
  
  public void draw() {
     for (int i = 1; i <= currentHead; i++) {
       int currColor = (int)((((currentHead - i) + maxAge) % maxAge) * colorIncrement);
       stroke(currColor);
       line(
         tail[i][0], tail[i][1],
         tail[i-1][0], tail[i-1][1]);
    }
    for (int i = currentHead + 2; i < maxAge; i++) {
       int currColor = (int)((((currentHead - i) + maxAge) % maxAge) * colorIncrement);
       stroke(currColor);
       currColor += colorIncrement;
       line(
         tail[i][0], tail[i][1],
         tail[i-1][0], tail[i-1][1]);
    }
    int currColor = (int)((((currentHead - maxAge) + maxAge) % maxAge) * colorIncrement);
    stroke(currColor);
    line(
      tail[maxAge-1][0], tail[maxAge-1][1],
      tail[0][0], tail[0][1]);   
  }
}

class SpawningTrail extends Trail {
  private StateMachine[] spawnSMs;
  private FadingWalk[] fadingWalks;
  private double spawnProbability;
  private double fadeRate;
  private int spawnWalkLength;

  public SpawningTrail(int maxAge, SMWalker walker, double spawnProbability, double fadeRate, int spawnWalkLength, StateMachine[] spawnSMs) {
     super(maxAge, walker);
     this.spawnSMs = spawnSMs;
     this.spawnProbability = spawnProbability;
     this.fadeRate = fadeRate;
     this.spawnWalkLength = spawnWalkLength;
     fadingWalks = new FadingWalk[spawnSMs.length];
     for (int i = 0; i < spawnSMs.length; i++) {
         fadingWalks[i] = new FadingWalk(255, 0, null);
     }
  }
  
  public void next() {
    for (int i = 0; i < 3; i++) {
      super.next();
    }
    
    if (random(0, 1) < spawnProbability) {
       if (fadingWalks[0].finished) {
          for (int i = 0; i < fadingWalks.length; i++) {
             fadingWalks[i] = new FadingWalk(fadeRate, spawnWalkLength,
                 new SMWalker(0, tail[currentHead], spawnSMs[i]));
          } 
       }
    }
  }
  
  public void draw() {
    super.draw();
   
    for (int i = 0; i < fadingWalks.length; i++) {
        fadingWalks[i].draw(); 
    } 
  }
}

StateMachine sm = new StateMachine(9);
StateMachine[] spawns;
SpawningTrail trail;

void setup() {
  size(800, 600);
  background(255);
  
  sm.a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 2, new int[] {0, 10}).a0(2, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  sm.a(0, 4, new int[] {10, 0}).a0(4, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 6, new int[] {0, -10}).a0(6, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  sm.a(0, 8, new int[] {-10, 0}).a0(8, 0);
  
  spawns = new StateMachine[4];
  
  // goes top left more (state 7)
  spawns[0] = new StateMachine(9);
  spawns[0].a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 2, new int[] {0, 10}).a0(2, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  spawns[0].a(0, 4, new int[] {10, 0}).a0(4, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 6, new int[] {0, -10}).a0(6, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  spawns[0].a(0, 8, new int[] {-10, 0}).a0(8, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  
  // goes top right more (state 5)
  spawns[1] = new StateMachine(9);
  spawns[1].a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 2, new int[] {0, 10}).a0(2, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  spawns[1].a(0, 4, new int[] {10, 0}).a0(4, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 6, new int[] {0, -10}).a0(6, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  spawns[1].a(0, 8, new int[] {-10, 0}).a0(8, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 5, new int[] {10, -10}).a0(5, 0);
  
  // goes bottem right more (state 3)]
  spawns[2] = new StateMachine(9);
  spawns[2].a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 2, new int[] {0, 10}).a0(2, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  spawns[2].a(0, 4, new int[] {10, 0}).a0(4, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 6, new int[] {0, -10}).a0(6, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  spawns[2].a(0, 8, new int[] {-10, 0}).a0(8, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  
  // goes bottem left more (state 1)
  spawns[3] = new StateMachine(9);
  spawns[3].a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 2, new int[] {0, 10}).a0(2, 0).a(0, 3, new int[] { 10, 10}).a0(3, 0);
  spawns[3].a(0, 4, new int[] {10, 0}).a0(4, 0).a(0, 5, new int[] {10, -10}).a0(5, 0).a(0, 6, new int[] {0, -10}).a0(6, 0).a(0, 7, new int[] {-10, -10}).a0(7, 0);
  spawns[3].a(0, 8, new int[] {-10, 0}).a0(8, 0).a(0, 1, new int[] {-10, 10}).a0(1, 0).a(0, 1, new int[] {-10, 10}).a0(1, 0);
  
  trail = new SpawningTrail(500, new SMWalker(0, new int[] {400, 300}, sm), 0.01, 5.0, 200, spawns);  
}

void draw() {
  background(255);
  trail.next();
  trail.draw();    
}
