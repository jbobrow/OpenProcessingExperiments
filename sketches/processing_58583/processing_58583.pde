
void setup(){
  size(900,600);
  smooth();
  background(0);
  aidRecips();
  text ("Millions given in Military and Economic Aid - USA", 682,149);
  

}

void draw(){
  background(255);
   aidRecips();
   textSize(15);
   fill(242,127,47);
   text ("Millions given in Military and Economic Aid - USA", 520,149);
   fill(255);
   text("1144",106,245);
text("169",398,382);
text("81",844,463);
     
}

void aidRecips(){
  textSize(12);
//Data courtesy of Data.gov - Department of Defense - http://gbk.eads.usaidallnet.gov/
  String [] data = loadStrings("aid.csv");
  for (int i = 0; i < data.length; i++){ // start at one cuz first line is words not numbers
    String [] pieces = split (data[i],",");
    if (i/10 == 0){ //ten pieces of data
    fill(2,115,188);
    text(pieces[0], i*90+20, 520);
    }
    float names = parseFloat(pieces[0]);
    float money = parseFloat(pieces[1]);
    stroke(210,90,188);
    fill(210,90,188);
    line (i*90, height-60-money,i, i);
    ellipse (i*90+30,height-60- money,money,money);
 
  }
}

void mouseReleased(){
  println("vertex("+mouseX+","+mouseY+");");
}

