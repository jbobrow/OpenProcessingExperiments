
//
// Sketch: barclass test1
//

//  This is test sketch 1 in trying to write a class, whose
//  objects are bargraphs (and in the future multiple display
//  options) used to display results of calculations (e.g.
//  mathematical simulations).

// results: working, spell 'Class' lowercase as 'class' !! It took
// a long time to figure out the bug.

// This sketch is done, next piece will be to make a
// useful/attractive example of its use.  Perhaps pendulum,
// or Newtonian motion.

// declare 2 new instances of bargraph
// and determining location, size, and how to display results
Bargraph graph1 = new Bargraph(50,350,0,10,5,300);
Bargraph graph2 = new Bargraph(100,350,0,10,10,300);
float t;
  
void setup() { // this is run once.
  size(400, 400);
  background(100, 200, 50);
}

void draw() { // this is run repeatedly
    t=t+0.01;
    ht=sin(t)*10;
    
  background(100, 200, 50);
  graph1.display(ht);  // simple call to .display method draws it
  graph2.display(ht+5);
  
  
}

class Bargraph {
    int xloc;
    int yloc;
    int minval;
    int maxval;
    int wid;
    int ht;
    float value;
    int htval;
    
    // Constructor
    Bargraph(int tempxloc, int tempyloc, int tempmin, int tempmax, int tempwidth, int tempht) {
        xloc=tempxloc;
        yloc=tempyloc;
        minval=tempmin;
        maxval=tempmax;
        wid=tempwidth;
        ht=tempht;
    // location of base, ht of highest value
    // maxval=value at ht, minval=value at 0 ht
    }
    
    //Method: display
    void display(float tempvalue) {
        value=tempvalue;
        htval = int(((value-minval)/(maxval-minval))*ht);
        fill (0);
        rect(xloc, yloc-htval, wid, htval);
        }
}
