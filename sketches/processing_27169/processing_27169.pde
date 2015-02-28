
/**
 *variations of ornamental patterns<br />
 *press '?' to toggle help<br />
 * by Peter Bosshard Schneider 2010
 */

PFont schrift;             // the font to use
String info;
String helptext;
String[] cmds;
String currentDatafile;
int currfileidx;
String[] datafiles;
float seite,halbeseite;    // side and half side of one triangle
float randou;              // margin top and bottom
float randlr;              // margin left and right
float dhoehe;              // height of one triangle
float bildhoehe;           // height of the drawing area
float bildbreite;          // width of the drawing area

float[] rasterpunktex;     // x coords of the triangle gridpoints
float[] rasterpunktey;     // y coords of the triangle gridpoints
float durchmesser;         // diameter of the big ellipses
float radius;              // radius of the big ellipses
float scalefactor = 0.575; // * side of triangle = diameter
int numpoints;             // number of points in the grid
int numjoints;

int kreisteile = 12;       // number of small ellipses per gridpoint
int minze = 7;             // minimal number of rows
int maxze = minze+1;       // maximal number of rows
int numrows;               // current number of rows 
float anginc = TWO_PI/kreisteile;  // angle increment for circlepoints

int nur[];                 // indices of the top right neighbour point in the grid if any else -1
int nbr[];                 // indices of the bottom right neighbour point in the grid if any else -1
int nbo[];                 // indices of the bottom neighbour point in the grid if any else -1

// graphics stuff
int currconfig = 0;
float stw = 1;             // stroke weight
float trans = 127;
int caps = 0;
color st_clr = color(255,255,255,trans);
color bg_clr = color ( 51,51,51,255);
boolean showgrid = false;
boolean showhelp = true;


void setup(){
  //noLoop();
  size(540,540);
  background(bg_clr);
  ellipseMode(CENTER);
  smooth();
  schrift=loadFont("SansSerif-10.vlw");
  textFont(schrift);
  helptext  = "MOUSE\nA mouseclick switches configurations\n";
  helptext += "which can be altered on the fly with the \nfollowing keys.\n\n";
  helptext += "KEYS:\n";
  helptext += "? - show/hide this help panel\n";
  helptext += "7 -> increase strokewidth\n";
  helptext += "4 -> restore default strokewidth\n";
  helptext += "1 -> decrease strokewidth\n";
  helptext += "8 -> increase opacity\n";
  helptext += "5 -> restore default opacity\n";
  helptext += "2 -> decrease opacity\n";
  helptext += "9 -> increase the number of cells\n";
  helptext += "6 -> restore default number of cells\n";
  helptext += "3 -> decrease the number of cells\n";
  helptext += "+ -> increase the diameter of the grid circles\n";
  helptext += ". -> restore default diameter of the grid circles\n";
  helptext += "- -> decrease the diameter of the grid circles\n";
  helptext += "0 -> swap foreground and background colour\n";
  helptext += "c -> switch between different stroke caps\n";
  helptext += "g -> show construction grid\n";
  helptext += "l -> load next datafile\n";
  //helptext += "s -> save a jpg image. (don't use in applet!)";
  datafiles = new String[18];
  datafiles[0] = "lines_arabesque.txt";
  datafiles[1] = "lines_alterparall.txt";
  datafiles[2] = "lines_enzian.txt";
  datafiles[3] = "lines_faltung.txt";
  datafiles[4] = "lines_geflecht.txt";
  datafiles[5] = "lines_kirchlein.txt";
  datafiles[6] = "lines_parallel.txt";
  datafiles[7] = "lines_rhom.txt";
  datafiles[8] = "lines_rhomben.txt";
  datafiles[9] = "lines_rhomesque.txt";
  datafiles[10] = "lines_simple.txt";
  datafiles[11] = "lines_spindly.txt";
  datafiles[12] = "lines_splitt.txt";
  datafiles[13] = "lines_splitty.txt";
  datafiles[14] = "lines_trueffel.txt";
  datafiles[15] = "lines_unangenehm.txt";
  datafiles[16] = "lines_wuerfel.txt";
  datafiles[17] = "lines_zion.txt";
  currfileidx = 0;
  currentDatafile = datafiles[currfileidx];
  setupParams();
}

