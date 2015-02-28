
int [] Colors = new color [8];                         //set up a matrix of colors to select from later in the sketch. There will be 8 possible colors to select from

void setup() {
  size(600,600);
  background(0);
  smooth();

  Colors[0] = color(255,130,86);                       //orange
  Colors[1] = color(205,200,174);                      //grey-brown
  Colors[2] = color(115,163,83);                       //green
  Colors[3] = color(58,115,69);                        //green'
  Colors[4] = color(26,31,28);                         //black
  Colors[5] = color(159,179,182);                      //grey-blue
  Colors[6] = color(71,142,176);                       //blue
  Colors[7] = color(126,130,173);                      //purple
}

int z = 0;                                             //variable that controls the opacity of stroke

void draw() {
  pushMatrix();
  translate(0,height/2);                               //moves the grid to the midpoint of the height
  for(int x = 0; x < 3; x ++) {                        //first for loop creating a quartering grid
    int c = floor(random(0,8));                        //random variable that determines what color from the matrix will be selected for the stroke
    translate(width/4,0);                              //the quartering effect is accomplished by translation horizontally
    for (int r = 0; r < 50; r++) {                     //essentially sets up the amount of bezier curves that will be drawn
      pushMatrix();                                    //begins a second matrix adjustment that will be used for rotation of the bezier curves each time 'r' changes
      rotate(r);                                       //rotates and then draws at the new grid point, adjusted to the rotation point 'r' each frame
      fill(255,2);                                     //creates a white fill that has a very high opacity creating only vision of overlapping areas
      stroke(Colors[c],100-z);                         //stroke influenced by the variables of transparency and opacity
      bezier(-10,-10,width/2,-height/2,width/2,height/2,-10,10);
      popMatrix();
    }
  }
  popMatrix();
  noStroke();
  fill(0,75);
  rect(0,0,width,height);
  if(z == 100) {
    noLoop();
  }
  else {
    z++;                                              //amount opacity changes each frame
  }
}


