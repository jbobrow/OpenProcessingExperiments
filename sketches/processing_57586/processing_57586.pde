
//field of dreams
//ariel leath
//march 26th

float petalDia=60;
float myCloud = 200;
float myPetal=50;
float myMiddle=20;
float bloomPetals = 7;
color petalColor=#F0B549;
color midColor=#CB462B;
color skyColor=#C3DBD9;
float cloudBlobs = 5;
int xPosition;

void setup() {
  size (800, 400);
  background (#67953F);
  smooth ();
  //strokeWeight(2);
  //noStroke();
}

void draw() {
  fill(skyColor); //sky blue
  rect(0, 0, 800, 300); //"the sky" aka a rectangle
  translate(300, 300); //relative placing of flowers
  myPetal = 50; //initial size of flower
  doFlowers(myPetal); //calling the flowers and placing them in different spots
  translate(99, 30);
  doFlowers(35);
  translate(-30, 0);
  doFlowers(60);
  translate(300, -30);
  doFlowers(49);
  translate(-200, 20);
  doFlowers(70);
  translate(-300, 20);
  doFlowers(45);
  noStroke();
  translate(xPosition-50,-200);
  rotate(180); //i cant get this to straighten out >:(
  //myCloud=myCloud;
  doCloud(myCloud);
  noFill();
  noStroke();
}

void doFlowers(float petalRad) { //making flowers
  pushMatrix(); 
  fill (petalColor);
  for (float i = 0; i<360; i=i+(360.0/bloomPetals)) { //creating multiple petals
    pushMatrix(); 
    rotate(radians(i)); //rotate by number of radians specified earlier
    bezier(0, 0, petalRad, petalRad*-.6, petalRad, petalRad*.6, 0, 0); //bezier - a line that curves before it ends
    popMatrix();
  }
  fill(midColor); // middle of flowers
  float midDia=20;
  ellipse(0, 0, midDia, midDia);
  noFill();
  popMatrix();
}

void doCloud (float cloudBlob){
  pushMatrix();
  //noStroke();
  fill(255);
  for(float c = 0; c<180; c=c+(180.0/cloudBlobs)){
    pushMatrix();
    rotate (radians(c));
    bezier(0,0,cloudBlob,cloudBlob*-.6,cloudBlob,cloudBlob*.6,0,0);
    popMatrix();
  }
  popMatrix(); 
  //makes the cloud follow the mouse aka "float" across the screen...
  if(mouseX>25 && mouseX<width-25){
    xPosition=mouseX;
   }
}

