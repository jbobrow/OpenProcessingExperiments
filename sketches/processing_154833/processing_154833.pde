
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/59371*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
import java.util.LinkedList;

float[][] xField, yField;
float[][] DxField, DyField;
int N = 1000;
LinkedList<Particle> parts = new LinkedList<Particle>();
boolean showField = false;

// physics constants
float damping = 0.95;
float contraction = 0.0003;
float repulsion = 0.015;
float beta = 0.2;          // diffusion factor and time step together. set too big for numerical instability fun times 

// width and height of the flow arrays
int fWidth = 50;
int fHeight = 50;


void setup() {
  size(400, 400);
  xField = new float[fWidth][fHeight];
  yField = new float[fWidth][fHeight];
  DxField = new float[fWidth][fHeight];
  DyField = new float[fWidth][fHeight];
  for (int i = 0; i<N; i++) {
    parts.add(new Particle(random(height), random(width)));
  }
  frameRate(30);
  smooth();
  colorMode(HSB,255,255,255,255);
  background(0);
}
void force(    int numPoints, float X,float Y,float pX, float pY,float strengt){

    for (int i = 0; i <= numPoints; i++) {
      float x = ((float) i)/numPoints * X + (1 - ((float) i)/numPoints) * pX;
      float y = ((float) i)/numPoints * Y + (1 - ((float) i)/numPoints) * pY;
      setField(x, y, xField, (constrain((X-pX)/10,-10,10))*strengt);
      setField(x, y, yField, (constrain((Y-pY)/10,-10,10))*strengt);
    }

}
void draw() {
  fill(0,70);
  rect(0,0,width,height);
  
  if(showField){
    drawField();
  }

  if (mousePressed) {
    // update the fields at a number of points between mouse and pmouse
force(5,mouseX,mouseY,pmouseX,pmouseY,1f);
  }
  


  ListIterator<Particle> it = parts.listIterator();
  while (it.hasNext ()) {
    Particle p = it.next();

    p.vx += (width/2-p.x)*contraction;
    p.vy += (height/2-p.y)*contraction;

    // iterate over the particles which the current particle has not interacted with yet
    ListIterator<Particle> forward = parts.listIterator(it.nextIndex());
    while (forward.hasNext ()) {
      Particle np = forward.next();
      float p2npx = np.x-p.x;
      float p2npy = np.y-p.y;
      float sqdist = p2npx*p2npx + p2npy*p2npy;
      
      // this sketch easily gets overlapping particles => divide by zero :(
      // add a small protection constant to prevent this
      sqdist += 0.001;

      //apply repulsive forces
      p.vx -= p2npx/sqdist * repulsion;
      np.vx+= p2npx/sqdist * repulsion;
      p.vy -= p2npy/sqdist * repulsion;
      np.vy+= p2npy/sqdist * repulsion;
    }

    // add the flow field to the particle
    p.vx += getField(p.x, p.y, xField);
    p.vy += getField(p.x, p.y, yField);
    p.update();
  }

  for (Particle p : parts) {
    noStroke();    
    p.draw();
  }

  diffuseField();
}

void diffuseField() {
  // apply laplace kernel and save in DxField (do not bother calculating at boundary)
  for (int i = 1; i < fWidth-1; i++) {
    for (int j = 1; j < fHeight-1; j++) {
      DxField[i][j] = xField[i+1][j] +
                      xField[i-1][j] +
                      xField[i][j+1] +
                      xField[i][j-1] -
                      xField[i][j]*4;
                      
      DyField[i][j] = yField[i+1][j] +
                      yField[i-1][j] +
                      yField[i][j+1] +
                      yField[i][j-1] -
                      yField[i][j]*4;
    }
  }
  //update flow fields at interior points only
  for (int i = 1; i < fWidth-1; i++) {
    for (int j = 1; j < fHeight-1; j++) {
      xField[i][j] += DxField[i][j]*beta;
      yField[i][j] += DyField[i][j]*beta;
    }
  }
}

// convert x,y position to i,j indices for the field arrays
float getField(float x, float y, float[][] field) {
  int i = (int) (x * ((float) fWidth)/width);
  int j = (int) (y * ((float) fHeight)/height);
  j = max(0, min(fHeight-1, j));
  i = max(0, min(fWidth-1, i));
  return field[i][j];
}

void setField(float x, float y, float[][] field, float val) {
  int i = (int) (x * ((float) fWidth)/width);
  int j = (int) (y * ((float) fHeight)/height);
  // do not alter the flow at boundary points
  j = max(1, min(fHeight-2, j));
  i = max(1, min(fWidth-2, i));
  field[i][j] = (field[i][j]+val)*.95f;
}

void keyReleased() {
  if (key == 's') {
    showField = !showField;
  }
}

void drawField(){
   for (int i = 0; i < fWidth; i++) {
    for (int j = 0; j < fHeight; j++) {
      noStroke();
      fill((atan2(yField[i][j],xField[i][j])+PI)/PI/2*255
            ,255,
            sqrt(yField[i][j]*yField[i][j] + xField[i][j]*xField[i][j])*1000);
      rect(i*400/50, j*400/50, 400/50, 400/50);
    }
  } 
}

