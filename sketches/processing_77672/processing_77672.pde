
//Ozone Levels at Different Elevations, by Vesselina Ivanova
//Sources: CSV file: http://www.epa.gov/heasd/sources/projects/CDC/index.html
//Sources: class notes

String[] data;
PImage sky;

void setup(){
  size(500,500);
  data = loadStrings("oz82011monitor.csv");
  smooth();
  sky= loadImage("spanish-sky_mr.png");
  image(sky,0,0);
  fill(255);
  text("X: Elevation from 3,000 to 1,000,000 Meters", 110,470); 
  text("Y: Time from January Through December of 2011", 97, 490);
  String s = "Ozone Levels in the US  in 2011 at Different Elevations";
  fill(255);
  textSize(17);
  text(s, 30, 17, 500, 30);
  for(int a=0; a<50; a++){
    for(int b=0; b<50; b++){
      stroke(100);
      noFill();
      fill(134,203,255,255);
      rect(a*8+50, b*8+50, 11,11);
   }
 }
}

void draw(){
  for (int i=0; i<data.length/10; i++){
    String[] pieces = split(data[i],",");
    float ozone = (parseFloat(pieces[7]));
    ozone = map (ozone,0,1,0,100);
    float elevation = (parseFloat(pieces[6]));
    elevation = map (elevation, 0 ,3000, 0, 1270);
    //println("ozone:"+ozone + "elevation:"+elevation);
    for(int w=65; w<width-50; w+=10){
      noStroke();
      if(ozone<=3){
        fill(83,16,129,10);
      }
      if(ozone<=5 && ozone>3){
        fill(255,54,54,10);
      }
      if(ozone<=10 && ozone>5){
        fill(130,242,93,10);
      }
      ellipse(w,elevation+55,ozone,ozone);
      //make interactive:
      /*ellipse(w,elevation+55,ozone,ozone);
      float date = (parseFloat(pieces[2]));
      if(dist(mouseX,mouseY,w,elevation+55)<2){
        text("Ozone:" + pieces[7] + "Elevation:" + pieces[6] + "Date:" + pieces[2]);
    }*/
    }
  }
}



