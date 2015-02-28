
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/67566*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//size(300,600);



PFont low;
PFont bold;
import processing.pdf.*;


//====
int[] tallies = new int[12];
String[] phrases;
int totaltally;
int[] totaltallies = new int [100];
String[] analyzee;
String[] splitUpText;
float tally;
String[] analyzeText;
int slabIndex;
//====
String[]archetype;
String[]definition;
String[]maintitle;
String[]maindetail;


//====
int index = 12; //number of archetypes in use
float counter;
//int []counter=tallies;
Archy[] jung = new Archy[index];
float rot;
float p1, p2, p3, p4;

void setup() {
  
  smooth();
  strokeWeight(0.5);
  size(300, 600);
  bold = loadFont("AvenirNextLTPro-Bold-12.vlw");
low = loadFont("AvenirLTStd-Light-12.vlw");

  //  background(255);
  analyzeText = loadStrings("churchilt.txt");
  //analyzeText = loadStrings("exuperyt.txt");
  //analyzeText = loadStrings("austert.txt");
  //analyzeText = loadStrings("adelet.txt");
  //analyzeText = loadStrings("pilatet.txt");

  //analyzeText = loadStrings("arch.txt");

  for (int i=0; i<analyzeText.length; i++ ) {

    splitUpText = splitTokens(analyzeText[i], " ,.?!;:@#$%^&*()");
    //println(analyzeText[i]);
  }

  //slabIndex= splitUpText.length;
  //println(slabIndex+" so much!!");
  //===============//
  phrases = loadStrings("arch.txt");
  for (int i=0; i<12; i++ ) {

    String[] words = split(phrases[i], ",");


    tallies[i] = analyzingText(splitUpText, words);


    int counter = tallies[i];

    //println(i + "do you see me" + tallies[i]);
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    jung[i] = new Archy(counter, i);// array );
    //println(i + "do you still see me" +"-"+counter);
  }
}



void draw() {
  
  
  fill(255);
  rect(0, 0, width, height);
  background(255);

  for (int i=0; i<index; i++) {


    jung[i].run();

    rot = i*(2*PI/index);
    p1 = (width/2)+ (sin(rot)*150);
    p2 = (height/2)+ (cos(rot)*150);
    p3 = (width/2)+ (cos(-1*rot)*150);
    p4 = (height/2)+ (sin(-1*rot)*150);
  }
  //popMatrix();
  //*************************

  //   for(int i=0; i< totaltallies.length; i++){
  //      totaltallies[i] =totaltally.length;
  //  println(totaltallies[i]+"words");

  //************************
textFont(bold);
  fill(0);
  rectMode(CORNER);
  maintitle= loadStrings("title.txt");

  maindetail=loadStrings("detail.txt");
  text(maintitle[0], 20, height-65, width-20, 50);
    textFont(low);
  text(maindetail[0], 20, height-50, width-20, 200);



}



//}  
//=============================//

int analyzingText(String[] input, String[] checker) {
  int tally=0;
  int totaltally=0;
  //println(input);
  for (int i=0; i<input.length; i++) {
    //standardize them by making them all lowercase first. the hero words are all lowercase, etc.
    String temp = input[i].toLowerCase();
    temp = trim(temp);

    for (int l=0; l<checker.length; l++) { 

      if (temp.indexOf(checker[l]) >=0) {
        tally=tally+20;
        //tallies[i]=tally;
      }
      //else {
      //  tally=tally-2;
      // }
      //*************************//
      //      totaltally++;
      //      
      //      for(int j=0; j< totaltallies.length; j++){
      //      totaltallies[j] =totaltally;
      //  println(totaltallies[j]+"words");
      //      }
      //    println("HERE WE ARE"+ totaltally);
      //    noLoop();
      //**********************//
    }  
    println(tally);
  }
  //println("match");

  return tally;
}

class Archy {

  int place;
  float rad;
  float angle;
  float x;
  float y;
  int scalar=4;

  Archy(float counter, int order) {//constructoooooor

      place=order;
    rad =counter+20;
    float radi= constrain(rad, 5, width/2-25);
    angle += order*(TWO_PI/index);
    x = (width/2)+ (cos(angle)*radi);
    y = (height/2)+ (sin(angle)*radi);
  }

  void run() {

    display();
    //check();
    checkHover();
  }


  void display() {
    stroke(0);
    noFill();
    pushMatrix();
    translate(0, -150);
    point(width/2, height/2);//reference to check rotate


    beginShape();
    for (int i=0; i<index; i++) {
      vertex(jung[i].x, jung[i].y);
    }
    endShape(CLOSE);
    for (int i=0; i<index; i++) {
      vertex(jung[i].x, jung[i].y);
      point(jung[i].x, jung[i].y);
    }

    popMatrix();
    //    println("did you know the counter value is "+counter+" ?");
    //println("the place "+counter+" the angle "+angle);
  }
  //void check(){
  // totaltally++;
  //println("HERE WE ARE"+ totaltally);
  //noLoop();
  //}
  void checkHover() {
    archetype = loadStrings("archetype.txt");
    definition = loadStrings("definition.txt");

    for (int i=0; i<index; i++) {
      if ( dist(mouseX, mouseY, jung[i].x, jung[i].y-150) <5 )
        //if ( dist(mouseX, mouseY, width/2, height/2-150) <50 )
      {
textFont(low);
        
        stroke(0, 150);
        rectMode(CORNER);
        fill(255);
        noStroke();
        rect(width/2+20, height/2, 150, 200);
        rect(50, height/2, 200, 100);
        fill(0);
        text(archetype[i], 50, height/2, 80, 30);
        text(definition[i], width/2-10, height/2, 100, 100);
      }
    }
  }
}


