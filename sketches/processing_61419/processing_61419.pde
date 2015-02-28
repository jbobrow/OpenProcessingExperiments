
import processing.opengl.*;

//Melanie Danver
//copyright 2012 mdanver

//data set on UFO sightings copyright NUFORC 
//http://www.nuforc.org/webreports/ndxloc.html


//Data visualization on the Number of UFO reports in the United states based off of States (including Washington D.C.)
//Bars coming off of the middle of the states indicates the number of reports
//placing your mouse around the base(closest to the map) of the bar will tell you the exact number of reports and the state Name
//the Arrow Keys can be used to move the Map in all directions, it will wrap around the screen when you go too far
//Pressing the R key will reset the map if you lose it
//Random spheres moving across the screen are randomly generated "UFO" sightings for aesthetic purpouses
//they are slightly interactive, if you place the cursor around a "UFO" it will move more erractially 

PImage usa;
int countHor = 0;
int countVer = 0;
float [] xCount;
float [] yCount;
float [] xList;
float [] yList;
color [] UFOcolor;
float startColor = 100;
float dia;

String [] stateName = {
  "Alaska", "Alabama", "Arkansas", "Arizona", "California", "Colorado", "Connecticut", "Washington D.C.", "Delaware", "Florida", 
  "Georgia", "Hawaii", "Iowa", "Idaho", "Illinois", "Indiana", "Kansas", "Kentucky", "Louisiana", "Massachusetts", "Maryland", 
  "Maine", "Michigan", "Minnesota", "Missouri", "Mississippi", "Montana", "North Carolina", "North Dakota", "Nebraska", "New Hampshire", 
  "New Jersey", "New Mexico", "Nevada", "New York", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", 
  "South Dakota", "Tennessee", "Texas", "Utah", "Virginia", "Vermont", "Washington", "Wisconsin", "West Virginia", "Wyoming"
};

int [] stateSightings = { 
  276/*alaska*/, 565 /*alabama*/, 617 /*arkansas*/, 2412 /*arizona*/, 
  8712 /*CA*/, 1352 /*Col*/, 766 /*connecticut*/, 100 /*DC*/, 154 /*del*/, 3422 /*FL*/, 
  1167 /*GA*/, 281 /*HI*/, 571 /*Iowa*/, 425 /*Idaho*/, 2427 /*illlinois*/, 1214 /*indiana*/, 
  587 /*kansas*/, 814 /*kentucky*/, 523 /*louisiana*/, 1080 /*mass*/, 727 /*maryland*/, 483 /*maine*/, 
  1814 /*michigan*/, 883 /*minnesota*/, 1418 /*missouri*/, 364 /*missi*/, 427 /*montana*/, 1513 /*NC*/, 
  126 /*ND*/, 370 /*nebraska*/, 415 /*newhamshire*/, 1274/* NJ*/, 715 /*NM*/, 820 /*NEV*/, 
  2860/* NY*/, 1940 /*Ohio*/, 647 /*OK*/, 1593 /*oregon*/, 2105 /*PA*/, 229 /*RI*/, 
  783 /*SC*/, 174 /*SD*/, 1021 /*TEN*/, 3469 /*TX*/, 585 /*Utah*/, 1118 /*VA*/, 
  213 /*Vermont*/, 3837 /*Wash*/, 1067 /*wisconsin*/, 397 /*WV*/, 191 /*WY*/
};

int [] xAxis = { 
  100, 625, 515, 175, // alaska, alabama, arkansas, arizona
  50, 295, 830, 773, 798, 722, // Cali, Col, Conn, DC, Del, FL
  685, 225, 495, 175, 565, 620, // GA, HI, Iowa, Idaho, ill, ind
  415, 650, 515, 835, 772, 865, // kan, kent, loui, mass, mary, maine
  635, 480, 518, 565, 250, 735, // mich, minn, missour, missi, montana, NC
  400, 400, 835, 808, 275, 110, // ND, nebras, new ham,  NJ, NM, NEV
  775, 675, 435, 75, 750, 848, //NY, Ohio, OK, oregon, PA, RI
  730, 395, 625, 400, 195, 755, // SC, SD, TEN, TX, Utah, VA
  815, 100, 535, 710, 275//vermont, wash, wisconsin, wv, wy
};

