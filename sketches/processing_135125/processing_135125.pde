
// import processing.pdf.*;                  // uncomment to output pdf

color white = color(255, 255, 255);          // colors
color black = color(0, 0, 0);
color grey = color(180);
color yellow = color(220, 200, 70);
color orange = color(210, 110, 50);
color red = color(210, 40, 40);
color green = color(60, 140, 60);
color blue = color(0, 96, 117);

PFont font1;                                 // font
ArrayList<orgGroup> orgGroupList;            // orgGroupList

String total = "$736,942";                   // total budget for the year
float t = 736942;                        

float centerColumnX = 340;                   // center column paramaters
float centerColumnY = 135;
float centerColumnWidthLeft = 70;
float centerColumnWidthRight = 90;
float centerColumnHeight = 530;
float centerColumnSpace = 15;

float rightColumnX = 500;                   // right column paramaters
float rightColumnY = 56;
float rightColumnWidthLeft = 40;
float rightColumnWidthRight = 40;
float orgHeightRight = 7;                       
float orgSpaceRight = 3;
float orgGroupSpaceRight = 35;

float leftColumnX = 160;                   // right column paramaters
float leftColumnY = 57;
float leftColumnWidthLeft = 15;
float leftColumnWidthRight = 200;
float orgHeightLeft = 5;                       
float orgSpaceLeft = 1.8;

float vPointX2 = -1260;                      // vanishing points
float vPointY2 = -540;
float vPointX1 = width + 1570;
float vPointY1 = -20;

float counter = 0;


