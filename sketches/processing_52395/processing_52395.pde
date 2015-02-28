
import processing.opengl.*;

Trail[] trails = new Trail[17];
Arrows[] arrows = new Arrows[17];
Info[] info = new Info[17];
Photograph[] photo = new Photograph[382];


PFont f;
PFont fLarge;
 




float marginX = 37;
float topMargin = 76;
float topMargin2;
int lightRows = 9;
int rowHeight;
int column2 = 187;
int column3 = 270;
int column4 = 361;
float mile = 62.5;
float damping = 0.2;

float zoomedTrail;




boolean distanceSort = false;
boolean nameSort = false;
boolean dateSort = true;
boolean slopeSort = false;





void setup() {
  size(1024, 768, OPENGL);
  smooth();
  frameRate(60);
  f = loadFont("TheSerif-Plain-12.vlw");
  fLarge = loadFont("TheSerif-Plain-28.vlw");

  rowHeight = (int)(height-topMargin)/(lightRows*2);
  topMargin2 = topMargin + rowHeight/2;
  

  trails[0] = new Trail(0, "mirror lake", "06.25.2006", 2.0, 600.0, "no", height/2, 1, 33);
  trails[1] = new Trail(1, "cape point lookout", "07.03.2006", 5, 450, "no", height/2, 34, 26);
  trails[2] = new Trail(2, "little si", "07.30.2006", 5, 1200, "yes",  height/2, 60, 14);
  trails[3] = new Trail(3, "beacon rock", "09.08.2007", 2, 680,  "no",  height/2,74, 30);
  trails[4] = new Trail(4, "lake 22", "07,13,2008", 5, 1300,  "no",  height/2, 104, 31); 
  trails[5] = new Trail(5, "ashland lakes", "07.26.2008", 3.5, 500, "no",  height/2, 135, 28);
  trails[6] = new Trail(6, "beaver lake", "08,22,2009",3, 0,"no",  height/2, 163, 22);
  trails[7] = new Trail(7, "mount si", "09.03.2009", 8, 3150, "yes, this was the first difficult hike",  height/2, 185, 7);
  trails[8] = new Trail(8, "west tiger 3", "02.27.2010",5.5, 2100, "no, our pace was slow",  height/2,192, 12);
  trails[9] = new Trail(9, "heather lake", "07.31.2010", 4, 1000, "no",  height/2, 204, 26);
  trails[10] = new Trail(10, "twin falls", "04.17.2010", 3.5, 300, "no",  height/2, 230, 29);
  trails[11] = new Trail(11, "mount si", "08.07.2010", 8, 3150, "yes, every time",  height/2, 259, 10);
  trails[12] = new Trail(12, "nisqually wildlife refuge", "03.27.2011", 5.5, 0, "no",  height/2, 269, 14);
  trails[13] = new Trail(13, "rattlesnake mnt.", "07.03.2011",5, 1200, "yes",  height/2,  283, 15);
  trails[14] = new Trail(14, "mount si", "07.17.2011", 8, 3150, "yes, it was hard to keep up with my friend",  height/2,298, 15);
  trails[15] = new Trail(15, "rattlesnake ledge", "11.20.2011", 4, 1160, "yes, it was icy", height/2, 313, 58);
  trails[16] = new Trail(16, "central peak", "01.29.2012", 3, 800, "no, we got lazy",  height/2, 371, 12);
  

  
  //arrow and info arrays initialize and load
  for(int i = 0; i < trails.length; i++) {
    info[i] = new Info(trails[i]);
    arrows[i] = new Arrows(info[i]);
    //arrows[i].load();
  }
  //load photos
  for(int i = 0; i < trails.length; i++) {
    trails[i].loadPhoto();
  }


}

void draw() {
  
  drawBackground();
  sortingSelectDisplay();
  captions();
  
  //trails position
  
  for(int i = 0; i < trails.length; i++) {
    float posY = topMargin2 + i * rowHeight;
    trails[i].position(posY);
  }

  //trail display
  
  int stackIndex = 0;
  while(stackIndex < trails.length) {
    for(int i = 0; i < trails.length; i++) {
      if(trails[i].stackOrder == stackIndex) {
        trails[i].display(i);
      }
    }
    stackIndex++;
  }
  

  topRect();
  
  for(int i = 0; i < trails.length; i++) {
    trails[i].drawArrows();
  }
  
  /* initially, i tried to stick with one set of photos and zoom those, however, I ran into issues
  with the gray rectangles masking my photographs. so in the end, I decided to just draw the photos again
  in a more convinient spot */
  for(int i = 0; i < trails.length; i++) {
    trails[i].bigPhoto();
  }
  
  for(int i = 0; i < arrows.length; i++) {
    arrows[i].infoBoxStuff();
  }

}


