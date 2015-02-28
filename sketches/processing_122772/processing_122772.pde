
Walker w;
Walker y;
Walker z;
Walker d;



void setup() {
  size(500,500);
  // Create a walker object
  w = new Walker();
  y = new Walker();
  z = new Walker();
  d= new Walker();

  background(20);
    smooth();
  
}

void draw() {
 
  // Run the walker object
  frameRate(5);
  w.step();
  w.render();
  y.step();
  y.render(); 
   z.step();
  z.render(); 
   d.step();
  d.render(); 

if(mousePressed) {
  
  background(20);
}
}




class Walker {
  int x,y;

  Walker() {
    //initial position
   x = width/2;
    y = height/2;
  }

  void render() {
    
    stroke(28,210,232,random(255));
    
   
   
    strokeWeight(random(.7));
    fill(0,0,0,0);
   
 
 ellipse(x,y,random(50),random(50));
  }

  // Randomly move up, down, left, right, or stay in one place
 void step() {
    
    float r = random(2);
  
    if (r < 0.5) {    
      x=x+40;
    } else if (r < 1) {
      x=x-40;
    } else if (r < 1.5) {
      y=y+40;
    } else {
      y=y-40;
    }
  
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
    
    
    
   
    
    }
      
  }



