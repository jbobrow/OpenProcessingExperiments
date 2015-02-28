
Thread t;
class MovementThread implements Runnable {
  MovementThread() {
    t = new Thread(this,"Movement Thread");
    t.start(); 
  }

  public void run() {
    try { 
      while(true)
      {
        for (int i=0; i<a.size(); i++)
            ((circle)(a.get(i))).move();
        Thread.sleep((long)(1/frameRate*250)); //Update position once per frame to limit CPU usage
      }
    } 
    catch (InterruptedException e) {
      System.out.println("Child interrupted.");
    }
    System.out.println("Exiting child thread.");
  }
}

