
// Code prepared by Gareth Simons and Katerina Skroumpelou
// CASA groupvis Processing presentation by Gareth, Gianfranco, Katerina, and Stelios 

HashMap<Integer, Tube> tubeList; // global hashmap for storing bus objects
HashMap<String, Station> stationList; // global hashmap for storing bus objects
Minute[] minuteList;
Minute[] selectedList;
PFont orator48, orator24, orator12, orator10; // custom fonts
int clock = 0; // create and initialise global clock variable
int maxFrames = 8*1440; //number of frames to display
int days = 0;
int hours = 0;
int minutes = 0;
String targetCard = "Freedom Pass (Disabled)";
int w = 700;
int h = 700;
float dialPanel = 700;
float binWidth, binX, binY;
float binInterval = 5; //every how many minutes to draw bin
Station s;
Table namespositions;
TableRow newRow;

////
 float xnew, ynew, wid, wi, wi2, wid2, percor, percdes, thisperor, thisperdes, tx, ty, acce, popular, popu, ori, disori;
 String namenew, access;
///




// Loads in tube trip data
void loadTubeTrips(){
 println("loading csv file into memory...");
 String [] rows = loadStrings("tubeData.csv"); // load CSV file
 for (int i = 1; i<rows.length; i++) // start from 1 to skip headers
 {
  // Split rows using the comma as delimiter - and save as string array
  String [] thisRow = split(rows[i], ",");
  int ID = int(thisRow[0]);
  boolean cardType;
  if (targetCard.equals(thisRow[14].replace("\"",""))){; // for some ? reason this file requires manually removing ""
   cardType = true; // assign "true" if matching card type of interest
   println("row "+i);
   println("Found matching card.");
  } else {
   cardType = false;
  }
  String station = thisRow[3];
  float startx = map(float(thisRow[15]), 496048, 556167, 0, w); // map to width
  float starty = map(float(thisRow[16]), 161497, 201650, h, 0); // map to height, but keep proportions ??
  float endx = map(float(thisRow[17]), 496048, 556167, 0, w);
  float endy = map(float(thisRow[18]), 161497, 201650, h, 0);
  // Calculate minutes per day
  int day = (int(thisRow[1])-1)*1440;
  // Add minutes for total days plus current day
  int inTime = int(thisRow[5].replace("\"","")) + day; // for some ? reason this file requires manually removing ""
  int outTime = int(thisRow[7].replace("\"","")) + day; // see above
  // Populate tube objects into tubeList hashmap
  Tube t = new Tube(ID,station,cardType,startx,starty,endx,endy,inTime,outTime); // creates new tube object
  tubeList.put(ID, t); // places tube object in hashmap
 }
 // Sort through tube objects and add to corresponding minute objects
 // Interpolate for highlighted routes, so add for each minute between start and end
 for (Tube t: tubeList.values()){
  if (t.cardType == true){
   int start = int(t.inTime);
   int end = int(t.outTime)+1;
   for (int i=start; i<end; i++){
    selectedList[i].minuteTubes.add(t);
   }
  } else {
   // No interpolating for non-highlighted routes, so add only start time and draw once
   int time = int(t.inTime);
   minuteList[time].minuteTubes.add(t);
  }
 }
}

// loads in the station data
void loadStations()
{
 String [] rows = loadStrings("origindestinationposition2.csv"); // load CSV file
 //what I am doing here, is, I am creating a table to store all the 
 //station positions and naems, in a way where I can easily access them
 //and run a query, to use the mouseOver effect etc
 namespositions= new Table();
 namespositions.addColumn("name", Table.STRING);
 namespositions.addColumn("x", Table.FLOAT);
 namespositions.addColumn("y", Table.FLOAT);
 namespositions.addColumn("accessibility", Table.FLOAT);
 namespositions.addColumn("origin", Table.FLOAT); //the percentage of all disabled trips originating from this station
 namespositions.addColumn("disorigin", Table.FLOAT); //the percentage of all disabled trips ending at this station
 namespositions.addColumn("popularity", Table.FLOAT);
 //table created 
 for (int i = 1; i<rows.length; i++) // Iterate through rows. Don&apos;t start from 0 so that you don&apos;t load in headers
 {
  // Split rows using the comma as delimiter - and save as string array
  String [] thisRow = split(rows[i], ";");
  String name = thisRow[0];
  float x = map(float(thisRow[2]), 496048, 556167, 0, w); // map to width
  float y = map(float(thisRow[3]), 161497, 201650, h, 0); // map to height, but keep proportions
  float acces = float(thisRow[1]);
  float or= round(float(thisRow[4]));
  float disor= round(float(thisRow[5]));
  popu = map(float(thisRow[4]), 1, 17624, 5, 2000); 
  s = new Station(name, x, y); // creates new station object
  stationList.put(name, s); // places bus object in hashmap
  //here I store the data in the table
  newRow=namespositions.addRow();
  newRow.setString("name", name);
  newRow.setFloat("x", x);
  newRow.setFloat("y", y);
  newRow.setFloat("accessibility", acces);
  newRow.setFloat("origin", or);
  newRow.setFloat("disorigin", disor);
  newRow.setFloat("popularity", popu);
 }
}

