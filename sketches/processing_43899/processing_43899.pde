
//VARIABLES
float [] xNative = new float [500];
float [] yNative = new float [500];
float [] xKill = new float [100];
float [] yKill = new float [100];
boolean [] DeadNatives = new boolean [100];
float [] xColonist = new float [100];
float [] yColonist = new float [100];

//COLOR VARIABLES
color c = color(random(255), random(255), random(255));

//SETUP
void setup() {
  size (800, 1000);
  smooth();
  noStroke();


  //INITIALIZE NATIVES
  for (int i = 0; i < xNative.length; i++) {
    xNative[i] = random(0, 800);
    yNative[i] = random(0, 1000);
  }

  //INITIALIZE NATIVES TO KILL
  for (int i = 0; i < xKill.length; i++) {
    xKill[i] = random (30, 770);
    yKill[i] = random (30, 970);
  }

  //INITIALIZE COLONISTS
  for (int i=0; i < xColonist.length; i++) {
    xColonist[i] = 0;
    yColonist[i] = 0;
  }

  //SET DEAD NATIVES TO FALSE
  for (int i =0; i < DeadNatives.length; i++) {
    DeadNatives[i] = false;
  }
}



//DRAW
void draw() {
  background(0);

  //SHIFT VALUES OF NATIVES
  for (int i = 0; i<xNative.length-1; i ++) {
    xNative[i] = xNative[i+1];
    yNative[i] = yNative[i+1];
  }


  //SHIFT VALUES OF COLONISTS
  for (int i = 0; i<xColonist.length-1; i ++) {
    xColonist[i] = xColonist[i+1];
    yColonist[i] = yColonist[i+1];
  }


  //COLONISTS DIRECTION BASED ON MOUSE
  xColonist[xColonist.length-1] = mouseX;
  yColonist[yColonist.length-1] = mouseY;


  //DEAD NATIVE
  for (int i = 0; i<xKill.length; i++) {
    if (DeadNatives[i]) {
      fill(0);
    } 
    else {
      fill(c);
    } 

    //KILL NATIVES BASED ON COLONIST POSITION
    if (mouseX > xKill[i]-12 && mouseX < xKill[i]+12 && mouseY > yKill[i]-12 && mouseY < yKill[i]+12) {
      DeadNatives[i] = true;
    }       

    ellipse(xKill[i], yKill[i], 25, 25);
  }



  //DRAW IT
  //NATIVE
  for (int i = 0; i<xNative.length; i++) {
    fill(c, 100);
    ellipse(xNative[i], yNative[i], 10, 10);
  }

  //COLONIST
  for (int i = 0; i<xColonist.length; i++) {
    fill(c*5);
    ellipse(xColonist[i], yColonist[i], 20, 20);
  }
}