void setup() {
  size(680, 740);                                             // comment out to output pdf 
  // size(3456, 3700, PDF, "VSA Annual Budget for 2014.pdf"); // uncomment to output pdf 

  font1 = createFont("Gulim-48.vlw", 20);  // initialize font (should be in data folder)
  orgGroupList = new ArrayList<orgGroup>();

  //////////////////////////////////////////////////////////////////////////////////////////////
  // INITIALIZE ORGS ///////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////

  orgGroupList.add(new orgGroup("Residences", "$43,660", 43660));     
  orgGroupList.get(orgGroupList.size()-1).c = yellow;  
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Jewett House", "$5,000", 5000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Main House", "$4,750", 4750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Josselyn House", "$4,750", 4750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Raymond House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Noyes House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Lathrop House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Strong House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Davison House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Cushing House", "$4,500", 4500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Ferry Co-Op", "$960", 960));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("TownHouses", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Terrace Apartments", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("South Commons", "$200", 200));

  orgGroupList.add(new orgGroup("Classes", "$54,000", 54000));
  orgGroupList.get(orgGroupList.size()-1).c = orange;  
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Senior Class", "$51,000", 51000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Junior Class", "$1,500", 1500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Sophomore Class", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Freshman Class", "$500", 500));

  orgGroupList.add(new orgGroup("VSA Internal Fund", "$79,000", 79000));
  orgGroupList.get(orgGroupList.size()-1).c = red;  
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Founder's Day", "$43,000", 43000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Shuttle", "$15,000", 15000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Meet Me in Poughkeepsie", "$6,000", 6000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Programming Board", "$5,000", 5000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VSA Operating", "$5,000", 5000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Fall Leadership Conference", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VSA Council Retreat", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VANS", "$1,000", 1000));

  orgGroupList.add(new orgGroup("VSA Special Purpose Fund", "$99,500", 99500));
  orgGroupList.get(orgGroupList.size()-1).c = green;  
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Speakers, Lectures, & Panels", "$50,000", 50000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Conference", "$15,000", 15000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Collaboration", "$12,000", 12000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Social Conciousness", "$10,000", 10000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Community", "10,000", 10000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("A Capella Recording", "$4,000", 4000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("New Organizations", "$2,500", 2500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Capital", "$0", 0));


  orgGroupList.add(new orgGroup("Student Organizations", "$460,782", 460782));
  orgGroupList.get(orgGroupList.size()-1).c = blue;
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Vice", "$155,000", 155000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("WVKR Radio Station", "$30,000", 30000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Hip Hop 101", "$23,000", 23000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Miscellany News", "$16,435", 16435));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Council of Black Seniors", "$15,000", 15000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Philetheis", "$12,000", 12000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Ultimate Frisbee", "$12,000", 12000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Debate Club", "$10,000", 10000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Ski Team", "$9,000", 9000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Outgoing Club", "$8,500", 8500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Black Student Union", "$8,000", 8000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("ASA", "$7,500", 7500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("MEChA", "$7,250", 7250));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Future Waitstaff of America", "$6,500", 6500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("ViSA", "$6,000", 6000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Poder Latino", "$6,000", 6000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VPI", "$5,500", 5500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("NSO", "$5,000", 5000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Barefoot Monkeys", "$4,200", 4200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Squirm", "$4,000", 4000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("QCVC", "$4,000", 4000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("CHOICE", "$4,000", 4000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Iced Brew", "$3,700", 3700));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Improv", "$3,500", 3500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("SASA", "$3,500", 3500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Feminist Alliance", "$3,500", 3500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("E.M.S.", "$3,032", 3032));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Chronicle", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Slow Foods", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Punx", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Habitat for Humanity", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Vassarion", "$3,000", 3000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Greens", "$2,800", 2800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Equestrian Team", "$2,800", 2800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Aikido Club", "$2,800", 2800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Pro-Health", "$2,750", 2750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Helicon", "$2,500", 2500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("GAAP", "$2,500", 2500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Hunger Action", "$2,300", 2300));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("TONCA", "$2,250", 2250));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Quidditch", "$2,200", 2200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Unbound", "$2,200", 2200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("P.E.A.C.E.", "$2,100", 2100));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Phocus", "$2,000", 2000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("MBSA", "$2,000", 2000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Woodshed", "$2,000", 2000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("African Students Union", "$2,000", 2000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Filmmakers", "$1,800", 1800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Shakespeare Troupe", "$1,750", 1750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Jewish Union", "$1,600", 1600));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Caribbean Students' Alliance", "$1,500", 1500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Hype", "$1,250", 1250));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Operation Donation", "$1,200", 1200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Soundsystem", "$1,200", 1200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Christian Fellowship", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Fly People", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("College Demo", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Idlewild Theatre Ensemble", "$1,000", 1000));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Ferry Co-op", "$960", 960));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Merely Players", "$900", 900));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VA RC", "$900", 900));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Challah", "$900", 900));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Happily Ever Laughter", "$800", 800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Mahagonny Ensemble", "$800", 800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Limit", "$800", 800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Act Out", "$800", 800));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Catholic Community", "$750", 750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Indecent Exposure", "$750", 750));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Haiti Project", "$700", 700));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Islamic Society", "$600", 600));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("UNICEF", "$600", 600));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Wordsmiths", "$600", 600));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Run Vassar", "$600", 600));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("On Tap", "$550", 550));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Matthew's Minstrels", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Night Owls", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Vastards", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("BAM", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("MICA", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Ballroom Dancing", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("The Listening Center", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Sailing", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Transmission", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Measure for Measure", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Accidentals", "$500", 500));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Amnesty International", "$400", 400));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("No Offense", "$350", 350));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Democracy Matters", "$300", 300));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Aircapella", "$300", 300));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Devils", "$250", 250));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("French Club", "$250", 250));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("VAC A", "$200", 200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Unitarian Universalists", "$200", 200));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Camarata", "$125", 125));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("ACCESS", "$110", 110));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Episcopalian Church", "$70", 70));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Forum for Political Philosophy", "$50", 50));
  orgGroupList.get(orgGroupList.size()-1).orgList.add(new org("Knights of Commuknity", "$50", 50));
  //////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////
}





