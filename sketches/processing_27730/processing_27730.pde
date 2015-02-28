

Pages[] page;
Table popscienceData;
int rowCount;

int mousex;
int mousey;

PImage frontcover;

PImage interfaceTitle;


void setup () {
  size (1200, 550);
  colorMode (RGB);
  background (255,255,255);
  smooth();

  PFont helveticaItalic;
  helveticaItalic = loadFont("Helvetica-Oblique-12.vlw");
  textFont(helveticaItalic, 12); 



  popscienceData = new Table("popscience-data.tsv");
  rowCount = popscienceData.getRowCount();


  page = new Pages[105];

  //BACKGROUND PATTERN LINES
  int linebegx = -550;
  int linebegy = 550;
  int lineendx = 0;
  int lineendy = 0 ;
  stroke (210,210,210);

  for (int i = 0; i < 200; i++) {      // do this 200 times

    line(linebegx, linebegy, lineendx, lineendy);      // draw a box
    linebegx += 10;
    lineendx += 10;
  }

  //MAIN LONG RECTANGLE AT TOP
  fill (90);
  noStroke();
  rect (0,0,1200,36);

  //TEXT AT TOP
  fill(255,255,255);
  textAlign(LEFT);
  text("Click on a cell in the Periodic Table of POPULAR SCIENCE:", 15, 25);
  
  text("Page IMAGE:", 580, 25);
  
  text("Page DATA:", 990, 25);

  fill(191,191,191);
  rect(10,43,560,274); //regtangle that the periodic table sits in

  rect(580,43,400,500); //regtangle that page will sit in

  fill(255,255,255); 
  stroke(191,191,191);
  rect(990,43,200,500); //rectangle that icons and data sit in
  
  //INTERFACE TITLE "Periodic Table of POPULAR SCIENCE : JULY 2009"
  interfaceTitle = loadImage("interfaceTitle.gif");
  image(interfaceTitle, 40, 360);
  



  //ESTABLISHING WHERE EACH OBJECT SITS
  float pageX = 14;
  float pageY = 47;


  for (int i = 0 ; i < 105 ; i++) {

    page[i] = new Pages( pageX, pageY, i );

    if ( pageX < 520) {
      pageX += 34.5;
    } 
    else {
      pageX = 14;
      pageY +=38;
    }
  }

  for (int i = 0; i < page.length; i++) {
    page[i].display();
  }
  
  frontcover = loadImage ("popular_science000.jpg");
  image(frontcover,585,47,390,490);
  
}

void draw () {
  
 if (mousePressed == true) {
   // mousex = mouseX;
   // mousey = mouseY;
      for (int i = 0; i < page.length; i++) {
        page[i].click();
      }
  } 
  else {
    
 }
  
}