void setupParams(){      // set proportions of the drawing area and the triangle grid
  randou = height/7;
  bildhoehe = (height-(2*randou));
  seite = bildhoehe/minze;
  halbeseite = seite/2.0;
  dhoehe = sqrt((seite*seite)-(halbeseite*halbeseite));
  numrows = int(width/dhoehe)-1;
  bildbreite = numrows*dhoehe;
  randlr = (width-bildbreite)/2;
  durchmesser = scalefactor*seite; // align 11 and 5
  maxze = minze+1;

  // count how many gridpoints to create
  numpoints=0;
  int currow=numrows;
  boolean gerade = false;
  while (currow >= 0){
    if(gerade){
      numpoints += maxze;
      gerade = false;
    }
    else{
      numpoints += minze;
      gerade = true;
    }
    currow--;
  }

  // fill arrays with grid coordinates
  rasterpunktex = new float[numpoints];
  rasterpunktey = new float[numpoints];

  int cnt = 0;     // current index
  int numz = 0;    // current number of rows
  int spalte = 0;  // current column
  float x = 0;     // x-coord
  float y = 0;     // y-coord
  float offy = 0;  // y-offset for short columns

  while(cnt<=rasterpunktex.length-1){       // while the array is not full
    if(spalte%2 == 0){                      // on even columns
      offy = halbeseite;                    // set the offset to half the side of a triangle
      numz = minze;                         // set the number of rows to the minimum
    }
    else{                                   // on odd columns
      offy = 0;                             // set the offset to zero
      numz = maxze;                         // set the number of rows to the maximum
    }
    float offx = spalte*dhoehe;             // set the horizontal offset
    for(int zeile=0; zeile<numz;zeile++){   // with every row in the current column do
      y = offy+zeile*seite;                 // calculate the y-coord
      x = offx;                             // calculate the x-coord
      if(cnt<=rasterpunktex.length-1){      // if the array is still not full
        rasterpunktex[cnt] = x+randlr;      // save the x-coord and add the leftmargin
        rasterpunktey[cnt] = y+randou;      // save the y-coord and add the topmargin
      }
      cnt++;                                // increment the point counter
    }
    spalte++;                               // increment the column counter
  }

  // determine neighbours of the grid points
  nur = new int[numpoints];                 // indices of the top right neighbour point in the grid if any else -1
  nbr = new int[numpoints];                 // indices of the bottom right neighbour point in the grid if any else -1
  nbo = new int[numpoints];                 // indices of the bottom neighbour point in the grid if any else -1

  int numlcol = numpoints/(maxze+minze);    // how many long columns
  int numscol = numpoints/(maxze+minze);    // how many short columns
  if(numpoints - (numscol*(maxze+minze)) >  0){ // if odd number of short columns
    numscol++;                                  // add one
  }

  //println("short: " + numscol + " long: " + numlcol);
  int numcolumns = numscol+numlcol;
  int currcol = 0;
  boolean isshort = true;
  for(int i=0;i<numpoints;i++){

    if(i%(maxze+minze) == 0){
      currcol ++;
      isshort = true;
    }
    else if(i%(maxze+minze) == maxze-1){
      isshort = false;
      currcol ++;
    }
    if ((isshort == true) && (currcol< numcolumns) && (i < (minze-1+((currcol/2))*(maxze+minze)))){
      nur[i] = i+maxze-1;
      nbr[i] = i+maxze;
      nbo[i] = i+1;
    }
    else if ((isshort == false) && (currcol<numcolumns) && (i<((currcol/2)*(maxze+minze)-1))&&(i>((currcol/2)*(maxze+minze)-maxze))){
      nur[i] = i+minze;
      nbr[i] = i+minze+1;
      nbo[i] = i+1;
    }
    else if((isshort == true) && ((i % (maxze+minze) == minze-1)||(i==minze-1)) && (i<numpoints-maxze)){
      nur[i] = i+maxze-1;
      nbr[i] = i+maxze;
      nbo[i] = -1;
    }
    else if((isshort == false)&&(i % (minze+maxze) == minze) && (i<numpoints-1-maxze)){
      nur[i] = -1;
      nbr[i] = i+minze+1;
      nbo[i] = i+1;
    }
    else if((isshort == false) && ((i % (maxze+minze) == (maxze+minze)-1)||(i==(maxze+minze)-1)) && (i<numpoints-minze)){
      nur[i] = i+minze;
      nbr[i] = -1;
      nbo[i] = -1;
    }
    else if((isshort == false) && (i>numpoints-1-maxze) && (i<numpoints-1)){
      nur[i] = -1;
      nbr[i] = -1;
      nbo[i] = i+1;
    }
    else if((isshort == true) && (i>numpoints-1-minze) && (i<numpoints-1)){
      nur[i] = -1;
      nbr[i] = -1;
      nbo[i] = i+1;
    }
    else{
      nur[i] = -1;
      nbr[i] = -1;
      nbo[i] = -1;
    }
  }
  info = "div: " + kreisteile + " min: " + minze + " max: " + maxze + " stw: " + int(stw) + " alpha: " + int(trans) + " scale: " + nf(scalefactor,1,3);
  loadData();
}


