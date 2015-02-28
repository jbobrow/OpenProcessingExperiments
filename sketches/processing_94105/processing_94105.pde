
class Ball {

  int xPos;
  int yPos;
  double xSpeed;
  double ySpeed;
  int ballRadius;
  int ballR;
  int ballG;
  int ballB;
  double ballSpeedFactor;

  Ball(int xp, int yp, double xs, double ys, int br, int bcr, int bcg, int bcb, double bsf) {
    xPos = xp;
    yPos = yp;
    xSpeed = xs;
    ySpeed = ys;
    ballRadius = br;
    ballR = bcr;
    ballG = bcg;
    ballB = bcb;
    ballSpeedFactor = bsf;
  }

  void drawBall() {
    ellipseMode(CENTER);
    fill(ballR, ballG, ballB);
    ellipse(xPos, yPos, ballRadius*2, ballRadius*2);
  }

  void bounceVert() {
    ySpeed*=-1;
  }

  void bounceHorz() {
    if(xSpeed < 0){
      int[] distance = new int[minions];
      for(int i = 0; i < minions; i++){
        distance[i] = (int)Math.sqrt(Math.pow(left.minions.get(i).xPos-xPos,2) + Math.pow(left.minions.get(i).yPos-yPos,2));
      }
      int least = Math.min(distance[0],Math.min(distance[1],Math.min(distance[2],Math.min(distance[3],Math.min(distance[4],distance[5])))));
      for(int j = 0; j < minions; j++){
        if(distance[j]==least){
          least = j;
          break;
        }
      }
      if(least==0){
        int count = 0;
        for(int j = 0; j < minions && count < 3; j++){
          if(!left.minions.get(j).destroyed()){
            left.minions.get(j).loseHealth();
            count++;
          }
        }
      } else if(least==minions-1){
        int count = 0;
        for(int j = minions-1; j >= 0 && count < 3; j--){
          if(!left.minions.get(j).destroyed()){
            left.minions.get(j).loseHealth();
            count++;
          }
        }
      } else {
        int count = 0;
        int mini = least;
        int maxi = least;
        while(count<3&&(mini>=0 || maxi < minions)){
          if(mini>=0 && !left.minions.get(mini).destroyed()){
            left.minions.get(mini).loseHealth();
            count++;
          }
          mini--;
          if(maxi!=mini+1 && count<3 && maxi<minions && !left.minions.get(maxi).destroyed()){
            left.minions.get(maxi).loseHealth();
            count++;
          }
          maxi++;
        }
      }
    } else {
      int[] distance = new int[minions];
      for(int i = 0; i < minions; i++){
        distance[i] = (int)Math.sqrt(Math.pow(right.minions.get(i).xPos-xPos,2) + Math.pow(right.minions.get(i).yPos-yPos,2));
      }
      int least = Math.min(distance[0],Math.min(distance[1],Math.min(distance[2],Math.min(distance[3],Math.min(distance[4],distance[5])))));
      for(int j = 0; j < minions; j++){
        if(distance[j]==least){
          least = j;
          break;
        }
      }
      if(least==0){
        int count = 0;
        for(int j = 0; j < minions && count < 3; j++){
          if(!right.minions.get(j).destroyed()){
            right.minions.get(j).loseHealth();
            count++;
          }
        }
      } else if(least==minions-1){
        int count = 0;
        for(int j = minions-1; j >= 0 && count < 3; j--){
          if(!right.minions.get(j).destroyed()){
            right.minions.get(j).loseHealth();
            count++;
          }
        }
      } else {
        int count = 0;
        int mini = least;
        int maxi = least;
        while(count<3&&(mini>=0 || maxi < minions)){
          if(mini>=0 && !right.minions.get(mini).destroyed()){
            right.minions.get(mini).loseHealth();
            count++;
          }
          mini--;
          if(maxi!=mini+1 && count<3 && maxi<minions && !right.minions.get(maxi).destroyed()){
            right.minions.get(maxi).loseHealth();
            count++;
          }
          maxi++;
        }
      }
    }
    xSpeed*=-1;
  }

  void bounceShield() {
    xSpeed*=ballSpeedFactor;
    ySpeed*=ballSpeedFactor;
    xSpeed*=-1;
  }

  void moveBall() {
    xPos+=xSpeed;
    yPos+=ySpeed;
    if (xPos + ballRadius > width || xPos - ballRadius < 0) bounceHorz();
    if (yPos + ballRadius > height || yPos - ballRadius < 0) bounceVert();    
    if (xSpeed < 0) {
      if (yPos < left.s.shieldyPos + shieldheight/2 && yPos > left.s.shieldyPos - shieldheight/2 && left.s.shieldxPos+shieldtolerance > xPos - ballRadius && left.s.shieldxPos-shieldtolerance < xPos - ballRadius) bounceShield();
    }
    if (xSpeed > 0) {
      if (yPos < right.s.shieldyPos + shieldheight/2 && yPos > right.s.shieldyPos - shieldheight/2 && right.s.shieldxPos+shieldtolerance > xPos + ballRadius && right.s.shieldxPos-shieldtolerance < xPos + ballRadius) bounceShield();
    }
  }
}


