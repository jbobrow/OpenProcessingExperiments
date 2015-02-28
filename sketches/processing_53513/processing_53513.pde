
final int W_UP = 0;
final int W_RIGHT = 1;
final int W_DOWN = 2;
final int W_LEFT = 3;

class Worm {
  /* The Worm is stored in segments. It starts with the Tail at the front of the array:
   *        Tail                    Head
   *       [ xy  xy  xy  xy  xy  xy  xy ]
   * index:  0   1   2   3   4   5   6 
   *
   * To advance the worm, the tail segment is "moved" to the front of the worm, and 
   * becomes the new head. (The PVector stays in the same place in the array - only
   * its x & y are updated.)
   */
  PVector[] segments;
  int head;
  int heading = W_UP;
  
  int command = 0;
  Command[] commands;
  
  Worm(int x, int y, int len, String commandData) {
    segments = new PVector[len];
    for (int i = 0; i < segments.length; i++) {
      segments[i] = new PVector(x, y+(len-i));
    }
    head = segments.length - 1;
    this.commands = unpackCommands(commandData);
    println(this.commands.length + " cycle length -> " + (this.commands.length*0.125) + " seconds");
  }
  
  void draw() {
    for(int i = 0; i < segments.length; i++) {
      ellipse(segments[i].x, segments[i].y, 1, 1);
    }
  }
  
  void next() {
    commands[command].executeOn(this);
    command = (command + 1) % commands.length;
  }
  
  void advance() {
    int tail = (head + 1) % segments.length;
    PVector last = segments[tail];
    PVector first = segments[head];
    last.x = first.x;
    last.y = first.y;
    
    switch(heading) {
      case W_UP:     last.y -= 1;  break;
      case W_DOWN:   last.y += 1;  break;
      case W_LEFT:   last.x -= 1;  break;
      case W_RIGHT:  last.x += 1;  break;
    }
    
    head = tail;
  }
  
  void turnLeft() {
    heading = (4 + heading - 1) % 4;
  }
  
  void turnRight() {
    heading = (heading + 1) % 4;
  }
}