/////////////////////////////////////////// Draw everything ////////////////////////////
void draw(){
  background(bg_clr);
  noStroke();
  radius = durchmesser/2.0;
  if(showgrid==true){                              // draw big ellipses on the gridpoints
    for(int i=0;i<rasterpunktex.length;i++){
      noFill();
      stroke(51,153,255,100);
      strokeWeight(1);
      ellipse(rasterpunktex[i],rasterpunktey[i],durchmesser,durchmesser);
      fill(0,51,153,255);
      text(i,rasterpunktex[i],rasterpunktey[i]);
    }
  }

  // draw connection to neighbours
  float xc,yc,currangle,nextangle;
  for(int i=0;i<numpoints;i++){
    xc = rasterpunktex[i];
    yc = rasterpunktey[i];
    currangle = TWO_PI-PI/2;
    nextangle = TWO_PI-PI/2;
    float spx,spy,zpx,zpy,nx,ny;

    // inner connections
    for(int cmd = 0;cmd<cmds.length;cmd++){
      String quelltypus = cmds[cmd].substring(0,1);
      String zieltypus = cmds[cmd].substring(3,4);
      int qnum = parseInt(cmds[cmd].substring(1,3));
      int znum = parseInt(cmds[cmd].substring(4,6));
      if(quelltypus.equals(zieltypus)){
        drawConnection(xc,yc,qnum,xc,yc,znum);
      }
    }

    // upper right neighbour
    if(nur[i] > -1){
      nx = rasterpunktex[nur[i]];
      ny = rasterpunktey[nur[i]];
      // draw gridlines
      if(showgrid == true){
        stroke(0,255,0,200);
        strokeWeight(1);
        line(xc,yc,nx,ny);
      }
      // connect uppermost points
      for(int cmd = 0;cmd<cmds.length;cmd++){
        String quelltypus = cmds[cmd].substring(0,1);
        String zieltypus = cmds[cmd].substring(3,4);
        int qnum = parseInt(cmds[cmd].substring(1,3));
        int znum = parseInt(cmds[cmd].substring(4,6));
        if(zieltypus.equals("B")){
          drawConnection(xc,yc,qnum,nx,ny,znum);
        }
      }
    }

    // lower right neighbour
    if(nbr[i] > -1){
      nx = rasterpunktex[nbr[i]];
      ny = rasterpunktey[nbr[i]];
      if(showgrid == true){
        stroke(255,255,0,200);
        strokeWeight(1);
        line(xc,yc,nx,ny); // draw gridlines
      }
      for(int cmd = 0;cmd<cmds.length;cmd++){
        String quelltypus = cmds[cmd].substring(0,1);
        String zieltypus = cmds[cmd].substring(3,4);
        int qnum = parseInt(cmds[cmd].substring(1,3));
        int znum = parseInt(cmds[cmd].substring(4,6));
        if(zieltypus.equals("C")){
          drawConnection(xc,yc,qnum,nx,ny,znum);
        }
      }
    }

    // bottom neighbour
    if(nbo[i] > -1){
      nx = rasterpunktex[nbo[i]];
      ny = rasterpunktey[nbo[i]];
      if(showgrid == true){
        stroke(255,0,255,200);
        strokeWeight(1);
        line(xc,yc,nx,ny); // draw gridlines
      }
      for(int cmd = 0;cmd<cmds.length;cmd++){
        String quelltypus = cmds[cmd].substring(0,1);
        String zieltypus = cmds[cmd].substring(3,4);
        int qnum = parseInt(cmds[cmd].substring(1,3));
        int znum = parseInt(cmds[cmd].substring(4,6));
        if(zieltypus.equals("D")){
          drawConnection(xc,yc,qnum,nx,ny,znum);
        }
      }
    }
    if(showgrid == true){
      fill(255);
      showLabel(info,width/2,height-10);
    }
  }

  if(showhelp == true){
    stroke(153,153,153,200);
    strokeWeight(1);
    fill(255,200);
    rectMode(CORNER);
    rect(width/2-125,height/2-180,250,360);
    fill(0);
    textAlign(LEFT);
    text(helptext,width/2-110,height/2-150);
  }
}

