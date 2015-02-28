
boolean[][] nodes;
int sp=10;

int noderow;
String[] points;
char[] mayumi;
char[] other;
int count;
int times;
boolean clicked;

void setup() 
{

  frameRate(8);
  clicked=false;
  count=0;
  times=0;
  size(600, 600); 
  noStroke();
  rectMode(CORNER);
  noderow=600/sp;
  mayumi=new char[3];
  other=new char[9];
  points=loadStrings("mayumi.dat");


  String[] ot= {
    "\u21D6", "\u21D1", "\u21D7", "\u21D0", "\u22C6", "\u21D2", "\u21D9", "\u21D3","\u21D8"
  };
  for (int g=0;g<ot.length;g++) {
    other[g]=ot[g].toCharArray()[0];
  }

  char[] tmp= {
    '麻', '由', '美'
  };
  System.arraycopy(tmp, 0, mayumi, 0, 3);

  nodes=new boolean[noderow][noderow];




  for (int i=0;i<noderow;i++)
    for (int j=0;j<noderow;j++) {
      String[] str=split(points[i*noderow+j], "\t");
      int bool=Integer.valueOf(str[0]);

      nodes[i][j]=boolean(bool);
    }
}
void draw() 
{   

  background(0); 

  for (int i=0;i<noderow;i++)
    for (int j=0;j<noderow;j++) {
      if (nodes[i][j]) {
         char t;
        if(clicked){
        t=mayumi[int(random(3))];
        }
        else{
        t=mayumi[count];
        
        }
        fill(56, 65, 206);
        text(Character.toString(t), i*sp, j*sp+10);
      }
      else {
        fill(250, 250, 250);
         char t;
          int u;
        if(clicked){
          while(true){
            u=int(random(9));
        t=other[u];
             if(u!=4)
             break;
           }
        }
        else{
        int mousepos=mouseX/200+mouseY/200*3;
          t=other[mousepos];
        }
        text(Character.toString(t), i*sp, j*sp+10);
      }
    }
    if(!clicked){
      if(times==5){
     count+=1;
         count%=3;}
         times+=1;
         times%=6;
    }
}
void mouseClicked() {
  times=0;
count=0;
  clicked=!clicked;
}

