
boolean done;
int percentCount;
int startFrame
;
void setup()
{
  size(300, 300);
  done = false;
  percentCount = 0;
  startFrame = 0;
  smooth();
}

void draw()
{
  if(done)
  {
    background(0);
    textAlign(CENTER);
    fill(255);
    text("DONE! CLICK TO RESET.", width/2, height/2);
    startFrame = frameCount;
  }
  else
  {
     if((frameCount - startFrame) % 3 == 0) percentCount++;
     background(0);
     noFill();
     stroke(255);
     rect(50, 150, 200, 20);
     
     noStroke();
     float alph = map(percentCount, 0, 100, 0, 255);
     fill(255);
     rect(50, 150, percentCount * 2, 20);
     textAlign(LEFT);
     text("LOADING " + Integer.toString(percentCount) + "%", 50, 140);
     
     fill(random(0, 255), random(0, 255), random(0, 255), alph);
     rect(51, 151, percentCount * 2 - 2, 19);
     
     if(percentCount == 100) done = true;
  }
}

void mouseClicked()
{
  if(done)
  { 
    done = !done;
    percentCount = 0;
  }
}

