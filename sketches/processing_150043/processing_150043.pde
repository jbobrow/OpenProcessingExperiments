
import de.bezier.data.*;
XlsReader reader;
//672 lines
int row_size = 28;
int year_size = 23;
int select;
int yselect;
String[] myCountries = new String[row_size];
Float[][] myRecords = new Float[row_size][year_size];
float[][] sorted = new float[year_size][row_size];
String[][] sorted_cou = new String[year_size][row_size];
Float[] rec_sum = new Float [row_size];
Float[] rec_ann = new Float [year_size];

int mode;
boolean scatter;
boolean show;
boolean order;

void setup ()
{
  size(800, 600);
  background(255);
  textSize(16);
  select = 0;
  yselect = 0;
  mode = 0;
  scatter = false;
  show = false;

  reader = new XlsReader( this, "data.xls" );

  for (int i=0; i<row_size; i++)
  {
    myCountries[i] = reader.getString((i+1), 0);
    float sum = 0;
    for (int j=0; j<year_size; j++)
    {
      myRecords[i][j] = reader.getFloat((i+1), (j+1));
      sum += myRecords[i][j];
    }
    rec_sum[i] = sum;
  }

  for (int i=0; i<year_size; i++)
  {
    float ann = 0;
    for (int j=0; j<row_size; j++)
    { 
      ann += myRecords[j][i];
    }
    rec_ann[i] = ann;
  }

  for (int i=0; i<year_size; i++)
  {
    float[] r = new float[row_size];
    for (int j=0; j<row_size; j++)
    {
      r[j] = myRecords[j][i];
    }
    r = sort(r);
    sorted[i] = r;
  }

  sorting();
}

void draw()
{
  background(255);
  if (mode == 1)
  { 
    if (scatter == false)
    {
      gridbgYr();
      countryDisplay(select);
    }
    else
    {
      gridbgYr();
      countryDisplay2(select);
    }
    countrySelection(select);
    countryMouseOver(select);
  }
  else if (mode == 2)
  {
    if (scatter == false)
    {
      if (order == false)
      {
        gridbgCo();
        yearDisplay(yselect);
      }
      else
      {
        gridbgCo();
        yearDisplay2(yselect);
      }
    }
    else
    {
      gridbgCo();
      yearDisplay3(yselect);
    }
    yearSelection(yselect);
    yearMouseOver(yselect);
  }
  menu();
}

