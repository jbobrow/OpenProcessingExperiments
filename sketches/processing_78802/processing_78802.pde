
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
}

void draw() {

  for (int i=0; i<data.length; i++) {
    String [] pieces=split(data[i], ",");//test length of pieces after this string if(pieces.length=6 other wise don't 
    float BD=parseFloat(pieces[0]); //dog breed
    float AD=parseFloat(pieces[1]); //attack doing
    float CH=parseFloat(pieces[2]); //children
    float MN=parseFloat(pieces[3]); //adults
    float DT=parseFloat(pieces[4]); //deaths
    println(pieces[0]);
    float x=i*12;
if(mousePressed==true){
  fill(255);
  rect( 25, 25, 20, 20);
} else {
  fill(0);
}
MN=map(MN, 0, 63, 0, 600 );
   rect(x, 0, 3, MN);
      fill(#FF0000);
       DT=map(DT, 0, 63, 0, 600);
}


//    fill(#009CFA);
//    MN=map(MN, 0, 63, 0, 600 );
//    rect(x, 0, 3, MN);
      /*fill(#FF0000);
       DT=map(DT, 0, 63, 0, 600);
   rect(x, 0, 4, height);*/
    //    fill(#FAFF00);

    // text(BD, 10, 10);
  }



