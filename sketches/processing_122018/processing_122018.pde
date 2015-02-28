
//Array for Stat Types
String [] StatType = {"Attacks","Opposition Error","Blocks","Serves"};

//Arrays for Stat Data
int [] Team1Set1Stats = {6,9,2,2};
int [] Team2Set1Stats = {9,9,3,4};
int [] Team1Set2Stats = {8,8,1,4};
int [] Team2Set2Stats = {9,12,1,2};
int [] Team1Set3Stats = {8,8,3,2};
int [] Team2Set3Stats = {13,9,0,3};

int x=20; //Start X position of the bars
int y=580; //Start Y position of the bars
float h=400; //Height of the bars
int curve=5; //Radius of curve on bars

void setup()
{
  size(800,600);
  PImage img;
  img = loadImage("volleyball2.jpg");
  background(img);
  header();
  
  menu();
}

void draw()
{
  
}

void keyPressed()
{
if(key=='1')
{
  screenReset();
  DrawSet1();
  set1Score();
  barLabels();
  set1Labels();
}
else if(key=='2')
{
  screenReset();
  DrawSet2();
  set2Score();
  barLabels();
  set2Labels();
}
else if(key=='3')
{
  screenReset();
  DrawSet3();
  set3Score();
  barLabels();
  set3Labels();
}
else if (key=='o')
{
  screenReset();
  calcTotals();
  finalScore();
}
else if (key=='p')
{
  screenReset();
  roster();
}
else if (key=='m')
{
  screenReset();
  menu();
}

}


//Method to draw set 1 stats
void DrawSet1()
{
  int x=20; //x position of Team1 bar
  int x2=60;//x position of Team2 bar

//draws the bars for set 1
for(int i=0; i<StatType.length; i++) //Team 1
{
  h=map(Team1Set1Stats[i], 0,25,0,height - 170);
  fill(255,0,0);
  rect(x,600,40,-h,curve);
  x=x+140;
}

for(int i=0; i<StatType.length; i++) //Team 2
{
 h=map(Team2Set1Stats[i],0,25,0,height -170);
 fill(0);
 rect(x2,600,40,-h,curve);
 x2=x2+140;
}
}

//Method to draw set 2 stats
void DrawSet2()
{
int x=20; //x position of Team1 bar
int x2=60;//x position of Team2 bar

//draws the bars for set 2
for(int i=0; i<StatType.length; i++) //Team 1
{
  h=map(Team1Set2Stats[i], 0,25,0,height - 50);
  fill(255,0,0);
  rect(x,600,40,-h,curve);
  x=x+140;
}

for(int i=0; i<StatType.length; i++) //Team 2
{
 h=map(Team2Set2Stats[i],0,25,0,height -50);
 fill(0);
 rect(x2,600,40,-h,curve);
 x2=x2+140;
}
}

//Method to Draw set 3 bars
void DrawSet3()
{
int x=20; //x position of Team1 bar
int x2=60;//x position of Team2 bar

//draws bars for set 3
for(int i=0; i<StatType.length; i++) //Team 1
{
  h=map(Team1Set3Stats[i], 0,25,0,height - 50);
  fill(255,0,0);
  rect(x,600,40,-h,curve);
  x=x+140;
}

for(int i=0; i<StatType.length; i++) //Team 2
{
 h=map(Team2Set3Stats[i],0,25,0,height -50);
 fill(0);
 rect(x2,600,40,-h,curve);
 x2=x2+140;
}
}

//Calculates set 1 score
void set1Score()
{
  int total1=0;
  int total2=0;
  int i=0;
  
  for(i=0; i<Team1Set1Stats.length; i++)
  {
    total1=total1+=Team1Set1Stats[i];
    total2=total2+=Team2Set1Stats[i];
  }
  println("Dundee Uni " + total1 + "-" + total2 + " University of Edinburgh");
  
  PFont mono;
  mono=loadFont("SetHeader.vlw");
  textFont(mono);
  fill(255,0,0);
  text("Set 1: Dundee University",34,60);
  fill(0);
  text(total1 + "-" + total2 + " University of Edinburgh",193,60);
}

