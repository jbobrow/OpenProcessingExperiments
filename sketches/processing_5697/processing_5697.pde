
int collisionDist = 25; //distance that orbs collide at
int listener; // tells which orb is selected

int lvl = 1;
int intersections = 0;

Orb[] orbs;
int orbcount;
Point[] p;
float[] orbsx;
float[] orbsy;

int orbsize = 25; //width and height of each orb

boolean once = true; //bool variable to run code once during a given situation
boolean once2 = true;
boolean once3 = true;

int[] xtrail = new int[orbsize]; //array for x values of the trail effect
int[] ytrail = new int[orbsize]; //array for y values of the trail effect

PFont font;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////           SETUP             ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////


void setup(){
  size(480,300);
  smooth();
  

  //here i'm initializing the x and y trail array
  for (int i = 0; i < xtrail.length; i ++ ) {
    xtrail[i] = 0; 
    ytrail[i] = 0;
  }



  font = loadFont("Helvetica-16.vlw");

} // end setup

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////            DRAW             ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void draw(){
  background(0);
  runGame(lvl);
  if(once3 == true){
    initGame();
    if(keyPressed == true){
      once3 = false;
      lvl = 1;
    }
  }
  

} // end draw

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////        CUSTOM FUNCTIONS     ////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void initGame(){
    fill(255);
    textFont(font);
    textSize(16);
    textMode(SCREEN);
    text("Welcome to UnTangle! The point is to move the orbs around", 10, height/2);
    text("the screen so that none of the lines intersect.", 75, height/2+25);
    text("Press any key to begin.", width/2-100, height/2+50);
    
}

void runGame(int lvl2){
  intersections = 0;
  if(once == true){
    switch(lvl2){
//      case 0:
//        orbcount = 1;
//        break;
      case 1:
        orbcount = 10; //number of orbs on screen
        break;
      case 2:
        orbcount = 12;
        break;
      case 3:
        orbcount = 14;
        break;
      case 4:
        orbcount = 16;
        break;
      case 5:
        orbcount = 18;
        break;
      case 6:
        orbcount = 20;
        break;
      case 7:
        orbcount = 24;
        break;
      case 8:
        orbcount = 28;
        break;
      case 9:
        orbcount = 32;
        break;
      case 10:
        orbcount = 36;
        break;
      case 11:
        orbcount = 50;
        break;
    }

    p = new Point[orbcount];

    orbs = new Orb[orbcount]; //orbs array
    orbsx = new float[orbcount]; //array for initial x locations for each orb
    orbsy = new float[orbcount]; //array for initial y locations for each orb

    //here i'm assigning orbsx and orbsy values for the initial start values for each orb
    for(int i = 0; i < orbs.length; i++){
      orbsx[i] = round(random(orbsize/2,width-orbsize/2));
      orbsy[i] = round(random(orbsize/2,height-orbsize/2));
      orbs[i] = new Orb(orbsx[i],orbsy[i],orbsize);
    }
    for(int i = 0; i < orbs.length; i++){
      p[i] = new Point(orbs[i].orbx, orbs[i].orby); 
    }
    once = false;
  }

  if(testCompletion() == false && lvl != 0){
    drawLines();

    //displaying the orbs
    for(int i = 0; i < orbs.length; i++){
      orbs[i].display(); 
    }

    //initializing p array with orb x and y values
    for(int i = 0; i < orbs.length; i++){
      p[i] = new Point(orbs[i].orbx, orbs[i].orby); 
      //println(p[i].x + ", " + p[i].y);
    }

    //spreading out the orbs so they don't overlap
    for(int i=0; i<orbs.length; i++){
      fixOverlap(i);
    }

    for(int i = 0; i < orbs.length; i++){

      if(dist(mouseX, mouseY, orbs[i].orbx, orbs[i].orby) < 25 && mousePressed){
        findListener();
        orbs[i].orbx = mouseX;
        orbs[i].orby = mouseY;
        detectCollision(i);
        for(int x=0; x<orbs.length; x++){
          detectCollisionByOthers(x); 
        }
        stroke(255);
        fill(0);

        for (int x = 45; x < xtrail.length-1; x ++ ) {
          xtrail[x] = xtrail[x+1];
          ytrail[x] = ytrail[x+1];
        }
        xtrail[xtrail.length-1] = mouseX;
        ytrail[ytrail.length-1] = mouseY;

        for (int t = 45 ; t < xtrail.length; t ++ ) {
          ellipse(xtrail[t],ytrail[t],t,t);
        }
        orbs[i].activated = true;
        orbs[i].listening = true;
      }
      else if(!mousePressed){
        orbs[i].activated = false;
      }
    }

    int temp = 0;
    for(int j=0; j< orbcount; j++) {
      int temp1 = j+1;
      if(temp1 == orbcount){
        temp1 = 0;
      }
      line(p[j].x,p[j].y, p[temp1].x,p[temp1].y);
      for(int i=0; i< orbcount; i++) if(i!=j) {
        int temp2 = i+1;
        if(temp2 == orbcount){
          temp2 = 0;
        }
        Point pt=findIntersection(p[i],p[temp2], p[j],p[temp1]);
        if(pt != null && (pt != p[i] || pt != p[j] || pt != p[temp1] || pt != p[temp2])){
          intersections++;
        }
      }
    }
    
    fill(255);
    textFont(font);
    textSize(16);
    textMode(SCREEN);
    text("Level: " + lvl, 25, height-25); 
    int tempcount = (intersections-orbcount*2)/2;
    text("Intersections Remaining: " + tempcount, width/2, height-25);
  }
  else if(testCompletion() == true){
    drawLines();

    //displaying the orbs
    for(int i = 0; i < orbs.length; i++){
      orbs[i].display(); 
    }
    
    rectMode(CENTER);
    strokeWeight(5);
    stroke(0);
    fill(50);
    rect(width/2, height/2, 360,200);

    fill(255);
    textFont(font);
    textSize(16);
    textMode(SCREEN);
    text("You Win!", width/2-75, height/2);
    delay(2000);
    if(lvl < 12){
      lvl++;
    }
    if(lvl != 12){
      once = true;
      runGame(lvl);
    }
    else{
      rectMode(CENTER);
    strokeWeight(5);
    stroke(0);
    fill(50);
    rect(width/2, height/2, 500,200);

    fill(255);
    textFont(font);
    textSize(40);
    textMode(SCREEN);
    text("You beat the game!!!", width/2-200, height/2);
    delay(2000);
    }
  }
}