void captions() {
  fill(255);
  textFont(f, 12);
  text("SORT BY:", marginX, topMargin - 35);
  text("name", marginX, topMargin - 6);
  text("date", column2, topMargin - 6);
  text("average slope", column3, topMargin -6);
  text("distance traveled", column4, topMargin - 6);
  textFont(fLarge, 14);
  text("Catherine's Hiking Adventures", width - 250, 40);
}

void sortingSelectDisplay() {
  fill(0);
  noStroke();
  if (nameSort) {
    rect(0, topMargin - 22, (column2 - 2), 22);
  } else if(dateSort) {
    rect(column2 - 5, topMargin - 22, (column3 - column2 -2), 22);
  } else if(slopeSort) {
    rect(column3 - 5, topMargin - 22, (column4 - column3 - 2), 22);
  } else if(distanceSort) {
    rect(column4 - 5, topMargin - 22, (column4 - column3 + 30), 22);
  }


}

void drawBackground() { //draws the striped background
  noStroke();
  background(64);
  fill(80);
  
  //draws the light background rectangles.
  for(int i = 0; i < lightRows; i++){
    rect(0, topMargin + rowHeight*2*i, width, rowHeight);
  }  
  
  
  //highlights the selection
  for(int i = 0; i < trails.length; i++) {
    if(trails[i].isZoomed) {
      fill(99, 129, 117);
      rect(0, zoomedTrail-rowHeight/2, width, rowHeight);
    } else {
      if(mouseY > topMargin && mouseY < topMargin + rowHeight * (lightRows*2 - 1)) {
        int row = (int)(mouseY - topMargin)/rowHeight;
        fill(0);
        rect(0, row*rowHeight + topMargin, width, rowHeight);
      }
    }
  }
  
  
  
  
  
}

void topRect() { //addition to black rectangles (over the coverup gray rectangles)
  
  for(int i = 0; i < trails.length; i++) {
    if(trails[i].isZoomed) {
      fill(99, 129, 117);
      rect(trails[i].x2-2, trails[i].y - rowHeight/2, width, rowHeight);
    } else {
      if(mouseY > topMargin && mouseY < topMargin + rowHeight * (lightRows*2 - 1)) {
        int row = (int)(mouseY - topMargin)/rowHeight;
        fill(0);
        rect(trails[row].x2-2, row*rowHeight + topMargin, width, rowHeight);
      }
    }
  }
}






void mouseClicked() {  
  
  for(int i = 0; i < trails.length; i++) {
    trails[i].onMousePressed();
  }
  int stackIndex = trails.length - 1;
  while(stackIndex >= 0) {
    for(int i = 0; i < trails.length; i++) {
      if (trails[i].stackOrder == stackIndex) {
        if (trails[i].isZoomed) {
          changeStackOrder(i);
          stackIndex = 0;
          break;
        }
      }
    }
    stackIndex--;
  }
}
  

void mouseDragged() {
  for(int i = 0; i < trails.length; i++) {
    trails[i].onMouseDragged();
  }
}



//sorting mechanism
void mousePressed() {
  if (mouseY < topMargin && mouseY > 60) {
    if (mouseX > marginX && mouseX < (column2 - 10)) {
      Arrays.sort(trails, new SortObjects("name"));
      nameSort = true;
      dateSort = false;
      slopeSort = false;
      distanceSort = false;
      
    } else if (mouseX > column2 && mouseX < (column3 - 10)) {
      Arrays.sort(trails, new SortObjects("date"));
      nameSort = false;
      dateSort = true;
      slopeSort = false;
      distanceSort = false;
      
    } else if (mouseX > column3 && mouseX < (column4 -10)) {
      Arrays.sort(trails, new SortObjects("slope"));
      nameSort = false;
      dateSort = false;
      slopeSort = true;
      distanceSort = false;
     
    } else if (mouseX > column4 && mouseX < (column4 + 100)) {
      Arrays.sort(trails, new SortObjects("distance"));
      nameSort = false;
      dateSort = false;
      slopeSort = false;
      distanceSort = true;
    }
  }
}





void changeStackOrder(int selectedIndex) {
  int prevIndex = trails[selectedIndex].stackOrder;
  int stackIndex = prevIndex;
  while (stackIndex < trails.length - 1) {
    for (int i = 0; i < trails.length; i++) {
      if (trails[i].stackOrder == stackIndex + 1) {          
        trails[i].stackOrder = stackIndex; 
        break;
      }
    }
    stackIndex++;
  }    
  trails[selectedIndex].stackOrder = trails.length - 1;
}





