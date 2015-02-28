
//////
// Project #2: "Crowd Psychology"
// Patrick J. O'Donnel
// Tues March 18th, 2014
//////

//////
// "The more amiability and esprit de corps there is among 
//  the members of a policy-making ingroup, the greater the 
//  danger that independent critical thinking will be replaced 
//  by groupthink, which is likely to result in irrational and 
//  dehumanizing actions directed against outgroups."
//    - Irving Janis in
//    Victims of Groupthink: A Psychological Study 
//    of Foreign-Policy Decisions and Fiascoes (1972)
//////

//////
// CONTROLS
// MousePressed == Presence of Innovator
// 'P' == Crowd as People
// 'S' == Crowd as Sheeple
//////


//declare 100 people objects 
Person [] p = new Person [100]; 
Innovator You;

boolean sheeple = true;

void setup(){
  size(600,600);
  background(255);
  frameRate(100);
  
  
//CREATE OBJECTS
//initialize
 for (int i = 0; i < p.length; i ++ ) {
    p[i] = new Person();
  }
  You = new Innovator();
}
 
 
 
void draw(){
  background(255);
  
 //KEYBOARD INTERACTIVITY 
  if (keyPressed) {

  //Reset  
  if (key == 'r' || key == 'R') {
  setup();
  }
  
  //People toogle
  if (key == 'p' || key == 'P') {
    sheeple = true;
  }
  
  //Sheeple toogle
  if (key == 's' || key == 'S') {
    sheeple = false;
  } 
}
  
  //MOUSE INTERACTIVITY
  if (mousePressed) {
    if (sheeple == true) {
      You.displayI(mouseX,mouseY);
    } else {
      You.displayA(mouseX,mouseY);
    }
  }
  
  
  
  
  for (int i = 0; i < p.length; i++ ) { 
    p[i].mingle();
    
    if (sheeple == true) {
      p[i].displayP();
    } else {
      p[i].displayS();
    }
   
 
   
    for (int j = 0; j < p.length; j++ ) {     // check each object with a for loop.
       if ( (  p[i].near(p[j]) )  ) {     //pass w[j] to the intersect function *
            p[i].loss_i();
            p[j].loss_i();
           } else {
           p[i].gain_i();
           }
     
       if (mousePressed && mouseX > p[j].x - 10 && mouseX < p[j].x + 10 && mouseY < p[j].y + 10 && mouseY > p[j].y - 10) {
         p[j].plant_idea();
       }      
    }
   
   
  } //-- end for loop 'i'


 //KEYBORARD ACTIONS
  if (keyPressed) {

  //Reset  
  if (key == 'r' || key == 'R') {
  setup();
  }
  
  //People toogle
  if (key == 'p' || key == 'P') {
    sheeple = true;
  }
  
  //Sheeple toogle
  if (key == 's' || key == 'S') {
    sheeple = false;
  } 
}
 
 
}


///////////
//PERSON CLASS
///////////

class Person {
 
  float x, y, cr, cg, cb;
  int s;
  
 
  //constructor
  Person() {
    x = random(width);
    y = random(height);
    s = 10;
    cr = 0;
    cg = 0;
    cb = 0;
  }
 
 //display function for people
  void displayP() {
    noStroke();
    fill(0);
    ellipse(x, y, s, s*1.25);
    rectMode(CORNERS);
    rect(x-.85*s, y+.8*s, x-.65*s, y+2*s);
    rect(x+.85*s, y+.8*s, x+.65*s, y+2*s);
    rectMode(CORNER);
    rect(x-.1*s, y+2.8*s, -.7*s, -.25*s);
    rect(x+.1*s, y+2.8*s, .7*s, -.25*s);
    fill (cr,cg,cb);
    stroke(255);
    quad(x-.85*s, y+.8*s, x+.85*s, y+.8*s, x+.3*s, y+2.5*s, x-.3*s, y+2.5*s);
 
 //constrain
    cr = constrain (cr,0,255);
    cg = constrain (cg,0,255); 
    cb = constrain (cb,0,255);  
  }
  
