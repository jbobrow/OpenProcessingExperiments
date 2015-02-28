
Bird bird;
Background bg;
Ground ground;
boolean gameover = false;
ArrayList<Pipe> pipes;
int pipeDistance = 200;
float numPipes;
Score score;

void setup() {
  size(300, 500);
  bird = new Bird(100, 200);
  bg = new Background();
  ground = new Ground();
  score = new Score();

  numPipes = (float(width) / float(pipeDistance)) + 1;
  pipes = new ArrayList<Pipe>();
  makePipes();
}

void draw() {

  if (bird.checkAlive()) {
    bg.display();

    for (int i = 0; i < pipes.size(); i++) {
      Pipe pipe = pipes.get(i);

      if (pipe.checkHit(bird)) {
        bird.setAlive(false);
      }

      if(bird.x > pipe.x){  
        if(pipe.passed == false){
          score.addScore();
          pipe.passed = true; 
        }
      }
      
      // Move Pipe
      pipe.setMoveSpeed(3);
      pipe.move();

      // Draw pipe
      pipe.display();

      // Add new Pipe object in array
      if(pipe.checkOutOfBounds()){
        float newPos = pipes.get( pipes.size()-1 ).x + pipeDistance;
        addPipe(newPos);
      }

    }

  }

  // Ground
  ground.display();
  if(ground.checkHit(bird)){
    bird.setAlive(false);
    bird.setPosition(bird.x,height-ground.image.height-bird.h);
  }

  // Bird
  bird.move();
  bird.display();

  // Score
  score.display(20,20);

  // Clean array
  if(pipes.size() > numPipes){
    pipes.remove(0);
  }

  if(bird.alive == false){
    gameover = true;
  }

}

void keyPressed() {
  if (key == ' ') {
    if (gameover == true) {
      resetGame();      
    }else{
      bird.jump();
    }
  }
}

void resetGame() {
  gameover = false;
  bird.reset();
  score.reset();
  pipes.clear(); // reset array
  makePipes();
}

void makePipes(){
  for(int i = 0; i < numPipes; i++){
    addPipe(400+i*pipeDistance);
  }
}

void addPipe(float x){
  Pipe pipe = new Pipe(x, random(50,250),100);
  pipes.add(pipe);
}
class Background{
	
	PImage bg;

	Background(){
		bg = loadImage("background.png");
	}

	void display(){
		float w = float(width)/float(bg.width);
		for (int i = 0; i < w; ++i) {
			image(bg, i*276, 0);
		}	
	}
}
class Bird{

	float x = 200;
	float y = height/2;
	float w = 34;
	float h = 24;
	float acceleration = 0.5;
	float speed = 1;
	boolean alive = false;
	PImage flappy;
	PImage flappy2;

	Bird(float x, float y){
		this.x = x;
		this.y = y;
		this.alive = true;
		flappy = loadImage("flappy.png");
		flappy2 = loadImage("flappy2.png");
	}

	void display(){	
		pushMatrix();
		translate(x, y);
		//rect(0,0,w,h); // Debug: show bounds
		if(this.speed > 0){
			image(flappy,0,0);
		}else{
			image(flappy2,0,0);
		}
		popMatrix();
	}

	void move(){
		if(alive){
			speed += acceleration;
			y += speed;
		}
	}

	void jump(){
		speed = -7;
	}

	void setPosition(float x, float y){
		this.x = x;
		this.y = y;
	}

	void setAlive(boolean a){
		this.alive = a;
	}

	void reset(){
		x = 100;
		y = height/2-50;
		speed = 1;
		alive = true;
	}

	boolean checkAlive(){
		if(alive){
			return true;
		}
		return false;
	}

}
class Ground{

	PImage image;

	Ground(){
		image = loadImage("ground.png");
	}

	void display(){
		float w = float(width)/float(image.width);
		for (int i = 0; i < w; ++i) {
			image(image, i*288, height-image.height);
		}
	}

	boolean checkHit(Bird bird){
		if ( bird.y > height-image.height-bird.h ) {
			return true;
		}
		else {
			return false;
		}
	}
}
class Pipe {

  float x, y;
  int w;
  int h;
  float moveSpeed = 2;

  PImage pipetop;
  PImage pipebottom;
  boolean passed = false;

  boolean hit = false;

  Pipe(float x, float y, int h) {
    this.x = x;
    this.y = y;
    pipebottom = loadImage("pipe1.png");
    pipetop = loadImage("pipe.png");
    this.w = pipetop.width;
    this.h = h;
  }
  
  void display() {
    image(pipetop, x, y-pipetop.height);
    image(pipebottom, x, y+h);
    if (hit) { fill(#ff0000); }else { fill(#ffffff); }
    //rect(x,y,w,h); // Debug: show hit area   
  }

  void move() {
      x-=moveSpeed;
  }

  void setMoveSpeed(float speed){
    this.moveSpeed = speed;
  }

  boolean checkHit(Bird bird) {
    if ( ((bird.x+bird.w >= this.x) && (bird.x <= this.x+this.w)) ) {
      if ( ((bird.y >= this.y) && (bird.y+bird.h <= this.y+this.h)) ) {
        hit = false;
        return false;
      }
      else {
        hit = true;
        return true;
      }
    }
    return false;
  }

  boolean checkOutOfBounds(){
    if(x < -w){
      return true;
    }
    return false;
  }
}
class Score{
	int currentScore;
	ArrayList<PImage> images;

	Score(){
		images = new ArrayList<PImage>();
		currentScore = 0;
		for(int i = 0; i < 10; i++){
			PImage img = loadImage(i+".png");
			images.add(img);
		}
	}

	void display(int x, int y){
		pushMatrix();
		translate(x,y);
		String tempScore = str(currentScore);
		for (int i = 0; i < tempScore.length(); ++i) {
			int nr = integerFromChar(tempScore.charAt(i));
			image(images.get(nr),i*29,0);
		}
		popMatrix();
	}

	int integerFromChar(char myChar) {
		return myChar - '0';
	}

	void reset(){
		this.currentScore = 0;
	}

	void addScore(){
		this.currentScore++;
	}
}


