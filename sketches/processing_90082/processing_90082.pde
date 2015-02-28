
import processing.opengl.*;
import java.util.Date;
import java.text.*;

float minBpm = MAX_FLOAT;
float minLoudness = MAX_FLOAT;
float minComplexity = MAX_FLOAT;
int minDate = MAX_INT;

float maxBpm = MIN_FLOAT;
float maxLoudness = MIN_FLOAT;
float maxComplexity = MIN_FLOAT;
int maxDate = MIN_INT;

PImage header;

long startDate;
long endDate;
float smoothing;

Listen[] listens;

ArrayList<float[]> bpmGraph;
ArrayList<float[]> loudnessGraph;
ArrayList<float[]> complexityGraph;

ArrayList<float[]> prevBpmGraph;
ArrayList<float[]> prevLoudnessGraph;
ArrayList<float[]> prevComplexityGraph;

PFont font;

int prevWidth;
int prevHeight;

int zoomLevel;
DateFormat dateFormat;

float slide;
float slowSlide;
float songSlide;

float prevBack;

float prevColor;

boolean init;

int songPopup;
int songPosX;

PImage theImage;

void setup() {
  //define window parameters
  size(1024, 576, OPENGL);
  
  //define global draw parameters
  rectMode(CENTER);
  ellipseMode(RADIUS);
  colorMode(HSB);
  stroke(128);
  
  font = createFont("cpmono.otf", 48);
  textAlign(CENTER, CENTER);
  textFont(font);
  
  //initiate zoom (0=all time; 1=two years; 2=one year; 3=six months; 4=two months; 5=one month; 6=two weeks; 7=one week; 8=one day)
  zoomLevel = 0;
  dateFormat = new SimpleDateFormat();
  
  //load data
  String[] lines = loadStrings("data.txt");
  listens = new Listen[lines.length];
  for (int i = 0; i < listens.length; i++) {
    String[] tokens = splitTokens(lines[i], "\t");
    listens[i] = new Listen(int(tokens[0]), tokens[1], tokens[2], float(tokens[3]), float(tokens[4]), float(tokens[5]), tokens[6]);
    //establish ranges
    if (listens[i].date < minDate) {
      minDate = listens[i].date;
    }
    if (listens[i].date > maxDate) {
      maxDate = listens[i].date;
    }
    if (listens[i].bpm < minBpm) {
      minBpm = listens[i].bpm;
    }
    if (listens[i].bpm > maxBpm) {
      maxBpm = listens[i].bpm;
    }
    if (listens[i].loudness < minLoudness) {
      minLoudness = listens[i].loudness;
    }
    if (listens[i].loudness > maxLoudness) {
      maxLoudness = listens[i].loudness;
    }
    if (listens[i].complexity < minComplexity) {
      minComplexity = listens[i].complexity;
    }
    if (listens[i].complexity > maxComplexity) {
      maxComplexity = listens[i].complexity;
    }
  }
  
  for (int i = 0; i < listens.length; i++) {
    listens[i].loudness += abs(minLoudness);
  }
  maxLoudness += abs(minLoudness);
  minLoudness = 0;
  
  //initialize toDraw data
  startDate = minDate;
  endDate = maxDate;
  smoothing = round(width / 106);
  
  header = loadImage("header.png");
  
  init = true;
  updateGraphs(true, true, true);
  prevBack = 220;
  
  prevColor = 42;
  
  songPopup = -1;
  songPosX = 0;
  
  songSlide = 0;
}

