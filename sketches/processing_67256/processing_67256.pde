
class WalkerSystem {
  ArrayList walkers;  // array list for all walkers
  int walkercount = 1000; 
  int r1 = 5;
  float crad= r1*2;
  
  
  WalkerSystem() {      //constructor
    walkers = new ArrayList();  //initialise the array list
    for (int i = 0; i < walkercount; i ++) {
      walkers.add(new Walker(width/2,height/2)); // add a walker to the array
    }
  }
  
  void run() {
    // cycle through the array list
    for (int i = 0; i < walkers.size(); i++) {
      Walker w = (Walker) walkers.get(i);
      w.display();
      w.step();
      w.fade();
      
  }
 } //---------------------------------------------end run method
 
  //---------------------------------------------end run method

} // -----------------------------------------------end class

