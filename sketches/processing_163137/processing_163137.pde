
//Variables. A box/memory that will contain a nummer, 
//which toyu can refer to in the code.

float lineA;
float lineB;
float lineC;
float lineD;
float lineE;
float lineF;
float lineG;
float lineH;



int count = 0;


//Static mode. Is read once by computer
void setup() {
  size(600, 600, P3D);

  strokeWeight(2); 
  stroke(255);
  fill(0);
  rect(0,0,width,height);
}

//Active mode. Is being read all the time. Loops forever.
void draw() {

  
  translate(width/2, height/2);
  pushMatrix();
  for (int j= 0; j<10; j++) {
    
    rotate(radians(random(360)));

    for (int i= 0; i<10; i++) {
      rotate(radians(random(-15, 15)));

      //scale(0.4);
      strokeWeight(1); 
      stroke(255);
      line (lineA, lineB, lineC, lineD);
      line (lineC, lineD, lineE, lineF);
      line (lineE, lineF, lineG, lineH);
      line (lineG, lineH, lineA, lineB);
      //translate(0, -25);
    }
  }

  popMatrix();
  //for(int i= 0; i<20; i++);
  

  if (count<10) {
    lineA = random(width);
    lineB = random(height);
    lineC = random(width);
    lineD = random(height);
    lineE = random(width);
    lineF = random(height);
    lineG = random(width);
    lineH = random(height);

    
    count = count + 1;

  }
}

  

