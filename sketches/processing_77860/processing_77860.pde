
BufferedReader reader;
PFont font;
/* @pjs transparent=true; */
float s;
int[] id;//This represents the ID of the individual
int[] q;//This represents the QUESTION
int[] age;//This represents the AGE of the individual
float[] dis;//This represents the DISORIENTATION of the individual
float[] proc;//This represents the PROCESSING speed of the individual

String stringC = ("Circles - Individual");

void setup() {
  String data[] = loadStrings("data.csv");
  int qIndex=0;
  int idIndex=0;
  int ageIndex=0;
  int disIndex=0;
  int procIndex=0;

  q = new int[data.length];
  id = new int[data.length];
  age = new int[data.length];
  dis = new float[data.length];
  proc = new float[data.length];

  for (int j=0; j<339; j++) {

    String[] bit = split(data[j], ",");
    q[qIndex++] = int(bit[0]);
    id[idIndex++] = int(bit[1]);
    proc[procIndex++] = float(bit[2]);
    age[ageIndex++] = int(bit[3]);
    dis[disIndex++] = float(bit[4]);
  }

  size(1200, 650, JAVA2D);
  font = loadFont("Monospaced.plain-48.vlw");
  //background(100);
  noLoop();
}

void draw() { 
  smooth(); 
  background(0,0,0,0);
  for (int i=0;i<300;i++) {
    float q1 = map(q[i], 1, 30, 50, width);//THE QUESTION, WHICH LIES ON THE X-Axis
    float id1 = map(id[i], 0, 10, 0, 255 );//THIS DETERMINES THE COLOUR OF THE INDIVIDUAL
    float proc1 = map(proc[i], 0.333333333, 0.604166667, 600, 10);//THE PROCESSING SPEED OF THE INDIVIDUAL SET BY THE Y-Axis
    float age1 = map(age[i], 18, 89, 20, 80);//THIS DETERMINES THE SIZE OF THE CIRCLE
    float dis1 = map(dis[i], 0.25, 1, 0.1, 200);//THIS IS THE OPACITY

    //Colours:   
    fill(id1, (random(100, 255)), (random(1, 255)), dis1);
    //Circles
    ellipse(q1, proc1, age1, age1);

    
  }
labels();
}

//TEXT
void labels() {
  smooth();
  noStroke();
  fill(200);
  rect(850,520,400,300);
  fill(100);
  text(stringC,860,530);
}


