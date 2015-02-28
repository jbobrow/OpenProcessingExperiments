
Thread t;
class NewThread implements Runnable {
  NewThread() {
    t = new Thread(this,"Movement Thread");
    t.start(); 
  }

  public void run() {
    Point p = new Point(width/2, height/2);
    try { 
      while(true)
      {
        for (int i=0; i < vlist.size(); i++)
          for (int j=0; j <((Vehicle)vlist.get(i)).speed; j++){
          ((Vehicle)vlist.get(i)).move();
          }
        Thread.sleep((long)(1/frameRate*1000)); //Update position once per frame to limit CPU usage
      }
    } 
    catch (InterruptedException e) {
      System.out.println("Child interrupted.");
    }
    System.out.println("Exiting child thread.");
  }
}