// Minute objects for storing arrays of e data for each point in time.
class Minute
{
 ArrayList<Tube> minuteTubes;
 
 Minute(){
  minuteTubes = new ArrayList<Tube>();
 }
}


void draw()
{  
 //i made variables global, to also work on the mousePressed
 fill(255,2);
 noStroke();
 rect(0,0,w,h);

 for (Station s: stationList.values())
 {
   s.display(); // calls each object’s display function. See below
 }
 
 //BUTTONS
 
 //Button to show accessible stations
 noStroke();
 
 fill(50, 0, 255);
 ellipse(40, height-50, 20, 20);
 fill(0);
 textFont(orator12);
 text("Show stations with step-free access", 60, height-45);
 //Button to show stations by popularity
 ellipse(40, height-20, 20, 20);
 text("Show popularity of stations", 60, height-15);
 
//this prints the info on mouseOver
for (int u=1; u<namespositions.getRowCount() ; u++)
{
 TableRow pir= namespositions.getRow(u);
 xnew=pir.getFloat("x");
 ynew=pir.getFloat("y");
 namenew=pir.getString("name");
 acce=pir.getFloat("accessibility");
 if (acce==1) access="Yes"; 
 else access="No";
 ori=pir.getFloat("origin");
 disori=pir.getFloat("disorigin");
 popular=pir.getFloat("popularity");

 if (overSomething(xnew, ynew, 8)) 
 {
   if (xnew<width/4) tx=xnew;
   else tx=xnew-227;
   if (ynew<height/2) ty=ynew;
   else ty=ynew-135;
   fill(0);
   textFont(orator10);
   rect(tx, ty, textWidth("Accessible trips from this station")+20, 135); 
   fill(180);
   textFont(orator12);
   text(namenew, tx+10, ty+14);
   textFont(orator10);
   text("Accessible: "+access, tx+10, ty+28);
   text("Compared to mean:", tx+10, ty+42);
   text("Trips from this stations", tx+10, ty+56);
   text("Accessible trips from this station", tx+10, ty+100);
   pushStyle();
    fill(180);
    rect(tx+10, ty+64, 200,20);
    rect(tx+10, ty+108, 200,20);
    fill(255,0,0);
    wi=map(ori, 1, 17624, 1, 200);
    rect(tx+10, ty+64, wi, 20);
    fill(50,0,255);
    wi2=map(disori, 0, 232, 1, 200);
    rect(tx+10, ty+108, wi2, 20);
    fill(0);
    wid2=map(24,0, 232, 1, 200);
    rect(tx+10+wid2, ty+108, 3,20);
    wid=map(1893,1, 17624, 1, 200);
    rect(tx+10+wid, ty+64, 3,20);
   popStyle();
 }
 
 //THIS IS DONE USING THE MOUSEOVER EFFECT
 //This way, the printed colours stay like this and not get overwritten each time "draw" runs
  /////
    if (overSomething(40, height-50, 20)) 
   {
     if (acce==1)
      {
        stroke(0);
        fill(50, 0, 255, 200);
        ellipse(xnew, ynew, 7, 7);
      }
   }
   if (overSomething(40, height-20, 20))
   {
    //the area of the circle represents how many originating trips there are from this station
    float r=sqrt(popular/PI);
    stroke(0);
    fill(70, 200, 100, 80);
    ellipse(xnew, ynew, r, r);
   }  
}


 // print non-selected tube trips to screen
 for (int i=0; i<minuteList[clock].minuteTubes.size(); i++)
 {
  Tube t = minuteList[clock].minuteTubes.get(i);
  t.display();
 }
 
 // print selected card type trips to screen
 for (int i=0; i<selectedList[clock].minuteTubes.size(); i++)
 {
  Tube s = selectedList[clock].minuteTubes.get(i);
  s.highlight();
 }
 
 // background boxes for clock info
 noStroke();
 
 // clock info
 fill(30);
 rectMode(CORNER);
 rect(w,0,w+150,85);
 fill(230);
 textFont(orator48);
 text(days+"d_"+hours+"h_"+minutes+"m",w+20,75); // draws seconds to screen
 
 // draw dial panel background
 fill(40,0.5);
 rect(w,0,width,height);
 if (frameCount % binInterval == 0)
 {
  int allTrips = minuteList[clock].minuteTubes.size()/4; // reduce size to keep contained
  int accTrips = selectedList[clock].minuteTubes.size()/4; // reduce size to keep contained
  strokeWeight(0.5);
  stroke(255);
  line(binX, binY, binX, binY-allTrips);
  stroke(255,0,0);
  line(binX, binY, binX, binY-accTrips);
  binX = binX + binWidth;
  if (binX>width)
  {
    binX = binX/2;
    binY = binY + (h-50)/8;
  }
 }
 
 // iterate the global clock after each frame
 clock ++;
 minutes ++;
 if (minutes == 60)
 {
  minutes = 0;
  hours ++;
 }
 if (hours == 24)
 {
   hours = 0;
   days ++;
   //background with opacity
 }

 // halt the animation if the clock exceeds 200...because we don’t have more data than that
 if (clock == maxFrames)
 {
   noLoop();
    //Button for Reset
//   fill(0);
//   noStroke();
//   triangle(70, height-35, 70, height-15, 90, height-23);
//   text("Click to replay", 100, height-23);
 }
}