/////////////////////////// Draw Connections //////////////////////////////////
void drawConnection(float sx, float sy, int spn, float nx, float ny, int npn){
  float cang = TWO_PI-(PI/2)+(spn*anginc);
  float nang = TWO_PI-(PI/2)+(npn*anginc);
  float s_px = sx - (cos(cang)*radius);
  float s_py = sy + (sin(cang)*radius);
  float z_px = nx - (cos(nang)*radius);
  float z_py = ny + (sin(nang)*radius);
  stroke(st_clr);
  strokeWeight(stw);
  line(s_px,s_py,z_px,z_py);
  if(showgrid==true){
    textAlign(CENTER);
    fill(255,0,0,255);
    text(spn,s_px,s_py);
    text(npn,z_px,z_py);
  }
}


//////////////////// Klick to change config //////////////////
void mouseReleased(){
  currconfig ++;
  if(currconfig > 4){
    currconfig = 0;
  }
  switch(currconfig){
    // default config
  case 0:                 // view lines only
    stw = 1;             // stroke weight
    strokeCap(ROUND);
    st_clr = color(255,255,255,trans);
    bg_clr = color ( 51,51,51,255);
    showgrid = false;
    minze = 7;            // minimal number of rows
    maxze = minze+1;      // maximal number of rows
    break;

    // default config with grid
  case 1:                 // view grid
    stw = 3;              // stroke weight
    strokeCap(ROUND);
    st_clr = color(51,51,51,trans);
    bg_clr = color ( 204,204,204,255);
    showgrid = true;
    minze = 2;             // minimal number of rows
    maxze = minze+1;       // maximal number of rows
    break;

    // color variation
  case 2:                 // view drawing
    stw = 5;             // stroke weight
    strokeCap(ROUND);
    st_clr = color(255,153,0,trans);
    bg_clr = color (0,51,102,trans);
    showgrid = false;
    minze = 5;             // minimal number of rows
    maxze = minze+1;       // maximal number of rows
    break;

    // color variation
  case 3:                 // view drawing
    stw = 5;             // stroke weight
    strokeCap(ROUND);
    st_clr = color(102,204,153,trans);
    bg_clr = color (51,26,51,trans);
    showgrid = false;
    minze = 5;             // minimal number of rows
    maxze = minze+1;       // maximal number of rows
    break;

    // color variation
  case 4:                 // view drawing
    stw = 5;             // stroke weight
    strokeCap(ROUND);
    st_clr = color(153,204,255,trans);
    bg_clr = color (255,204,153,trans);
    showgrid = false;
    minze = 5;             // minimal number of rows
    maxze = minze+1;       // maximal number of rows
    break;
  }
  setupParams();
}