void draw() {
  slide += 0.2 * (1 - slide);
  slowSlide += 0.02 * (1 - slowSlide);
  songSlide += 0.2 * (1 - songSlide); 
  float back = prevBack + ((map(zoomLevel, 0, 8, 128, 0) - prevBack)) * slowSlide;
  prevBack = back;
  
  float thisColor = prevColor + ((map(zoomLevel, 0, 8, 42, 0) - prevColor)) * slowSlide;
  prevColor = thisColor;
  background(0);
  


  long numDays = (endDate - startDate) / 86400;
  noStroke();

  for (int i = 0; i <= numDays; i++) {
    int posX = round(map(i, 0, numDays, 0, width));
    beginShape();
    fill(255);
    vertex(posX, height * 0.2);
    vertex(posX + 1, height * 0.2);
    fill(0);
    vertex(posX + 1, height * 0.4);
    vertex(posX, height * 0.4);
    endShape(CLOSE);
    
    beginShape();
    fill(255);
    vertex(posX, height * 0.8);
    vertex(posX + 1, height * 0.8);
    fill(0);
    vertex(posX + 1, height * 0.6);
    vertex(posX, height * 0.6);
    endShape(CLOSE);
    
  }
  

  
  //establish screen size
  if (width != prevWidth || height != prevHeight) {
    smoothing = round(width / 106);
    init = true;
    prevWidth = width;
    prevHeight = height;
    updateGraphs(true, true, true);
  }
  
  fill(200, 255, 255);
  beginShape();
  vertex(0, height / 2);
  vertex(width, height / 2);
  vertex(width, height / 2 + 1);
  vertex(0, height / 2 + 1);
  endShape(CLOSE);
  
  //draw graphs
  noStroke();
  int first = 0;
  boolean open = false;
  for (int i = 0; i < loudnessGraph.size(); i++) {
    if (loudnessGraph.get(i)[1] > 0) {
      if (!open) {
        first = i;
        beginShape();
        open = true;
      }
      
      float complexitySlid = prevComplexityGraph.get(i)[1] + ((complexityGraph.get(i)[1] - prevComplexityGraph.get(i)[1]) * slide);
      float loudnessSlid = prevLoudnessGraph.get(i)[1] + ((loudnessGraph.get(i)[1] - prevLoudnessGraph.get(i)[1]) * slide);
      fill(25, complexitySlid, 64);
      vertex(loudnessGraph.get(i)[0], height / 2 - loudnessSlid / 2);
      if (i == loudnessGraph.size() - 1 || loudnessGraph.get(i + 1)[1] == 0) {
        if (i != first) {
          for (int j = i; j >= first; j--) {
            complexitySlid = prevComplexityGraph.get(j)[1] + ((complexityGraph.get(j)[1] - prevComplexityGraph.get(j)[1]) * slide);
            loudnessSlid = prevLoudnessGraph.get(j)[1] + ((loudnessGraph.get(j)[1] - prevLoudnessGraph.get(j)[1]) * slide);
            fill(25, complexitySlid, 255);
            vertex(loudnessGraph.get(j)[0], height / 2 + loudnessSlid / 2);
          }
        } else {
          fill(25, complexitySlid, 255);
          vertex(loudnessGraph.get(i)[0] + smoothing / 2, height / 2);
          fill(25, complexitySlid, 255);
          vertex(loudnessGraph.get(i)[0], height / 2 + loudnessSlid / 2);
          fill(25, complexitySlid, 255);
          vertex(loudnessGraph.get(i)[0] - smoothing / 2, height / 2);
        }
        endShape(CLOSE);
        open = false;
      }
    }
  }
  stroke(0);
  strokeWeight(2);
    rectMode(CORNER);
  fill(255);
  rect(0, 0, width, height / 5);
  image(header, 1, 1, width - 1, height / 5 - 1);
  rect(0, height * 0.8, width, height);
  

  fill(0);

  String startDateString = dateFormat.format(new Date(startDate * 1000));
  String endDateString = dateFormat.format(new Date(endDate * 1000));
  
  textAlign(CENTER, CENTER);
  
  textSize(height / 35);
  text("form", width / 8, height - (height / 9));
  textSize(height / 25);
  text(startDateString, width / 8, height - (height / 15)); 
  
  textSize(height / 22);
  text("showing", width / 2, height - (height / 10));
  textSize(height / 15);
  if (zoomLevel == 0) {
    text("All Time", width / 2, height - (height / 20));
  } else if (zoomLevel == 1) {
    text("Two Years", width / 2, height - (height / 20));
  } else if (zoomLevel == 2) {
    text("One Year", width / 2, height - (height / 20));
  } else if (zoomLevel == 3) {
    text("Six Months", width / 2, height - (height / 20));
  } else if (zoomLevel == 4) {
    text("Two Months", width / 2, height - (height / 20));
  } else if (zoomLevel == 5) {
    text("One Month", width / 2, height - (height / 20));
  } else if (zoomLevel == 6) {
    text("Two Weeks", width / 2, height - (height / 20));
  } else if (zoomLevel == 7) {
    text("One Week", width / 2, height - (height / 20));
  } else if (zoomLevel == 8) {
    text("One Day", width / 2, height - (height / 20));
  }
  
  textSize(height / 35);
  text("to", width * 0.875, height - (height / 9));
  textSize(height / 25);
  text(endDateString, width * 0.875, height - 50);
  
  long cursorDate = round(map(mouseX, 0, width, startDate, endDate));
  String cursorDateString = dateFormat.format(new Date(cursorDate * 1000));
  
  fill(0, 0, 0, 220);
  rectMode(CORNER);
  int cursorX;
  if (mouseX - (width / 8) < 0) {
    cursorX = width / 8;
  } else if (mouseX + (width / 8) >= width) {
    cursorX = floor(width * 0.875);
  } else {
    cursorX = mouseX;
  }
  rect(cursorX - (width / 8), height * 0.8, width / 4, height * 0.06);
  fill(255); 
  textAlign(CENTER, BOTTOM);
  
  text(cursorDateString, cursorX, height * 0.85);
  
  stroke(0);
  strokeWeight(2);
  fill(200, 255, 255, 220);
  ellipse(mouseX, height * 0.8, width / 128, width / 128);
  strokeWeight(1);
  beginShape();
  vertex(mouseX, height / 2);
  vertex(mouseX - width / 128, height * 0.8);
  vertex(mouseX + width / 128, height * 0.8);
  endShape(CLOSE);
  fill(0);
  ellipse(mouseX, height * 0.8, width / 183, width / 183);
  
  if (songPopup >= 0) {
    int adjustedPosX;
    if (songPosX < width / 6) {
      adjustedPosX = width / 6;
    } else if (songPosX >= round(width * 0.8333333333)) {
      adjustedPosX = round(width * 0.8333333333);
    } else {
      adjustedPosX = songPosX;
    }
    rectMode(CORNER);
    fill(0, 0, 255, 220 * songSlide);
    stroke(0, 0, 0, 220 * songSlide);
    strokeWeight(2);
    rect(adjustedPosX - (width / 6), height * 0.2, width / 3, height * 0.3);
    fill(0, 0, 0, 220 * songSlide);
    textAlign(LEFT, TOP);
    textSize(height * 0.3 * 0.075);
    text(listens[songPopup].artist, adjustedPosX - (width / 6) + 2, height * 0.2 + 2);
    text(listens[songPopup].title, adjustedPosX - (width / 6) + 2, height * 0.2 + 2 + (height * 0.3 * 0.075));
    image(theImage, adjustedPosX + (width / 64), round(height * 0.2 + 2 + (height * 0.6 * 0.075)), round(height * 0.3 * 0.75), round(height * 0.3 * 0.75));
  }
  if (abs(mouseX - songPosX) >= width / 100) {
    songPopup = -1;
  }
}