//Calculates set 2 score
void set2Score()
{
  int total3=0;
  int total4=0;
  int i=0;
  
  for(i=0; i<Team1Set2Stats.length; i++)
  {
    total3=total3+=Team1Set2Stats[i];
    total4=total4+=Team2Set2Stats[i];
  }
  println("Dundee University " + total3 + "-" + total4 + " University of Edinburgh");

  PFont mono;
  mono=loadFont("SetHeader.vlw");
  textFont(mono);
  fill(255,0,0);
  text("Set 2: Dundee University",34,60);
  fill(0);
  text(total3 + "-" + total4 + " University of Edinburgh",193,60);
  
}

//Calculates set 3 score
void set3Score()
{
  int total5=0;
  int total6=0;
  int i=0;
  
  for(i=0; i<Team1Set2Stats.length; i++)
  {
    total5=total5+=Team1Set3Stats[i];
    total6=total6+=Team2Set3Stats[i];
  }
  println("Dundee University " + total5 + "-" + total6 + " University of Edinburgh");
  
 PFont mono;
  mono=loadFont("SetHeader.vlw");
  textFont(mono);
  fill(255,0,0);
  text("Set 3: Dundee University",34,60);
  fill(0);
  text(total5 + "-" + total6 + " University of Edinburgh",193,60);
  
}

void header()
{
  //Header for stat sheet
  String header="Dundee University vs University of Edinburgh";
  fill(0);
  PFont mono;
  mono=loadFont("header.vlw");
  textFont(mono);
  text(header,30,40);
}

//Labels for the bars
void barLabels()
{
  int i=0;
  fill(0);
  PFont mono;
  mono=loadFont("labels.vlw");
  textFont(mono);
  text("A",105,597);
  text("OE",245,597);
  text("B",385,597);
  text("S",525,597);
}

void screenReset()
{
  size(800,600);
  PImage img;
  img = loadImage("volleyball2.jpg");
  background(img);
  
  String header="Dundee University vs University of Edinburgh";
  fill(0);
  PFont mono;
  mono=loadFont("header.vlw");
  textFont(mono);
  text(header,30,40);
}

//Calculates and displays the stat totals
void calcTotals()
{
  int Team1Attack=0;
  int Team2Attack=0;
  int Team1OE=0;
  int Team2OE=0;
  int Team1Blocks=0;
  int Team2Blocks=0;
  int Team1Serves=0;
  int Team2Serves=0;
  
  Team1Attack=Team1Set1Stats[0]+Team1Set2Stats[0]+Team1Set3Stats[0];
  Team2Attack=Team2Set1Stats[0]+Team2Set2Stats[0]+Team2Set3Stats[0];
  Team1OE=Team1Set1Stats[1]+Team1Set2Stats[1]+Team1Set3Stats[1];
  Team2OE=Team2Set1Stats[1]+Team2Set2Stats[1]+Team2Set3Stats[1];
  Team1Blocks=Team1Set1Stats[2]+Team1Set2Stats[2]+Team1Set3Stats[2];
  Team2Blocks=Team2Set1Stats[2]+Team2Set2Stats[2]+Team2Set3Stats[2];
  Team1Serves=Team1Set1Stats[3]+Team1Set2Stats[3]+Team1Set3Stats[3];
  Team2Serves=Team2Set1Stats[3]+Team2Set2Stats[3]+Team2Set3Stats[3];
  
  //Team 1 stat totals
  fill(255,0,0);
  PFont mono;
  mono=loadFont("overview.vlw");
  textFont(mono);
  text("Dundee University",10,200);
  fill(0);
  text("Total:",10,225);
  text("Attacks - " + Team1Attack,10, 250);
  text("Opposition Error - " + Team1OE,10,275);
  text("Blocks - " + Team1Blocks,10,300);
  text("Serves - " + Team1Serves,10,325);
  
  //Team 2 stat totals
  fill(0,100,0);
  text("University of Edinburgh",250,200);
  fill(0);
  text("Total:",250,225);
  text("Attacks - " + Team2Attack,250, 250);
  text("Opposition Error - " + Team2OE,250,275);
  text("Blocks - " + Team2Blocks,250,300);
  text("Serves - " + Team2Serves,250,325);
  
  
}
//Stat labels for set 1
void set1Labels()
{
  int lblx=30;
  int lblx2=70;
  int i=0;
  
  for(i=0; i<Team1Set1Stats.length; i++)
{
  text(Team1Set1Stats[i],lblx,597);
  lblx=lblx+140;
}

for(i=0; i<Team2Set1Stats.length; i++)
{
  fill(255);
  text(Team2Set1Stats[i],lblx2,597);
  lblx2=lblx2+140;
}
}

