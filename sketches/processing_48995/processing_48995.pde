
/*
Wade Shumaker; Feb '11
wshumaker@ist.psu.edu
Penn State; College of IST
Weblog Visualization: 24hrs of visitor IPs
personal.psu.edu/wrs15

Controls:
s key = rotate via mouseY
mouseclick toggles perspective/orthographic views
t = top view
r = right view
f = front
Filtering via mouse position in "Set IP" and "Set Range" rectangles
x filters x axis
y filters y
z filters z
b filters size
c filters color
*/ 

String[] lines; // array for lines of data
String[] IP = new String[1]; // array to store unique IPs
int IPnum[] = new int[0]; // array for # of pageviews for each IP
int firsttime = 0; // used to load first IP into IP[]
PFont fontA;
int xIP = 255, xRng = 255, yIP = 255, yRng = 255, zIP = 255, zRng = 255, bigIP = 255, bigRng = 255, pgVu = 255, pgVuRng = 255;
float ipMin, ipMax;
int bck = 140;


import peasy.*;
PeasyCam camera;

void setup () {

  size(600, 610, P3D);

  ipMin = width*0.1;
  ipMax = width*0.9;
  println(ipMin);
  println(ipMax);
  noFill();
  stroke(255);
  fontA = loadFont("ArialNarrow-Bold-24.vlw");
  textFont(fontA, 36);
  stroke(0);
  camera = new PeasyCam(this, width/2, height/2, -300, 850);
//  camera.setMaximumDistance(5000);
//  camera.setMinimumDistance(3000);


  // Find all the unique IPs in the log
  lines = loadStrings("TestLogBigipOnly.txt"); // load data
  
  for(int i = 0; i < lines.length; i++) { // cycle thru each line of data
    int count = 0; // keeps track of whether new IP is in IP[] already
    
    if(firsttime == 0) { // add 1st IP to array
      IP[i] = lines[i];
//      IPs[i] = lines[i];
      firsttime = firsttime+1; 

    } else { // END IF // after 1st time, do this
      for(int j = 0; j < IP.length; j++) { // cycle thru IP[]
        if(IP[j].equals(lines[i])) { // is new IP already in array....
        count = count + 1; //... if not, increment count
       }
      }  
       if(count == 0) { // if count is 0, this is a new IP so....
        IP = append(IP, lines[i]); // ... add it to array
       }
    } // END ELSE
  } // END FOR 
  
// Now find # of pageviews for each IP
  for(int i = 0; i < IP.length; i++) { // cycle thru unique IPs
    int IPcount = 0; // reset counter for # of pageviews for each IP
    for(int j = 0; j < lines.length; j++) { // cycle thru data
//      String[] data = split(lines[j], ' '); // bust line of data into elements
      if(IP[i].equals(lines[j])) { // start checking IP occurrences/pageviews
      IPcount = IPcount + 1; // increment count w/ each match/pageview
      }
   } // END FOR lines
   IPnum = append(IPnum, IPcount); // add pageviews to array
  } // END FOR IP
} // END SETUP

void draw() {

  background(bck);
  rectMode(CORNER);
  stroke(0);
  camera.beginHUD(); // PeasyCam HUD  makes key/legend stay put
  rect(ipMin, ipMax + ipMax*0.04, 2*ipMin, ipMin/4); // draw rectangles for slider controls
  rect(4*ipMin, ipMax + ipMax*0.04 , 2*ipMin, ipMin/4);
  rect(7*ipMin, ipMax + ipMax*0.04, ipMin, ipMin/4);
  textFont(fontA, 16);
  textAlign(CENTER); 
  text("24 Hrs. of Weblog Visitor IPs", width/2, 0.05*height);
  text("Set Value", 2*ipMin, ipMax+ipMax*0.062, 0);
  text("Set Range", 5*ipMin, ipMax+ipMax*.062, 0);
  text("Reset", 7*ipMin + ipMin/2, ipMax+ipMax*0.062, 0);
  text("Values: x, y, z;  s = size;  c = object color;  b = background color", width/2, height*0.98);
  camera.endHUD(); // End HUD
  textAlign(LEFT);
  rectMode(CENTER);

  grphAxes(); // draw the axes
  drawRect(); // draw the rectangles
  
// Manipulate the view: ortho vs perspective
  if(mousePressed && (mouseX > 7*ipMin) && (mouseX < 8*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax + ipMax*0.04 + ipMin/4)) {
    xIP = 128;
    xRng = 128;
    yIP = 128;
    yRng =128;
    zIP = 128;
    zRng = 128;
    bigIP =128;
    bigRng = 128;
    pgVu = 
    pgVuRng = 128;
  }
} // END DRAW

