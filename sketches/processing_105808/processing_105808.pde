

float[] xPos = new float[5];
float[] yPos = new float[5];
float[] xSpeed = new float[5];
float[] ySpeed = new float[5];
float[] startSpeed = {2,-2,1,-1,3};
int[] index = new int[5];

void setup () {
  size(500,400);
  background(150);
  
  //defines innitial position of ellipse
  for(int i=0; i<5; i++){
  xPos[i] = random(30,width-30);
  yPos[i] = random(30,height-30);
  xSpeed[i] = startSpeed[i];
  ySpeed[i] = startSpeed[i];
  index[i] = int(random(1,259));
  }
  
  //defines the inital speed of the ellipse
  
  //change color mode to Hue, Saturation, Brightness
  colorMode(HSB, 360, 100, 100);
}


void draw () {
  
   noStroke();
   fill(0,0,0,50);
   rect(0,0,width,height);
  
  //cycles through Hues
  for(int i=0; i<5; i++){
    if (index[i]<360){
      index[i]++;
    } else {index[i] =0;}
    
    //adds faded background
    //creates ghosting effect
    //noStroke();
    //fill(0,0,0,50);
    //rect(0,0,width,height);
    
    //checks if ellipse is within width and height
    //reverses speed direction on collision
    if (xPos[i] > (width+56)) {xPos[i] = -56;}
    else if (xPos[i] < -56) {xPos[i] = (width+56);}
    if (yPos[i] > (height-26) || yPos[i] < 26) {ySpeed[i]*=-1;}
    
    //applies speed to ellipse
    xPos[i]+=xSpeed[i];
    yPos[i]+=ySpeed[i];
    
    //draw glow effect
    fill(index[i],100,100,5);
    for(int j=0;j<10;j++){
      ellipse(xPos[i],yPos[i],50+(j*5),50+(j*5));
    }
    
    //draws ellipse 
    noStroke();
    fill(index[i],100,100,100);
    ellipse(xPos[i],yPos[i],50,50);
  }
}

void mousePressed() {
  for(int i=0; i<5; i++){
  if (dist(mouseX,mouseY,xPos[i],yPos[i])<26) {xSpeed[i]*=-1;}
  }
}


