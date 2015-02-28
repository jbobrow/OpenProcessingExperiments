
int division=100;
int nombreCercles=8;
float pas;
PVector[][]sommetsCercles=new PVector[100][100];
float[][]cosSelonDivision=new float[100][100];
float[][]sinSelonDivision=new float[100][100];
boolean moving = false;

void setup() {
  size(400,400);
  pas = (width/2)/nombreCercles;
  smooth();
  preCalculate();
  updatePoints();
  noFill();
  stroke(0,100);
  strokeWeight(0.05);
}

void draw() {
  background(255);
  updatePoints();
  for(int i=0; i<nombreCercles; i++){
    beginShape();
    for (int j=0; j<division; j++) {
      vertex(sommetsCercles[i][j].x,sommetsCercles[i][j].y);
      if(i<nombreCercles-1){
        line(sommetsCercles[i][j].x,sommetsCercles[i][j].y,
             sommetsCercles[(i+1)%nombreCercles][j].x,sommetsCercles[(i+1)%nombreCercles][j].y);
      }
    }
    endShape(CLOSE);
  }
  println(frameRate);
}

void updatePoints() {
  if(!moving){randomSeed(0);}
  for(int i=0; i<nombreCercles; i++){
    for(int j=0; j<division; j++){
      sommetsCercles[i][j]=new PVector(cosSelonDivision[i][j]+random(-mouseX/40,mouseX/40),
                                       sinSelonDivision[i][j]+random(-mouseY/40,mouseY/40));
    }
  }
}

void preCalculate(){
  for (int i=0; i<nombreCercles; i++) {
    for (int j=0; j<division; j++) {
      float angle = j*(TWO_PI/division);
      cosSelonDivision[i][j] = (width/2)+(pas+pas*i)*cos(angle);
      sinSelonDivision[i][j] = (height/2)+(pas+pas*i)*sin(angle);
    }
  }
}

void keyPressed() {
  if(key=='q'&&division>3){division--;setup();}
  if(key=='w'&&division<100){division++;setup();}
  if(key=='a'&&nombreCercles>2){nombreCercles--;setup();}
  if(key=='s'&&nombreCercles<100){nombreCercles++;setup();}
  if(key==' '){moving=!moving;}
}

