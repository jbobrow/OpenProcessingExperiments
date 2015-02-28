

String [] years;
int [] kt;
int[] bc;

int startyear = 1990;
int margin = 50;
int ymargin = 5;
int startkilo = 10000;
int scale = 80;
PFont font;


void setup () {
  size(600, 500);
  background(255);
  font = createFont("Arab-12", 12);
  textFont(font);
  
  loadData();
}


void draw() {
  background(255);
fill(0);
text("NSW",470, 70);
 // fill(255,200,100);
stroke(255, 50,0);
line(460,70,445,70);
fill(0);
text("VIC",470,50);
stroke(255, 200,100);
line(460,50,445,50);
  //fill(255,150,30);
//rect(300,71,20,20);
fill(0);

fill(0);
text("Fisheries Summary Of Production",410, 30);
  

/**for (int sk = startkilo; sk <73000; sk += 10000) {
text(sk, margin, height-ymargin-sk);
stroke(0.20);
line(margin,height-margin-sk,width-50,height-margin-sk);

}**/


for (int y= startyear; y < 1997; y++) {
text(y, margin + (y - startyear)*scale, 400);
stroke(0.20);
line (margin + (y - startyear)*scale, 450, margin + (y - startyear)*scale, 150);

}
for (int x= startkilo; x< 32000; x+=10000) {
text(x,margin,height-ymargin-x);
stroke(0.20);
//line (margin + (x - startkilo)*scale, 450, margin + (x - startkilo)*scale, 150);

}

noFill();


beginShape();
stroke(255, 50,0);
  for (int i=0; i<years.length; i++) {
  
    String d = years[i];
    int k = kt[i];
   // fill(255, 200,0);
 //ellipse(margin +i*scale,  400 - k/400, 5,5);
  int y = int(d);// convert to int
   //stroke(255,50,100);
   vertex(margin + (y - startyear)*scale, 400- k);

  }

  endShape();


beginShape();
for (int i =0; i<years.length; i++) {
String d = years[i];
int b =  bc[i];
  int y = int(d);
    stroke(255, 200,100);
  strokeWeight(2);

vertex(margin + (y - startyear)*scale,  300 - b/10);
}
  endShape();
}






void loadData () {

  String [] data_in = loadStrings ("data3.csv");
  years = new String[data_in.length];
  kt = new int[data_in.length];
bc = new int [data_in.length];

  for (int i = 0; i < data_in.length; i++) {
    String line = data_in[i];
    String[] bits = line.split(",");
    String y=bits[0].replaceAll("\"",""); // replace all quotes with blank 
    y = y.substring(0,4);
    println(y);
    String nsw = bits[1].replaceAll(" ", "");
String vic = bits[2].replaceAll(" ", "");

    years[i] = y;
    kt[i] =  int(nsw);
    bc[i]= int (vic);
  }
  
  println(kt.length);
}