void setup () {
 size (w+int(dialPanel),h);
 
 noStroke();
 fill(40);
 rect(w,0,width,height);
 
 // load and set fonts for text
 orator48 = loadFont("OratorStd-48.vlw");
 orator24 = loadFont("OratorStd-24.vlw");
 orator12 = loadFont("OratorStd-12.vlw");
 orator10 = loadFont("OratorStd-10.vlw");

 // Populate minute objects into minutes hashmap
 minuteList = new Minute[maxFrames];
 selectedList = new Minute[maxFrames];
 for (int i=0; i<maxFrames; i++){
   minuteList[i]=new Minute();
   selectedList[i]=new Minute();
 }
 
 binWidth = (dialPanel / (24*60)) * binInterval;
 binX = w + (binWidth/2);
 binY = ((h-50) / 8)+50;
 println(binX + " " + binY + " " + binWidth + " ");
 
 // call functions to load in data
 tubeList = new HashMap<Integer, Tube>(); // initialise the Hashmap
 loadTubeTrips();
 stationList = new HashMap<String, Station>();
 loadStations(); 

}


boolean overSomething (float x, float y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


// class
class Station 
{
 String name;
 float x,y; // float list array for x,y coordinates
                    
 
 Station (String nameIn, float xIn, float yIn)
 {
   name = nameIn;
   x=xIn;
   y=yIn;
 }
 
 // display function called by each draw loop for each bus object - called above
 void display()
 {
   strokeWeight(0.1);
   stroke(80);
   //line(x, y-4, x, y+4);
 //  line(x-4, y, x+4, y);
   ellipse(x, y, 5, 5);
 }
}


class Tube 
{
 int id;
 String station;
 boolean cardType; // id variable
 PVector vStart, vEnd, vCurrent; // float list array for x,y coordinates
 int inTime, outTime;
 float duration;
 
 Tube(int idin, String stationIn, boolean cardTypeIn, float xStartIn, float yStartIn, float xEndIn, float yEndIn, int inTimeIn, int outTimeIn){
   id = idin;
   station = stationIn;
   cardType = cardTypeIn;
   vStart = new PVector(xStartIn,yStartIn);
   vCurrent = vStart.get();
   vEnd = new PVector(xEndIn,yEndIn);
   inTime = inTimeIn;
   outTime = outTimeIn;
   duration = outTime-inTime;
 }
 
 // for drawing non-highlighted routes
 void display() {
  strokeWeight(0.1);
  stroke(30,150);
  line(vStart.x,vStart.y,vEnd.x,vEnd.y); // draw line for each route
 }
 
 // for drawing highlighted routes
 void highlight(){
  if (duration != 0){
   vCurrent.set(vEnd);
   vCurrent.sub(vStart);
   vCurrent.mult((clock-inTime)/duration);
   vCurrent.add(vStart);   
  } else {
   vCurrent.set(vStart);
  }
  strokeWeight(0.5);
  stroke(220,0,0);
  line(vStart.x,vStart.y,vCurrent.x,vCurrent.y); // draw line for each route
 }
}









