
//An Interactive Illustrated Mysterious Novel 2.0
//This novel is generated by your clicks for texts and illustrations.
//You will have 3 steps in drawing the illustrations.
//Press e or E to start a new story
//I wanted but had no time to make it, that it can save an image of all drawings, and show them in one last image when you press E... Ill do that later, tho :)
//normally, the cursor changes, but i have read it might not work on every platforms


//GLOBALS
int page,textX,textY,m, numRows,rand, fatness, steps;
float x,y, prop, coloring, sizeX, sizeY;
int counter = 0;
Table table;
String text = "";
TableRow row;
PImage book, bookIllus, openBook, hand, bookTitle, frame, newie, ant;
PImage fly,show, bookShow, drops,neet, picture, p1,p2,p3,p4,p5,p6,p7,p8,p9,cover;
PFont bulm;
boolean end,shows;


//SETUP
void setup(){
  //FONT
  bulm = loadFont("BulmerMT-SemiBoldSC-48.vlw");
  //TEXT
  table = loadTable("table1.csv");
  //PICTURES
  book = loadImage("book.png");
  openBook = loadImage("bookopen.png");
  bookTitle = loadImage("booktitle.png");
  bookIllus = loadImage("bookopenillus.png");
  ant  = loadImage("ant.png");
  fly = loadImage("fly.png");
  drops = loadImage("gouttes.png");
  neet = loadImage("ortie.png");
  hand = loadImage("main.png");
  newie = loadImage("new.png");
  show = loadImage("bookopenshow.png");
  bookShow = loadImage("bookshow.png");
  page = 0;
  
 //cover = loadImage("cover.png");

 ////////////////////////////////////////////
  size(960 , 960);
  colorMode(HSB,360,100,100,100);
  background(42,12,56);
  smooth();
  textFont(bulm);
  end = false;
  //shows = false;
}

