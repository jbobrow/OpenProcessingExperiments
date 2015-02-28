

// Rotation of items at 137.5 degrees
// Golden Rectangle sized canvass naturally.
float phi=1.6180339;
float  dimX=600,dimY=dimX/phi; 
float distance=4;   // Spreading of the dots
float ox,newx=dimX/2;
float oy,newy=dimY/2;
float diameter=20;  // Width of the outer dots. 
float growth=1;  // Speed of growth
int numSeeds=144  ;   // number of seeds should be a fibonacci number.
float rot=0; 
int i;
float direction=-1;
float spinAmt=1;
boolean randomColor=true; // Uses black and white by default. 
color mColor=color(255,255,255); 
float redAmt,blueAmt,greenAmt=0;
boolean decRed, decBlue, decGreen; 
boolean cShift=true;
float countInc=-.5;
color[] phicolors = new color[3];
int cnum=0;

void setup(){
  size(int(dimX),int(dimY),JAVA2D);
  smooth();
  background(255);
  fill (mColor);
  stroke(1,255);
  get3Colors();
  placeSpots();
}

void get3Colors(){
  redAmt=int(random(255));
  greenAmt=int(random(255));
  blueAmt=int(random(255));  
  mColor=color(redAmt,blueAmt,greenAmt,155); 
  phicolors[0]=color(redAmt,blueAmt,greenAmt,255);
  phicolors[1]=color(redAmt/phi,blueAmt/phi,greenAmt/phi,255);
  phicolors[2]=color(redAmt*phi,blueAmt*phi,greenAmt*phi,255);
}
  
void placeSpots() {
   
  translate(dimX*(1/phi),dimY/2);
  rotate(spinAmt);
   for(i=1;i<numSeeds;i++){
    rot+=radians(360/(phi*phi));
    newx=(i*distance*sin( rot));
    newy=(i*distance*cos( rot));
    ellipse(newx,newy,diameter*i*.02,diameter*i*.02);
   }
}

void draw(){
  fill(0,0,0,255);
  diameter+=countInc;
  if (diameter==0 || diameter>40) {
    countInc*=-1;
    get3Colors();
  }
  rot=0;
  spinAmt+=137.5*direction;
  fill(phicolors[cnum]);
  cnum++;
      if (cnum>2){
        cnum=0;
      }
    
  placeSpots();
}


void mouseMoved(){
  distance=float(mouseX)/70+2; 
  diameter=float(mouseY)/3+5;
  direction*=-1;
  //print("diameter:"+diameter+",diatance:"+distance+",mouseX/70"+mouseX/70+"\n");
  
}

void keyPressed() {
  if (key == 'c') {
      // pressing c will toggle color and B&W
    randomColor=!randomColor;
    get3Colors(); 
  }
  if (key == 's') {
    // pressing s will take a picture.  Won't work on JS version.
    saveFrame("output##.png");
  }
  if (key == 'r') { // reset
    background(255);
  }
 
}
                                
