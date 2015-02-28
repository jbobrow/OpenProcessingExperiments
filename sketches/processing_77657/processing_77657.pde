
//https://explore.data.gov/catalog/raw?limitTo=datasets
//processing.org
//learning processing
int[] data;
void setup (){
  size(500,300);
  String[]stuff= loadStrings("data2.csv");
  data=int(split(stuff[2],','));
}
void draw(){
  background(84,214,245);
  textSize(16);
  fill(255);
  text("Unemployment in California", 110,20);
  textSize(9);
  text("2000", 56,45);
    textSize(9);
  text("2001", 86,45);
     textSize(9);
  text("2002", 116,45);
      textSize(9);
  text("2003", 146,45);
       textSize(9);
  text("2004", 176,45);
   textSize(9);
  text("2005", 206,45);
   textSize(9);
  text("2006", 236,45);
   textSize(9);
  text("2007", 266,45);
     textSize(9);
  text("2008", 296,45);
     textSize(9);
  text("2009", 326,45);
      textSize(9);
  text("2010", 356,45);
  
  
   textSize(9);
  text("13%", 56,99);
    textSize(9);
  text("12&", 86,99);
     textSize(9);
  text("18%", 116,99);
      textSize(9);
  text("23%", 146,99);
       textSize(9);
  text("26%", 176,99);
   textSize(9);
  text("25%", 206,99);
   textSize(9);
  text("24%", 236,99);
   textSize(9);
  text("19%", 266,99);
     textSize(9);
  text("13%", 296,99);
     textSize(9);
  text("10&", 326, 99);
      textSize(9);
  text("15%", 356,99);
     
  stroke(0);
  for (int i=2; i < data.length; i++){
    noStroke();
    fill (23,100,118);
    rect(i*30,50,20, data[i]);
  }
}


