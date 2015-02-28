
int numBalloons = 20;  // maximum number of balloons alive at any one time
Balloon[] b_array = new Balloon[numBalloons];

//Maxim maxim;
//AudioPlayer player;
//AudioPlayer player2;
int balloonPoppedCount = 0;
int balloonCreatedCount = 0;


void setup() {
  size(600,600);
  background(255);
  //maxim = new Maxim(this);
  //player = maxim.loadFile("balloon_blow_up.wav");
  //player.setLooping(false);
  //player2 = maxim.loadFile("balloon_pop.wav");
  //player2.setLooping(false);
  
  //Initialize the balloon array  
  for(int i = 0; i < numBalloons; i++){
     Balloon b = new Balloon(0,0);
     b.alive = false;
     b_array[i] = b; 
  }
}






void draw(){
  
    background(255);
    for(Balloon b : b_array){
      if(b.yPos < 9 && b.alive) {    // Reached Top
        b.alive = false;
        //player2.play();
        balloonPoppedCount++;
      }  
      if (b.alive == true){
        b.floatUp();
        b.display();
      }  
    }
    
    updateCount();
  
}


void mousePressed(){  
  
  Balloon b = new Balloon(mouseX, mouseY);
  b.alive = true;
  //player.play();
       
  for(int i=0; i< numBalloons; i++){
     if(b_array[i].alive == false){
       b_array[i] = b;
       balloonCreatedCount++;
       break;
     }
  }
}

void updateCount(){
  fill(0);
  textAlign(RIGHT);
  text("Balloons Popped: " + balloonPoppedCount, 590, 580);
  textAlign(LEFT);
  text("Balloons Created: " + balloonCreatedCount, 10, 580);
}


class Balloon {
    float size;
    color c;
    float floatSpeed;
    float xPos;
    float yPos;
    boolean alive;
    
    Balloon(int xpos, int ypos){
      size = 20;
      c = color(map(xpos, 0, width, 0, 255),map(ypos, 0, width, 0, 255),0);
      floatSpeed = 1;
      xPos = xpos;
      yPos = ypos; 
      alive = false;
    }
    
    void floatUp(){
        yPos = yPos - floatSpeed;
    }
    
    void display(){
      stroke(3);
      fill(c);
      rectMode(CENTER);
      ellipse(xPos, yPos, size, size);
    }
}


