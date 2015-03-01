
//font declaration
PFont font1, font2;

//flake name string
String letters1 = "HEM 2015";
String letters2 = letters1;

//controls between entering text phase and running snow
boolean snowing = false;

//amount of each snow type
int n = 5;
int m = 25;
int p = 100;

//class object declaration
Flake fl;
MiniFlake mf;
Part pt;

//arrays of snow types
Flake[] flakes = new Flake[n];
MiniFlake[] miniflakes = new MiniFlake[m];
Part[] parts = new Part[p];


void setup(){

  font1 = loadFont("mister_giacco_light.ttf");
  font2 = loadFont("monofonto.ttf");
  //
  size(1920 ,1080);
  background(15);
  noStroke();
  fill(255);
  smooth();
  //
  textFont(font2);
   if(snowing == false){
   
      submit(); 
  //
    
 }
  
}


void draw(){
  background(15);
  //make it snow!!!
  if (snowing == true){
    for(int i=0; i<p; i++){
      parts[i].display();
    }
    for(int i=0; i<n; i++){
      flakes[i].display();
    }
    for(int i=0; i<m; i++){
      miniflakes[i].display();
    }
  } 
}

//
//
//


//submitting name and creating snow
void submit(){
  snowing = true;
  //
  //create snow
  for(int i=0; i<p; i++){
    parts[i] = new Part();
  }
  //
  for(int i=0; i<m; i++){
    miniflakes[i] = new MiniFlake(letters2);
  }
  //
  for(int i=0; i<n; i++){
    flakes[i] = new Flake(letters2);
  }
  //
  letters1 = "";
  letters2 = letters1;
}


// CLASSES * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

//large flakes made from name
class Flake {
  //position variables
  int x = int(random(width));
  int speed = int(1 + random(3));
  int s = -200;//random(height);
  //control size
  int ze = int(8+random(17));
  int zh = int(ze >> 1);
  //character array created inside class
  char c[];
  //random number array created inside class using char array length
  float r[];
  //
  int cl;

  Flake(String ss) {
    //convert string to array
    c = ss.toCharArray();
    cl = c.length;
    r = new float[c.length];
    //generate random rotation number for each letter
    for(int i = 0; i < cl; i++){
       r[i] = PI/ round(2.5+random(17));
       if(r[i] < 0.19){ r[i] = 0; }
    }
  }

  //move snow
  void display(){
    s += speed;
    pushMatrix();
    translate(x,s);
    //for each 'spoke' of flake make two lines of text
    //line 1
    for(int i = 0; i<6; i++){
      textFont(font1);
      textAlign(RIGHT);
      textSize(ze);
      //
      for(int j = 0; j<cl; j++){
        //
        pushMatrix();
        translate(0,-(((cl-j)*ze)-zh)); //20
        rotate(-r[j]);
        text(c[j],0,zh);
        popMatrix();
      }
      
      //line 2 (reverse of line 1)
      textFont(font2);
      textAlign(LEFT);
      textSize(ze);
      //
      for(int j = 0; j<cl; j++){
        //
        pushMatrix();
        translate(0,-(((cl-j)*ze)-zh));
        rotate(r[j]);
        text(c[j],0,zh);
        popMatrix();
      }
      //rotate to create 6 sided symetrical flake
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
    
    //reset positions when out of view
    if(s > height+(ze*cl)){
      s = -200;
      x = int(random(width));
      speed = int(1+random(3));
      //new random numbers for new random arrangement
      for(int i = 0; i < cl; i++){
        r[i] = PI/ round(2.5+random(17));
        if(r[i] < 0.19){ r[i] = 0; }
      }
      //new size
      ze = int(8+random(17));
      zh = int(ze >> 1);
    }
  }
}

//

//smaller flakes made from only one character of name
class MiniFlake {
  
  //array of characters from letters2
  char[] c;

  int x = int(random(width));
  int speed = int(1 + random(3));
  int s = int(-(20+random(200)));
  //control size
  int ze = int(4+random(12));
  int zh = int(ze >> 1);
  //random letter in array
  int r;
  //the random letter
  char l;
  //
  int cl;

  MiniFlake(String ss) {
    c = ss.toCharArray();
    r = int(random(c.length));
    l = c[r];
    cl = 1;
  }

  //
  void display(){
    s += speed;
    pushMatrix();
    translate(x,s);
    for(int i = 0; i<6; i++){
      textFont(font1);
      textAlign(RIGHT);
      textSize(ze);
      //
      for(int j = 0; j<1; j++){
        //
        pushMatrix();
        translate(0,-(((cl-j)*ze)-zh));
        text(l,0,zh);
        popMatrix();
      }

      textFont(font2);
      textAlign(LEFT);
      textSize(ze);
      //
      for(int j = 0; j<1; j++){
        //
        pushMatrix();
        translate(0,-(((cl-j)*ze)-zh));
        text(l,0,zh);
        popMatrix();
      }
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
    if(s > height+20){
      s = -20;
      x = int(random(width));
      speed = int(1+random(3));
      //new size
      ze = int(4+random(12));
      zh = int(ze >> 21);
    }
  }
}

//

//tiny circle particles
class Part {

  int x;
  float y;
  float speed;
  //int trans;
  int dia;

  Part(){
    x = int(random(width));
    y = -(random(200));//0;//random(height);
    speed  = 0.5 + random(3);
    //trans = int(155+random(100));
    dia = int(3+random(4));
  }

  void display(){

    //fill(255, trans);

    ellipse(x,y,dia,dia);
    y+= speed;

    if(y> height+6){
      y = -6;
      x = int(random(width));
    }
  }
}




