
void keyTyped(){
  if(key ==' '){
    setup();
  }
  if(key =='r'){
    maxdTheta = 1.5*(2*PI)/nSegs;//max angle by which it can differ from its predecessor
    maxdThetaVelPerStep = maxdTheta/40;//max velocity it can change by each step
    maxThetaVel = maxdThetaVelPerStep*2;
    trickleVelScaling = nSegs*.003;
    
    centeredTentacles = true;
    drawSuckers = true;
    
    backgroundColor = 255;
    tentacleColor = 0;
    suckerColor = 255;
    suckerOutlineColor = 0;
    setup();
  }
  if(key=='s')
    drawSuckers = !drawSuckers;
  if(key=='c'){
    backgroundColor = color(random(255),random(255),random(255));
    tentacleColor = color(random(255),random(255),random(255));
    suckerColor = color(random(255),random(255),random(255));
    suckerOutlineColor = color(random(255),random(255),random(255));
  }  
  
  if(key =='l'){
    centeredTentacles = !centeredTentacles;
    setup();
  }
  if(key=='-'){
    maxThetaVel = maxThetaVel/1.2;
    println("thetavel: "+(maxThetaVel/(maxdThetaVelPerStep*2)));
  }
  if(key=='_'){
    maxThetaVel = maxThetaVel*1.2;
    println("thetavel: "+(maxThetaVel/(maxdThetaVelPerStep*2)));
  }
  
  if(key=='='){
    trickleVelScaling = trickleVelScaling/1.2;
    println("trickleVel: "+(trickleVelScaling/(nSegs*.003)));
  }
  if(key=='+'){
    trickleVelScaling = trickleVelScaling*1.2;
    println("trickleVel: "+(trickleVelScaling/(nSegs*.003)));
  }

  if(key=='['){
    maxdTheta = maxdTheta/1.2;
    println("maxdTheta: "+(maxdTheta/(1.5*(2*PI)/nSegs)));
  }
  if(key=='{'){
    maxdTheta = maxdTheta*1.2;
    println("maxdTheta: "+(maxdTheta/(1.5*(2*PI)/nSegs)));
  }
  
  if(key==']'){
    nTentacles = constrain(nTentacles-1, 1, 2000);
    setup();
  }
  if(key=='}'){
    nTentacles = constrain(nTentacles+1, 1, 2000);
    setup();
  }
}

