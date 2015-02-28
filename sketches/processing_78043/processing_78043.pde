
String [] data;
String [] smthn;
Float [] shortMem;
Float [] longMem;
Float [] intUsg;
PFont font;
void setup()
{
  size (800, 600);
  background(220);
  stroke(0);
  font = loadFont("AgencyFB-Reg-48.vlw");
  data = loadStrings("data1.csv");
  smthn = new String[data.length];
  shortMem = new Float[data.length];
  longMem = new Float[data.length];
  intUsg = new Float[data.length];
  

  /*for (int i=0;i<data.length;i++)
   {
   smthn = split(data[i], ",");
   //println(smthn[0]);
   //text(smthn[0], 20, i*10);
   
   }*/
}

void draw()
{
  stroke(0);
  line (30, 580, 780, 580);
  //line (550, 750, 570, 780);
  //line (570, 780, );
  line (700, 20, 700, 100);
  line (700, 100, 780, 100);
  fill(10,80);
  text("Internet usage", 350, 560);
  text("Short term memory - x radius", 630, 120);
  text("Long term memory - y radius", 530, 60);
  

  for (int i=0;i<data.length;i++)
  {
    smthn = split(data[i], ",");
    shortMem[i] = Float.parseFloat(smthn[0]);
    longMem[i] = Float.parseFloat(smthn[1]);
    intUsg[i] = Float.parseFloat(smthn[2]);
    float x = 100/shortMem[i];
    float y = 100/longMem[i];
    float r = 100/intUsg[i];
    //println(smthn[0]);
    
    fill(0,150,200,5);
    ellipse(r, 300, x, y);
  }
}


