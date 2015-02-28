
/** 
Natalia Monroy-Lopez 3056493
Data Visualisation & Design

http://www.conapo.gob.mx**/

//Global Variables


int [] dates;  //integer arrays
int [] pops;
int [] women; 
int [] men;
int [] births;
int [] deaths;


int startyear =1990;
int startpop= 8350000; 
int margin = 50;
int ymargin = 20;
int scale = 30;

PFont f1, f2;  //sets fonts f1, f2

void setup() {
  size(900, 900);
  smooth();
  f1 = createFont("AlYarmook.vlw",13);  //creates fonts
  textFont(f1);
  f2 = createFont("DejaVuSans-Bold-45.vlw",45);
  loadData();  //loads data below
}

void draw() {
  background(250, 245, 247);
  fill(62,67, 64);



  for (int y= startyear; y<2011; y+=2) {   //a for structure for years(texts and line)
    text(y,ymargin,650-(y - startyear)*scale);
    stroke(159, 250,05, 100);
    line(20, margin + (y - startyear)*scale, width-40,margin + (y - startyear)*scale);
  }

  for (int m=  startpop; m<9000000; m+=100000) { //a for structure for population(texts and line)
    text(m,100+(m - startpop)*0.001,30);
  }



  for (int i=1; i<dates.length; i++) {  //for strurcture that will read the dates and population arrays
    int dts = dates[i];
    int pt= pops[i];

    float xpos= 100+(pt - startpop)*0.001; //floats for x and y pos
    float ypos= 650-(dts - startyear)*scale;

    noStroke();


    fill(82, 73, 73, 100) ;
    ellipse(xpos, ypos,35,35);  //draws the ellipses on the graph


    //rect(0,xpos, ypos, 10);

    PVector dotvec = new PVector(xpos, ypos);        //vector for calculating distance between the two points below
    PVector mousevec = new PVector(mouseX, mouseY);

    if(dotvec.dist(mousevec) < 20 ) {   //if the the dist is less than 20 run the code below
      text("Total " + pops[i]+ " Mlln"+".", mouseX+70, mouseY+5); //text total plus values in the pop array
      noFill();
    }

    PVector dotvec2 = new PVector(xpos, ypos);  //second vector
    PVector mousevec2 = new PVector(mouseX, mouseY);

    if(dotvec.dist(mousevec) < 5 ) {  //if the the dist is less than 5 run the code below
      fill(255,0, 0, 100);
      ellipse(xpos+10, ypos, 15, 15);//draws red ellipse
      text(women[i]+ " Women", mouseX+70, mouseY+20); //text of values from women array
      noFill();
      fill(93, 05,247, 100);
      ellipse(xpos-10,ypos, 13, 13);//draws blue ellipses
      noFill();
      text(men[i]+" Men", mouseX+70, mouseY+35);//text of values from men array
      fill(62,67, 64);
      text(births[i]+ " Births", 600, 500);//text of values from births array
      text(deaths[i]+ "  Deaths", 601, 530);//text of values from deaths array
    }
  }
  textFont(f2);
  fill(159, 250,05, 150);
text("mexico city pop.",450, 650);// title text
  textFont(f1);


}
void loadData () {  //loads data from a csv file

  String[] data_in= loadStrings ("mex.csv");

  dates = new int[data_in.length];  //will read the integers in their full length
  pops = new int[data_in.length];
  women = new int[data_in.length];
  men = new int[data_in.length];
  births = new int[data_in.length];
  deaths = new int[data_in.length];

  for (int i = 1; i < data_in.length; i++) {  //for structure
    String line = data_in[i];
    String[] bits = line.split (",");//will split info at the comma

    String dt = bits[0];  //placement within the array
    dates[i] = int(dt);   //converting into integers
    String pop = bits[1];
    pops[i] = int(pop);
    String woman = bits[3];
    women[i] = int(woman);
    String man = bits[2];
    men[i] = int(man);
    String bt = bits[4];
    births[i] = int(bt);
    String dth = bits[5];
    deaths[i] = int(dth);

    //println(bits[4]);
  }
}