//////////////MAIN ORDERING
void draw() {
  //COVER
  //if(shows == false){
  if(page == 0){
    steps = 5;
     cursor(hand); 
     background(42,100,100);
     frame = book;     
     counter = 4; textSize(24); textX=int(570*0.8) ; textY=int(180*0.8); text = ""; 
     stroke(0,0,0);     
     for(int n =0 ; n<300 ; n++){      
       strokeWeight(6*0.8);
       line((mouseX+random(1000))*0.8,(mouseY+random(400))*0.8,random(1000)*0.8,random(400)*0.8);
        } 
    }
 
 //TITLEPAGE
if(page == 1){
      steps = 5;  
      counter = 4; textSize(70*0.8); textX=int(640*0.8) ; textY=int(270*0.8);
      frame = bookTitle;
     for(int n =0 ; n<10 ; n++){
        strokeWeight(6*0.8);
        stroke(random(100,120)*0.8,random(10)*0.8, random(20)*0.8);
        line((mouseX+random(1000))*0.8,(mouseY+random(400))*0.8,random(1200)*0.8,random(1200)*0.8);   
        }         
     }
     
//OTHER PAGES
if(page > 1) { 
     frame = bookIllus;       
      textSize(24); textX=int(570*0.8) ; textY=int(200*0.8);
      noStroke();
      fill(180,0,100);
      rect(555*0.8,0,(1200-555)*0.8,1500*0.8);
      stroke(0,0,0);
      
      if(counter == 1){ 
        fill(coloring,random(10,20),random(30,50));       
        noStroke();       
        float c = mouseX/6*0.8;
        float d = mouseY/6*0.8;
         float a = random(0,600);
         float b = random(0,600);
          ellipse(a,b, c,d);  
      }
        
      if(counter == 2){
        tint(random(50,100), random(50,100), random(50,100), 200);
        image(picture, mouseX, mouseY,sizeX,sizeX);
        noTint();
      }
        
      if(counter == 3){
        fill(coloring,100,100);       
        strokeWeight(fatness*0.8);
        ellipse(mouseX,mouseY, 20*0.8,20*0.8);
      }
} 
////////////DRAW BOOK, TEXT AND COMMENTS      
   image(frame,0,0); fill(0,0,0);
   text(text,textX,textY*0.8); 
   
   if(steps < 4){  textSize(70*0.8); text(steps+4,611*0.8,790*0.8);
             if(counter > 1){image(newie,10,913*0.8);}
           }
   if(page == table.getRowCount()){ end = true; cursor(ARROW); textSize(18);  text("THE END. PRESS E FOR A NEW STORY",580*0.8,410*0.8);
 //text("OR PRESS S TO SEE WHAT YOU DID",580*0.8,430*0.8);
 }
/*  }
  if(shows == true){
    image(picture,0,0);
    if(counter == 2){  image(show,0,0); image(bookShow,0,0);}
    if(counter >2){
    image(show,0,0);}
  }*/
}
//MOUSE_PRESSED
void mousePressed(){
  
  //if(shows == false){
    if(page < 1){background(180,0,100);
    /*save("data/page"+page+".png");
    }
    if(page == 1){save("data/page"+page+".png");
  */}    
    Text_Generator randText = new Text_Generator();
    m = (int)random(3);
    int i = int(random(4));
    if(i == 0){picture = ant; sizeX=random(80,150)*0.8;}
    if(i == 1){picture = fly;sizeX=random(50,150)*0.8;}
    if(i == 2){picture = neet;sizeX=random(150,350)*0.8;}
    if(i == 3){picture = drops;sizeX=random(100,350)*0.8;}   
    counter += 1;
    coloring = random(360);
    
    if(counter < 5 && page >1){
      //save("data/page"+page+".png");
      steps -=1;
      fatness = int(random(2,10)*0.8);            
    }
     if (counter == 5 && end == false){
       steps = 0;
       background(180,0,100);
       counter = 0;
       randText.select_Text(page);
       rand = int(random(3));
       float size = random(10,50)*0.8;
       strokeWeight(size);             
     }
  /*}
  if(shows == true){
  background(180,0,100);
  counter += 1;
  //if(counter == 1){showPicture = cover;}
  if(counter == 2){picture = p1;}
  if(counter == 3){picture = p2;}
  if(counter == 4){picture = p3;}
  if(counter == 5){picture = p4;}
  if(counter == 6){picture = p5;}
  if(counter == 7){picture = p6;}
  if(counter == 8){picture = p7;}
  if(counter == 9){picture = p8;}
  if(counter == 10){picture = p9;}
  if(counter == 11){
    end = false; 
    steps = 4;
    counter = 0;
    shows = false;
    page = 0;}
  }*/
}

class Text_Generator {
  //read table
  private int numRows = table.getRowCount();
  private int numCols = table.getColumnCount();

  //randomly pick a line in the row
  private void select_Text(int p){     
    if(p < numRows){
    int n = (int)random(numCols);   
    counter = 0;
    row = table.getRow(page);
    text = row.getString(n);
    page += 1;
   }
 }
}

void keyPressed(){    
    if (key == 'e' || key == 'E'){
    end = false; steps = 4;
    shows = false;
    page = 0;
    }
    if (key == 'x' || key == 'X'){
      if(steps < 5 && counter > 0){
    steps = steps+1;
    counter -= 1;}
    }
    /*if (key == 's' || key == 'S'){
      p1 = loadImage("page1.png");
  p2 = loadImage("page2.png");
  p3 = loadImage("page3.png");
  p4 = loadImage("page4.png");
  p5 = loadImage("page5.png");
  p6 = loadImage("page6.png");
  p7 = loadImage("page7.png");
  p8 = loadImage("page8.png");
  p9 = loadImage("page9.png");
    shows = true;
    picture = cover;
    counter = 1;
    end = false; steps = 4;
    page = 0;
    }*/
}



