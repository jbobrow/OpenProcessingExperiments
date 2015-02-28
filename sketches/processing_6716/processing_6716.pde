
class Bug {
  
  PVector pos;
  Grid parentGrid;
  Node nextNode;
  
  public Bug(Grid parentGrid) {
    this.parentGrid = parentGrid;
    this.nextNode = parentGrid.startNode;
    this.pos = new PVector(
      parentGrid.startNode.pos.x,
      parentGrid.startNode.pos.y
    );
    this.findNextNode();
    bugs.add(this);
  }
  
  void model() {
    if (this.hasReached(parentGrid.endNode)) {
      // remove bug from list
      bugs.remove(bugs.indexOf(this));
    }
    if (this.hasReached(nextNode)) {
      this.pos.set(
        nextNode.pos.x,
        nextNode.pos.y,
        0
      );
      this.findNextNode();
    } else {
      // move
      if (nextNode.pos.x < this.pos.x) {
        this.pos.x--;
      } else if (nextNode.pos.x > this.pos.x) {
        this.pos.x++;
      }
      if (nextNode.pos.y < this.pos.y) {
        this.pos.y--;
      } else if (nextNode.pos.y > this.pos.y) {
        this.pos.y++;
      }
    }
  }
  
  /**
   * Find the next closest node to the end
   */
  private void findNextNode() {
    
    /**
     * Iterate through siblings to get minimal distance
     */
    int minDistance = -1;
    for (int i = 0; i < nextNode.siblings.length; i++) {
      Node s = nextNode.siblings[i];
      int d = s.getDistanceToEnd();
      if ((minDistance == -1) || (d > -1 && d < minDistance)) {
        minDistance = d;
      }
    }
    if (minDistance == -1) {
      return;
    }
    
    /**
     * Get the list of closests nodes among siblings
     */
    Node[] closestsNodes = new Node[0];
    for (int i = 0; i < nextNode.siblings.length; i++) {
      Node s = nextNode.siblings[i];
      if (s.getDistanceToEnd() == minDistance) {
        closestsNodes = (Node[]) append(closestsNodes, s);
      }
    }
    
    this.nextNode = closestsNodes[int(random(closestsNodes.length))];
    
  }
  
  private boolean hasReached(Node b) {
    return (dist(pos.x, pos.y, b.pos.x, b.pos.y) < 2);
  }
  
  void view() {
    ellipseMode(CENTER);
    fill(#ff8800); stroke(255);
    ellipse(this.pos.x, this.pos.y, 10, 10);
  }
  
}