int [] yAxis = { 
  510, 410, 365, 375, // alaska, alabama, arkansas, arizona
  300, 265, 180, 260, 250, 500, // Cali, Col, Conn, DC, Del, FL
  415, 565, 215, 150, 250, 250, // GA, HI, Iowa, Idaho, ill, ind
  290, 305, 450, 163, 245, 85, // kan, kent, loui, mass, mary, maine
  185, 150, 300, 415, 85, 330, // mich, minn, missour, missi, montana, NC
  95, 225, 135, 215, 375, 225, // ND, nebras, new ham,  NJ, NM, NEV
  170, 240, 355, 115, 215, 175, //NY, Ohio, OK, oregon, PA, RI
  380, 155, 345, 450, 250, 290, // SC, SD, TEN, TX, Utah, VA
  125, 50, 135, 275, 175//vermont, wash, wisconsin, wv, wy
};

int states = 100;
final int MAX = 3;

void setup()
{
  textSize(15);
  size(900, 600, OPENGL);
  background(0);
  lights();
  usaMap();
  boxes();
 
  xList = new float[MAX];
  inArray(xList);
  yList = new float[MAX];
  inArray(yList);
  xCount = new float[MAX];
  inArray(xCount);
  yCount = new float[MAX];
  inArray(yCount);
  UFOcolor = new color [MAX];
  inColorArray();
  dia = random(2,5);

}

void draw()
{
  background(0);
  title();
  lights();
  UFO();
  moveMap();
}

void UFO() // Draws the Moving UFO figures across the screen
{
  noStroke();
shapes();
moveX();
moveY();
stroke(0);
}

void title() // Writes the title at the top of the Data Visualization 
{
  stroke(255);
  textSize(25);
  text("Number of UFO sightings per State", 400, 25);
  textSize(15);
  text("Use Arrow Keys to move Map Position", 550,50);
  text("Press the r Key to reset Map Position", 550,75);
  stroke(0);
}

void moveMap() //moves the map, boxes, and mouse coordinates with the arrow keys  
{
  translate(countHor, countVer);
  usaMap();
  boxes();
  mouseTrack();
}

void boxes()
{ 
  for (int i = 0; i < stateSightings.length; i++)
  {
    pushMatrix();
    fill(255);
    translate(xAxis[i], yAxis[i], 0);
    box(10, 10, stateSightings[i]/20);
    popMatrix();
  }
}

void usaMap() // draws the image of the map
{
  usa = loadImage("usa.png");
  usa.resize(width, height);
  image(usa, 0, 0);
}

void mouseTrack() //tracks the mouse movements, if you hover over the base of one of the boxes, the state's name and the number of sightings will appear
{
  textSize(15);
  int mousePointX = mouseX-countHor;
  int mousePointY = mouseY-countVer;
  for ( int i = 0; i<stateSightings.length; i++)
  {
    if (mousePointX <= xAxis[i]+10 && mousePointX >= xAxis[i]-10 && mousePointY <= yAxis[i]+10 && mousePointY >= yAxis[i]-10)
    {  
      if (stateSightings[i] <=250) //solution for text being blocked by higher boxes from other states around it
      {
        translate(0, 0, stateSightings[i]/5);
      }
      else if (stateSightings[i] >= 251 && stateSightings[i] <= 500)
      {
        translate(0, 0, stateSightings[i]/10);
      }
      else {
        translate(0, 0, stateSightings[i]/50);
      }
      fill(0);       //text
      stroke(0, 255, 0);
      rect(xAxis[i]-10, yAxis[i], 14*stateName[i].length(), 45);
      fill(0, 255, 0);
      text( stateSightings[i], xAxis[i], yAxis[i] +20 );
      textSize(20);
      text(stateName[i], xAxis[i], yAxis[i]+40);
      fill(255);
      textSize(15);
      stroke(0);
    }
  }
}

