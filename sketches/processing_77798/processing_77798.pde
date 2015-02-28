
String[] data;
float pointX, pointY;
void setup() {
  size(1050, 600 );
  data=loadStrings("gas.csv");
  smooth();
  noStroke();
}

void draw() {
  background(#FFFFFF);
  //COLOR KEY
  fill(#2CF500);
  ellipse(50, 450, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in California", 65, 455);
  fill(#FF001E);
  ellipse(50, 425, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in the West Coast", 65, 430);
  fill(#00CAFA);
  ellipse(50, 400, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in the United States", 65, 405);
  fill(#9C00FF);
  ellipse(50, 475, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in the East Coast", 65, 480);
  fill(#FF6F00);
  ellipse(50, 500, 10, 10);
  fill(#000000);
  text("Cost of gas per gallon in New York", 65, 505);

  textSize(20);  
  text("Cost of Gas in 2004 on the East Coast and West Coast", width/3, 60);

  textSize(12);
  text("Weekly Gas Prices", 425, 375);
for (int i=0; i<=3.50; i++) {
  text(i+.50, i+30, i*80);
}
  for (int i=0; i<data.length; i++) {
    String [] pieces=split(data[i], ",");
    float MD=parseFloat(pieces[0]);
    float US=parseFloat(pieces[1]);
    float EC=parseFloat(pieces[2]);
    float WC=parseFloat(pieces[9]);
    float CA=parseFloat(pieces[10]);
    float NY=parseFloat(pieces[15]);
    // println(pieces);
    float x=i*30;
    float y=i*3;
    //US//
    US=map(US, 0, 3.0000, 0, height);
    fill(#00CAFA);
    if (dist(mouseX, mouseY, x+105, US-200)<10) {
      text(pieces[1], x+100, US-210);
      //println("over");
    }
    ellipse(x+100, US-200, 5, 5);
    WC=map(WC, 0, 3.000, 0, height);
    fill(#FF001E);
    if (dist(mouseX, mouseY, x+105, WC-200)<10) {
      text(pieces[9], x+100, WC-210);
      //println("over");
    }
    ellipse(x+100, WC-200, 5, 5);
    //East Coast 
    EC=map(EC, 0, 3.000, 0, height);
    fill(#9C00FF);
    if (dist(mouseX, mouseY, x+105, EC-200)<10) {
      text(pieces[2], x+100, EC-210);
      //println("over");
    }
    ellipse(x+100, EC-200, 5, 5);
    //CA
    fill(#2CF500);
    CA=map(CA, 0, 3.000, 0, height);
    if (dist(mouseX, mouseY, x+105, CA-200)<10) {
      text(pieces[10], x+100, CA-210);
      //println("over");
    }
    ellipse(x+100, CA-200, 5, 5);  
    //NY 
    fill(#FF6F00);
    NY=map(NY, 0, 3.000, 0, height);
    if (dist(mouseX, mouseY, x+105, NY-200)<10) {
      text(pieces[15], x+100, NY-210);
      //println("over");
    }
    ellipse(x+100, NY-200, 5, 5);  

    //date
    if (i% 1.5==0) {
      fill(#000000);
      text(pieces[0], x+100, width/3);
    }


  }
    
}