public void updateGraphs(boolean updateBpm, boolean updateLoudness, boolean updateComplexity) {
  //copy current graphs to storage (for sliding)
  slide = 0;
  slowSlide = 0;
  if (!init) {
    prevBpmGraph = (ArrayList<float[]>) bpmGraph.clone();
    prevLoudnessGraph = (ArrayList<float[]>) loudnessGraph.clone();
    prevComplexityGraph = (ArrayList<float[]>) complexityGraph.clone();
  }
 
  //determine number of listens in provided range
  int firstIndex = 0;
  int lastIndex = 0;
  for (int i = 0; i < listens.length; i++) {
    if (listens[i].date >= startDate) {
      firstIndex = i;
      break;
    }
  }
  for (int i = listens.length - 1; i >= 0; i--) {
    if (listens[i].date <= endDate) {
      lastIndex = i;
      break;
    }
  }
  
  //determine grouping
  int grouping = ceil((float) width / (float) smoothing);
  int groupInterval = ceil((float) (endDate - startDate) / (float) grouping);
  
  if (updateBpm) {
    bpmGraph = new ArrayList<float[]>(grouping);
  }
  if (updateLoudness) {
    loudnessGraph = new ArrayList<float[]>(grouping);
  }
  if (updateComplexity) {
    complexityGraph = new ArrayList<float[]>(grouping);
  }
  
  //create initial emptry graphs (for sliding)
  if (init) {
    init = false;
    prevBpmGraph = new ArrayList<float[]>(grouping);
    prevLoudnessGraph = new ArrayList<float[]>(grouping);
    prevComplexityGraph = new ArrayList<float[]>(grouping);
    for (int i = 0; i < grouping; i++) {
      prevBpmGraph.add(new float[]{0, 0, 0});
      prevLoudnessGraph.add(new float[]{0, 0, 0});
      prevComplexityGraph.add(new float[]{0, 0, 0});
    }
  }
  
  //fill graph toDraw list
  int currentListen = firstIndex;
  for (int i = 0; i < grouping; i++) {
    int groupCount = 0;
    float[] bpmEntry = new float[]{0, 0};
    float[] loudnessEntry = new float[]{0, 0};
    float[] complexityEntry = new float[]{0, 0};
    
    while (currentListen < listens.length && listens[currentListen].date < startDate + (groupInterval * (i + 1))) {
      bpmEntry[1] += listens[currentListen].bpm;
      loudnessEntry[1] += listens[currentListen].loudness;
      complexityEntry[1] += listens[currentListen].complexity;
      currentListen++;
      groupCount++;
    }
    if (groupCount != 0) {
      bpmEntry[1] = 1000 / ((bpmEntry[1] / (float) groupCount) / 60);
      loudnessEntry[1] = abs(map(loudnessEntry[1] / (float) groupCount, 30, maxLoudness, 1, height / 2));
      complexityEntry[1] = map(complexityEntry[1] / (float) groupCount, 0.3, 0.6, 1, 255);
    } else {
      bpmEntry[1] = 0;
      loudnessEntry[1] = 0;
      complexityEntry[1] = 0;
    }
    bpmEntry[0] = map(i, 0, grouping, 0, width);
    loudnessEntry[0] = map(i, 0, grouping, 0, width);
    complexityEntry[0] = map(i, 0, grouping, 0, width);
    
    if (updateBpm) {
      bpmGraph.add(bpmEntry);
    }
    if (updateLoudness) {
      loudnessGraph.add(loudnessEntry);
    }
    if (updateComplexity) {
      complexityGraph.add(complexityEntry);
    }
  }
}

