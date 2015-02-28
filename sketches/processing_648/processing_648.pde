
class Being {
  float wide;
  int wideOption;
  int shade;
  int shadeOption;
  float xpos;
  float ypos;
  float mommySize;
  float daddySize;
  int mommyShade;
  int daddyShade;
  int shapeGene;
  int sizeGene;
  int shadeGene;
  boolean isCircle = false;
  boolean isSquare = false;
  boolean isChild = false;

  Being(int form) {

    if(form == 0) {
      isCircle = true;
    }
    else if(form == 1) {
      isSquare = true;  
    }

    xpos = width/2;
    ypos = height/2;
  }

  Being(float mR, int mS, float dR, int dS) {
    isChild = true;
    mommySize = mR;
    mommyShade = mS;
    daddySize = dR;
    daddyShade = dS;
    shapeGene = int(random(0,2));
    sizeGene = int(random(0,2));
    shadeGene = int(random(0,2));
  }

  void drawMe() {
    
    wideOption = int(random(3));
    shade = int(random(3));
    
    noStroke();
    //SHADE
    if(shadeOption == 0) {
      shade = 50;
    }
    else if(shadeOption == 1) {
      shade = 100;
    }
    else {
      shade = 200;
    }
    
    //WIDTH
    if(wideOption == 0) {
      wide = 30;
    }
    else if(wideOption == 1) {
      wide = 80;
    }
    else {
      wide = 200;
    }
    
    fill(0,0,0,shade);
    
    if(isCircle){
      ellipse(xpos, ypos, wide, wide);  
    }

    else if(isSquare) {
      rect(xpos, ypos, wide, wide);
    }

    else if(isChild) {
      if(sizeGene == 1) {
        wide = mommySize;
      }
      else {
        wide = daddySize;
      }
      if(shadeGene == 1) {
        shade = mommyShade;
      }
      else {
        shade = daddyShade;
      }
      //randomize shape
      if(shapeGene == 1) {
        noStroke();
        fill(0,0,0,shade);
        ellipse(width/2, height/2 + 50, wide, wide);
      }

      else {
        noStroke();
        fill(0,0,0,shade);
        rect(width/2, height/2 + 50, wide, wide);
      }
    }

  }

}