  //display function for sheeple
  void displayS() {
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(x-.6*s,y+.85*s,s/3,s);
    rect(x+.6*s,y+.85*s,s/3,s);
    rect(x-.3*s,y+.95*s,s/4,.65*s);
    rect(x+.3*s,y+.95*s,s/4,.65*s);
    fill(cr,cg,cb);
    ellipse(x,y,s*2,s*2);
    fill(0);
    ellipse(x+1.1*s, y-.5*s, s*1.1, s*.9);
    ellipse(x-1*s, y-.3*s, s/2, s/2);
    quad(x+.8*s,y-.8*s, x+1.4*s,y-.9*s, x+.6*s,y-1.1*s, x+.5*s,y-s);
    
    //constrain
    cr = constrain (cr,0,255);
    cg = constrain (cg,0,255); 
    cb = constrain (cb,0,255); 
  }
 
  void mingle() {
    //mingle movement
    float m = 0.5;
    
    //mingle horiztonal
    int moveX = int(random(3));
    if (moveX == 0) {
      x = x + m;
    } else if (moveX == 1) {
      x = x - m;
    } else {
      x = x;
    } 

    //mingle vertical
    int moveY = int(random(3));
    if (moveY == 0) {
      y = y + m;
    } else if (moveY == 1) {
      y = y - m;
    } else {
      y = y;
    } 
    
    //mingle constraints
    x = constrain(x,0,width);
    y = constrain(y,0,height); 
  }
     
 //loss and gain of individuality
    void loss_i() {
    cr = cr + 1;
    cg = cg + 1;
    cb = cb + 1;
  }
    void gain_i() {      
    cr = cr -.01;
    cg = cg -.01;
    cb = cb -.01;
    }
 
    void plant_idea () {
    cr = 0;
    cg = 0;
    cb = 200;
    }
  
  
 //Bump into other Person
 boolean near(Person p0) { 
   
  // distance between two persons 
  float d = dist(x,y,p0.x,p0.y);  
  
   if ((d > 0) && (d < s*1.5)) {              
    return true;
   } else {
    return false;
   }
 }
 
    
}

//////////
// INNOVATOR CLASS
//////////

class Innovator {
  
  float x, y, c;
  int s;
  
  //constructor
  Innovator () {
    s = 10;
    c = 200;
  }
  
  void displayI (float x, float y) {
    noStroke();
    fill(0);
    ellipse(x, y, s, s*1.25);
    rectMode(CORNERS);
    rect(x-.85*s, y+.8*s, x-.65*s, y+2*s);
    rect(x+.85*s, y+.8*s, x+.65*s, y+2*s);
    rectMode(CORNER);
    rect(x-.1*s, y+2.8*s, -.7*s, -.25*s);
    rect(x+.1*s, y+2.8*s, .7*s, -.25*s);
    fill (0,0,c);
    stroke(255);
    quad(x-.85*s, y+.8*s, x+.85*s, y+.8*s, x+.3*s, y+2.5*s, x-.3*s, y+2.5*s);
    
    //constrains
    x = constrain(x, s, width-10);
    y = constrain(y, s, height-10);   
  }
  
  void displayA (float x, float y) {
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(x-.6*s,y+.85*s,s/3,s);
    rect(x+.6*s,y+.85*s,s/3,s);
    rect(x-.3*s,y+.95*s,s/4,.65*s);
    rect(x+.3*s,y+.95*s,s/4,.65*s);
    fill(0,0,c);
    ellipse(x,y,s*2,s*2);
    fill (0);
    ellipse(x+1.1*s, y-.5*s, s*1.1, s*.9);
    ellipse(x-1*s, y-.3*s, s/2, s/2);
    quad(x+.8*s,y-.8*s, x+1.4*s,y-.9*s, x+.6*s,y-1.1*s, x+.5*s,y-s);
  }
  
  //whisper from innovator to sheeple
 boolean whisper(Person p0) { 
   
  // distance between two persons 
  float dT = dist(You.x,You.y,p0.x,p0.y);  
  
   if ((dT > 0) && (dT < s*1.5)) {              
    return true;
   } else {
    return false;
   }
 }

 
 
}
