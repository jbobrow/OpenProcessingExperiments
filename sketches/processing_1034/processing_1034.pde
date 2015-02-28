
// Random Walker (Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

Walker w;
int[][] matrix = new int[400][400];
Walker[] walkers = new Walker[10];

void setup() {
  size(400,400);
  frameRate(30);

  // Create a walker object
  for (int i = 1; i< 10; i++) {
    walkers[i] = new Walker();
  }

  // create a matrix of food
  randomSeed(0);
  for (int i = 1; i < width; i++) {
    for (int j = 1; j < height; j++) {
      matrix[i][j] = (int)random(99,255);
    }
  }
}

void draw() {
  background(255);
  // Run the walker object
  for (int i = 1; i< 10; i++) {
    walkers[i].walk();
  }

  // Make it eat
  for (int i = 1; i< 10; i++) {
    walkers[i].eat();
  }
  
  //refresh map
  for (int i = 1; i < width; i++) {
    for (int j = 1; j < height; j++) {
      stroke(matrix[i][j]); 
      point(i,j);
    }
  }
  
  for (int i = 1; i< 10; i++) {
    walkers[i].render();
  }
 
}


class Walker {
  PVector loc;
  int hunger;
  int belly_size;

  Walker() {
    loc = new PVector(width/2,height/2);
    hunger = 1;
    belly_size = 5;
  }

  void render() {
    int size;
    stroke(0,0); 
    fill(50,belly_size);    
    ellipse(loc.x,loc.y,this.belly_size,this.belly_size);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    PVector vel = new PVector(random(-2,2),random(-2,2));
    loc.add(vel);
    
    // Stay on the screen
    loc.x = constrain(loc.x,0,width-1);
    loc.y = constrain(loc.y,0,height-1);
  }
  
  void eat() {
    if (matrix[(int)loc.x][(int)loc.y] > 100) {
      if (this.belly_size < 100) { this.belly_size++; } else { this.belly_size = 5; }
      matrix[(int)loc.x][(int)loc.y] = 100 - this.hunger;
      this.hunger--;
    } else {
      if (this.hunger < 100 ) { this.hunger++; }
    }     
  }
  
}



  