//Stat labels for set 2
void set2Labels()
{
  int lblx=30;
  int lblx2=70;
  int i=0;
  
  for(i=0; i<Team1Set2Stats.length; i++)
{
  text(Team1Set2Stats[i],lblx,597);
  lblx=lblx+140;
}

for(i=0; i<Team2Set2Stats.length; i++)
{
  fill(255);
  text(Team2Set2Stats[i],lblx2,597);
  lblx2=lblx2+140;
}
}

//Stat labels for set 3
void set3Labels()
{
  int lblx=30;
  int lblx2=70;
  int i=0;
  
  for(i=0; i<Team1Set3Stats.length; i++)
{
  text(Team1Set3Stats[i],lblx,597);
  lblx=lblx+140;
}

for(i=0; i<Team2Set3Stats.length; i++)
{
  fill(255);
  text(Team2Set3Stats[i],lblx2,597);
  lblx2=lblx2+140;
}
}

void roster()
{
  fill(255,0,0);
  PFont mono;
  mono=loadFont("overview.vlw");
  textFont(mono);
  text("Dundee University",10,200);
  fill(0);
  text("Players:",10,225);
  text("E.Velten(C) - Outside",10,255);
  text("H.Rooney - Middle",10,280);
  text("L.Brownlow - Setter",10,305);
  text("M.Luce - Opposite",10,330);
  text("L.Turkoz - Middle",10,355);
  text("G.Capitani - Libero",10,380);
  text("J.Currie - Outside",10,405);
  
  fill(0,100,0);
  text("University of Edinburgh",240,200);
  fill(0);
  text("Players:",240,225);
  text("B.Bunny(C) - Setter",240,255);
  text("M.Scofield - Outside",240,280);
  text("C.Bing - Middle",240,305);
  text("W.White - Libero",240,330);
  text("L.Jenkins - Middle",240,355);
  text("K.Evergreen - Opposite",240,380);
  text("C.Banks - Outside",240,405);
}

//Displays the menu instructions
void menu()
{
  
  fill(96);
  PFont mono;
  mono=loadFont("menu.vlw");
  PFont mono1;
  mono1=loadFont("menuNum.vlw");
  
  //Set 1
  textFont(mono);
  text("Press",30,100);
  textFont(mono1);
  text("1",79,100);
  textFont(mono);
  text(" to Display Set 1",95,100);
  
  //Set 2
  textFont(mono);
  text("Press",30,130);
  textFont(mono1);
  text("2",79,130);
  textFont(mono);
  text(" to Display Set 2",95,130);
  
  //Set 3
  textFont(mono);
  text("Press",30,160);
  textFont(mono1);
  text("3",79,160);
  textFont(mono);
  text(" to Display Set 3",95,160);
  
  //Overview
  textFont(mono);
  text("Press",30,190);
  textFont(mono1);
  text("O",77,190);
  textFont(mono);
  text(" to Display Match Overview",95,190);
  
  //Player roster
  textFont(mono);
  text("Press",30,220);
  textFont(mono1);
  text("P",79,220);
  textFont(mono);
  text(" to Display Match Overview",95,220);
  
  //Menu
  textFont(mono);
  text("Press",30,260);
  textFont(mono1);
  text("M",74,260);
  textFont(mono);
  text(" to Return to Menu",95,260);
}

void finalScore()
{
  PFont mono;
  mono=loadFont("final.vlw");
  textFont(mono);
  text("Final Score:",10,470);
  text("Dundee University 0-3 University of Edinburgh",10,500);
}


  
  