void draw() {
  background(white);
  pushMatrix();
  //  scale(5.02);           // uncomment to output pdf 

  // draw frame ///////////////////////////////////////////////////////////////////////////////////
  noFill();                 
  stroke(grey);
  rect(20, 50, 640, 660, 8);
  ////////////////////////////////////////////////////////////////////////////////////////////////

  // draw text ///////////////////////////////////////////////////////////////////////////////////
  textFont(font1, 25);

  fill(black);
  text("How does the VSA spend " + total + " ?", 22, 36);

  textFont(font1, 25);
  fill(grey);
  text("VSA", 548-(textWidth("VSA")/2)-1, 515+35-1);
  fill(black);
  text("VSA", 548-(textWidth("VSA")/2), 515+35);
  fill(grey);
  text("Annual Budget", 548-(textWidth("Annual Budget")/2)-1, 545+35-1);
  fill(black);
  text("Annual Budget", 548-(textWidth("Annual Budget")/2), 545+35);
  fill(grey);
  text("for 2014", 548-(textWidth("for 2014")/2)-1, 575+35-1);
  fill(black);
  text("for 2014", 548-(textWidth("for 2014")/2), 575+35);

  textFont(font1, 5);
  fill(black);
  text("Source", 435, 703);
  fill(black);
  text("http://vsa.vassar.edu/documents/passed/20130428_VSA_Annual_Budget-FY_2014.pdf", 
  435, 708);

  textFont(font1, 8);
  fill(grey);
  text("pashchyhelski@vassar.edu", 570, 735);
  ////////////////////////////////////////////////////////////////////////////////////////////////


  // position and draw central column ////////////////////////////////////////////////////////////////////////////////
  for (int i = 0; i < orgGroupList.size(); i++) {
    orgGroupList.get(i).h = map(orgGroupList.get(i).b, 0, t, 0, centerColumnHeight);
    if (i == 0) {
      orgGroupList.get(i).x = centerColumnX;
      orgGroupList.get(i).y = centerColumnY;
    }
    else {
      orgGroupList.get(i).x = centerColumnX;
      orgGroupList.get(i).y = orgGroupList.get(i-1).y 
        + orgGroupList.get(i-1).h 
        + centerColumnSpace;
    }
  }
  for (int i = orgGroupList.size()-1; i >= 0; i--) {
    orgGroupList.get(i).draw();
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////


  popMatrix();

  //  counter++;             // uncomment to output pdf
  //  if (counter == 5) {
  //  exit();      
  //  }
}


class org {

  float x, y, h;
  float widthRight, widthLeft;
  color c;

  float x1, y1, x2, y2, x3, y3, x4, y4;
  float jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4;
  float kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4;

  String label;
  String budget;
  float b;

  orgGroup orgGroup;


  org(String label, String budget, float b) {
    this.label = label;
    this.budget = budget;
    this.b = b;
  }

  void update() {

    x1 = x;
    y1 = y;

    x2 = x1;
    y2 = y1 + h;

    x3 = x2 + widthRight;
    float slope1 = ((y2 - vPointY1)/(x2 - vPointX1));
    y3 = y2 + (slope1*(x3-x2));

    x4 = x3;
    float slope2 = ((y1 - vPointY1)/(x1 - vPointX1));
    y4 = y1 - (slope2*(x1-x4));

    jx1 = x1;
    jy1 = y1;

    jx2 = x1;
    jy2 = y2;

    jx3 = jx2 - widthLeft;
    float slope3 = ((jy2 - vPointY2)/(jx2 - vPointX2));
    jy3 = jy2 + (slope3*(jx3-jx2));

    jx4 = jx3;
    float slope4 = ((jy1 - vPointY2)/(jx1 - vPointX2));
    jy4 = jy1 - (slope4*(jx1-jx4));

    kx1 = x1;
    ky1 = y1;

    kx2 = x4;
    ky2 = y4;

    kx3 = kx2 - widthLeft;
    float slope5 = ((ky2 - vPointY2)/(kx2 - vPointX2));
    ky3 = ky2 + (slope5*(kx3-kx2));

    kx4 = jx4;
    ky4 = jy4;
  }

  void draw() {
    pushStyle();

    // draw box //////////////////////////////////////////////////////
    fill(c);
    stroke(grey, 0);
    quad(kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    quad(jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4);

    fill(black, 50);
    quad(kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4);
    fill(black, 25);
    quad(jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4);

    stroke(black);
    strokeWeight(1.5);
    line(x2, y2, x3, y3);
    line(x3, y3, x4, y4);
    line(x4, y4, kx3, ky3);
    line(kx3, ky3, kx4, ky4);
    line(kx4, ky4, jx3, jy3);
    line(jx3, jy3, x2, y2);

    strokeWeight(1);
    /////////////////////////////////////////////////////////////////

    // draw label //////////////////////////////////////////////////////
    if (orgGroup.label.equals("Student Organizations")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx3 - 70 - 24, jy4, 70, 5.5, 10, 0, 0, 10);

      textFont(font1, 4);
      fill(black);
      text(budget, jx3-22, jy3-1);

      fill(white);
      text(label, jx3 - 30 - textWidth(label), jy3-0.8);

      stroke(grey);
      line(jx3-3, jy3+0.5, jx3 - 23.5, jy3+0.5);
    }
    else {
      stroke(grey);
      line(x3+3, y3-0.5, x3+23, y3-0.5);

      fill(c);
      stroke(black);
      noStroke();
      rect(x3+20+3.5, y4, 85, 7, 0, 10, 10, 0);

      textFont(font1, 5);
      fill(black);
      text(budget, x3+2, y3-2);

      fill(black);
      text(label, x3+26-1, y3-1-1);
      fill(white);
      text(label, x3+26, y3-1);
    }
    /////////////////////////////////////////////////////////////////
  }
}


class orgGroup {

  float x, y, h;
  color c;

  float x1, y1, x2, y2, x3, y3, x4, y4;
  float jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4;
  float kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4;

  String label;
  String budget;
  float b;

  ArrayList<org> orgList = new ArrayList<org>();  // orgList


  orgGroup(String label, String budget, float b) {
    this.label = label;
    this.budget = budget;
    this.b = b;
  }


  void draw() {
    for (org o: orgList) {
      o.orgGroup = this;
    }

    x1 = x;
    y1 = y;

    x2 = x;
    y2 = y + h;

    x3 = x2 + centerColumnWidthRight;
    float slope1 = ((y2 - vPointY1)/(x2 - vPointX1));
    y3 = y2 + (slope1*(x3-x2));

    x4 = x3;
    float slope2 = ((y1 - vPointY1)/(x1 - vPointX1));
    y4 = y1 - (slope2*(x1-x4));

    jx1 = x1;
    jy1 = y1;

    jx2 = x1;
    jy2 = y2;

    jx3 = jx2 - centerColumnWidthLeft;
    float slope3 = ((jy2 - vPointY2)/(jx2 - vPointX2));
    jy3 = jy2 + (slope3*(jx3-jx2));

    jx4 = jx3;
    float slope4 = ((jy1 - vPointY2)/(jx1 - vPointX2));
    jy4 = jy1 - (slope4*(jx1-jx4));

    kx1 = x1;
    ky1 = y1;

    kx2 = x4;
    ky2 = y4;

    kx3 = kx2 - centerColumnWidthLeft;
    float slope5 = ((ky2 - vPointY2)/(kx2 - vPointX2));
    ky3 = ky2 + (slope5*(kx3-kx2));

    kx4 = jx4;
    ky4 = jy4;

    // position and draw left column ////////////////////////////////////////////////////////////////
    if (label.equals("Student Organizations")) {
      for (int i = 0; i < orgList.size(); i++) {
        if (i == 0) {
          orgList.get(i).x = leftColumnX;
          orgList.get(i).y = leftColumnY;
        }

        else {
          orgList.get(i).x = leftColumnX;
          orgList.get(i).y = orgList.get(i-1).y 
            + orgHeightLeft
            + orgSpaceLeft;
        }
        orgList.get(i).widthRight = map(orgList.get(i).b, 0, b, 0, leftColumnWidthRight);
        orgList.get(i).widthLeft = leftColumnWidthLeft;
        orgList.get(i).c = c;
        orgList.get(i).h = orgHeightLeft;
      }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////
    else {
      // position and draw right column ////////////////////////////////////////////////////////////////
      for (int i = 0; i < orgList.size(); i++) {
        if (i == 0) {
          if (orgGroupList.indexOf(this) == 0) {
            orgList.get(i).x = rightColumnX;
            orgList.get(i).y = rightColumnY;
          }
          else {
            orgList.get(i).x = rightColumnX;
            orgList.get(i).y = 
              orgGroupList.get(orgGroupList.indexOf(this)-1).orgList.get(orgGroupList.get(orgGroupList.indexOf(this)-1).orgList.size()-1).y 
              + orgHeightRight 
              + orgGroupSpaceRight;
          }
        }
        else {
          orgList.get(i).x = rightColumnX;
          orgList.get(i).y = orgList.get(i-1).y 
            + orgHeightRight
            + orgSpaceRight;
        }
        orgList.get(i).widthRight = rightColumnWidthRight;
        orgList.get(i).widthLeft = map(orgList.get(i).b, 0, b, 0, rightColumnWidthLeft);
        orgList.get(i).c = c;
        orgList.get(i).h = orgHeightRight;
      }
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////
    for (int i = orgList.size()-1; i >= 0; i--) {
      orgList.get(i).update();
      orgList.get(i).draw();
    }



    pushStyle();

    // draw box //////////////////////////////////////////////////////
    fill(c);
    stroke(grey, 0);
    quad(kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4);
    quad(x1, y1, x2, y2, x3, y3, x4, y4);
    quad(jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4);

    fill(black, 50);
    quad(kx1, ky1, kx2, ky2, kx3, ky3, kx4, ky4);
    fill(black, 25);
    quad(jx1, jy1, jx2, jy2, jx3, jy3, jx4, jy4);

    stroke(black);
    strokeWeight(1.5);
    line(x2, y2, x3, y3);
    line(x3, y3, x4, y4);
    line(x4, y4, kx3, ky3);
    line(kx3, ky3, kx4, ky4);
    line(kx4, ky4, jx3, jy3);
    line(jx3, jy3, x2, y2);

    strokeWeight(1);
    /////////////////////////////////////////////////////////////////

    // draw label //////////////////////////////////////////////////////
    if (label.equals("Student Organizations")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx4-75-2, jy4, 75, 46, 10, 0, 0, 10);

      textSize(10);
      fill(black);
      text("Student", jx4-5-textWidth("Student")-1, jy4+14-1);
      fill(white);
      text("Student", jx4-5-textWidth("Student"), jy4+14);
      fill(black);
      text("Organizations", jx4-5-textWidth("Organizations")-1, jy4+26-1);
      fill(white);
      text("Organizations", jx4-5-textWidth("Organizations"), jy4+26);

      fill(black);
      text(budget, jx4-5-textWidth(budget)-1, jy4+41-1);
      fill(white);
      text(budget, jx4-5-textWidth(budget), jy4+41);
    }
    if (label.equals("VSA Special Purpose Fund")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx4-75-2, jy4, 75, 45, 10, 0, 0, 10);

      textSize(10);
      fill(black);
      text("VSA Special", jx4-5-textWidth("VSA Special")-1, jy4+14-1);
      fill(white);
      text("VSA Special", jx4-5-textWidth("VSA Special"), jy4+14);
      fill(black);
      text("Purpose Fund", jx4-5-textWidth("Purpose Fund")-1, jy4+26-1);
      fill(white);
      text("Purpose Fund", jx4-5-textWidth("Purpose Fund"), jy4+26);

      fill(black);
      text(budget, jx4-5-textWidth(budget)-1, jy4+41-1);
      fill(white);
      text(budget, jx4-5-textWidth(budget), jy4+41);
    }
    if (label.equals("VSA Internal Fund")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx4-75-2, jy4, 75, 45, 10, 0, 0, 10);

      textSize(10);
      fill(black);
      text("VSA", jx4-5-textWidth("VSA")-1, jy4+14-1);
      fill(white);
      text("VSA", jx4-5-textWidth("VSA"), jy4+14);
      fill(black);
      text("Internal Fund", jx4-5-textWidth("Internal Fund")-1, jy4+26-1);
      fill(white);
      text("Internal Fund", jx4-5-textWidth("Internal Fund"), jy4+26);

      fill(black);
      text(budget, jx4-5-textWidth(budget)-1, jy4+41-1);
      fill(white);
      text(budget, jx4-5-textWidth(budget), jy4+41);
    }
    if (label.equals("Classes")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx4-60-2, jy4, 60, 32, 10, 0, 0, 10);

      textSize(10);
      fill(black);
      text("Classes", jx4-5-textWidth("Classes")-1, jy4+14-1);
      fill(white);
      text("Classes", jx4-5-textWidth("Classes"), jy4+14);

      fill(black);
      text(budget, jx4-5-textWidth(budget)-1, jy4+29-1);
      fill(white);
      text(budget, jx4-5-textWidth(budget), jy4+29);
    }
    if (label.equals("Residences")) {
      fill(c);
      stroke(black);
      noStroke();
      rect(jx4-70-2, jy4-1, 70, 32, 10, 0, 0, 10);

      textSize(10);
      fill(black);
      text("Residences", jx4-1-5-textWidth("Residences")-1, jy4+14-1);
      fill(white);
      text("Residences", jx4-1-5-textWidth("Residences"), jy4+14);

      fill(black);
      text(budget, jx4-5-textWidth(budget)-1, jy4-1+29-1);
      fill(white);
      text(budget, jx4-5-textWidth(budget), jy4-1+29);
    }
    /////////////////////////////////////////////////////////////////

    // draw line ////////////////////////////////////////////////////
    pushStyle();

    stroke(grey);
    strokeWeight(3);
    float x1, y1, x2, y2;
    float slope1;


    if (label.equals("Student Organizations")) {
      x1 = orgList.get(orgList.size()-1).jx3;
      y1 = orgList.get(orgList.size()-1).jy3 + 6;
      x2 = orgList.get(orgList.size()-1).jx2;
      y2 = orgList.get(orgList.size()-1).jy2 + 6;
      line(x1, y1, x2, y2);

      x1 = centerColumnX - centerColumnWidthLeft ;
      slope1 = ((y2 - vPointY1)/(x2 - vPointX1));
      y1 = y2 + (slope1*(x1-x2)) + 10;
      line(x1, y1, x2, y2);

      x2 = centerColumnX;
      y2 = y + h + 10;
      line(x1, y1, x2, y2);

      x1 = centerColumnX + centerColumnWidthRight + 10;
      y1 = y3 + 4;
      line(x1, y1, x2, y2);

      x2 = x1;
      y2 = y3-(h/2);
      line(x1, y1, x2, y2);

      fill(grey);
      ellipse(x2, y2, 5, 5);
    }
    else {
      x1 = orgList.get(orgList.size()-1).kx3+3;
      y1 = orgList.get(orgList.size()-1).ky3 + 13;
      x2 = orgList.get(orgList.size()-1).kx4;
      y2 = orgList.get(orgList.size()-1).ky4 + 13;
      line(x1, y1, x2, y2);

      x1 = orgList.get(0).jx3-3;
      slope1 = ((y2 - vPointY2)/(x2 - vPointX2));
      y1 = y2 + (slope1*(x1-x2));
      line(x1, y1, x2, y2);

      x2 = x1;
      y2 = y1 - ((orgList.get(orgList.size()-1).y - orgList.get(0).y))+10;
      if (y2 < y) {
        y2 = y+(h);
      }
      line(x1, y1, x2, y2);

      x1 = centerColumnX + centerColumnWidthRight + 10;
      slope1 = ((y2 - vPointY2)/(x2 - vPointX2));
      y1 = y2 + (slope1*(x1-x2));
      line(x1, y1, x2, y2);

      x2 = x1;
      y2 = y3-(h/2);
      line(x1, y1, x2, y2);

      fill(grey);
      ellipse(x2, y2, 5, 5);
    }
    popStyle();
    /////////////////////////////////////////////////////////////////
    popStyle();
  }
}






