
Stripe[] myStripes = new Stripe[100];

void setup() { 
  size(400, 400); 
  smooth();  
  noStroke();  

  for (int i=0; i<myStripes.length; i++) { 

    myStripes[i] = new Stripe(i*50, color(random(100), 0, random(100, 255)) );
  }
}

void draw() { 

  background(0); 
  for (int i=0; i<myStripes.length; i++) { 

    myStripes[i].update(); 
    myStripes[i].drawStripe();
  }
}

void mousePressed() { 
  for (int i=0; i<myStripes.length; i++) { 

    myStripes[i].checkMousePress(); 
   
  }
  
}




class Stripe {

  float x; 
  float w; 
  float xspeed; 
  color c; 
  boolean clicked; 


  // constructor
  Stripe(float xpos, color col) { 

    x = xpos; 
    w = random(10, 50); 
    c = col; 
    xspeed = random(1, 4);
    
    clicked = false; 
  }  

  void update() { 
    x+=xspeed; 
    if (x>width) {
      x = -w;
    }
  }
  void drawStripe() { 

    if (clicked) { 
      fill(0,255,0);
    } 
    else {
      fill(c);
    }

    rect(x, 0, w, height);
  }
  
  void checkMousePress() { 
    if((mouseX > x ) && (mouseX< x + w)) {
      
       clicked = !clicked;
    }
    
  }
  
}

