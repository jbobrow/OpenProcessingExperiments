
String[] data;
void setup() {
  size(1000,600 );
  data=loadStrings("gas.csv");
  smooth();
  noStroke();
}

void draw() {
  background(#FFFFFF);
  for (int i=0; i<data.length; i++) {
    String [] pieces=split(data[i], ",");
    float MD=parseFloat(pieces[0]);
    float US=parseFloat(pieces[1]);
    float WC=parseFloat(pieces[9]);
    float CA=parseFloat(pieces[10]);
    //println(pieces[10]);
    noLoop();
   float x=i*30;
    //US//
    US=map(US, 0, 2.104, 0, height/4);
    fill(#00CAFA);
    ellipse(x, US, 5, 5);
    WC=map(WC, 0, 2.050, 0, height/5);
    fill(#FF001E);
    ellipse(x, WC, 5, 5);
    //CA
    fill(#2CF500);
   CA=map(CA, 0, 2.106, 0, height/6);
   ellipse(x, CA, 5, 5);  
    //date
    if (i% 1.5==0) {
      fill(#000000);
      text(pieces[0], x, width/3);
    }
    //cost
    }
}