void keyPressed( ) //counts which arrow key pressed and how many times it's pressed in a counter for Horizontal and Verticle
{
  if (key == CODED) {

    if (keyCode == LEFT)
    {
      countHor -=50;
    }
    if (keyCode == RIGHT)
    {
      countHor += 50;
    }
    if (keyCode == UP)
    {
      countVer -= 50;
    }
    if (keyCode == DOWN)
    { 
      countVer += 50;
    }
  }
  
  if(countHor == -900)  //Map wrapping around screen
  {countHor = 850;}
  if(countHor == 900)
  {countHor = -850;}
  if(countVer == -600)
  {countVer = 550;}
  if(countVer == 600)
  {countVer = -550;}
 
  if (key == 'r') //reset button
  {countVer = 0;
  countHor = 0;}
  
  println("hor " + countHor);
  println("Ver " + countVer);
}

void shapes()  //creates the sphere UFOs
{
  for (int i = 0; i <xList.length; i++) {
    fill(UFOcolor[i]);
    pushMatrix();
    translate(xCount[i], yCount[i], 0);
    rotateX(radians(xCount[i]));
    rotateY(radians(yCount[i]));
    sphere(dia);
    popMatrix();
    fill(255);
  }
}

void moveX()//Moves the UFO Horizonal
{ 
  float turnPointX = random(-10, 10);
  for (int i = 0; i <xList.length; i++)
  { 
    if (xCount[i] == turnPointX)
    {
      xCount[i] += turnPointX+random(-3, 3);
    }

    else {
      xCount[i] += random(-1, 1) +5;
    }

    float d = dist(mouseX, mouseY, xCount[i], yCount[i]);

    if (d < 50)
    {
      xCount[i] = xCount[i]+random(-5,5);
      yCount[i] = yCount[i]+random(-5,5);
    }
    if (xCount[i] > width)
    {
      xCount[i] = 0;
      yCount[i] = random(200,400);
        UFOcolor = new color [MAX];
  inColorArray();
  dia = random(2,10);
    }
  }
}

void moveY() //moves the UFO Vertical  and adds some randomness to the movment
{ 
  float turnPointY = random(-10, 10);
  for (int i = 0; i<yList.length; i++)
  {
    if (yCount[i] == turnPointY)
    {
      yCount[i] += turnPointY+random(-6, 6);
    }
    else
    {
      yCount[i] += random(-3, 3);
    }

    if (yCount[i] > height)
    {
      yCount[i] = 0;
      xCount[i] = random(width);
    }
    if (yCount[i] < 0)
    {
      yCount[i] = height;
    xCount[i] = random(width);
      UFOcolor = new color [MAX];
  inColorArray();
  dia = random(2,10);
  }
}
}

void inArray( float [] array)
{
  for (int i =0; i<array.length; i++) {
    array[i] = int(random(10, 100));
  }
}

  void inColorArray()  //randomly selects the colors of the UFO
{
  for (int i = 0; i<xList.length; i ++)
  {
    UFOcolor[i] = color(random(100,255),random(100,255),random(100,255));}
}




//
//void  states()   //WAS USED TO FIND THE POINT LOCATIONS FOR EACH STATE 
//{
//  for (int i = 0; i<xAxis.length; i++)
//  {
//    if ( i <= 20) 
//    {
//      stroke(255, 0, 255);
//    }
//    if ( i > 20)
//    {
//      stroke(0, 255, 0);
//    }
//    strokeWeight(5);
//    point(xAxis[i], yAxis[i]);
//  }
//}

