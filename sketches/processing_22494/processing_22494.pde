
//Toggle help
void keyPressed() {
  if (key == ' ') {
    if (menu) {
      menu = false;
    }
    else {
      menu = true;
    }
  }
  //Increase mouse follower speed
  else if(key == 'z' || key == 'Z') {
    easing+=0.01;
    if(easing > 0.4) {
      easing = 0.4;
    }
  }
  //Decrease mouse follower speed
  else if(key == 'x' || key == 'X') {
    easing-=0.01;
    if(easing < 0) {
      easing = 0;
    }
  }
  //Toggle orbit trails
  else if (key == 'c' || key == 'C') {
    if (showorbit) {
      showorbit = false;
    }
    else {
      showorbit = true;
    }
  }
  //Add orbs and spokes
  else if (key == 'a' || key == 'A') {
    orbiter.add(new Orbiter());
    spoke.add(new Spoke());
  }
  //Remove orbs and spokes
  else if (key == 's' || key == 'S') {
    if(orbiter.size()!=0) {
      Orbiter last_orb = (Orbiter) orbiter.get(orbiter.size()-1);
      orbiter.remove(last_orb);
      Spoke last_spoke = (Spoke) spoke.get(spoke.size()-1);
      spoke.remove(last_spoke);
    }
  }
  //Reset the sketch
  else if(key == 'd' || key == 'D') {
    setup();
  }
}
void mousePressed() {
  if(mouseButton==LEFT) {
    //Enlarge the shape
    if((keyPressed == true && key == CODED && keyCode == SHIFT))
    {
      for(int i = 0; i < orbiter.size(); i++) {
        Orbiter orb = (Orbiter) orbiter.get(i);
        orb.enlarge();
      }
    }
    else {
      //Speed up rotation clockwise      
      for(int i = 0; i < orbiter.size(); i++) {
        Orbiter orb = (Orbiter) orbiter.get(i);
        orb.speedup();
      }
    }
  }
  else if(mouseButton==RIGHT) {
    //Shrink the shape
    if((keyPressed == true && key == CODED && keyCode == SHIFT))
    {
      for(int i = 0; i < orbiter.size(); i++) {
        Orbiter orb = (Orbiter) orbiter.get(i);
        orb.shrink();
      }
    }
    else {
      //Speed up rotation counter clockwise 
      for(int i = 0; i < orbiter.size(); i++) {
        Orbiter orb = (Orbiter) orbiter.get(i);
        orb.slowdown();
      }
    }
  }
}