//bar chart
void countryDisplay(int sel)
{
  pushMatrix();
  translate(75, 50);
  //scale
  stroke(0);
  line(-25, 0, -25, 500);
  line(-25, 0, 0, 0);
  line(-25, 250, 0, 250);
  line(-25, 500, 0, 500);
  pushMatrix();
  rotate(PI/2);
  fill(0);
  text("0(UNIT: 1000TOE)", -5, 50);
  text("7500", 230, 50);
  text("15000", 475, 50); 
  popMatrix();
  for (int j=0; j<year_size; j++)
  {
    int year = int(map(j, 0, 22, 1990, 2012));
    //yearprint
    pushMatrix();
    translate(17.5, 0);
    rotate(3*PI/2);
    fill(0);
    text(year, 0, j*25); 
    popMatrix();
    //bar chart
    float conv_record = map(myRecords[sel][j], 0, 15000, 0, 500);
    fill(200 - j*5);
    rect(0 + j*25, 0, 25, conv_record);
  }
  popMatrix();
}
//scatter chart
void countryDisplay2(int sel)
{
  pushMatrix();
  translate(75, 50);

  //scale
  stroke(0);
  line(-25, 0, -25, 500);
  line(-25, 0, 575, 0);
  line(-25, 250, 0, 250);
  line(-25, 500, 0, 500);
  pushMatrix();
  rotate(PI/2);
  fill(0);
  text("0(UNIT: 1000TOE)", -5, 50);
  text("7500", 230, 50);
  text("15000", 475, 50); 
  popMatrix();

  for (int i=0; i<year_size; i++)
  {
    int year = int(map(i, 0, 22, 1990, 2012));
    //yearprint
    pushMatrix();
    translate(17.5, 0);
    rotate(3*PI/2);
    fill(0);
    text(year, 0, i*25); 
    popMatrix();
    //line chart
    float conv_record = map(myRecords[sel][i], 0, 15000, 0, 500);
    fill(200 - i*5);
    ellipseMode(CENTER);
    ellipse(i*25+12.5, conv_record+12.5, 20, 20);
    if(i < year_size - 1){
    float conv_record2 = map(myRecords[sel][i+1], 0, 15000, 0, 500);
    line(i*25+12.5,conv_record+12.5, (i+1)*25+12.5, conv_record2+12.5);
    }
  }
  popMatrix();
}
//side menu
void countrySelection(int sel)
{
  pushMatrix();
  translate(675, 50);
  pushMatrix();
  translate(15, -15);
  fill(0);
  text("Country", 0, 0); 
  popMatrix();
  for (int i=0; i<row_size; i++)
  {
    fill(125);
    rect(0, i*15, 100, 15);
    pushMatrix();
    translate(40, 15);
    fill(0);
    text(myCountries[i], 0, i*15); 
    popMatrix();
  }
  ellipseMode(CORNER);
  ellipse(-20, sel*15, 15, 15);
  popMatrix();
}
//mouse hover
void countryMouseOver(int sel)
{
  int mX = mouseX;
  int mY = mouseY;
  //main display hover
  for (int j=0; j<year_size; j++)
  {
    float conv_record = map(myRecords[sel][j], 0, 15000, 0, 500);
    if (mode == 1 && scatter == false)
    {
     //bar hover
      if ((mX >= 75 + j*25 && mX < 100 + j*25) && (mY >= 50 && mY < 50 + conv_record))
      {
        pushMatrix();
        pushMatrix();
        fill(0);
        rect(mouseX-10, mouseY-20, 80, 25);
        popMatrix();
        fill(255);
        String reading = nfc(myRecords[sel][j], 1);
        text(reading, mouseX, mouseY);
        popMatrix();
      }
    }
    else if (mode == 1 && scatter == true)
    {
      //scatter hover
      if ((mX >= 75+j*25 && mX < 100+j*25)&&(mY >= 50+conv_record && mY < 50+conv_record+25))
      {
        pushMatrix();
        pushMatrix();
        fill(0);
        rect(mouseX-10, mouseY-20, 80, 25);
        popMatrix();
        fill(255);
        String reading = nfc(myRecords[sel][j], 1);
        text(reading, mouseX, mouseY);
        popMatrix();
      }
    }
  }
  //side barhover
  for ( int i=0; i<row_size; i++)
  {
    if ((mX >= 675 && mX <=775) && (mY >= 50 +i*15 && mY <= 65 + i*15))
    {
      pushMatrix();
      pushMatrix();
      fill(0);
      rect(mouseX-10, mouseY-20, 100, 25);
      popMatrix();
      fill(255);
      String reading = nfc(rec_sum[i], 1);
      text(reading, mouseX, mouseY);
      popMatrix();
    }
  }
}

