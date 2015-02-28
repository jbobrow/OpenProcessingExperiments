

void controlPanel(){
  int deltaX = 10;
  int deltaY = 10;
  int stepX = 85;
  int stepY = 20;
  
  cp5 = new ControlP5(this);
  cp5.hide();

  Slider nFishesSlider = cp5.addSlider("nFishes",0,500,nFishes,deltaX,deltaY,100,15);
  nFishesSlider.setCaptionLabel("Number or fishes");
  nFishesSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Slider nJellysSlider = cp5.addSlider("nJellys",0,500,nJellys,deltaX,deltaY+stepY,100,15);
  nJellysSlider.setCaptionLabel("Number or jellys");
  nJellysSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Slider nWhalesSlider = cp5.addSlider("nWhales",0,100,nWhales,deltaX,deltaY+2*stepY,100,15);
  nWhalesSlider.setCaptionLabel("Number or whales");
  nWhalesSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Slider nHammersSlider = cp5.addSlider("nHammers",0,100,nHammers,deltaX,deltaY+3*stepY,100,15);
  nHammersSlider.setCaptionLabel("Number or hammers");
  nHammersSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider repulsionDistSlider = cp5.addSlider("repulsionDist",0,300,repulsionDist,deltaX,deltaY+4*stepY,100,15);
  repulsionDistSlider.setCaptionLabel("Repulsion distance");
  repulsionDistSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider alignDistSlider = cp5.addSlider("alignDist",0,300,alignDist,deltaX,deltaY+5*stepY,100,15);
  alignDistSlider.setCaptionLabel("Align distance");
  alignDistSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider attractionDistSlider = cp5.addSlider("attractionDist",0,300,attractionDist,deltaX,deltaY+6*stepY,100,15);
  attractionDistSlider.setCaptionLabel("Attraction distance");
  attractionDistSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider huntDistSlider = cp5.addSlider("huntDist",0,300,huntDist,deltaX,deltaY+7*stepY,100,15);
  huntDistSlider.setCaptionLabel("Hunt distance");
  huntDistSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider limitDistSlider = cp5.addSlider("limitDist",0,300,limitDist,deltaX,deltaY+8*stepY,100,15);
  limitDistSlider.setCaptionLabel("Limit distance");
  limitDistSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
    
  Slider maxVelSlider = cp5.addSlider("maxVel",0,10,maxVel,deltaX,deltaY+9*stepY,100,15);
  maxVelSlider.setCaptionLabel("Maximum velocity");
  maxVelSlider.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Toggle paintLimitsToggle = cp5.addToggle("paintLimits",paintLimits,deltaX,deltaY+10*stepY,15,15);
  paintLimitsToggle.setCaptionLabel("Show limits");
  paintLimitsToggle.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Toggle paintLinesToggle = cp5.addToggle("paintLines",paintLines,deltaX,deltaY+11*stepY,15,15);
  paintLinesToggle.setCaptionLabel("Show lines");
  paintLinesToggle.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);

  Toggle paintDetailsToggle = cp5.addToggle("paintDetails",paintDetails,deltaX,deltaY+12*stepY,15,15);
  paintDetailsToggle.setCaptionLabel("Paint details");
  paintDetailsToggle.getCaptionLabel().align(ControlP5.RIGHT_OUTSIDE,CENTER).setPaddingX(10);
}

void controlEvent(ControlEvent theControlEvent){
  if(theControlEvent.isFrom("nFishes")){
    while(nFishes > fishes.size()){
      float posAngle = random(0,TWO_PI);
      float posMagnitude = random(0,limitDist);
      PVector pos = new PVector(0.5*width+posMagnitude*cos(posAngle),0.5*height+posMagnitude*sin(posAngle));
      float velAngle = random(0,TWO_PI);
      float velMagnitude = 1;
      PVector vel = new PVector(velMagnitude*cos(velAngle),velMagnitude*sin(velAngle));
      color col = color(50,50,155);
      float headSize = 7;
      Fish f = new Fish(pos,vel,col,headSize);
      fishes.add(f);
    }
  }
  if(theControlEvent.isFrom("nJellys")){
    while(nJellys > jellys.size()){
      float posAngle = random(0,TWO_PI);
      float posMagnitude = random(0,limitDist);
      PVector pos = new PVector(0.5*width+posMagnitude*cos(posAngle),0.5*height+posMagnitude*sin(posAngle));
      float velAngle = random(0,TWO_PI);
      float velMagnitude = 1;
      PVector vel = new PVector(velMagnitude*cos(velAngle),velMagnitude*sin(velAngle));
      color col = color(200,200,230,150);
      float headSize = random(8,11);
      int nArms = 4;
      int lengthArms = int(random(headSize*0.5,headSize*0.6));
      Jellyfish j = new Jellyfish(pos,vel,col,headSize,nArms,lengthArms);
      jellys.add(j);
    }
  }
  if(theControlEvent.isFrom("nWhales")){
    while(nWhales > whales.size()){
      float posAngle = random(0,TWO_PI);
      float posMagnitude = random(0,limitDist);
      PVector pos = new PVector(0.5*width+posMagnitude*cos(posAngle),0.5*height+posMagnitude*sin(posAngle));
      float velAngle = random(0,TWO_PI);
      float velMagnitude = 1;
      PVector vel = new PVector(velMagnitude*cos(velAngle),velMagnitude*sin(velAngle));
      color col = color(0);
      float headSize = random(8,11);
      Whale w = new Whale(pos,vel,col,headSize);
      whales.add(w);
    }
  }
  if(theControlEvent.isFrom("nHammers")){
    while(nHammers > hammers.size()){
      float posAngle = random(0,TWO_PI);
      float posMagnitude = random(0,limitDist);
      PVector pos = new PVector(0.5*width+posMagnitude*cos(posAngle),0.5*height+posMagnitude*sin(posAngle));
      float velAngle = random(0,TWO_PI);
      float velMagnitude = 1;
      PVector vel = new PVector(velMagnitude*cos(velAngle),velMagnitude*sin(velAngle));
      color col = color(100,100,100);
      float headSize = random(5,6);
      Hammer h = new Hammer(pos,vel,col,headSize);
      hammers.add(h);
    }
  }
  if(theControlEvent.isFrom("repulsionDist")){
    repulsionDistSqr = sq(repulsionDist);
  }
  if(theControlEvent.isFrom("alignDist")){
    alignDistSqr = sq(alignDist);
  }
  if(theControlEvent.isFrom("attractionDist")){
    attractionDistSqr = sq(attractionDist);
  }
  if(theControlEvent.isFrom("huntDist")){
    huntDistSqr = sq(huntDist);
  }
  if(theControlEvent.isFrom("limitDist")){
    limitDistSqr = sq(limitDist);
  }
}

void mousePressed() {
  cp5.show();
}