//fixOverlap is a function to spread out the orbs so they dont overap eachother
void fixOverlap(int temp){
  for(int i=0; i<orbs.length; i++){
    if (i != temp){
      float tdist = dist(orbs[temp].orbx, orbs[temp].orby, orbs[i].orbx, orbs[i].orby);
      if(tdist < collisionDist){
        float originx = orbs[temp].orbx - orbs[i].orbx;
        float originy = orbs[temp].orby - orbs[i].orby;
        float theta = atan2(originy, originx);
        float newx = collisionDist * -cos(theta) + orbs[temp].orbx;
        float newy = collisionDist * -sin(theta) + orbs[temp].orby;
        orbs[i].orbx = newx;
        orbs[i].orby = newy;
        //orbs[i].activated = true;
      }
    }
  }
}

//this function detects collisions between the selected orb and any other orb
void detectCollision(int temp){
  for(int i=0; i<orbs.length; i++){
    if (i != listener){
      float tdist = dist(orbs[listener].orbx, orbs[listener].orby, orbs[i].orbx, orbs[i].orby);
      if(tdist < collisionDist-1){
        float originx = orbs[listener].orbx - orbs[i].orbx;
        float originy = orbs[listener].orby - orbs[i].orby;
        float theta = atan2(originy, originx);
        float newx = collisionDist * -cos(theta) + orbs[listener].orbx;
        //newx = constrain(newx, 0+orbsize/2, width-orbsize/2);
        float newy = collisionDist * -sin(theta) + orbs[listener].orby;
        //newy = constrain(newy, 0+orbsize/2, height-orbsize/2);
        orbs[i].orbx = newx;
        orbs[i].orby = newy;
        orbs[i].activated = true;
      }
    }
  }
}

//this function detects collisions between any of the orbs other than the selected orb
void detectCollisionByOthers(int temp){
  for(int i=0; i<orbs.length; i++){
    if (i != temp){
      float tdist = dist(orbs[temp].orbx, orbs[temp].orby, orbs[i].orbx, orbs[i].orby);
      if(tdist < collisionDist-1){
        float originx = orbs[temp].orbx - orbs[i].orbx;
        float originy = orbs[temp].orby - orbs[i].orby;
        float theta = atan2(originy, originx);
        float newx = collisionDist * -cos(theta) + orbs[temp].orbx;
        //newx = constrain(newx, 0+orbsize/2, width-orbsize/2);
        float newy = collisionDist * -sin(theta) + orbs[temp].orby;
        //newy = constrain(newy, 0+orbsize/2, height-orbsize/2);
        orbs[i].orbx = newx;
        orbs[i].orby = newy;
        orbs[i].activated = true;
      }
    }
  }
}

// finds which orb is selected
void findListener(){
  for(int i=0; i<orbs.length; i++){
    if(orbs[i].listening){
      listener = i;
    }
  }
}

void drawLines(){
  strokeWeight(5);
  stroke(100,0,200);
  for(int i = 0; i < orbs.length-1; i++){
    line(orbs[i].orbx, orbs[i].orby,orbs[i+1].orbx, orbs[i+1].orby);
  }
  line(orbs[0].orbx, orbs[0].orby,orbs[orbs.length-1].orbx, orbs[orbs.length-1].orby);

}

boolean testCompletion(){
  int temp = 0;
  boolean temp3 = false;
  for(int j=0; j< orbcount; j++) {
    int temp1 = j+1;
    if(temp1 == orbcount){
      temp1 = 0;
    }
    line(p[j].x,p[j].y, p[temp1].x,p[temp1].y);
    for(int i=0; i< orbcount; i++) if(i!=j) {
      int temp2 = i+1;
      if(temp2 == orbcount){
        temp2 = 0;
      }
      Point pt=findIntersection(p[i],p[temp2], p[j],p[temp1]);
      if(pt != null && (pt != p[i] || pt != p[j] || pt != p[temp1] || pt != p[temp2])){
        temp++;
      }
    }
  }
  if(temp == orbcount*2){
    temp3 = true;
  }
  return temp3;
}









