
import controlP5.*;
import java.util.Comparator;
import java.util.Collections;
import java.util.Comparator;
import java.util.Collections;
import sojamo.drop.*;

SDrop drop;
ControlP5 cp5;
MyDropListener source;
MyDropListener contributor;

int labelsize;
boolean run;
int ImagesPerSide, Resolution;

void setup() {
  size(700, 500);
  labelsize = height/20;
  drop = new SDrop(this);
  cp5 = new ControlP5(this);
  source = new MyDropListener("Source Image", "photo", width/4, height/2);
  contributor = new MyDropListener("Contributing Files", "folder", width*3/4, height/2);
  drop.addDropListener(source);
  drop.addDropListener(contributor);
  cp5.addSlider("Images Per Side")
    .setPosition(width/2-200, height*.65)
      .setWidth(400)
        .setHeight(20)
          .setRange(10, 100) // values can range from big to small as well
            .setValue(60)
              .setNumberOfTickMarks(10)
                ;
  cp5.addSlider("Resolution")
    .setPosition(width/2-200, height*.75)
      .setWidth(400)
        .setHeight(20)
          .setRange(1, 20) // values can range from big to small as well
            .setValue(11)
              .setNumberOfTickMarks(10)
                ;
}

void draw() {
  if (run) {
    background(0);

    generateMosaic(source.filePath, contributor.filePath, ImagesPerSide, Resolution);
    noLoop();
    exit();
  }
  if (source.dropped&&contributor.dropped) {
    background(0);
    fill(255);
    text("Loading...", width/2, height/2);
    ImagesPerSide = int(cp5.getController("Images Per Side").getValue());
    Resolution = int(cp5.getController("Resolution").getValue());
    cp5.getController("Images Per Side").remove();
    cp5.getController("Resolution").remove();
    run = true;
  }
  else {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(17);
    text("Drag an image out of which to make a mosaic to \"Source Image\"", width/2, height/10);
    text("Drag folder of files (images, text files) to \"Contributing Files\"", width/2, height/5);
    source.draw();
    contributor.draw();
  }
}

class MyDropListener extends DropListener {
  int myColor;
  float x, y, w, h;
  String label;
  boolean dropped;
  String warning;
  boolean warn;
  String type;
  String filePath;
  MyDropListener(String tlabel, String ttype, int tx, int ty) {
    label = tlabel;
    x = tx; 
    y = ty; 
    h=labelsize;
    type=ttype;
    textSize(labelsize);
    warning = "Please drop a "+type+" here";
    w=textWidth(label);
    myColor = color(255);
    // set a target rect for drop event.
    setTargetRect(x-w/2, 0, w, height);
  }

  void draw() {
    fill(myColor);
    if (dropped) {
      myColor = color(0, 255, 0);
    }
    textSize(labelsize);
    textAlign(CENTER);
    text(label, x, y);
    if (warn) {
      text(warning, x, y+labelsize*2);
    }
  }

  // if a dragged object enters the target area.
  // dropEnter is called.
  void dropEnter() {
    myColor = color(255, 0, 0);
  }

  // if a dragged object leaves the target area.
  // dropLeave is called.
  void dropLeave() {
    myColor = color(255);
  }

  void dropEvent(DropEvent theEvent) {
    File myFile = theEvent.file();
    if (type == "photo" && theEvent.isImage()) {
      dropped = true;
      warn = false;
      filePath = theEvent.filePath();
    }
    else if (type =="folder"&&myFile.isDirectory()) {
      dropped = true;
      warn = false;
      filePath = theEvent.filePath();
    }
    else {
      warn = true;
    }
  }
}

int cellWidth, cellHeight;
int numCellsSide;
PImage sourceImage;
int outputScale;
int numCellsTop;
ArrayList<PixelImage> pixelImages;

void generateMosaic(String sourceImageFilePath, String folderPath, int tnumCellsSide, int toutputScale) {
  outputScale = toutputScale;
  numCellsSide = tnumCellsSide;
  background(255);
  sourceImage = loadImage(sourceImageFilePath);
  numCellsTop = numCellsSide*sourceImage.width/sourceImage.height;
  size(sourceImage.width*outputScale, sourceImage.height*outputScale);
  cellWidth = sourceImage.width/numCellsTop;
  cellHeight = sourceImage.height/numCellsSide;
  java.io.File folder = new java.io.File(folderPath);
  String[] tileImageFilenames = folder.list();
  pixelImages = new ArrayList<PixelImage>();
  PImage img;
  for (int i = 0; i < tileImageFilenames.length; i++) {
    if (tileImageFilenames[i].endsWith("txt")) {
      drawText(dataPath(folderPath + "\\" + tileImageFilenames[i]), folderPath);
    }
  }
  tileImageFilenames = folder.list();
  for (int i = 0; i < tileImageFilenames.length; i++) {
    println(i + "/" + tileImageFilenames.length);
    if (tileImageFilenames[i].endsWith("jpg")) {
      img = loadImage(dataPath(folderPath + "\\" + tileImageFilenames[i]));
      img.resize(200, 200);
      float imgBrightness = aveBrightness(img);
      PixelImage pixelImage = new PixelImage(imgBrightness, dataPath(folderPath + "\\" + tileImageFilenames[i]));
      pixelImages.add(pixelImage);
    }
    else {
      println("skipping");
    }
  }

  Collections.sort(pixelImages, new PixelImageComparator());
  background(0);
  drawPhotomosaic();
  saveFrame(sourceImageFilePath+" Mosaic.jpg");
}

