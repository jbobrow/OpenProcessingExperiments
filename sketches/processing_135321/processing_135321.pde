
/*
  TIFFANY VEDUA - RUBIK'S CUBE
*/

Panel myPanel1;
Panel myPanel2;
Panel myPanel3;
Panel myPanel4;
Panel myPanel5;
Panel myPanel6;
Panel myPanel7;
Panel myPanel8;
Panel myPanel9;

float red[] = {255,0,0};
float green[] = {17,152,15};
float blue[] = {0,0,255};
float white[] = {255,255,255};
float orange[] = {255,141,0};
float yellow[] = {255,255,0};

void setup(){
  size(100,100);
  frameRate(1);
  background(0);

  myPanel1 = new Panel(7,7);
  myPanel2 = new Panel(38,7);
  myPanel3 = new Panel(69,7);
  myPanel4 = new Panel(7,38);
  myPanel5 = new Panel(38,38);
  myPanel6 = new Panel(69,38);
  myPanel7 = new Panel(7,69);
  myPanel8 = new Panel(38,69);
  myPanel9 = new Panel(69,69);
}



void draw(){
  background(0);
  myPanel1.run();
  myPanel2.run();
  myPanel3.run();
  myPanel4.run();
  myPanel5.run();
  myPanel6.run();
  myPanel7.run();
  myPanel8.run();
  myPanel9.run();
}

 
class Panel{

  float x = 0;
  float y = 0;
  float panelSize = 24;

  float choice[] = {1, 6};
  

  
  Panel(float _x, float _y){
    x = _x;
    y = _y;
  }

  void pickColor(){
    
   float colorOfPanel = random(choice[0], choice[1]);


    if ((int)colorOfPanel == 1){
      fill(red[0], red[1], red[2]);
    }
    else if ((int)colorOfPanel == 2){
      fill(green[0], green[1], green[2]); 
    }
    else if ((int)colorOfPanel == 3){
      fill(blue[0], blue[1], blue[2]);
    }
    else if ((int)colorOfPanel == 4){ 
      fill(white[0], white[1], white[2]);
    }
     else if ((int)colorOfPanel == 5){ 
      fill(orange[0], orange[1], orange[2]);
    } 
      else if ((int)colorOfPanel == 6){ 
      fill(yellow[0], yellow[1], yellow[2]);
    }
}

    void run(){
      pickColor();
      display();
    }

  void display(){
    noStroke();
    rect(x, y, panelSize, panelSize);
  }
}


