
//Working Title: Bitten 
//Discription: The infographic will take the useres through various visualizations that will allow them to view the data through various comparative views. 
//Technical problems: Being able to graph and inturpert the data in various ways.
String[] data; 
PImage corgi, golden, aGolden, boston; 



void setup() {
  data=loadStrings("dog_bite.csv");
  corgi=loadImage("corgi.png");
  golden=loadImage("puppygolden2.png");
  aGolden=loadImage("golden.png");
  boston=loadImage("boston.png");
  noLoop();
  size(1000, 600);
  noStroke();
  smooth();
  noLoop();
  background(#FFFFFF);
}

void draw() {

  for (int i=0; i<data.length; i++) {
    String [] pieces=split(data[i], ",");//test length of pieces after this string if(pieces.length=6 other wise don't 
    float BD=parseFloat(pieces[0]); //dog breed
    float AD=parseFloat(pieces[1]); //attack doing
    float CH=parseFloat(pieces[2]); //children
    float MN=parseFloat(pieces[3]); //adults
    float DT=parseFloat(pieces[4]); //deaths
    //float ML=parseFloat(pieces[5]); //mailling
    println(pieces[0]);
    float x=i*2.5;
    AD=map(AD, 0, 63, 0, height);
    tint(#6F6F6F);
    image(boston, x, AD+30, width/5, height/5);
    CH=map(CH, 0, 63, 0, height);
    tint(#00F9FF);
    image(corgi, x, CH+40);
    fill(#009CFA);
    MN=map(MN, 0, 63, 0, height);
    tint(#FAFF00);
    image(golden, x, MN+50, width/10, height/10);
    fill(#FF0000);
    DT=map(DT, 0, 63, 0, height);
    tint(#F200FF);
    image(aGolden, x, DT+60, width/10, height/10);
    fill(#FAFF00);
    //ML=map(ML, 0, 63, 0, height);
    //ellipse(x, ML+70, 5, 5);
    
   // if (i++==0) {
      fill(#000000);
      text(pieces[0], x, height);
      println(x);
    //}
  }
}


