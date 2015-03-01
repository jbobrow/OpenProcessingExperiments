
/* 
 Original 144 Trapezes von Vera Molnar 
 http://dam.org/artists/phase-one/vera-molnar/artworks-bodies-of-work/144-trap-zes
 
 !!!SAVE AT LEAST 2 Settings ("f") AND RESTART TO LOAD SAVED SETTINGS!!!
 
 SYNTAX
 
 1. randomSeedNum 
 2. randomnessX 
 3. margin 
 4. padding 
 5. rows 
 6. columns
 
 
 KEYS
 
 l = nächste settings
 k = vorherige settings
 f = save current settings
 SPACE = randomize values
 
 + = randomSeedNum++;
 - = randomSeedNum--;
 m = randomnessX++;
 n = randomnessX--;
 w = margin++;
 s = margin--;
 a = padding++;
 d = padding--;
 p = rows++;
 o = rows--;
 i = columns++;
 u = columns--;
 */

import java.io.BufferedWriter;
import java.io.FileWriter;

String output = "out.txt";
ArrayList sets = new ArrayList();
String lines[];

float margin = 70;
float padding = 10;
int rows = 12;
int columns = 12;
int iid = 0;

float randomnessX = 20;

int randomSeedNum = 0;

void setup ()
{
  size (700, 700);
  smooth();
  lines= loadStrings("out.txt");
}

void draw ()
{
  background (247);

  randomSeed (randomSeedNum);

  float xSteps = ( width - 2*margin - (columns-1)*padding ) / columns;
  float ySteps = ( height - 2*margin - (rows-1)*padding ) / rows;

  float x = margin;
  float y = margin;
  fill(0);
  if(lines.length>0){
  text((iid+1)+"/"+lines.length, 15, 25);
  }else{
    text("no saved settings. press 'f' to save current settings and reload afterwards",15,25);
  }
  noFill();
  stroke (0, 200);

  while (y <= height-margin)
  {
    x = margin;

    while (x <= width-margin)
    {
      quad (
      x            + random (-randomnessX, randomnessX), y, 
      x + xSteps   + random (-randomnessX, randomnessX), y, 
      x + xSteps   + random (-randomnessX, randomnessX), y + ySteps, 
      x            + random (-randomnessX, randomnessX), y + ySteps
        );

      x = x + xSteps + padding;
    }
    y = y + ySteps + padding;
  }
}

void keyPressed ()
{
  if (key == 'f') {
    appendTextToFile(output, "sets: "+randomSeedNum+", "+randomnessX+", "+margin+", "+padding+", "+rows+", "+columns);
    println("wrote new settings");
  }
  if (key == 'l') {
    println("number of sets:"+lines.length);
    if (iid < lines.length-1) {
      iid++;
      if (lines[iid].startsWith("sets:")) {
        float values[] = float(lines[iid].split(":")[1].split( ",")); //very short and ugly !
        sets.add( new set(values[0], values[1], values[2], values[3], values[4], values[5]) );
      }
    }
  }
  if (key == 'k') {
    if (iid>0) {
      iid--;
      if (lines[iid].startsWith("sets:")) {
        float values[] = float(lines[iid].split(":")[1].split( ",")); //very short and ugly !
        sets.add( new set(values[0], values[1], values[2], values[3], values[4], values[5]) );
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
    randomnessX = randomnessX+1;
  }

  if (key == 'n')
  {
    randomnessX = randomnessX-1;

    if (randomnessX < 0) 
    {
      randomnessX = 0;
    }
  }

  if (key == 'w')
  {
    margin = margin + 1;
  }

  if (key == 's')
  {
    margin = margin - 1;
  }

  if (key == 'a')
  {
    padding = padding + 1;
  }

  if (key == 'd')
  {
    padding = padding - 1;
  }

  if (key == 'p')
  {
    rows = rows +1;
  }

  if (key == 'o')
  {
    rows = rows -1;

    if (rows < 1)
    {
      rows = 1;
    }
  }

  if (key == 'i')
  {
    columns = columns +1;
  }

  if (key == 'u')
  {
    columns = columns -1;

    if (columns < 1)
    {
      columns = 1;
    }
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

void setRandomValues ()
{ 
  randomSeedNum  = int(random(0,100));
  randomnessX = int(random(0,100));
  margin = int(random(50,150));
  padding = int(random(50,150));
  rows = int(random(0,100));
  columns =  int(random(0,100));
}

class set {
  set(float rsn, float rnx, float m, float p, float r, float c) {
    println( " loaded new set on line "+iid);
    randomSeedNum  = int(rsn);
    randomnessX = rnx;
    margin = m;
    padding = p;
    rows = int(r);
    columns = int(c);
  }
}



