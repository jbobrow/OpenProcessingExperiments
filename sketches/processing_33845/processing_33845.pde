
ArrayList balls;
//create an arraylist (actually I did it for trying to remove some elements


void setup() {
  size(1000,400);
  balls = new ArrayList();
  smooth();
  //create 50 balls with for loop
  for(int i=0; i<50; i++) {
balls.add(new ball());
  }

}

void draw() {
  
  background(255);
  
  //it should get track of all elements so we basically call them
  for(int i=0; i<balls.size(); i++) {
   ball b = (ball) balls.get(i);
   b.animate();
   b.display();
   b.Revert();
     


   println("heyo");
  }
  
}
   class ball {
     //ball class to contain all information regarding the ball
  float x;
  float y;
  float xspeed;
  float yspeed;
  float r;
  float g;
  float b;
  float diam;

  
  ball() {
    
    x = random(30, 900);
    y =random(30, 350); 
    diam = random(20, 60);
    xspeed = random(1, 5);
    yspeed = random(1, 2.8);
    r = 0;
    g = 0;
    b = 0;
    

  }
  
    void animate() {
      //move the ball
      x+=xspeed;
      y+=yspeed;
    }
    
    void display() {

      noStroke();
        fill(r, g, b);
        ellipse(x,y,diam,diam);
        println("color");
        
    }
    void Revert() {
    
       //change of direction and color when balls hit boundaries
      if(x>width-15) {
        xspeed*=-1;
        r=50;
        b=50;
        g=100;
        fill(r, g, b);
         ellipse(x,y,diam,diam);
    }
    
    if(x<15) {
        xspeed*=-1;
        r=150;
        b=150;
        g=10;
        fill(r, g, b);
         ellipse(x,y,diam,diam);
    }
    
    
    if(y>height-15) {
        yspeed*=-1;
        r=255;
        b=0;
        g=215;
        fill(r, g, b);
         ellipse(x,y,diam,diam); 
      }
      
         if( y<15) {
        yspeed*=-1;
        r=0;
        b=220;
        g=80;
        fill(r, g, b);
         ellipse(x,y,diam,diam);
      }

    //when mouse is pressed, it will turn all the balls into black
    if(mousePressed) {
        r=0;
        b=0;
        g=0;
        fill(r, g, b);
        ellipse(x,y,diam,diam);
      }
   }
   }

