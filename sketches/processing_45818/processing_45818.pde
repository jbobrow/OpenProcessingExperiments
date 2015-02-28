
/* greatly modified and commented form of 
  -http://www.openprocessing.org/visuals/?visualID=45488
  the rectangles jiggle back and fort. back and forth.
  it's highly claustrophobic in here.
  
  generative art, each time this sketch is run the "flock" of 
  squares starts in a new generalized local. 
*/



float pos1[ ];              //this becomes the left x-coord of rect
float pos2[ ];              //this becomes the top y-coord of the rect
float velx[ ];              //used to increment x-coord
float vely[ ];              //used to increment y-coord
float col[ ];
int q = 36;                 // number of rectanlges


void setup() {
  size(900, 400);
  background(255);
  frameRate(80);
  smooth();
  colorMode(HSB, 360, 100, 100);    // sets mode to HSV 360 degrees
                                    // 100% Saturation, 100% Brightness 
  velx = new float[q];
  vely = new float[q];
  pos1= new float[q];
  pos2= new float[q];
  col = new float[q];
 
  for (int i=0;i<q;i++) {
    
   /* Using noise helps initiate all the blocks near each other.
    Once they've begun theyre free to move around as they see fit.
    */
    pos1[i]= noise(width) * (width);
    pos2[i]= noise(height) * (height);
    col[i]= random(255);
  }
}
 
void draw() {
  strokeWeight(0.75);
  for (int i=0;i<q;i++) {
    velx[i] = random(-6, 6);         // the direction of x randomizes between -6 (left) to 6 (right)
    vely[i] = random(-6, 6);         // the direction of y randomized between -6 (down) to 6 (up) 
    
    fill(col[i]);
    rect(pos1[i], pos2[i], 10, 10 );
    pos1[i]+=random(velx[i]);        // position of x-coord is adjusted by its velx index
    pos2[i]+=random(vely[i]);        // position of y-coord is adjusted by its vely index
    
/* check to make sure no rect goes beyond the constraints of the box */ 
    if (((pos1[i] >= width) || (pos1[i] <= -10))) {
      pos1[i] = random(width);
    }
    if ((pos2[i] >= height) || (pos2[i] <= -10)) {
      pos2[i] = random(height);
    }
  }
}

void mousePressed(){
  noLoop();
}

void mouseReleased(){
  loop();
}


