
// spiral phyllotaxis
// mitchell whitelaw

// based on an algorithm from Douady and Couder (1995) "Phyllotaxis as a Dynamical Self Organizing Process 
// Part I: The Spiral Modes Resulting from Time-Periodic Iterations" - http://www.math.ntnu.no/~jarlet/Douady96.pdf

float growthrate = 0.2;
float baseradius = 40; // radius of growth ring
float maxradius = 250; // radius limit
int numBases = 40;
int maxPrimordia = 200;
float inhibitionDecay = 0.01;
float iThresh = 0.1;

ArrayList Primordia = new ArrayList(maxPrimordia);
Base[] Bases = new Base[numBases];

void setup(){
  size(500,500);
  background(255);
  makeBases();
  Primordium firstP = new Primordium(baseradius,random(TWO_PI));
  Primordia.add(firstP);
}

void draw(){
  frameRate(30);
  //smooth();
  noStroke();
  fill(255,40);
  rect(0,0,width,height);
  translate(width/2,height/2);
  //background(255);

  stroke(0,10);
  noFill();
  for (int p=0; p<Primordia.size(); p++){
    Primordium thisP = (Primordium) Primordia.get(p);
    thisP.grow();
    thisP.drawP();
  }

  for (int b=0;b<numBases;b++){
    Bases[b].doInhibition();
  }

  float minimum = 100;
  int whichB = 0;
  for (int c=0; c<numBases;c++){  
    if (Bases[c].inhibition < minimum){
      minimum = Bases[c].inhibition;
      whichB = c;  
    }

  }
  if (minimum < iThresh){ 
    //println(minimum + " " + whichB); 
    Primordium newP = new Primordium(baseradius,whichB*(TWO_PI/float(numBases)));
    Primordia.add(newP);
    //println("spawned");
  }
}


void makeBases(){
  for (int b=0; b<numBases; b++){
    Bases[b] = new Base((TWO_PI*b)/numBases);
  }
}

class Base{

  float radius;
  float angle;
  float inhibition;
  float xpos;
  float ypos;

  Base(float angle_in){
    radius = baseradius;
    angle = angle_in;
    inhibition = 0;
    xpos = radius*cos(angle);
    ypos = radius*sin(angle);
  }

  void doInhibition(){ // calculate the inhibition at this point
    inhibition = 0;
    for (int p=0; p<Primordia.size(); p++){
      Primordium thisP = (Primordium) Primordia.get(p);
      float thatx = thisP.radius*cos(thisP.angle);
      float thaty = thisP.radius*sin(thisP.angle);
      float distance = sqrt(sq(xpos-thatx)+sq(ypos-thaty));
      inhibition += (1/distance)*pow(2.7182818,thisP.age*-inhibitionDecay);
      //println(log(distance*inhibitionDecay*-1));
    }
  }
}


class Primordium{

  float radius;
  float angle;
  int age;

  Primordium(float startradius, float angle_in){
    radius = startradius;
    angle = angle_in;
    age=0;
    Primordia.add(this);
  }

  void grow(){
    radius += growthrate;
    if (radius > maxradius) Primordia.remove(this); // kill if it's exceeded the radius
    age++;
  }

  void drawP(){
    float xpos = radius*cos(angle);
    float ypos = radius*sin(angle);
    stroke(0,max(0,40-(0.2*radius)));
    ellipse(xpos,ypos,age*0.5,age*0.5);//radius*0.5,radius*0.5);
  }

}

void keyPressed(){
  if (keyCode == UP){
    iThresh += 0.001;
    println("threshold: " + iThresh);
  }
  if (keyCode == DOWN){
    iThresh -= 0.001;
    println("threshold: " + iThresh);
  }
    if (keyCode == LEFT){
    growthrate -= 0.01;
    println("growthrate: " + growthrate);
  }
  if (keyCode == RIGHT){
    growthrate += 0.01;
    println("growthrate: " + growthrate);
  }
}

