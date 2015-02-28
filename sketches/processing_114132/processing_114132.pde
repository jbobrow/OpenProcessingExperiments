
int i, counter;
ArrayList<Planet> planetlist;
PVector forceij, loc, vel;

Bargraph graph1 = new Bargraph(50,350,0,10,5,300);

void setup() {  //setup function called initially, only once
  size(450, 450);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  
  loc = new PVector(int(random(450)),int(random(450)));
  vel = new PVector(int(random(450)),int(random(450)));
  
  plan_num = 5;  //number of planets
  planletlist = new ArrayList<Planet>();
  for i = 1 to 5
  // the following line is tricky, it calls the ArrayList method add
    planetlist.add(new Planet(random(5),random(1000), pos mass velocity));
  endif
}

void draw() {  //draw function loops 
// in pseudocode
// time+1
// calc new positions
//    2 loop, 1 goes 1 - numplanets, the other i to numplanets
// blank background
// redraw world

  // time_1
  counter++;
  
  // calc forces
  for (i=0; i<plan_num; i++) {
    Planet thisplanet = planetlist.get(i);
    for (j=i+1; j<plan_num; j++) {
      Planet thatplanet = planetlist.get(j);
      forceij = thisplanet.calcforce(thatplanet);
      //now add force to planet i and negative force to planet j
      thisplanet.addforce(forceij);
      thatplanet.addforce(-forceij);
    }
  }
  
  //calc new positions
  planetlist.update;
  
  // blank background
  background(255);
  
  //redraw world
  planetlist.draw;
  graph1.display(avg velocity of planet #1);
   
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}
 
class Planet {
// this class will need mass, radius, x, y, xvel, yvel

    PVector pos, vel, force;
    int mass, diam;
    float g = 9.8;
     
    // Constructor
    Planet (PVector l, PVector v, int m, int d) {
        pos=p;
        vel=v;
        mass=m;
        diam=d;
    }
     
    //Method: display
    void display() {
        stroke(0);
        fill(175);
        ellipse(pos.x,pos.y,diam,diam);
        }
    //Method: calculate force that thatplanet has on thisplanet
    void calcforce(Planet p) {
      // now calculate force between planet mass at pos and planet p.mass and p.pos
      // f = g * m1 * m2 / r^2
      // note that forcevector = (a-b) /magab * g*m*m/magab^2
      force = pos.sub(p.pos).mult( g * mass * p.mass / pow(pos.dist(p.pos),3) );
        }
    void update() {
      pos.add(vel);
    }
    
}
