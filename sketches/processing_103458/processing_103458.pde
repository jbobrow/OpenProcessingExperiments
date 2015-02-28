
class Ball {
  PVector ballPos = new PVector(); // ball's position
  PVector velocity = new PVector(); // ball's direction and speed.
   
  // the radius. To allow scalability, we set it according to the width.
  float radius = width / 107;
  Ball () { // Constructor. When the ball is created (Ball ball = new Ball()), this thing is called.
    // the ball will be at the center, where the player's wall is (z=0).
    ballPos = new PVector(0,0,0);
    // The velocity depends on the difficulty. We use random so it doesnt stay at the same place.
    velocity = new PVector(random(-1,1), random(-1,1),difficulty + 10);
  }  
  void update () { // Update. We Move the ball, check for collisions, and handle scoring in here.
    ballPos.add(velocity); // Velocity + Position.
     
    // The collision between the ball and the walls.
    // right wall
    if (ballPos.x > 0.9 * width/2) { // if the ball is too far to the right
      velocity.x *= -1; // multiply the velocity's x value by -1.
      ballPos.x = 0.9 * width/2; // set the ball to the wall's position so it doesnt get stuck
      rightFade = frameCount; // set the fade for that wall
    }
    // bottom wall
    if (ballPos.y > 0.9 * height/2) {
      velocity.y *= -1;
      ballPos.y = 0.9 * height/2;
      bottomFade = frameCount;
    }
    // left wall
    if (ballPos.x < -0.9 * width/2) {
      velocity.x *= -1;
      ballPos.x = -0.9 * width/2;
      leftFade = frameCount;
    }
    // top wall
    if (ballPos.y < -0.9 * height/2) {
      velocity.y *= -1;
      ballPos.y = -0.9 * height/2;
      topFade = frameCount;
    }
     
    // now we check for the collision between the wall and the player's/opponent's wall
    // player's wall
    if (ballPos.z > 0) { // The player's wall is at z = 0.
      // we use the intersect function, found at the bottom of this page,
      // to detect collision between the paddle and the ball
      // Intersection is made to be accurate.
      boolean intersect = intersects(ballPos, radius + 2,
                     new PVector(constrain(mouseX - width/2 - width/10, -width/2 *0.9, width/2 *0.9 - width/5),
                     constrain(mouseY - height/2 - height/10, -height/2 *0.9, height/2 *0.9 - height/5)),
                     width/5, height/5);
      if ((intersect) || (first)) { // if the ball hits the paddle
        velocity.z += 1.2; // add to the velocity so the ball goes faster and it becomes more difficult.
        velocity.z *= -1; // reverse the ball's direction.
        ballPos.z = 0; // make sure the ball doesn't get stuck.
        if (intersect) { // if the ball hits the paddle
          if (first) { // if it's the first hit (the player is serving)
            velocity.x += (mouseX - pmouseX) * 0.1; // base the velocity off of the paddle speed
            velocity.y += (mouseY - pmouseY) * 0.1;
            first = false;
          }
          else { // If the player isn't serving
            velocity.x += (mouseX - pmouseX) * 0.5;
            velocity.y += (mouseY - pmouseY) * 0.5;     
          }
        }
        // make sure that it isn't first serve everytime the player hits.
        if (first)
          first = false;
           
        // set the playerFade to current frame.
        // the fading is based off of which frame it starts
        playerFade = frameCount;
        drawPaddle(); // Redraw the paddle so has the fade effect.
      }
      else {
        // If the player's paddle doesn't hit the ball
        // and it isn't the first serve
        // increase the opponent's score and restart.
        opponentsScore += 1;
        restart();
      }
    }
    
    //their wall
    if (ballPos.z < -depth) { // their wall is at z = -depth
      if (intersects(ballPos, radius + 2,
                     new PVector(constrain(opponent.location.x -width/10, -width/2 *0.9, width/2 *0.9 - width/10),
                                 constrain(opponent.location.y -height/10, -height/2 *0.9, height/2 *0.9 - height/10)),
                      width/5, height/5)) { // if the ball and their paddle intersects
        // the opponent hits the ball
        // fade
        opponent.fade = frameCount;
         
        // velocity is sped up and reversed
        velocity.z -= 1.2;
        velocity.z *= -1;
         
        // move the ball back to their wall, just in case it went through the paddle.
        ballPos.z = -depth;
      }
      else { // if the opponent misses
        playerScore += 1;
        difficulty += 1; // increase the difficulty
        restart();
      } 
    }
  }
  // Display the ball
  void display() {
    noStroke();
    fill(255);
    // push Matrix, makes the translating local,
    // so it only moves the ball, and not the room
    pushMatrix();
      translate(ballPos.x, ballPos.y, ballPos.z); // move to ball's location
      sphere(radius * 2); // draw the ball
    popMatrix();  
  }
}
 
// checks to see if ball intersects rectangle at edge
boolean intersects(PVector ballPos, float ballRadius,
                   PVector rectPos, float rectWidth, float rectHeight) {
  // Vector distance from the ball and the rectangle
  PVector cDist = new PVector(
          abs(ballPos.x - rectPos.x - rectWidth/2),
          abs(ballPos.y - rectPos.y - rectHeight/2));
  // if the the ball is too far from the rectangle, return false
  if (cDist.x > (rectWidth/2 + ballRadius))
    return false;
  if (cDist.y > (rectHeight/2 + ballRadius))
    return false;
   
  // if the ball's center is within the rectangle, return true
  if (cDist.x <= rectWidth/2)
    return true;
  if (cDist.y <= rectHeight/2)
    return true;
     
  float cDist_sq = sq(cDist.x - rectWidth/2) +
                   sq(cDist.y - rectHeight/2); // find the distance^2
                    
  if (cDist_sq <= sq(ballRadius))
    return true;
  else
    return false;
}
