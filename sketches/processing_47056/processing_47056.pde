
// Homework 13
// Copyright Kinnari Thakker 2011 Pittsburgh, 15224

// attached CSV file is downloaded from DATA.GOV
// Its edited to only show data for the discipline of Graphic Design in the United states (Total Employed, mean Salary, etc)



PImage bgimg, icon;

////for importing csv files into a 2d array ---- variables identified from found code
//by che-wei wang
String lines[];
String [][] csv;
boolean [] selState;
int csvWidth=0;

int AREA_NAME, TOT_EMP, A_MEAN, OCC_TITLE, COL_VAL, STATE; // data sets

int ColXPos; // data column Position
int selected;
int value;

int minSalary, maxSalary, salWidth, salHeight, ySalPos;

void setup()
{
  lines = loadStrings("graphicdes_salary.txt");  
  
  size(1000,1200);
  
  // Loading Images
  bgimg = loadImage("united-states-map-coloring-pages.png");
  icon = loadImage("icon.png");
  
  
  importCSV(); ////for importing csv files into a 2d array
                     //by che-wei wang
  
  
  // Typography varibles 
   
  
  //  Salary Meter Variables
  salWidth = 300;
  salHeight = 10;
  minSalary = 20000;
  maxSalary = 80000;
  
  ColXPos = width-400; // X position of Data column
  
  // Assigning csv-column value to dataset variables
  AREA_NAME = 2;
  TOT_EMP = 4;
  A_MEAN = 5;
  OCC_TITLE = 3;
  COL_VAL = 0;
  STATE = 1;
  
  //background(255);
  image(bgimg, 0, height/5);
  instructions();
 
}

void draw()
{
}

void mousePressed()
{
  int compValue;
  value = get(mouseX, mouseY);
  //println("color: " + get(mouseX, mouseY));
  println(value);
  for (int x=1; x < lines.length; x++)
  {
    //compare selected and state colours
    compValue = Integer.parseInt(csv[x][COL_VAL]); // to Convert String to an Int ---> http://processing.org/discourse/yabb/YaBB.cgi?board=Syntax;action=display;num=1041796247
    if (value == compValue)                        
    {
      println("matching colour");
      if (selState[x] == false)
      {
        loadData(x,value);
        selected++;
        selState[x] = true;
      }
    }      
  }
}


void importCSV()     //for importing csv files into a 2d array
                     //by che-wei wang
{

  //calculate max width of csv file
  for (int i=0; i < lines.length; i++) {
    String [] chars=split(lines[i],'\t');
    if (chars.length>csvWidth){
      csvWidth=chars.length;
    }
  }
  
  //create csv array based on # of rows and columns in csv file
  csv = new String [lines.length][csvWidth];
  //creat array for selected values
  selState = new boolean[lines.length];
  
  //parse values into 2d array
  for (int i=0; i < lines.length; i++) {
    String [] temp = new String [lines.length];
    temp= split(lines[i], '\t');
    for (int j=0; j < temp.length; j++){
    csv[i][j]=temp[j];
    selState[i] = false;
    }
  }
    
}
void instructions()
{
   fill(0);
   textSize(18);
   text("How much do Graphic Designers earn on an average?",width/12,height/8);
   textSize(15);
   text("(Click on the colored States to find out)",width/12,height/8+25);
   image(icon,width/12,height/8+45);
   text(" = 1000 designers",width/12+20,height/8+70);
   textSize(11);
   text("Data from 2010 (data.gov)", width/12,height*.9);
   
}


void loadData(int row, int col)
{

  int startY = 115*selected;
  int employed = Integer.parseInt(csv[row][TOT_EMP]);
  int salary = Integer.parseInt(csv[row][A_MEAN]);
  float salaryX;
  
  ySalPos = startY+85;
  employed = round(employed/1000);
  
  noStroke();
  fill(175);
  rect(ColXPos,ySalPos,salWidth,salHeight);
  salaryX = map(salary, minSalary, maxSalary, ColXPos, ColXPos+salWidth);
  fill(col);
  
  textSize(15);
  text(csv[row][STATE],ColXPos,startY+15);
  
  textSize(11);
  text(csv[row][AREA_NAME],ColXPos,startY+30);
  rect(ColXPos,ySalPos,(salaryX-ColXPos),salHeight);

  fill(0);
  text("$"+salary,salaryX,ySalPos);
  
  
  for (int i=0; i < employed; i++) {
    image(icon,ColXPos+(i*20),startY+40); /// image --- man icon. Each icon represents approximately 1000 Gdesigners
  }
    
  println("loading data: " + csv[row][AREA_NAME]);
}



