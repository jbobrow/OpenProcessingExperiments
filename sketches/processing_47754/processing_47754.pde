
//an exercise for custom functions, arrays, loops and coditional statements
//for "How to Make Things with Words" seminar, AFAD, bratislava, 2011/12
//by echoechonoisenoise


int amount=30;//amount of boxes in the scene

PVector[] pos;//define "pos" as a list of positions in 3d space, stored as vectors
PVector[] rot;//...list of rotations
PVector[] dim;//...list of dimensions
color[] col;//...list of colors

void setup() {
  size(800, 600, P3D);

  pos=new PVector[amount];//create new, empty array of PVectors
  rot=new PVector[amount];//-||-
  dim=new PVector[amount];//-||-
  col=new color[amount];//-||- of colors

  generateBoxes();//custom function filling the above empty arrays with data
}

void draw() {
  background(100);
  pointLight(255, 255, 255, 300, 400, 300);
  pointLight(255, 255, 255, -500, 200, -100);

  translate(width/2, height/2, -150);//pulling the centre of coordinate system to the middle of the screen
  rotateY(map(mouseX, 0, width, 0, TWO_PI));//spinning around Y-axis by 0-180 degrees resulting from mapping mouse's X position on the screen to required range [0-2*pi]
  rotateX(map(mouseY, 0, height, 0, TWO_PI));//spinning around X-axis by 0-180 degrees resulting from mapping mouse's X position on the screen to required range [0-2*pi]

  drawBase();

  for (int i=0;i<amount;i++) {// for all the elements in the scene, take "pos", "rot", "dim" and "col" values at "i" position in the list and use them to draw a box...
    fill(col[i]);
    pushMatrix();
    translate(pos[i].x, pos[i].y, pos[i].z);
    rotateX(rot[i].x);
    rotateY(rot[i].y); 
    rotateZ(rot[i].z);
    box(dim[i].x, dim[i].y, dim[i].z);
    popMatrix();
  }
}

void mouseClicked() {
  generateBoxes();
}




