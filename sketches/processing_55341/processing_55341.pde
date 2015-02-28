
//DIGF 6B07 Data Visualization
//Final Project by Harjot Bal
//'Coding Emotion'
/*
Data is used from a paper that evaluated subjects who were asked to portray four slightly ambiguous emotions. This project simulates a neutral face which is then manipulated via code to portray pride, interest, joy, and pleasure. This project aims to create a code framework which allows for the input of values that correspond to the degree to which a certain facial feature exudes a certain emotion. Please view the source code for a better understanding.
The data used in the project is pulled from a study which measures emotion via FACS (facial action coding system). The faces shown in the processing sketch are a result of the agreed upon manifestation of facial expressions as chosen by actors asked to portray certain emotions. Simply put, consensus is to input what magnitude is to output. 
REF:Mortillaro, M., Mehu, M., & Scherer, K.R. (2011). Subtly different positive emotions can be distinguished by their facial expressions. Social Psychological and Personality Science, 2(3), 262-271.
*Note: Variables for emotions that appear twice for one facial feature do so in order to account for movements tied to not only the individual feature but also the movement of a feature that it is also linked to (i.e. jaw and chin).
*Note: Emotion variables that appear to be divided by 2 actually account for the equal movement of two simultaneously moving parts of a whole facial feature (i.e. as the mouth opens up the top half moves half of the entire distance as does the lower half in order to account for the entire mouth having moved the actual amount as a whole).
*/

float pride6;
float pride7;
float pride8;
float pride9;
float pride10;
float interest6;
float interest7;
float interest8;
float interest9;
float interest10;
float joy6;
float joy7;
float joy8;
float joy9;
float joy10;
float pleasure6;
float pleasure7;
float pleasure8;
float pleasure9;
float pleasure10;

PFont font;

boolean neutral = true;

void setup(){
  size(700,400);
  smooth();
}

void draw(){
  
  background(100);
  
  noStroke();
  fill(255,225,190,255);
  //Chin
  ellipse(width/2, height/2+23-pride9-interest7-joy9+joy8, 80, 88);
  //Cheekbones
  ellipse(width/2, height/2-25-pride6-joy9-pleasure8, 140, 150);
  //Jaw
  ellipse(width/2, height/2+5, 115, 110+joy8+pleasure7);
  //Head
  ellipse(width/2, height/2-50, 140, 160);
  //Eyes
    //Pupils
    noStroke();
    fill(130,130,110);
    ellipse(width/2-37, height/2-40, 15, 13);
    ellipse(width/2+37, height/2-40, 15, 13);
    //Dots
    fill(100,100,90);
    ellipse(width/2-37, height/2-40, 6, 5.5);
    ellipse(width/2+37, height/2-40, 6, 5.5);
    noStroke();
    fill(255,225,190,255);
    //Upper Lids Skin 
    arc(width/2-38, height/2-49+(pride6/2)+(interest9/2)+(pleasure8/2)+(pleasure6/2), 34, 14, PI, TWO_PI);
    arc(width/2+37, height/2-49+(pride6/2)+(interest9/2)+(pleasure8/2)+(pleasure6/2), 34, 14, PI, TWO_PI);
    //Lower Lids Skin
    arc(width/2-37, height/2-30-(pride6/2)-(interest9/2)-(pleasure8/2), 31, 15, 0, PI);
    arc(width/2+37, height/2-30-(pride6/2)-(interest9/2)-(pleasure8/2), 31, 15, 0, PI);
  stroke(0,100);
  strokeWeight(3);
    fill(255,80);
    strokeWeight(0.7);
    //Upper Lids  
    arc(width/2-38, height/2-40, 28, 14-(pride6/2)-(interest9/2)-(pleasure8/2)-(pleasure6/2), PI, TWO_PI);
    arc(width/2+37, height/2-40, 28, 14-(pride6/2)-(interest9/2)-(pleasure8/2)-(pleasure6/2), PI, TWO_PI);
    //Lower Lids
    arc(width/2-37, height/2-40, 28, 15-(pride6/2)-(interest9/2)-(pleasure8/2), 0, PI);
    arc(width/2+37, height/2-40, 28, 15-(pride6/2)-(interest9/2)-(pleasure8/2), 0, PI);
  //Mouth
  //Inner
    noStroke();
    fill(250,205,185,255);
    ellipse(width/2, height/2+29-pride7-interest6-joy7-pleasure7, 40+pride10+interest8+joy10+pleasure10, 8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2));
  //Corners
    stroke(245,200,175,200);
    noFill();
    line(width/2+(40+pride10+interest8+joy10+pleasure10)/2, height/2+25-pride7-interest6-joy7-pleasure7-(8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2))/2, width/2+(42)/2, height/2+28+(8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2))/2);
    line(width/2-(40+pride10+interest8+joy10+pleasure10)/2, height/2+25-pride7-interest6-joy7-pleasure7-(8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2))/2, width/2-(42)/2, height/2+28+(8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2))/2);
    //Top Lip
    stroke(255,210,200,255);
    strokeWeight(3);
    fill(250,205,185,255);
    arc(width/2, height/2+25-pride7-interest6-joy7-pleasure7, 40+pride10+interest8+joy10+pleasure10, 8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2), PI, TWO_PI);
    //Lower Lip
    fill(250,205,185,255);
    arc(width/2, height/2+28, 42, 8+(pride9/2)+(interest10/2)+(joy9/2)+(pleasure10/2), 0, PI);
  //Eyebrows
  stroke(0,40);
  strokeWeight(3);
  //Inner
  line(width/2-18, height/2-59-pride6-joy7, width/2-48, height/2-62-pride6-joy8);
  line(width/2+18, height/2-59-pride6-joy7, width/2+48, height/2-62-pride6-joy8);
  //Outer
  line(width/2-50, height/2-61-pride6-joy8, width/2-57, height/2-56-joy8);
  line(width/2+50, height/2-61-pride6-joy8, width/2+57, height/2-56-joy8);
  //Nose
    noFill();
    strokeWeight(0.7);
    //Bulb
    arc(width/2, height/2-3, 36, 16, 0, PI);
    fill(255,225,190,255);
    arc(width/2, height/2+2, 20, 10, 0, PI);
    noFill();
    arc(width/2-10, height/2-28, 5, 30, TWO_PI-PI/2, TWO_PI+PI/2);
    arc(width/2+10, height/2-28, 5, 30, PI/2, PI+PI/2);
   
    emotions();
    
    if(neutral){
      font = loadFont("Andalus-48.vlw"); 
      textFont(font); 
      String s = "Neutral";
      text(s, 15, 20, 700, 700); 
    }

}

void mousePressed(){
 neutral = !neutral; 
}

