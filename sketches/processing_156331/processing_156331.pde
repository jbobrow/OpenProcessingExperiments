
PFont font;
String message="Happy"; // String is the variable  message words
float x,y; //X and Y coordinates
float hr,vr; //horizontal  and vertical radius of the font

void setup(){
   size(640,360);
    font= loadFont("Chalkboard-Bold-48.vlw");
    frameRate(30);    
    textFont(font);
    textAlign(CENTER,CENTER);
   
    hr = textWidth(message) / 2;
    vr = (textAscent()+ textDescent())/2; // changes to height of type divide by two 
    noStroke();
    x = width/2;   //set the height and width of x  and y by
    y =height/2; 
}
 void draw(){
  fill(frameCount/2,200,50,120); // Put  rectangle on top on top of background
  println(frameCount);
  rect(0,0, width,height);
  
  if(abs(mouseX-x)< hr&& // abs calculates the absolute Value ( magnitude) of a number. the abs number is always postive
   abs(mouseY-y)< hr){//&& comparess expression and returns  if both are true
     x +=random(-5,5);// random() generates  unexpectedt numbers
     y +=random(-5,5);
   }
   fill(200,150,0);
   text("Happy",x,y);
 }
  
 


