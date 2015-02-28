
//create to arrays of strings from source code
Nemo[]files = new Nemo[50];
Nemo[]orange = new Nemo[50];

//declare
PImage back;//image for playback
PFont a;//declare font
int n = 1;//switches to make every other frame play
int q = 0;//will become a random numer to frame search
int qf = 0;
int p = 0;
float x =0;
float y = 0;

//load strings to search
String[] wecannot = {"We"," cannot" ," just"," move"," like"," this"};
String[] andlike = {"and", " like", " this."};
String move = "o";//will change based on location

void setup(){
  smooth();
  //basics
  size(1000, 800);
  background (0);
  a = createFont("Times", 25, true);
  
  //Pull in the text
  for (int i = 0; i<50; i++){
    String name = "blue"+i+".txt";//make the filename
    println (name);
    files[i] = new Nemo(name);
  }//for
  for (int i = 0; i<50; i++){
    String name = "oranges"+i+".txt";//make the filename
    println (name);
    orange[i] = new Nemo(name);
  }//for
  
  //Display text
/*  for (int i = 0; i<50; i++){
    for (int j = 0; j<orange[i].sourceText.length; j++){
      fill(150, 80, 0, 200);
      textFont(a, 10);
      textAlign(CENTER);
      text(orange[i].sourceText[j], -i*15, (80*j)+(90*i));
     }//for j
   }//for i
  pushMatrix();
  rotate(PI/2);
  for (int i = 0; i<50; i++){
    for (int j = 0; j<files[i].sourceText.length; j++){
      fill(0, 120, 150, 10);
      textFont(a, 10);
      textAlign(LEFT);
      text(files[i].sourceText[j], 200, 5*j-1000);
     }//for j
   }//for i
   popMatrix();
   

   //capture string
   saveFrame();
   back=loadImage("screen-0000.tif");
*/
}//setup

void draw() {
 //switch on and off
  n*=-1;
    stroke(0,70,150,200);
    strokeWeight(1);
    //strokeWeight(30);
 // y+=1;
  line(x,0,x,800);
  
 //calculate ranges for each word 
 float wea = 200;
 textFont(a, 25);
 float web = wea+textWidth(wecannot[0]);
 float cannotb = web+textWidth(wecannot[1]);
 float justb = cannotb+textWidth(wecannot[2]);
 float moveb = justb+textWidth(wecannot[3]);
 float likeb = moveb+textWidth(wecannot[4]);
 float thisb = likeb+textWidth(wecannot[5]);
 println(moveb);
 println(likeb);
 
     //determine word to search for 
  if (mouseX>= wea && mouseX<web){
    move = "we";
    x = wea;
    y = textWidth(wecannot[0]);
  }else if (mouseX>= web && mouseX<cannotb){
    move = "cannot";
    x = web;
    y = textWidth(wecannot[1]);
  }else if (mouseX>= cannotb && mouseX<justb){
    move = "just";
    x = cannotb;
    y = textWidth(wecannot[2]);
  }else if (mouseX>= justb && mouseX<moveb){
    move = "move";
    x = justb;
    y = textWidth(wecannot[3]);
  }else if (mouseX>= moveb && mouseX<likeb){
    move = "like";
    x = moveb;
    y = textWidth(wecannot[4]);
  }else if (mouseX>= likeb && mouseX<thisb){
    move = "this";
    x = likeb;
    y = textWidth(wecannot[5]);
  }else{
    move = "o";
    x = mouseX;
    y = 10;
  }
  //every other frame, find lines
  if (n==1){
    noStroke();
    fill (0,10);
    rect(0, 0, width, height);
    //walk through the orange source code lookin for a word
    for (int i = q; i<50; i++){
      //pick a random place in that array
      p = int(random(0,orange[i].sourceText.length-1));
      for (int j = p; j<orange[i].sourceText.length; j++){
        int index = orange[i].sourceText[j].indexOf(move);
        //add character by character to line up text
        if(index >=0){
          float minus = 0;
          //calculate location
          for (int k = 0; k<index; k++){
          textFont(a, 25);
          minus = minus+textWidth(orange[i].sourceText[j].charAt(k));
            }
            fill(0,10);
            noStroke();
            rect (x, mouseY-20, y, 25);
            fill(255,150,0,150);
            textFont(a, 25);
            text(orange[i].sourceText[j], x-minus, mouseY);
            q = int(random(0, 49));
            break;
         }//if index is positive
 
    }//forj
    for (int j = p; j<files[i].sourceText.length; j++){
        int index = files[i].sourceText[j].indexOf(move);
        //add character by character to line up text
        if(index >=0){
          pushMatrix();
          rotate(PI/2);
          fill(0, 120, 150, 255);
          textFont(a, 10);
          textAlign(LEFT);
          text(files[i].sourceText[j], 200, (j)-800);
          popMatrix();
          
          break;
        }//if
    
      }//for j
   }//fori
   //and blue files
  
  }//if index is positive
}//draw
   
  
 
 



  
//Nemo class is just an array of strings build from a file
class Nemo{
  String fileName;//filename is how we get to the file
  String []sourceText; //sourceText is the array of strings made
  
  Nemo (String _fileName){//get filename from draw
    fileName = _fileName;//pass it
    sourceText = loadStrings(fileName);//so SourceText is the thing
    println("loaded");//just checking that a string is loaded
  }//Nemo
  
void display(){
  for (int i = 0; i<3; i++){//work through the array
  text(sourceText[i], 10, 10);//show the text
}//for
}//display
}//Nemo