//bar chart
void yearDisplay(int sel)
{
  pushMatrix();
  translate(75, 50);
  //scale
  stroke(0);
  line(-25, 0, -25, 500);
  line(-25, 0, 0, 0);
  line(-25, 250, 0, 250);
  line(-25, 500, 0, 500);
  pushMatrix();
  rotate(PI/2);
  fill(0);
  text("0(UNIT: 1000TOE)", -5, 50);
  text("7500", 230, 50);
  text("15000", 475, 50); 
  popMatrix();
  for (int i=0; i<row_size; i++)
  {
    //countryprint
    pushMatrix();
    translate(17.5, 0);
    rotate(3*PI/2);
    fill(0);
    text(myCountries[i], 0, i*20); 
    popMatrix();
    //bar chart
    float conv_record = map(myRecords[i][sel], 0, 15000, 0, 500);
    fill(200 - sel*5);
    rect(0 + i*20, 0, 20, conv_record);
  }
  popMatrix();
}
//bar chart order
void yearDisplay2(int sel)
{
  pushMatrix();
  translate(75, 50);
  //scale
  stroke(0);
  line(-25, 0, -25, 500);
  line(-25, 0, 0, 0);
  line(-25, 250, 0, 250);
  line(-25, 500, 0, 500);
  pushMatrix();
  rotate(PI/2);
  fill(0);
  text("0(UNIT: 1000TOE)", -5, 50);
  text("7500", 230, 50);
  text("15000", 475, 50); 
  popMatrix();
  for (int i=0; i<row_size; i++)
  {
    //countryprint
    pushMatrix();
    translate(17.5, 0);
    rotate(3*PI/2);
    fill(0);
    text(sorted_cou[sel][i], 0, 540 - i*20); 
    popMatrix();
    //bar chart
    float conv_record = map(sorted[sel][i], 0, 15000, 0, 500);
    fill(200 - sel*5);
    rect(540 - i*20, 0, 20, conv_record);
  }
  popMatrix();
}
//scatter chart
void yearDisplay3(int sel)
{
  pushMatrix();
  translate(75, 50);

  //scale
  stroke(0);
  line(-25, 0, -25, 500);
  line(-25, 0, 575, 0);
  line(-25, 250, 0, 250);
  line(-25, 500, 0, 500);
  pushMatrix();
  rotate(PI/2);
  fill(0);
  text("0(UNIT: 1000TOE)", -5, 50);
  text("7500", 230, 50);
  text("15000", 475, 50); 
  popMatrix();

  for (int i=0; i<row_size; i++)
  {
    int year = int(map(i, 0, 22, 1990, 2012));
    //yearprint
    pushMatrix();
    translate(17.5, 0);
    rotate(3*PI/2);
    fill(0);
    text(myCountries[i], 0, i*20); 
    popMatrix();
    //line chart
    float conv_record = map(myRecords[i][sel], 0, 15000, 0, 500);
    fill(200 - sel*5);
    ellipseMode(CENTER);
    ellipse(i*20+10, conv_record+10, 20, 20);
  }
  popMatrix();
}
//side bar
void yearSelection(int sel)
{
  pushMatrix();
  translate(675, 50);
  pushMatrix();
  translate(15, -15);
  fill(0);
  text("Year", 0, 0); 
  popMatrix();
  for (int i=0; i<year_size; i++)
  {
    fill(200 - i*5);
    rect(0, i*15, 100, 15);
    int year = int(map(i, 0, 22, 1990, 2012));
    pushMatrix();
    translate(40, 15);
    fill(0);
    text(year, -15, i*15); 
    popMatrix();
  }
  ellipseMode(CORNER);
  ellipse(-20, sel*15, 15, 15);
  popMatrix();
}
//mouse hover
void yearMouseOver(int sel)
{
  int mX = mouseX;
  int mY = mouseY;
  
  if (mode == 2 && scatter == false)
  {
    if (order == false)
    {
      //not sorted hover
      for (int i=0; i<row_size; i++)
      {
        //not order hover
        float conv_record = map(myRecords[i][sel], 0, 15000, 0, 500);
        if ((mX >= 75 + i*20 && mX < 100 + i*20) && (mY >= 50 && mY < 50 + conv_record))
        {
          pushMatrix();
          pushMatrix();
          fill(0);
          rect(mouseX-10, mouseY-20, 80, 25);
          popMatrix();
          fill(255);
          String reading = nfc(myRecords[i][sel], 1);
          text(reading, mouseX, mouseY);
          popMatrix();
        }
      }
    }
    else
    {
      //sorted hover
      for (int i=0; i<row_size; i++)
      {
        // order hover
        float conv_record = map(sorted[sel][i], 0, 15000, 0, 500);
        if ((mX >= 615 - i*20 && mX < 640 - i*20) && (mY >= 50 && mY < 50 + conv_record))
        {
          pushMatrix();
          pushMatrix();
          fill(0);
          rect(mouseX-10, mouseY-20, 80, 25);
          popMatrix();
          fill(255);
          String reading = nfc(sorted[sel][i], 1);
          text(reading, mouseX, mouseY);
          popMatrix();
        }
      }
    }
  }
  else if(mode == 2 && scatter == true)
  {
     for (int i=0; i<row_size; i++)
    {
      //scatter hover
      float conv_record = map(myRecords[i][sel], 0, 15000, 0, 500);
      if ((mX >= 75+i*20 && mX < 100+i*20) && (mY >= 50+conv_record && mY < 50+conv_record+20))
      {
        pushMatrix();
        pushMatrix();
        fill(0);
        rect(mouseX-10, mouseY-20, 80, 25);
        popMatrix();
        fill(255);
        String reading = nfc(myRecords[i][sel], 1);
        text(reading, mouseX, mouseY);
        popMatrix();
      }
    }
  }
  //side bar hover
  for ( int i=0; i<year_size; i++)
  {
    if ((mX >= 675 && mX <=775) && (mY >= 50 +i*15 && mY <= 65 + i*15))
    {
      pushMatrix();
      pushMatrix();
      fill(0);
      rect(mouseX-10, mouseY-20, 100, 25);
      popMatrix();
      fill(255);
      String reading = nfc(rec_ann[i], 1);
      text(reading, mouseX, mouseY);
      popMatrix();
    }
  }
}

