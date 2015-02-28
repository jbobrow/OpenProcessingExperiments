
void keyTyped() {
    if (key == 'c' || key == 'C') {
      varyColors = !varyColors;
      for(int i=0; i<movers.length; i++)
        movers[i].fillColor = randomTranspColor();
    }
    if (key == 't' || key == 'T') {
      transparency = !transparency;
      if(transparency)
        for(int i=0; i<movers.length; i++)
          movers[i].fillColor = color(red(movers[i].fillColor), 
                                      green(movers[i].fillColor),
                                      blue(movers[i].fillColor),
                                      random(0,50));
      else
        for(int i=0; i<movers.length; i++)
          movers[i].fillColor = randomTranspColor();
    }
    if (key == 'o' || key == 'O') {
      outline = !outline;
    }    
    if (key == 's' || key == 'S') {
      decreasingSize = !decreasingSize;
    }
    if (key == 'i' || key == 'I') {
      if(maxTraverses == 0)
        maxTraverses = 1;
      else
        maxTraverses = 0;
    }
    if (key == '-') {//turn less
      dThetaScaling = dThetaScaling/1.2;
    }
    if (key == '_') {//turn more
      dThetaScaling = dThetaScaling*1.2;
    }
    if (key == '+') {//faster
      velocityScaling = velocityScaling*1.2;
    }
    if (key == '=') {//slower
      velocityScaling = velocityScaling/1.2;
    }
    if (key == '[') {//smaller
      diamInit = diamInit/1.2;
    }
    if (key == '{') {//bigger
      diamInit = diamInit*1.2;
    }
    if (key == ']') {//less
      nMovers--;
      if(nMovers<1)
        nMovers = 1;
      movers = new root[nMovers];
      for(int i=0; i<movers.length; i++)
        movers[i] = new root(windowSize/2,windowSize/2);
    }
    if (key == '}') {//more
      nMovers++;
      movers = new root[nMovers];
      for(int i=0; i<movers.length; i++)
        movers[i] = new root(windowSize/2,windowSize/2);
    }
    
    if(key== '\''){//less stripes
      if(nStripes>1)
        nStripes--;
      for(int i=0; i<movers.length; i++)
        movers[i] = new root(windowSize/2,windowSize/2);
    }
    if(key== '\"'){//more stripes
      nStripes++;
      for(int i=0; i<movers.length; i++)
        movers[i] = new root(windowSize/2,windowSize/2);
    }

    if (key == (";".charAt(0))) {//slower spin
      maxdRotation = maxdRotation/1.2;
    }
    if (key == ':') {//faster spin
      maxdRotation = maxdRotation*1.2;
    }

    if (key == ' ') {//clear
      fill(255);
      noStroke();
      rect(0,0,windowSize,windowSize);
      for(int i=0; i<movers.length; i++)
        movers[i] = new root(windowSize/2,windowSize/2);
    }
    
    if (key == 'r') {//reset
      initialConditions();
    }
}

void mouseClicked() {
  fill(255);
  noStroke();
  rect(0,0,windowSize,windowSize);
  for(int i=0; i<movers.length; i++)
    movers[i] = new root(windowSize/2,windowSize/2);
}
 

