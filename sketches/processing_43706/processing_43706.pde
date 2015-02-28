
//VARIABLES
  float [] xNative = new float [500];
  float [] yNative = new float [500];
  float [] xColonist = new float [100];
  float [] yColonist = new float [100];

//COLOR VARIABLES
  color c = color(random(255), random(255),random(255));

//SETUP
  void setup() {
    size (800, 1000);
    smooth();
    noStroke();


//INITIALIZE NATIVES
 for (int i = 0; i < xNative.length; i++) {
    xNative[i] = random(0, 800);
    yNative[i] = random(0,1000);
   }
   
//INITIALIZE COLONISTS
  for (int i=0; i < xColonist.length; i++) {
    xColonist[i] = 0;
    yColonist[i] = 0;
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

//DRAW IT
  //NATIVE
  for(int i = 0; i<xNative.length; i++) {
    fill(c, 100);
    ellipse(xNative[i], yNative[i], 12, 12);
  }
  //COLONIST  
  for(int i = 0; i<xColonist.length; i++) {
    fill(c*5);
    ellipse(xColonist[i], yColonist[i], 25, 25);
     
  }
}