void drawPhotomosaic() {
  PImage workingImage = createImage(cellWidth, cellHeight, RGB);
  int i = 0; 
  int total = numCellsTop*numCellsSide;
  for (int row = 0; row < numCellsSide; row++) {
    for (int col = 0; col < numCellsTop; col++) {
      println(i + "/" + total);
      i++;
      workingImage.copy(sourceImage, col*cellWidth, row*cellHeight, cellWidth, cellHeight, 0, 0, cellWidth, cellHeight);
      float b = aveBrightness(workingImage);
      int imageIndex = (int)map(b, 0, 255, 0, pixelImages.size());
      PImage cellImage = pixelImages.get(imageIndex).image();
      cellImage.filter(GRAY);
      image(cellImage, col*cellWidth*outputScale, row*cellHeight*outputScale);
    }
  }
}

class PixelImage {
  float score;
  String path;
  PImage cache;
  boolean cached = false;
  PixelImage(float s, String p) {
    score = s;
    path = p;
  }
  PImage image() {
    if (!cached) {
      cache = loadImage(path);
      float proportion = 1;      
      cache.resize(cellWidth*outputScale, cellHeight*outputScale);
      cached = true;
    }
    return cache;
  }
}

class PixelImageComparator implements Comparator<PixelImage> {
  public int compare(PixelImage i1, PixelImage i2) {
    return (int)(i1.score - i2.score);
  }
}

float aveBrightness(PImage img) {
  float result = 0;
  for (int i = 0; i < img.pixels.length; i++) {
    result += brightness(img.pixels[i]);
  }

  result /= img.pixels.length;
  return result;
}

String[] quotes;
PImage frame;
public StringList divide(String s) { //divide the quote into lines of text to be drawn
  float w = sqrt(textWidth(s))*5; //calculates the maximum width of a line necessary to maintain a square-ish text shape
  StringList split = new StringList();
  //Splits the string into words and filters the results of the split function into our StringList
  for (int i=0;i<s.split("\\s+").length;i++) {
    split.append(s.split("\\s+")[i]);
  }
  for (int i = 0; i+1 < split.size(); i++) {//for every word...
    while (textWidth (split.get (i)+" "+split.get(i+1)) < w && i+1 < split.size() ) {//while the length of the "word" (which becomes multiple words) is less than the maximum line width...
      split.set(i, split.get(i)+" "+split.get(i+1)); //add the next word to the current...
      split.remove(i+1); // and remove the next word
    }
  }
  return split;
}

public float deftextsize(String s) { //define the font size based on whether or not a single word is by itself longer than the maximum line width. This section isn't working quite right.
  StringList words = new StringList();
  float textsize = 0;
  float widestwordwidth = 0; 
  String widestword = "";
  //Splits the string into words and filters the results of the split function into our StringList
  for (int i=0;i<s.split("\\s+").length;i++) {
    words.append(s.split("\\s+")[i]);
  }
  for (String word: words) { //return the width of the widest word
    if (textWidth(word)>widestwordwidth) {
      widestwordwidth = textWidth(word);
      widestword = word;
    }
  }
  StringList wordsa = divide(s);
  textsize = height/wordsa.size(); //the textsize is determined by the number of lines
  textSize(textsize);
  for (String word: words) { //return the width of the widest word
    if (textWidth(word)>widestwordwidth) {
      widestwordwidth = textWidth(word);
      widestword = word;
    }
  }
  if (widestwordwidth>width) {//if the widest word is wider than the maximum allowed width...
    textsize = widestwordwidth*height/(widestword.length()); //the textsize is determined by the length of the word.
  }
  return textsize;
}

void drawText(String textFileName,String savefolderPath) {
  quotes = loadStrings(textFileName); //load a list of quotes
  textAlign(CENTER);
  for (String quote: quotes) { //for every quote...
    background(random(255));
    fill(random(255));
    StringList lines = divide(quote); //divide the quote into lines using our divide function...
    float textsize = deftextsize(quote); //and generate the appropriate font size for each quote
    textSize(textsize);
    for (int i = 0; i<lines.size(); i++) { //for every line in every quote...
      String line = lines.get(i);
      text(line, width/2, i*textsize+textsize); //display the line at the appropriate position
    }
    quote=join(split(quote, "\""), ""); //remove unallowed marks for saving
    quote=join(split(quote, "\""), "");
    quote=join(split(quote, "/"), "");
    quote=join(split(quote, ":"), "");
    quote=join(split(quote, "*"), "");
    quote=join(split(quote, "|"), "");
    quote=join(split(quote, "?"), "");
    quote=join(split(quote, "<"), "");
    quote=join(split(quote, ">"), "");
    frame = get();
    frame.resize(280,200);
    println("Generating text frames...");
    frame.save(dataPath(savefolderPath+"\\"+quote+".jpg"));
  }
}



