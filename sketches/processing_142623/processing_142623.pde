
///////
// HW 9: Agents, hard coding
// Patrick O'Donnel
//////

//////
// MousePressed == pause
// MouseReleased == unpause
// r = reset
//////

Agent a1; 
Agent a2;
Agent a3;
Obstacle o1; 
Obstacle o2;
Obstacle o3;

void setup () {
  size (600,250);
 a1 = new Agent();
a2 = new Agent();
a3 = new Agent();
o1 = new Obstacle();
o2 = new Obstacle();
o3 = new Obstacle();
  
}

void draw () {
  fill(0);
  rect(0,0,width,height);
  
  o1.display();
  o2.display();
  o3.display();
  
  a1.move();
  a2.move();
  a3.move();
  
  a1.intrs(a2);
  a1.intrs(a3);
  a2.intrs(a3);
  a1.intrse(o1);
  a1.intrse(o2);
  a1.intrse(o3);
  a2.intrse(o1);
  a2.intrse(o2);
  a2.intrse(o3);
  a3.intrse(o1);
  a3.intrse(o2);
  a3.intrse(o3);
  
  a1.display();
  a2.display();
  a3.display();
  
if (keyPressed)
  if (key == 'r' || key == 'R') {
    setup();
  }
  
}

void mousePressed () {
  noLoop();
}

void mouseReleased() {
  loop();
}



/////


class Agent {
  
  float x,y,s;
  
  Agent () {
    x = 200+random(-200,300);
    y = 200+random(-200,30);
    s = 10;
  }
  
  void display () {
    noStroke();
    fill (255);
    ellipse(x,y,s,s);
    
  }
  
  void move () {
    float m = int(random(0,4));
    
    if (m == 0) {
      x+=2;
    } else if (m == 1) {
      x-=2;
    } else if (m == 2) {
      y+=2;
    } else {
      y-=2;
    } 
    
    x = constrain (x, 3, width-3);
    y = constrain (y, 3, height-3);
  }
  
  
  void intrs(Agent a0) {  
    
    float d = dist(x, y, a0.x, a0.y);
    
    if (d < s) {          
      fill(100,100,0);
    }
    
  }
  
  void intrse(Obstacle o0) {
    
    float d = dist(x,y,o0._x,o0._y);
    
    if (d < (s/2 + 23)) { 
      textSize(12);
      fill(0,200,200);      
      text ("OUCH!", x, y);
    }
  }
  
}


/////

class Obstacle {
  
  float _x,_y,_s;
  
  Obstacle () {
    _x = 100+random(-80,300);
    _y = 100+random(-80,135);
    _s = 46;
  }
  
  void display () {
    noStroke();
    fill (120,10,233,150);
    ellipse(_x,_y,_s,_s);
    
    constrain(_x,0,width);
    constrain(_y,0,height);
    
  }
}