// Manipulate the view: front, top, right vew
// Set the IPs and ranges
void keyPressed() {
  if(key == 't') {  //-------------------------------- top view
    camera(width/2, -height, -height/2, // eyeX, eyeY, eyeZ
         width/2, height/2, -height/2, // centerX, centerY, centerZ
         0.0, 0.0, 1.0); // upX, upY, upZ
         
  } else if (key == 'f') { //------------------------- front view (default cam position)
    camera(width/2, height/2, (height/2.0) / tan(PI*60.0 / 360.0),  // eyeX, eyeY, eyeZ
         width/2, height/2, 0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
         
  } else if (key == 'r') { // ------------------------- right view
    camera(width*2, height/2, -height/2, // eyeX, eyeY, eyeZ
         width*.1, height/2, -height/2, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
         
  } else if(key == 'x') {  // set xIP equal to mouseX position when X key is hit
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      xIP = int (map(mouseX, ipMin, 3*ipMin, 0, 255));
    } // set x Range when Xkey is held
    if((mouseX > 4*ipMin) && (mouseX < 6*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      xRng = int (map(mouseX, 4*ipMin, 6*ipMin, 0, 128));
    }
    
  } else if(key== 'y') { // Same for y (see above comments)
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      yIP = int (map(mouseX, ipMin, 3*ipMin, 0, 255));
    } 
    if((mouseX > 4*ipMin) && (mouseX < 6*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      yRng = int (map(mouseX, 4*ipMin, 6*ipMin, 0, 128));
    } // END if
    
   }  else if(key== 'z') { // Same for y (see above comments)
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      zIP = int (map(mouseX, ipMin, 3*ipMin, 0, 255));
    } 
    if((mouseX > 4*ipMin) && (mouseX < 6*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      zRng = int (map(mouseX, 4*ipMin, 6*ipMin, 0, 128));
    } // END if
    
   } else if(key== 's') { // Size of squares; Same for y (see above comments)
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      bigIP = int (map(mouseX, ipMin, 3*ipMin, 0, 255));
    } 
    if((mouseX > 4*ipMin) && (mouseX < 6*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      bigRng = int (map(mouseX, 4*ipMin, 6*ipMin, 0, 128));
    } // END if
    
   } else if(key== 'c') { // color of squares; Same for y (see above comments)
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      pgVu = int (map(mouseX, ipMin, 3*ipMin, 10, 255));
    } 
    if((mouseX > 4*ipMin) && (mouseX < 6*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      pgVuRng = int (map(mouseX, 4*ipMin, 6*ipMin, 0, 128));
    } // END if    
   
   } else if(key== 'b') { // color of bckgrnd; Same for y (see above comments)
    if((mouseX > ipMin) && (mouseX < 3*ipMin) && (mouseY > ipMax + ipMax*0.04) && (mouseY < ipMax+ ipMax*0.04 + ipMin/4)) {
      bck = int (map(mouseX, ipMin, 3*ipMin, 30, 200));
    }
  } // END if
  
    if(key == 'p') { // toggle ortho/persp view on mouse click
      ortho(-width/1.6, width/1.6, -height/1.6, height/1.6, -10, 10); 
       }
  } // END keyPressed
  
  void keyReleased() { // change back to perspective view
    if (key == 'p') {
      float fov = PI/3.0;  
      float cameraZ = (height/2.0) / tan(PI * fov / 360.0); 
      perspective(fov, float(width)/float(height), 
                cameraZ/2.0, cameraZ*2.0); 
    }
  }
 
void grphAxes() {
  // draw axes
  stroke(0);
  strokeWeight(4);
  line(ipMin,ipMax,0, ipMax,ipMax,0); // x axis
  line(ipMin,ipMax,0, ipMin,ipMin,0); // y axis
  line(ipMin,ipMax,0, ipMin,ipMax,-ipMax); // z axis
  strokeWeight(1);
  fill(0,50);
  rectMode(CORNER);
 // rect(ipMin,ipMax,ipMax-ipMin,-ipMax+ipMin); // to help the eye w/ depth
  rectMode(CENTER);
  fill(255);
  text("X", ipMax, ipMax, 0);
  text("Y", ipMin, ipMin,0);
  text("Z", ipMin,ipMax,-ipMax);
  noFill();  
} // END grphAxes

void drawRect() {
/* create rectangles based on IP
  X location = octet 1; Y = octet 2; Z = 3;
  size of rectangle = 4; color/brighness = # of pageviews
*/
  int counter = 0;
  int countmax = 0;
  for(int i = 0; i < IP.length; i++) { // loop thru array of IPs
    String[] pts = split(IP[i], '.'); // split IP into octets
//    noStroke(); // TOGGLE THIS OFF TO GET LINES AROUND CIRCLES
    int alph =(IPnum[i]); // base color on # of pageviews
    if (alph > 1000) { alph = 1000; } // 3 outlyers of 2541, 1308 & 1262 pageviews
    int alphmap = int(map(alph, 0, 1000, 10, 255));
    stroke(alphmap);
    int x = int(pts[0]);              // octet 1
    int xx = int (map(x, 0, 255, ipMin, ipMax)); 
    int y = int (pts[1]);    // octet 2
    float yy = ipMax -  (map(y, 0, 255, ipMin, ipMax)) + ipMin;
    int z = int (pts[2]);            // octet 3
    int zz = int (map(z, 0, 255, 0, ipMax));
    int big = int(pts[3]);           // octet 4
    int bigbig = int (map(big, 0, 255, 2, width*.1));
    pushMatrix();
    translate(0, 0, -zz);    // base z location on octet 3

    // test x, y, z, big & IPnum (pageviews) and only draw rect based on settings
    if ((x >= (xIP - xRng)) && (x <= (xIP + xRng))) {
        if ((y >= (yIP - yRng)) && (y <= (yIP + yRng))) {
          if ((z >= (zIP - zRng)) && (z <= (zIP + zRng))) {
           if ((big >= (bigIP - bigRng)) && (big <= (bigIP + bigRng))) {
             if ((alphmap >= (pgVu - pgVuRng)) && (alphmap <= (pgVu + pgVuRng))) {
                rect(xx, yy, bigbig, bigbig); // draw rect/square to depict IP
                counter = counter +1; // keep track of # displayed
                if (countmax < counter) { // keep track of # displayed
                 countmax = counter; 
                }             
                if(keyPressed) { // display the ip's 
                  if(key == 'l') {
                   camera.beginHUD();
                   text(IP[i], width*.8, countmax*12+20);
                   camera.endHUD(); 
                  }
                }
             }
           }
         }
      }// END IF
    } // END IF
    popMatrix();
  } // END FOR IP LOOP
  camera.beginHUD();
  text ("IPs Displayed", width*.85, height*.94);
  text (countmax, width*.9, height*.97);
  camera.endHUD();
} // END drawRect



