
import java.util.ArrayList;
Wibble mywibble;
Game mygame;
boolean newWibble;
ArrayList<Wibble> wibbles = new ArrayList<Wibble>();
ArrayList<Wibble> nextgen = new ArrayList<Wibble>();

void setup() {
  size(300,300);
  // Parameters go inside the parentheses when the object is constructed.
  mywibble = new Wibble(150,150,1,0,1);
  wibbles.add(mywibble);
  mygame = new Game();
}

void draw() {
  
 
  background(255);
  for(Wibble wibble: wibbles){
    wibble.display();
    wibble.update();
    // make new wibbles iff number of wibbles < max number allowed
   if (wibbles.size() < mygame.getMax()){
      // spawn the wibbles that are old enough
      if (wibble.getAge() % wibble.getLifespan() == 0){
        // spawn new wibble
        nextgen.add(wibble.spawn());
        newWibble = true;
      }
   }
    
  }
  
  // add nextgen to wibbles list if new wibbles have been spawned
  if (newWibble){
    wibbles.addAll(nextgen);
    nextgen.clear();
  }
  
  newWibble = false;
  
  
  mygame.timeStep();
  
  // autospawn function
  //if (mygame.getTime() % 1000 == 0){
    //wibbles.add(new Wibble(150,150,1,0));
  //}
}

class Game {
  int time;
  int max;
  
  Game(){
    time = 0;
    max = 500;
  }
  
  int getTime(){
    return time;
  }
  
  int getMax(){
    return max;
  }
  
  void timeStep(){
    time++;
  }
}

class Wibble {
  int xpos;
  int ypos;
  int xvel;
  int yvel;
  int age;
  int lifespan;
  
  int gen;
  color col;
  
  //constructor creates new wibble
  Wibble(int tempXpos, int tempYpos, int tempXvel, int tempYvel, int tempgen) {
    xpos = tempXpos;
    ypos = tempYpos;
    xvel = tempXvel;
    yvel = tempYvel;
    age = 0;
    lifespan = 100;
    
    gen = tempgen;
   
    
  }
  
  
  int getAge(){
    return age;
  }
  
  int getLifespan(){
    return lifespan;
  }
  
  //update moves the wibble (and controls splits - later)
  void update(){
    
    // update velocity (change direction at random intervals)
    int  change = int(random(50));
    //change direction on average one time in 50
    if (change == 1) {
      //turn left or right at random
      int turnleft = int(random(2));
      if (turnleft == 1) {
       this.turnleft();
      }
      else {
        this.turnright();
      }      
    }
    
    //update age
    age++;
    
    //update position
    xpos += xvel;
    //wrap x-position
    xpos = (xpos + width) % width;
    ypos += yvel;
    //wrap y-position
    ypos = (ypos + height) % height;
  }
  
  //turns wibble to the left
  void turnleft(){
    int temp = xvel;
    xvel = yvel;
    yvel = -temp;
    
  }
  
  //turns wibble to the right
   void turnright(){
    int temp = xvel;
    xvel = -yvel;
    yvel = temp;
    
  } 
  
  //creates a child wibble (without destroying parent)
  //Wibble spawn(){
    //Wibble daughterWibble = new Wibble(xpos, ypos, -xvel, -yvel, gen+1);
    //return daughterWibble;
  //}

  //creates two child wibbles (and "destroys" parent)
  Wibble spawn(){
    if (gen == 4){
      gen = 1;
    }
    else{
      gen++;
    }
    Wibble daughterWibble = new Wibble(xpos, ypos, -xvel, -yvel, gen);
    return daughterWibble;
  }
  
  
  //display sets wibble appearance
  void display(){
        //set color
    switch(gen){
      case 1:
        col = color(0);
        break;
      case 2:
        col = color(255,0,0);
        break;
      case 3:
        col = color(0,255,0);
        break;
      case 4:
        col = color(0,0,255);
        break;
      default:
        col = color(0);
        break;
    }
    stroke(col);
    fill(col);
    ellipseMode(CENTER);
    ellipse(xpos,ypos,10,10);
  }  
}