//test
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && zoomLevel < 8) {
      zoomLevel++;
      updateZoom();
    } else if (keyCode == DOWN && zoomLevel > 0) {
      zoomLevel--;
      updateZoom();
    } else if (keyCode == LEFT) {
      updateScroll(false);
    } else if (keyCode == RIGHT) {
      updateScroll(true);
    }
  }
  if (key == 'q' && smoothing < 20) {
    smoothing++;
    init = true;
    updateGraphs(true, true, true);
  }
  if (key == 'a' && smoothing >= 2) {
    init = true;
    smoothing--;
    updateGraphs(true, true, true);
  }
}

public void updateZoom() {
  long middle = startDate + ((endDate - startDate) / 2);
  if (zoomLevel == 0) {
    startDate = minDate;
    endDate = maxDate;
  }
  if (zoomLevel == 1) {
    startDate = middle - 31536000;
    endDate = middle + 31536000;
  }
  if (zoomLevel == 2) {
    startDate = middle - 15768000;
    endDate = middle + 15768000;
  }
  if (zoomLevel == 3) {
    startDate = middle - 7884000;
    endDate = middle + 7884000;
  }
  if (zoomLevel == 4) {
    startDate = middle - 2592000;
    endDate = middle + 2592000;
  }
  if (zoomLevel == 5) {
    startDate = middle - 1296000;
    endDate = middle + 1296000;
  }
  if (zoomLevel == 6) {
    startDate = middle - 604800;
    endDate = middle + 604800;
  }
  if (zoomLevel == 7) {
    startDate = middle - 302400;
    endDate = middle + 302400;
  }
  if (zoomLevel == 8) {
    startDate = middle - 43200;
    endDate = middle + 43200;
  }
  updateGraphs(true, true, true);
}

