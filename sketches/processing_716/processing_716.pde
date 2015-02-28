
public class Lock {
  // declare variables
  boolean newLeader = false;
  int NUM_POINTS = 11;
  int NUM_LINES;
  int horizon;
  int[] yPoints = new int[NUM_POINTS];

  int[] domain = {
    100, 0, 50, 200, 450, 600, 800, 1000, 1200, 1400, 1500       };

  int[] range = {
    20, 10, 15, 5, 15, 13, 5, 6, 8, 5, 15, 13, 5, 0, 0      };


  Lock (int _NUM_LINES, int _horizon){
    NUM_LINES = _NUM_LINES;
    horizon = _horizon;
  } 
  void update(){
    tendril(NUM_LINES);
  }
  // declare functions
  void tendril(int _NumFollowers){
    leaderStrand();
    followerStrands(_NumFollowers);
  }
  void followerStrands(int _NumStrand){
    stroke(0);
    strokeWeight(0.05);

    for(int i = 0;i <= _NumStrand; i++){
      beginShape();
      for (int j=0; j < NUM_POINTS; j++) {
        // check to see if conditions are right for change
        if(newLeader == false){
          int dissent = int(random((range[j])*500));
          if(dissent == 18){
            newLeader = true;
          } 
        }
        // alas we have a new leader, Hello World here we come!
        if(newLeader == true){
          yPoints[j] += int(random(70)-35);
          curveVertex(domain[j], yPoints[j]);
        }


        // if not a new leader, be a follower
        else{
          float chain = random(range[j])-(range[j]/2);
          curveVertex(domain[j], yPoints[j]+chain);
        }

      }
      endShape();
      newLeader = false;
    }
  }

  void leaderStrand(){
    stroke(0);
    strokeWeight(random(3, 8));
    beginShape();
    for (int j=0; j < NUM_POINTS; j++) {
      yPoints[j] = int((random(100)-50)+horizon);
      curveVertex(domain[j], yPoints[j]);
    }
    endShape();
  }
}




