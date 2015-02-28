
String[] data;
void setup() {
  size(1000, 600 );
  data=loadStrings("gas.csv");
  smooth();
  noStroke();
   background(#FFFFFF);
   fill(#000000);
  text("Weekly Gas Prices", 425, 375);
  noLoop();
}

void draw() {
  //COLOR KEY
  fill(#2CF500);
  ellipse(50, 400, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in California", 65, 405);
  fill(#FF001E);
  ellipse(50, 425, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in the West Coast", 65, 430);
  fill(#00CAFA);
  ellipse(50, 450, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in the United States", 65, 455);

  

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
    ellipse(x+50, US, 5, 5);
    WC=map(WC, 0, 2.050, 0, height/5);
    fill(#FF001E);
    ellipse(x+50, WC, 5, 5);
    //CA
    fill(#2CF500);
    CA=map(CA, 0, 2.106, 0, height/6);
    ellipse(x+50, CA, 5, 5);  
    //date
    if (i% 1.5==0) {
      fill(#000000);
      text(pieces[0], x+50, width/3);
    }
  }
}



