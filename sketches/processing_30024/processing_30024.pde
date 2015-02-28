
//QUESTION 6

int no = 200; //number of bubbles allowed
Bubble[] myB; 
int ar = 0; 

void setup() {
  frameRate(100);
  size(400,350);
  smooth();
  myB = new Bubble[no]; 
}

class Bubble { //tells us stuff about the bubble
  float x;
  float y;
  float speed;

  Bubble(float xpos, float ypos) { // "the constructor"
    x = xpos;
    y = ypos;
    speed = random(0.5,3);
  }
  void update(){             
    y -= speed;         //Telling the bubble to move
    if (y > 30){        //Makes the bubble disappear at the top of the glass
    ellipse(x,y,7,7);   //size of bubbles
    }
  }
}

void draw() {
  background(240);
  for (int i=0; i<no; i++)  
    if(myB[i] != null)      //Checks if the bubble has a value, if it has, the program runs void update
    myB[i].update();
    makeBubbles();
    
    //Drawing the glass
    strokeWeight(5);
    line(90,30,90,300);
    line(310,30,310,300);
    line(90,300,310,300);
    strokeWeight(1);
}

void makeBubbles(){
  myB[ar] = new Bubble (random(100,300),300); //makes a new bubble
  ar = (ar+1)% no; //Makes the array loop
}



