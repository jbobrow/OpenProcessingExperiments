
/**
Natalia Monroy-Lopez 3056493
Data Visualisation & Design
Data Source http://abare.gov.au**/

//Global Variables

String [] years; //string array for years
int [] kt; //integer array for kilotons
int[] bc; //integer arrar for brown coal

int startyear = 1960;  //value for starting year
int margin = 150; //value for margin
int ymargin = 50;// value for y margin
int startkilo = 0; //value for starting kilo
int scale = 10; // value for scale

PFont font;  //font


void setup () {
  size(900, 900);
 smooth();
  font = createFont("Arab-12", 15);  //creating font
  textFont(font); //loading font

  loadData(); //loading data below
}


void draw() {
  background(255);
  if (mousePressed == true) {  //boolen for mouse pressed if so draw what is below
fill(64, 64,64, 100);
  ellipse (700,300,20,20);
   fill(137, 110, 4, 100);
  ellipse(700, 350, 20, 20);
   fill(0);
  text("black coal", 720, 300);
  text("brown coal", 720, 350);
  }
    fill(0);

  
  
  text("COAL CONSUMPTION IN AUSTRALIA",250, 100);  //title text
  for (int sk = startkilo; sk < 81000; sk += 20000) {  //counter for kilotons
    stroke(162, 165,135);
    
    strokeWeight(1);
    text(sk,margin-100, 480 - sk/250, 10); //kilotons text
    line(100,(480 - sk/250), 670, (480 - sk/250));  //draws kilotons lines on graph

    stroke(0);
    strokeWeight(1);


    line(70, 480, 670,480);  //x and y axis on graph
    line(105,120, 105, 500);
  }

  strokeWeight(1);
  for (int y= startyear; y < 2007; y+=5) { //counter for years
    text(y, margin + (y - startyear)*scale, 500);  //years text
    stroke(162, 165,135);
    line (margin + (y - startyear)*scale, height - 410, margin + (y - startyear)*scale, 120);//draws years lines
  }

  noFill();

  stroke(64, 64,64, 100);
  strokeWeight(5);

  beginShape();  //use to unite all the dots that represent the values on the graph for black coal

  for (int i=0; i<years.length; i++) {

    String d = years[i];
    int k = kt[i];



    int y = int(d);// convert to int
    float xpos= margin + (y - startyear)*scale;  //floats for x and y positions
    float ypos=  400 - k/400;

    vertex(margin + (y - startyear)*scale,  400 - k/400);  //draws the line on graph

    PVector dotvec = new PVector(xpos, ypos);  //vector for calculating a distance between two points
    PVector mousevec = new PVector(mouseX, mouseY);
    
    if(dotvec.dist(mousevec) < 6 ) {  //if the dist. between the mouse and vertext is smaller than 6 run the code below

      text(k + " Kilotons", 700, 100,100);  //text from k array
      strokeWeight(1);
        line(xpos, ypos, 700,100);  //draws line from vertex to text
        strokeWeight(5);
    }
   
  }
  endShape();   //ends the above vertex



  stroke(137, 110, 4, 100);
  strokeWeight(5);

  beginShape();   //begins a new vertex for the brown coal values
  for (int i =0; i<years.length; i++) {
    String d = years[i];
    int b =  bc[i];
    int y = int(d);
      float xpos= margin + (y - startyear)*scale;
    float ypos=  400 - b/400;
    
    vertex(margin + (y - startyear)*scale, 400 - b/400);
  
   PVector dotvec = new PVector(xpos, ypos);
    PVector mousevec = new PVector(mouseX, mouseY);
    
    if(dotvec.dist(mousevec) < 5 ) {

      text(b + " Kilotons", 700, 150,150);
      strokeWeight(1);
        line(xpos, ypos, 700,150);
        strokeWeight(5);
    }

}
  endShape();
  noStroke();
}






void loadData () {  //loads data from the csv file below

  String [] data_in = loadStrings ("data3.csv");
  years = new String[data_in.length];  //will read all the string and integers below in its full length
  kt = new int[data_in.length];
  bc = new int [data_in.length];



  for (int i = 0; i < data_in.length; i++) {
    String line = data_in[i];
    String[] bits = line.split(",");// splits lines at the commas
    String y=bits[0].replaceAll("\"",""); // replace all quotes with blank 
    y = y.substring(0,4);

    String n = bits[1].replaceAll(" ", "");
    String coal = bits[2].replaceAll(" ", "");

    years[i] = y;
    kt[i] =  int(n);
    bc[i]= int (coal);
  }

  println(years);
}


