
class Fruit {
  int i,j,x,y;
  String type = null;
  PImage worm = loadImage("data/worm.png");
  PImage woodenApple = worm.get(0,spacing*4,spacing,spacing);
  PImage greenApple = worm.get(spacing,spacing*4,spacing,spacing);
  PImage redApple = worm.get(spacing*2,spacing*4,spacing,spacing);
  PImage goldenApple = worm.get(spacing*3,spacing*4,spacing,spacing);

  Fruit() {
  }

  Fruit(int x, int y, String type) {
    this.i = x;
    this.j = y;
    this.x = (x+1)*spacing-(spacing/2);
    this.y = (y+1)*spacing-(spacing/2);
    this.type = type;
  }

  void display() {
    if (type == "Wood") {
      image(woodenApple,x-(spacing/2),y-(spacing/2));
    } else if (type == "Green") {
      image(greenApple,x-(spacing/2),y-(spacing/2));
    } else if (type == "Red") {
      image(redApple,x-(spacing/2),y-(spacing/2));
    } else {
      image(goldenApple,x-(spacing/2),y-(spacing/2));
    }
  }

  void createFruit() { // first you find a nice spot with enough sunlight ... :[
    tempScore = 0;
    if (type != null && fruitCounter > 0 && snake.head.x == fruit.x && snake.head.y == fruit.y) {
      if (type == "Wood") {
        tempScore = 5;
      } else if (type == "Green") {
        tempScore = 10;
      } else if (type == "Red") {
        tempScore = 20;
      } else if (type == "Gold") {
        tempScore = 40;
      }
      tempScorePosx = fruit.x;
      tempScorePosy = fruit.y;
      tempScoreCounter = 10;
      score += tempScore;
    } else {
      if (type == "Wood") {
        tempScore = -40;
      } else if (type == "Green") {
        tempScore = -20;
      } else if (type == "Red") {
        tempScore = -10;
      } else if (type == "Gold") {
        tempScore = -5;
      }
      tempScorePosx = fruit.x;
      tempScorePosy = fruit.y;
      tempScoreCounter = 10;
      score += tempScore;
    }
    for (int i = 0; i < snake.body.size(); i++) {
      SnakeSegment temp = (SnakeSegment) snake.body.get(i);
      pathfinder.nodes[temp.i][temp.j].walkable = false;      
    }
    boolean foundWalkableSpot = false;
    while (!foundWalkableSpot) {
      fruitPos = (Node) pathfinder.nodes[int(random(0,w))][int(random(0,h))];
      if (fruitPos.walkable) {
        foundWalkableSpot = true;
      }
    }
    int d100 = (int) random(0,100);
    String tempType;
    if (d100 < 25) {
      tempType = "Wood";
      fruitCounter = 40;
    } else if (d100 < 50) {
      tempType = "Green";
      fruitCounter = 20;
    } else if (d100 < 80) {
      tempType = "Red";
      fruitCounter = 15;
    } else {
      tempType = "Gold";
      fruitCounter = 12;
    }
    fruit = new Fruit(int(fruitPos.i),int(fruitPos.j),tempType);
  }
}