//order the data
void sorting()
{  
  for (int h=0; h<year_size; h++)
  {
    for (int i=0; i<row_size; i++)
    {
      for (int j=0; j<row_size; j++)
      {
        if (sorted[h][i] == myRecords[j][h])
        {
          sorted_cou[h][i] = myCountries[j];
        }
      }
    }
  }
}
//bg grid
void gridbgYr(){
  pushMatrix();
  translate(75, 50);
  stroke(126);
  for(int i=0; i<3; i++)
  {
    line(-25, 125+i*125, 575, 125+i*125);
  }
  for(int i=0; i<year_size; i++){
    line(i*25+12.5, 0, i*25+12.5, 500);
  }
  popMatrix();
}
void gridbgCo(){
  pushMatrix();
  translate(75, 50);
  stroke(126);
  for(int i=0; i<3; i++)
  {
    line(-25, 125+i*125, 575, 125+i*125);
  }
  for(int i=0; i<row_size; i++){
    line(i*20+10, 0, i*20+10, 500);
  }
  popMatrix();
}
void menu()
{
  //button frame
  pushMatrix();
  translate(500, 550);
  fill(125);
  rect(0, 0, 100, 25);
  rect(125, 0, 100, 25);

  if (mode == 1 || mode == 2)
  {
    //plot bar
    rect(0, -50, 100, 25);
    if (mode == 2 && scatter == false)
    {
      if (show == true)
      {
       //filter bar
        rect(125, -50, 100, 25);
      }
    }
  }
  popMatrix();
  //button text
  pushMatrix();
  fill(0);
  text("Country", 520, 567);
  text("Year", 655, 567);
  
  if (mode == 1 || mode == 2)
  {
    text("Plot", 520, 517);
    if (mode == 2 && scatter == false)
    {
      if (show == true)
      {
        if (order == false)
        {
          text("Alphabet", 655-15, 517);
        }
        else
        {
          text("Amount", 655-10, 517);
        }
      }
    }
  }    
  //start screen
  popMatrix();
  if (mode == 0)
  {
    pushMatrix();
    fill(0);
    text("ELectricity Consumption of Households", width/2-150, height/2);
    popMatrix();
  }
}

void mouseReleased()
{
  int mX = mouseX;
  int mY = mouseY;

  println(mX + " " + mY);
  //click on menu
  if (mode == 1)
  {
    for ( int i=0; i<row_size; i++)
    {
      if ((mX >= 675 && mX <=775) && (mY >= 50 +i*15 && mY <= 65 + i*15))
      {
        select = i;
      }
    }
  }
  else if (mode == 2)
  {
    for ( int i=0; i<year_size; i++)
    {
      if ((mX >= 675 && mX <=775) && (mY >= 50 +i*15 && mY <= 65 + i*15))
      {
        yselect = i;
      }
    }
  }
  //click on mode
  if ((mX >= 500 && mX <= 600) && (mY >= 550 && mY <= 575))
  {
    mode = 1;
    show = false;
  }
  else if ((mX >= 625 && mX <=725) && (mY >= 550 && mY <= 575))
  {
    mode = 2;
    show = true;
  }
  //click on filter
  if (mode == 2 && scatter == false) {
    if (show == true)
    {
      if ((mX >= 625 && mX <=725) && (mY >= 500 && mY <= 525))
      {
        if (order == true)
        {
          order = false;
        }
        else
        {
          order = true;
        }
      }
    }
  }
  //click on scatter
  if ((mX >= 500 && mX <= 600) && (mY >= 500 && mY <= 525))
  {
    if (mode == 1)
    {
      if (scatter == false) {

        scatter = true;
      }
      else {
        scatter = false;
      }
    }
    else if (mode == 2)
    {
      if (scatter == false) {

        scatter = true;
      }
      else {
        scatter = false;
      }
    }
  }
}



