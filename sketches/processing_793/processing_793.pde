
/*   Noise Field by Leafcutter John http://leafcutterjohn.com
 If you can work out why certain flowCell settings give errors
 please let me know (try 9 for example).
 
 oh and the moving arrows are actally called 'b' - from the class
 Ball.
 
 the class called arrows is for drawing the flow field
 
 !!!!!!IMORTANT!!!!
 
 Click window with mouse to start
 press any key to show/hide flow field
 
 
 Processing  v1.0.1
 
 */


boolean run = true;

int flowCells = 5; // how many rows and colums 
float[] [] directions = new float[flowCells][flowCells]; // create 2d array

Arrow[] a = new Arrow [flowCells*flowCells];

int numBalls = 10;

Ball[] b = new Ball [numBalls];

float noiseStep = .095;
float noiseOffset = 0.0;

int arrows = 1;

void setup(){
  size(400,400);
  smooth();
  frameRate(30);
  background(0);
  noStroke();
  fill(255,30);   
  for(int i = 0; i < numBalls; i++){
    b[i] = new Ball();
  }
}

void draw(){

  if (run == true){

    // background(0); 
    fill(0,40);
    rect(0,0,width,height);
    //construct flow field
    for(int x = 0; x < flowCells; x++){
      for(int y = 0; y < flowCells; y++){
        directions[x] [y] = noise((x*noiseStep)+noiseOffset,(y*noiseStep)+noiseOffset)* (TWO_PI*2); // fill directions with noise weight  
        stroke(50);

        if (arrows == 1){
          line(x*(width/flowCells), 0  ,x*(width/flowCells) , height); // vert grid lines
          line(0, y*(height/flowCells)  ,width , y*(height/flowCells)); // horz grid lines
        }
      }
    }

    // visualise the weight data using arrows
    if (arrows == 1){
      for(int x = 0; x < flowCells; x++){
        for(int y = 0; y < flowCells; y++){

          float xShift = (width/flowCells) / 2;
          float yShift = (height/flowCells) / 2;

          a[x+(y*flowCells)] = new Arrow (x*(width/flowCells)+xShift,y*(height/flowCells)+yShift,directions [x] [y]); // create new arrow
          a[x+(y*flowCells)].display(); // display arrow
        }
      }
    }

    for(int i = 0; i < numBalls; i++){
      b[i].display();
    }


    noiseOffset += 0.01;
  }
} 

void keyPressed(){
  arrows += 1;
  arrows = arrows %2;

}

void mousePressed(){

  run = true;
}

class Arrow {

  float x;
  float y;
  float dir;

  Arrow (float xpos, float ypos, float direction) {
    x = xpos;
    y = ypos;
    dir = direction;
  }

  void display(){

    stroke(255);
    strokeWeight(1);

    pushMatrix();
    translate(x,y);
    //scale(1.5);
    rotate(dir);
    line(-5,0,5,0);
    line(5,0,3,-3);
    line(5,0,3,3);
    popMatrix();
  }
}
class Ball {

  float x;
  float y;
  float mass;

  Ball() {
    x = width/2.; 
    y = height/2.;
    mass = random(6.,15.);
  }

  void display(){



    float move = directions [int(x / (width/flowCells))] [int(y / (height/flowCells))]; // find out which cell the ball is above
    float speed = (((mass - 2.) *-1.) + 40.1)*0.09  ;  

    x += speed * cos (move);  // the number being the distance
    y += speed * sin (move);

    mass -= 0.005; // how fast the particles shrink

    stroke(255);
    if (mass <= 0.){
      x = (width/2);
      y = (height/2);
      mass = random(2.,40.);
    }

    pushMatrix();
    translate(x,y);
    rotate(move);
    scale(mass/8);
    line(-5,0,5,0);
    line(5,0,3,-3);
    line(5,0,3,3);
    popMatrix(); 


    //send ball back to center if it goes off edge
    if (x <= 0 || x >= width || y <=0 || y >= height){
      x = (width/2);
      y = (height/2);
    }
  }
}


