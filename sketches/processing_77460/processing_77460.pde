
//Working Title: Bitten 
//Discription: The infographic will take the useres through various visualizations that will allow them to view the data through various comparative views. 
//Technical problems: Being able to graph and inturpert the data in various ways.
String[] data; 

void setup(){
  data=loadStrings("dog_bite.csv");
  noLoop();
  size(1000, 600);
  noStroke();
  smooth();
  noLoop();
}

void draw(){
  
  for (int i=0; i<data.length; i++){
    String [] pieces=split(data[i], ",");
    float AD=parseFloat(pieces[1]);
    float CH=parseFloat(pieces[2]);
    float x=i*20;
    fill(#6F6F6F);
    AD=map(AD, 0, 63, 0, height);
    ellipse(x, AD+5, 5, 5);
    fill(#2CF500);
     CH=map(CH, 0, 63, 0, height);
    ellipse(x, CH+5, 5, 5);
  }
}

