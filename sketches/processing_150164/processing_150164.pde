
/*
Quelle:
 Noisy Plates von Michael Roderfeld
 http://dianalange.tumblr.com/post/72549366477/dr-mitch-noisy-plates-generated-with
 bzw.
 http://www.mroderfeld.de/
 
 !!!SAVE AT LEAST 2 Settings ("f") AND RESTART TO LOAD SAVED SETTINGS!!!
 
 SYNTAX
 
 1. randomSeedNum 
 2. amplitude 
 3. timeSteps 
 
 
 KEYS
 
 l = nächste settings
 k = vorherige settings
 f = save current settings
 SPACE = randomize values
 
 + = randomSeedNum++;
 - = randomSeedNum--;
 m = amplitude++;
 n = amplitude--;
 c = timeSteps++;
 v = timeSteps--;

*/

import java.io.BufferedWriter;
import java.io.FileWriter;

String output = "out.txt";
ArrayList sets = new ArrayList();
String lines[];

int linesLength;
float amplitude = 30;
float timeSteps = 0.05;
int randomSeedNum = 0;
int iid = 0;

void setup ()
{
  size (700, 700);
  smooth();
  linesLength = int (width * 0.4);
  lines= loadStrings("out.txt");
}

void draw ()
{
  background (247);
  fill(0);
  if(lines.length>0){
  text((iid+1)+"/"+lines.length, 15, 25);
  }else{
    text("no saved settings. press 'f' to save current settings and reload afterwards",15,25);
  }

  randomSeed (randomSeedNum);

  translate (width/2, height/2);
  noFill();
  stroke (0, 180);

  rotateNoisyLines();
}

void setRandomValues ()
{
  randomSeedNum = frameCount;

  amplitude = random (10, 100);
  timeSteps = random (0.0005, 0.2);
}

void rotateNoisyLines ()
{
  float angleCount = 0;

  float angle = 0;

  while (angleCount < 360)
  {
    angle = random (1, 6);
    rotate (radians (angle));
    drawNoisyLine();
    angleCount = angleCount + angle;
  }
}

void drawNoisyLine ()
{
  int count = 0;
  float time = 0.0;
  float y = 0;

  beginShape();
  while (count < linesLength)
  {
    y = noise (time)*amplitude;
    vertex (count, y);

    time = time + timeSteps;
    count = count + 1;
  }
  endShape();
}

void keyPressed ()
{
  if (key == 'f') {
    appendTextToFile(output, "sets: "+randomSeedNum+", "+amplitude+", "+timeSteps);
    println("wrote new settings");
  }
  if (key == 'l') {
    //println("number of sets:"+lines.length);
    if (iid < lines.length-1) {
      iid++;
      if (lines[iid].startsWith("sets:")) {
        float values[] = float(lines[iid].split(":")[1].split( ",")); //very short and ugly !
        sets.add( new set(values[0], values[1], values[2]) );
      }
    }
  }
  if (key == 'k') {
    if (iid>0) {
      iid--;
      if (lines[iid].startsWith("sets:")) {
        float values[] = float(lines[iid].split(":")[1].split( ",")); //very short and ugly !
        sets.add( new set(values[0], values[1], values[2]) );
      }
    }
  }
  
  if (key == ' ') 
  {
    setRandomValues ();
  }
  
  if (key == '+') 
  {
    randomSeedNum = randomSeedNum + 1;
  }
  
  if (key == '-') 
  {
    randomSeedNum = randomSeedNum - 1;
  }
  
  if (key == 'm')
  {
   amplitude = amplitude + 1; 
  }
  if (key == 'n')
  {
   amplitude = amplitude - 1; 
  }
  
  if (key == 'c')
  {
    timeSteps = timeSteps + 0.002;
  }
  if (key == 'v')
  {
    timeSteps = timeSteps - 0.002;
  }
}

void appendTextToFile(String filename, String text) {
  File f = new File(dataPath(filename));
  if (!f.exists()) {
    createFile(f);
  }
  try {
    PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    out.println(text);
    out.close();
  }
  catch (IOException e) {
    e.printStackTrace();
  }
}

void createFile(File f) {
  File parentDir = f.getParentFile();
  try {
    parentDir.mkdirs(); 
    f.createNewFile();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
}    

class set {
  set(float rsn, float a, float ts) {
    println( "loaded set on line "+iid);
    randomSeedNum  = int(rsn);
    amplitude = a;
    timeSteps = ts;
  }
}



