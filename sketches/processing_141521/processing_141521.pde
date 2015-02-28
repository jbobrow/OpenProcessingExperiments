
ArrayList<Node> allNodes = new ArrayList<Node>();
int TOT;
float INC;
float SCALEFACTOR = 35;
int THRESHOLD = 998;
String K="1";
String LV="2";
String P="1";
String Q= "1188";
boolean PAUSE=false;
int FRAMERATE=60;
float RADIUS=200;
PFont f = createFont("Arial",12,true);

void keyPressed()
{  
PAUSE = !PAUSE;  
if (PAUSE)    
  noLoop();  
else    
  loop();
}

float edgeBrightness(float connectionLevel)
{
  float scale = (999.0-THRESHOLD)/160;
float s = (connectionLevel - THRESHOLD)/scale+10;
return s;
}

float impToSize(float imp, float scaleMax, float scaleMin)
{
float scale = (scaleMax-scaleMin)/SCALEFACTOR;
float s = (imp-scaleMin)/scale+5;
return s;
}

boolean mouseOverCircle(float x, float y, float diameter) 
{  
  return (dist(mouseX, mouseY, x, y) <= (diameter*0.5+2));
}

class Neighbor
{
Node mNode;
int connWeight;
Neighbor(Node node)
{
mNode = node;
connWeight = 200;
}

Neighbor(Node node, int conn)
{
mNode = node;
connWeight = conn;
}
}

class Node
{
int mId;
String mName;
float mImportance;
float mX;
float mY;
//float mZ;
float mScore;   // this is the size of the node
float mColor;
PVector mForce;
ArrayList<Neighbor> neighbors = new ArrayList<Neighbor>();
int red = 0;
//ArrayList<Node> neighbors = new ArrayList<Node>();
Node(int i)
{
mId = i;
mX = random(15,680);
mY = random(15,680);
//mZ = 0;
mScore = 15;
mForce = new PVector(0,0);
mName = "";
mImportance=0.01;
mColor = 0;
}
}
/**************************************************************
***************************************************************
***************************************************************/
void setup()
{
size(750,750);
background (0);
frameRate(FRAMERATE);
String[] lines = loadStrings("order"+K+"_lv"+LV+"_best"+P+"_path"+Q+".txt");
String[] lines1 = loadStrings("pname"+K+"_lv"+LV+"_best"+P+"_path"+Q+".txt");
int[] num0 = int(split(lines[lines.length-1],' '));
int[] num1 = int(split(lines[0],' '));
int start = num1[0];
float[] num2 = float(split(lines1[lines1.length-1], ' '));
float[] num3 = float(split(lines1[0], ' '));
float MIN = num2[1];
float MAX = num3[1];
TOT = num0[0];
INC = 2*PI/TOT;
if (TOT <=10)
RADIUS = 120;
if (TOT >=30)
RADIUS = 240;
if (TOT >=40)
RADIUS = 280;
if (TOT >=50)
{
  SCALEFACTOR = 20; 
  RADIUS = 300;
}
if (TOT >=60)
{
  SCALEFACTOR = 16; 
  RADIUS = 321;
}
if (TOT >=88)
{
  SCALEFACTOR = 6; 
  RADIUS = 340;
}
for (int k=start; k<=TOT; k++)
{
allNodes.add(new Node(k));
Node curr = allNodes.get(k-1);
String[] name = split(lines1[k-1],' ');
int[] ifRed = int(split(lines1[k-1],' '));
float[] imp = float(split(lines1[k-1],' '));
curr.mName = name[0];
curr.red = ifRed[2];
curr.mImportance = imp[1];
curr.mScore = impToSize(imp[1], MAX, MIN);   // compute the size of nodes;
curr.mX = (width/2)+RADIUS*cos((3*PI/2)+((k-1)*INC));
curr.mY = (height/2)+RADIUS*sin((3*PI/2)+((k-1)*INC));
curr.mColor += k*255/TOT;
}

for (int i=0; i<lines.length; i++)
{
int[] num = int(split(lines[i],' '));
if (num[1] > TOT)
  {
    TOT = num[1];
    allNodes.add(new Node(num[1]));
  }
Node temp0 = allNodes.get(num[0]-1);    // because the node's id starts at 1, index is off by 1;
Node temp1 = allNodes.get(num[1]-1);
temp0.neighbors.add(new Neighbor(temp1, num[2]));
}
println(allNodes.size());
}

void draw()
{
background (0);
for (int i=0; i < allNodes.size(); i++)
{
  float ha=1;
  float ha2=10;
  Node temp = allNodes.get(i);
  if (mouseOverCircle(temp.mX, temp.mY, temp.mScore)){
    ha = 3;
    ha2 = 20;
   }
    temp.mScore *=ha;
    noStroke();
    if (temp.red == 1)
      fill(255,0,0);
    else
      fill(0, temp.mColor, 255);
    ellipse(temp.mX, temp.mY, temp.mScore, temp.mScore);
    temp.mScore /= ha;
    textFont(f,ha2);
    fill(255,255,0);
    float setX = width/2+(RADIUS+0.6*temp.mScore)*cos(3*PI/2+i*INC);
    float setY = height/2+(RADIUS+0.6*temp.mScore)*sin(3*PI/2+i*INC);
    
    if (i == 0)
      textAlign(CENTER, BOTTOM);
    else if (i == TOT/2 || i == TOT/2 + 1 || i == TOT/2 - 1)
      textAlign(CENTER, TOP);
    else if (i < TOT/2) 
      textAlign(LEFT);
    else
      textAlign(RIGHT);
    if (mouseOverCircle(temp.mX, temp.mY, temp.mScore) || (temp.red==1))
      text(temp.mName, setX, setY);
    for (int j=0; j<temp.neighbors.size(); j++){
      Neighbor nei = temp.neighbors.get(j);
      Node temp2 = nei.mNode;
      float e = edgeBrightness(nei.connWeight);
      //float e2=(nei.connWeight-900)/0.7071+30;//(nei.connWeight-900)/0.4605+40;//(nei.connWeight-700)/1.391+40;//(nei.connWeight-200)/3.716+40;
      stroke(255, e);
      line(temp.mX, temp.mY, temp2.mX, temp2.mY);
    }
}
}


