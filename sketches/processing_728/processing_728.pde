

//BY DAVID HUNTER

String letters1 = "";
String letters2 = letters1;

boolean generating = false;
boolean paused = false;

int n = 0;
float v = 0;
//

PFont font1;
PFont font2;

Flake fl;


void setup(){

  font1 = loadFont("Avenir-Light-Reverse-72.vlw");
  font2 = loadFont("Avenir-Light-72.vlw");
  textFont(font2);
  //
  size(800,800);
  background(15);
  fill(255);
  noStroke();
  smooth();
  //frameRate(1);

}

void draw(){
  
  if(generating == true){
    if((frameCount % 60) == 0){
      background(15);
      textSize(16);
      text("press 'Spacebar' to pause", 30, 30);
      textSize(48);
      fl.display();
      //saveFrame("flake_###.TIF");
    }
  } 
  else {
    background(15);
    //form for entering name
    textSize(24);
    text("NameFlake Snowflake Generator", 30, 30);
    textSize(16);
    text("Type your name or word and press 'Enter' to make flakes", 30, 52);
    textSize(24);
    text(letters2, 30,82);
    //
    if(((frameCount % 30) == 0) || ((frameCount % 30) == 1) || ((frameCount % 30) == 2)){
      rect(textWidth(letters2)+30,82,16,1);
    }
  } 
}

//

//entering name and submit
void keyPressed(){
  if(generating == false){
    if((key == ENTER) || (key == RETURN)){ 
      submit(); 
    }
    //
    if((key == DELETE) || (key == BACKSPACE)){
      letters2 = letters1.substring(0, letters1.length()-1);
      println("del");
      letters1 = letters2;
    } 
    else {
      letters1 += key;
      letters2 = letters1;
    }
  } else {
    if(key == ' ') {
      if(paused == false){
        fill(15);
        rect(30,0,width,50);
        fill(255);
        noLoop();
        paused = true;
      } else {
        loop();
        paused = false;
      }
    }
  }
}

//submitting name and creating snow
void submit(){
  println("Name Submitted");
  generating = true;
  //
  //create flake instance
  fl = new Flake(letters2);
  //
  letters1 = "";
  letters2 = letters1;
  //
}

//
//
//

class Flake {

  float x = width*0.5;
  float s = height*0.5;
  //

  //
  //character array created inside class
  char c[];
  //random number array created inside class using char array length
  float r[];

  Flake(String ss) {

    c = ss.toCharArray();
    r = new float[c.length];

  }

  //
  void display(){
    //
    //
    //
    for(int i = 0; i < c.length; i++){
      r[i] = PI/ round(2.5+random(17));
      if(r[i] < 0.19){ 
        r[i] = 0; 
      }
    }
    //
    //
    //
    pushMatrix();
    translate(x,s);
    for(int i = 0; i<6; i++){
      textFont(font1);
      textAlign(RIGHT);
      //textSize(48);
      //
      for(int j = 0; j<c.length; j++){
        //
        pushMatrix();
        translate(0,-(((c.length-j)*40)-24));
        rotate(r[j]);
        text(c[j],0,26);
        popMatrix();
      }

      textFont(font2);
      textAlign(LEFT);
      //textSize(48);
      //
      for(int j = 0; j<c.length; j++){
        //
        pushMatrix();
        translate(0,-(((c.length-j)*40)-24));
        rotate(-r[j]);
        text(c[j],0,26);
        popMatrix();
      }
      //
      pushMatrix();
      rotate(PI/3);
    }
    //for six PI/3 rotates in transformation
    popMatrix();
    popMatrix();
    popMatrix();
    popMatrix();
    popMatrix();
    popMatrix();
    //
    popMatrix();
    //
  }
}

