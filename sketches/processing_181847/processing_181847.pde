
/* Chris Jung
exercise III

Visualizes drops of water expanding outwards and filling the screen over a minute. 

Helpful resource for creating incrementing arrays: http://www.learningprocessing.com/examples/chapter-10/example-10-7/
*/


//Create an array of drops
Drop[] drops= new Drop[60]; 

int totalDrops = 0; //keep track for drops created

void setup() {
  size(700,700); // make it big
  frameRate(10); //dont give anyone a seizure
  
}

void draw() {

  //intialize a drop
  drops[totalDrops] = new Drop(40, random(0,700), random(0,700));
  
  //increment drops
  totalDrops = int(millis()/1000); //each drop appears after 1 second
  
  //stop once 60 secs has gone by
  if (totalDrops >= 60) { //length is built in array method
    totalDrops = 0; //stop animation after 1 minute
  }
  
  for (int i = 0; i < totalDrops; i++) {
    drops[i].display();  // displays each drop
    drops[i].grow(); // drop grows
  }
}

class Drop {
  int d; //diameter of drop
  float xpos; //xpos of drop
  float ypos; //ypos of drop
  
  Drop(int id, float ixpos, float iypos) {
    d = id;
    xpos = ixpos;
    ypos = iypos;
  }
  
    
    void display() {
      fill(random(0,125), random(0,205), random(120,255), 40); //constrain the color to a random set of blues with some opacity
       ellipse(xpos, ypos, d, d);  //draw the drop
    }
    
    void grow() {
      d += 1;
  }
}

  




