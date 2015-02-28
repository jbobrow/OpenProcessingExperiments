
class Strand
{
  PVector lastPoint;        // the last point that a line was made/continues on
  PVector followPoint;      // The point that the line follows and plots its points along as a guide
  float origAngle;          // the original angle that is followed
  float followAngle;        // the current angle that is being followed
  float goalFollowAngle;    // the angle that will ultimately be followed
  float freq;               // the freqency of the strand
  float goalFreq;           // the goal frequency
  float sinAngle = 0;       // the sin angle that the strand is going along

  float amp = 0.0;          // the amplitude of the strand 
  float goalAmp;            // the goal amplitude of the strand
  int count;                // count symbolized life. We keep track of this so that every strand dies
  int maxCount;             // the maximum age of a strand
  boolean done = false;     // whether it's ready to be removed or not
  float ampFactor;          // the amoun that the amplitude changes
  int lineColor;            // the color of the line
  
  int randomChangeCount;    // count for when a change should occur
  int changeCount;          // the current count leading to a random change
  float startWeight;        // the start line weight of a strand



  Strand(float _x, float _y, float angle, float startAngle, int col, float w, int life)
  {
    count = 0;
    maxCount = life;
    lastPoint = new PVector(_x, _y);
    sinAngle = 0;
    startWeight = w;

    this.amp = getGoalAmp();
    goalAmp = amp;
    this.freq = getGoalFreq();
    goalFreq = freq;

    followPoint = new PVector(_x, _y);

    this.origAngle = angle;
    followAngle = (float)((origAngle + 90) * Math.PI/180);
    goalFollowAngle = followAngle;
    ampFactor = random(.01, .2);
    lineColor = col;
 
    makeRandomChange();
    
    /*
    // draws a line in the direction that this will start to follow
    stroke(0, 80);
    strokeWeight(1);
    line(lastPoint.x, lastPoint.y, lastPoint.x + cos(followAngle) * 100, lastPoint.y + sin(followAngle)*100);*/
  }

  
  
  void update()
  {
    // increase the follow point
    followPoint.x += cos(followAngle) * 1.0;
    followPoint.y += sin(followAngle) * 1.0;

    float curSin = sin(sinAngle);
    float newX = followPoint.x + (curSin * (cos(followAngle+1.5) * amp));
    float newY = followPoint.y + (curSin * (sin(followAngle+1.5) * amp));
    
    float countRatio = ((float)count/(float)maxCount);
    int lineAlpha = 255;
    float thickness = (startWeight - countRatio * startWeight);
    strokeWeight(thickness);
    stroke(lineColor, lineAlpha);
    line(lastPoint.x, lastPoint.y, newX, newY);


    lastPoint.x = newX;
    lastPoint.y = newY;

    sinAngle += freq;

    count++;
    
    // Find if the strand should be dead or not
    if (count > maxCount || lineAlpha < 2 || thickness<.5 || outOfBounds() == true)
    {
      done = true;
    }


    amp += (goalAmp - amp) * .01;
    freq += (goalFreq - freq) * .01;
    followAngle += (goalFollowAngle - followAngle) * .08; 


    if (changeCount  > randomChangeCount)
    {
      makeRandomChange();
      // change the goal sin and goal freq
      goalAmp = getGoalAmp();
      goalFreq = getGoalFreq();
      goalFollowAngle = followAngle + random(-1, 1);

      Strand s  = new Strand(lastPoint.x, lastPoint.y, followAngle + random(-45, 45), sinAngle, lineColor, thickness, (int)(count *1.1));
      strands.add(s);
    }
    changeCount++;
  }
  
  
  
  void makeRandomChange()
  {
    randomChangeCount = (int)random(5, 100);
    changeCount = 0;
  }
  
  
  
  float getGoalAmp()
  {
    return amp + random(20)-10;
  }
  
  
  
  float getGoalFreq()
  {
    return random(.009, .1);
  }

  
  
  // Determine if a line is out of bounds
  boolean outOfBounds()
  {
    boolean out = false;
    if (lastPoint.x < -50 || lastPoint.x > width +50)
    {
      out = true;
    }
    if (lastPoint.y < -50 || lastPoint.y > height + 50)
    {
      out = false;
    }
    return out;
  }
}


