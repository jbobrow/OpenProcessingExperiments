
PFont font1, font2; 

Record[] records; //declaring an array of records
int recordCount;  // number of records (samee as maxReccords??)
int recordIndex=0; //initial record to be displayed
int maxRecords=76; //total records

int maxImages = 76; // Total # of images
int imageIndex = -1; // Initial image to be displayed

PImage[] images = new PImage[maxImages]; // Declaring an array of images.

PImage timeline;

int margin=10;

String name=("Lydia Jarvis");
String library=("Milwaukee Public Library");
String date=("JANUARY-OCTOBER 2009");


void setup() { 
  size(700, 624);
  background(255);
  smooth();

  font1 = loadFont("futura.vlw"); 
  font2 = loadFont("bodoni.vlw");
  
  timeline=loadImage("timeline.jpg");

  String[] lines = loadStrings("materials.txt"); 
  records = new Record[lines.length]; 
  for (int i = 0; i < lines.length; i++) { 
    String[] pieces = split(lines[i], '\t');  // Load data into array 
    if (pieces.length == 3) { 
      records[recordCount] = new Record(pieces); 
      recordCount++; 
    }
  }
  
   for (int i = 0; i < images.length; i++ ) {
    images[i] = loadImage( 1+i + ".jpg" ); 
   }
  
  fill(0);
rect(0, 0, 700, 80);
fill(255);
textAlign(CENTER);
textFont(font2);
text("The Library Record of " + name, 350, 30);
textFont(font1);
text(library, 350, 50);
text(date, 350, 70);

} 



void draw(){
  noStroke();
  if(recordIndex == -1){
  recordIndex=76;
  }
  
   image(images[(1+imageIndex)%76], 20, 100);
 if(imageIndex == -1){
  imageIndex=75;
 }
  fill(255);
  rect(340, 105, 360, 500);
  fill(0); 
  for(int i=0; i<maxRecords; i++){
  drawLabels();
  }
  
  for(int i=0; i<maxRecords; i++){
    stroke(1);
     fill(255);
   rect((margin+(width/maxRecords)*i), 610, 4, 4);
   }
   
   fill(0);
   rect((margin+(width/maxRecords)*(recordIndex%maxRecords)), 610, 4, 4);
   
   
}


void drawLabels(){
  
  fill(255);
rect(330, 95, 360, 500);
  fill(0);
  textFont(font2);
  textAlign(LEFT);
  textSize(28);
    text(records[(recordIndex)%maxRecords].title, 340, 125, 340, 100);
  textFont(font1); 
    text(records[(recordIndex)%maxRecords].author, 340, 110);
    textFont(font1);
    text(records[(recordIndex)%maxRecords].notes, 340, 205, 250, 400);
}
  

class Record { 
  String title; 
  String author;  
  String notes;
  //int type;
  
  public Record(String[] pieces) { 
    title = pieces[0]; 
    author = pieces[1]; 
    notes = pieces[2]; 
  }
}

void keyPressed() {
  if(key=='.'){
    recordIndex++;
    imageIndex++;
    fill(255);
    noStroke();
    rect(20, 100, 300, 500);
  } else if(key==','){
    if (recordIndex>=1){
     recordIndex--;
    imageIndex--;
  }else if(recordIndex<=1){}
      
    
    fill(255);
    noStroke();
    rect(20, 100, 300, 500);
    
    }else if(key=='t'){
      noStroke();
      fill(255);
      rect(0, 98, 700, 502);
      image(timeline, 0, 100, 700, 465);
      stroke(1);
    }
  }


void keyReleased(){
  if(key=='t'){
    fill(255);
    noStroke();
    rect(0, 98, 700, 502);
    stroke(1);
  }
}

