
class Ball {
 
 float x, y, vx, vy, radius, r, g, b;
 
 float bounce = -1;
  
 Ball(float ix, float iy, float ivy, float ivx, float iradius, float ir, float ig, float ib) {
  x = ix;
  y = iy;
  vx = ivx;
  vy = ivy;
  radius = iradius;
  r = ir;
  b = ib;
  g = ig;
 }
 
 void create() {
  fill(r, g, b);
  noStroke();
  ellipse(x, y, radius, radius);
  x += vx;
  y += vy;
 }
 
 void bounce() {
      if(x > width - radius/2) {
       x = width - radius/2;
       vx *= bounce;
      }else if(x < 0 + radius/2) {
       x =   radius/2;
       vx *= bounce; 
      }
      
      if(y> height - radius/2) {
       y = height - radius/2;
       vy *= bounce; 
      }else if(y< radius/2) {
       y = radius/2;
       vy *= bounce; 
      }
      
      /* trying to do ball collision
      for(int i = 0; i < numBalls -1; i ++) {
       Ball ballA = ballList[i];
       for(int j = i + 1; j<numBalls; j++) {
        Ball ballB = ballList[j];
        float bdx = ballB.x - ballA.x;
        float bdy = ballB.y - ballA.y;
        float ballDist = sqrt(bdx*bdx + bdy*bdy);
        if(ballDist < radius*2){
         ballA.vx *= bounce;
         ballA.vy *= bounce;
         ballB.vx *= bounce;
         ballB.vy *= bounce; 
        }
       }
      }
      */
      
 }
  
}

