
// PseudoRandomSwarm : modified for pseudo-random movement by Petr Vacek
//  P suffix = parallel processing of particles' physics

// Gravity Swarm
// Claudio Gonzales, June 2009
// Albuquerque, New Mexico



// MultiCount Setup
import java.util.*;
import java.util.concurrent.*;
import processing.opengl.*;
int maxThreads=4;  //number of threads running
MultiCount[] threads;
Future[] futures;
ExecutorService executor = Executors.newFixedThreadPool(maxThreads);
// ... MultiCount

particle[] Z = new particle[128042];  //large array or paticles 
int zmax = 8042;  //maximum number of currently "active" particles
float colour = random(1);
long time = 1;

void setup() {
  smooth();
  size(600,400,P2D);  

  background(250);
  
  for(int i = 0; i < Z.length; i++) {
    Z[i] = new particle( random(width), random(height), 0, 0, 1 );
  }
  
  frameRate(15);
  colorMode(RGB,255);
  cursor(CROSS);
  MultiCountSetup(0,zmax);
//noCursor();
}

void MultiCountSetup(int parmin,int parmax) {   //initial setup, allocate structures and do ReAssign
  threads = new MultiCount[maxThreads];
  futures = new Future[maxThreads];
  MultiCountReAssign(parmin,parmax);
}

void MultiCountReAssign(int parmin, int parmax) {  //divides range of values among threads for processing
  int toDivide = parmax-parmin;
  for (int i=0;i<maxThreads;i++) {
    int newmin=parmin + ( (toDivide/maxThreads)*i );
    int newmax=newmin +   (toDivide/maxThreads);
    MultiCount temp = new MultiCount(newmin,newmax);
    threads[i]= temp;
  System.out.printf("Thread %d : %d -> %d\n",i,newmin,newmax);
  }
}

class MultiCount implements Callable {  //encapsulation class for threaded operations
  int min;
  int max;
  
  public MultiCount(int parmin,int parmax) {
   min = parmin;
   max = parmax;
  }
  
  Integer call() throws Exception {  // overriden method from Callable interface- this is executed during each frame
    count();
    return 0;
  }
  
void count() {  //actual code for processing particles 
   
  for(int i = min; i < max; i++) {
    if( mousePressed && mouseButton == LEFT ) {      
      Z[i].gravitate( new particle( mouseX, mouseY, 0, 0, 1 ) );
    } 
    else if( mousePressed && mouseButton == RIGHT ) {
      Z[i].deteriorate();
//      reset();
    } 
    else {
      Z[i].gravitate( new particle( random(width), random(height), 0, 0, 1 ) );
      //Z[i].deteriorate();
    }
    Z[i].update();
   //drawing must be done in single-thread inside main Draw function ...
 }
  
}

} // ..end of encapsulation class

void MultiCount() { //encapsulation for calling all the threads to perform single frame
   Vector<Callable<MultiCount>> cord =new Vector();
  for (int i=0;i<maxThreads;i++) {
    cord.add(threads[i]);
  }
  try{
  executor.invokeAll(cord);
  } catch (Exception e) {}
  
}

float r; 

void draw() {
  
   filter(INVERT);
 
  stroke(0);
  fill(255,30);
  rect(0,0,width,height);
  
  colorMode(HSB,1);
  
 MultiCount();
  for (int i=0;i<zmax;i++) {
  r = float(i)/zmax;
    stroke( colour, pow(r,0.1), 1-r, 0.15 );
    Z[i].display();
  }
 
   colorMode(RGB,255);
  
  colour+=random(0.01);
  if( colour > 1 ) { 
    colour = colour%1;
  }

  filter(INVERT);
}

void keyPressed() {

    if (key == 's' || key == 'S') {
        zmax -= 500;
        if (zmax< 0) { zmax=42; }
                MultiCountReAssign(0,zmax);  //number of active particles changed so we change ranges of threads
       }

    if (key == 'w' || key == 'W') {
        zmax += 500;
        if (zmax> Z.length) { zmax= Z.length; }
        MultiCountReAssign(0,zmax);  //number of active particles changed so we change ranges of threads
       }

      
}


void reset() {
  colour = random(1);  
  for(int i = 0; i < Z.length; i++) {
    Z[i].reset( random(width), random(height), 0, 0, 1 );
  }
}


