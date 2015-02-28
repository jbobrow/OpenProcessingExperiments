
///////
// HW 9: Agents, with arrays
// Patrick O'Donnel
//////

//////
// MousePressed == pause
// MouseReleased == unpause
// r = reset
//////

Agent [] ag = new Agent [3]; 
Obstacle [] ob = new Obstacle [3]; 


void setup () {
  size (600,250);
    for (int i = 0; i < ag.length; i++) {
      ag[i] = new Agent();
      ob[i] = new Obstacle();
    }
}

void draw () {
  fill(0);
  rect(0,0,width,height);
  
  for (int i = 0; i < ag.length; i ++) {
    ob[i].display();
    ag[i].move();
  
  
      for (int j = 0; j < ag.length; j ++) {
        ag[i].intrs(ag[j]);
        ag[i].intrse(ob[j]);
      }
    
    ag[i].display();
  
  }//--end of for loops
    
  
if (keyPressed) {
  if (key == 'r' || key == 'R') {
    setup();
  }
  
}//--end of keyPressed
}
void mousePressed () {
  noLoop();
}//--end of mousePressed

void mouseReleased() {
  loop();
}//--end of mouseReleased


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


//////

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