///////////////////////////////////////// Save JPG Image //////////////////////
void keyPressed(){
  String filename = "opat" + day() + "_" + month() + "_" + year() + "_" + hour() + "_" + minute() + "_" + second() + ".jpg";
  switch(key){
  case 'l':
    currfileidx++;
    if(currfileidx>datafiles.length-1){
      currfileidx = 0;
    }
    currentDatafile = datafiles[currfileidx];
    setupParams();
    break;
    //  case 's':
    //    save(filename);
    //    break;
  case '+':
    if((scalefactor*seite) < 2*dhoehe){
      scalefactor+=0.05;
      setupParams();
      break;
    }
    break;
  case '-':
    if((scalefactor*seite) > (seite/dhoehe)){
      scalefactor-=0.05;
      setupParams();
      break;
    }
    break;
  case '.':
    scalefactor = 0.575;
    setupParams();
    break;
  case '7':
    if(stw < 100){
      stw++;
      setupParams();
      break;
    }
    break;
  case '1':
    if(stw > 1){
      stw--;
      setupParams();
      break;
    }
    break;
  case '4':
    stw=10;
    break;
  case '8':
    if(trans < 255){
      trans+=8;
      st_clr = color(red(st_clr),green(st_clr),blue(st_clr),trans);
      setupParams();
      break;
    }
    break;
  case '2':
    if(trans > 13){
      trans-=8;
      st_clr = color(red(st_clr),green(st_clr),blue(st_clr),trans);
      setupParams();
      break;
    }
    break;
  case '5':
    trans = 127;
    st_clr = color(red(st_clr),green(st_clr),blue(st_clr),trans);
    setupParams();
    break;
  case '9':
    if(minze < 20){
      minze++;
      setupParams();
      break;
    }
    break;
  case '3':
    if(minze > 3){
      minze--;
      setupParams();
      break;
    }
    break;
  case '6':
    minze = 5;
    setupParams();
    break;
  case '0':
    color tempclr = color(red(st_clr),green(st_clr),blue(st_clr),trans);
    st_clr = color(red(bg_clr),green(bg_clr),blue(bg_clr),trans);
    bg_clr = tempclr;
    setupParams();
    break;
  case 'g':
    showgrid = !showgrid;
    setupParams();
    break;
  case '?':
    showhelp = !showhelp;
    setupParams();
    break;
  case 'c':
    if(caps<2){
      caps++;
    }
    else{
      caps=0;
    }
    switch(caps){
    case 0:
      strokeCap(ROUND);
      break;
    case 1:
      strokeCap(SQUARE);
      break;
    case 2:
      strokeCap(PROJECT);
      break;
    }
    setupParams();
    break;
  }
}

/////////////////////////////////////////// Show text label ////////////////////
void showLabel(String txt, float x, float y){
  stroke(153,153,153,153);
  strokeWeight(15);
  float tw = textWidth(txt);
  line(x-tw/2,y,x+tw/2,y);  
  fill(255);
  textAlign(CENTER);
  text(txt,x,y+5);
}


//////////////////////////////////////////// load data file ////////////////////

void loadData(){
  cmds = loadStrings(currentDatafile);
}
