public void updateScroll(boolean right) { 
  if (zoomLevel == 1) {
    if (right) {
      startDate += 63072000;
      endDate += 63072000;
    } else {
      startDate -= 63072000;
      endDate -= 63072000;
    }
  }
  if (zoomLevel == 2) {
    if (right) {
      startDate += 31536000;
      endDate += 31536000;
    } else {
      startDate -= 31536000;
      endDate -= 31536000;
    }
  }
  if (zoomLevel == 3) {
    if (right) {
      startDate += 15768000;
      endDate += 15768000;
    } else {
      startDate -= 15768000;
      endDate -= 15768000;
    }
  }
  if (zoomLevel == 4) {
    if (right) {
      startDate += 5184000;
      endDate += 5184000;
    } else {
      startDate -= 5184000;
      endDate -= 5184000;
    }
  }
  if (zoomLevel == 5) {
    if (right) {
      startDate += 2592000;
      endDate += 2592000;
    } else {
      startDate -= 2592000;
      endDate -= 2592000;
    }
  }
  if (zoomLevel == 6) {
    if (right) {
      startDate += 1209600;
      endDate += 1209600;
    } else {
      startDate -= 1209600;
      endDate -= 1209600;
    }
  }
  if (zoomLevel == 7) {
    if (right) {
      startDate += 604800;
      endDate += 604800;
    } else {
      startDate -= 604800;
      endDate -= 604800;
    }
  }
  if (zoomLevel == 8) {
    if (right) {
      startDate += 86400;
      endDate += 86400;
    } else {
      startDate -= 86400;
      endDate -= 86400;
    }
  }
  if (startDate < minDate) {
    long diff = minDate - startDate;
    startDate += diff;
    endDate += diff;
  } else if (endDate > maxDate) {
    long diff = endDate - maxDate;
    startDate -= diff;
    endDate -= diff;
  }
  updateGraphs(true, true, true);
}

void mousePressed() {
  long pixelInterval = round((endDate - startDate) / (width / smoothing));
  
  long cursorGroup = floor(map(mouseX, 0, width, 0, width / smoothing));
  long cursorStartDate = startDate + cursorGroup * pixelInterval;
  long cursorEndDate = cursorStartDate + pixelInterval;
  boolean found = false;
  int i;
  for (i = 0; i < listens.length; i++) {
    if (listens[i].date >= cursorStartDate && listens[i].date < cursorEndDate) {
      songPopup = i;
      found = true;
      break;
    }
  }
  if (found) {
    theImage = requestImage(listens[songPopup].imagePath);
    songSlide = 0;
    songPosX = mouseX;
  }
}

//encapsulates a listened track
public class Listen {
  int date;
  String artist;
  String title;
  float bpm;
  float loudness;
  float complexity;
  String imagePath;
  
  public Listen(int date, String artist, String title, float bpm, float loudness, float complexity, String imagePath) {
    this.date = date;
    this.artist = artist;
    this.title = title;
    this.bpm = bpm;
    this.loudness = loudness;
    this.complexity = complexity;
    this.imagePath = imagePath;
  }
}


