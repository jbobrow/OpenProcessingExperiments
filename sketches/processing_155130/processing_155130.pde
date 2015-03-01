

PFont fonts;
ScriptClass[] scripts;
Ball[] balls;
SimpleGraph[] graphs;

String data;
int number = 0;



int varValue = 0;


int troubleEngine = 0;
int troubleEtc = 0;
int troubleScrew = 0;
int fire = 0;
int flooding = 0;
int stuck = 0;
int collision = 0;
int overturn = 0;
int etc = 0;

float varMargin = 20;







void setup() {
  size(800, 800);
  //  background(0);
  


  fonts = createFont("Airal.vlw", 14);
  String[] data = loadStrings("disaster2.csv");
  balls = new Ball[data.length];
  scripts = new ScriptClass[data.length];
  graphs = new SimpleGraph[data.length];
  
  



  for (int i = 0; i < data.length; i++) {

    float[] values = float(split(data[i], ","));
    String[] codes = split(data[i], ",");



    balls[i] = new Ball(values[3], values[2]);
//    scripts[i] = new ScriptClass(codes[1], balls[i].x, balls[i].y);
    scripts[i] = new ScriptClass(codes[1], values[3], values[2]);
    
    if(values[6] == 1){
      troubleEngine++;
    }
    if(values[6] == 2){
      troubleEtc++;
    }
    if(values[6] == 3){
      troubleScrew++;
    }
    if(values[6] == 4){
      fire++;
    }
    if(values[6] == 5){
      flooding++;
    }
    if(values[6] == 6){
      collision++;
    }
    if(values[6] == 7){
      stuck++;
    }
    if(values[6] == 8){
      overturn++;
    }
    if(values[6] == 9){
      etc++;
    }
    
    
    
    graphs[i] = new SimpleGraph(troubleEngine, varMargin);
    graphs[i] = new SimpleGraph(troubleEtc, varMargin*2);
    graphs[i] = new SimpleGraph(troubleScrew, varMargin*3);
    graphs[i] = new SimpleGraph(fire, varMargin*4);
    graphs[i] = new SimpleGraph(flooding, varMargin*5);
    graphs[i] = new SimpleGraph(collision, varMargin*6);
    graphs[i] = new SimpleGraph(stuck, varMargin*7);
    graphs[i] = new SimpleGraph(overturn, varMargin*8);
    graphs[i] = new SimpleGraph(etc, varMargin*9);


    //    balls[i].display();
    //    println(values[3]);
  }
}

void draw() {

  for (int i = 0; i < balls.length; i++) {

    balls[i].display();
    graphs[i].display();
    
    println(balls[i].x);

    float d = dist(balls[i].x, balls[i].y, mouseX, mouseY);
//    println(balls[i].x);
    
    

      if ( d < 30) {
        println(balls[i]);
        scripts[i].textplay();
      
    }
  }
}

class Ball {

  float x, y;
  float r = 30;
  
  color c;


  Ball(float x_, float y_) {

    x = x_;
    y = y_;
  }

  void display() {
    pushMatrix();

    translate(0, height);

    //    //jeju map
    //    x = map(x, 126, 127, 0, width);
    //    y = map(y, 33.1, 33.6, 0, height);


    // koreaMap
    x = map(x, 121.7, 132.5, 0, width);
    y = map(y, 30.2, 41.5, 0, height);


    noStroke();
    fill(255, 0, 0, 30);      
    ellipse(x, -y, r, r);
    

    popMatrix();
  }
}


class ScriptClass {

  String texts;
  float x, y;


  ScriptClass(String texts_, float x_, float y_) {

    texts = texts_;
    x = x_;
    y = y_;
  }

  void textplay() {
    pushMatrix();

    translate(0, height);

    // koreaMap
    x = map(x, 121.7, 132.5, 0, width);
    y = map(y, 30.2, 41.5, 0, height);


    fill(0, 30); 
    textFont(fonts);
    //    text("texts", x, y);
    text(texts, x, -y);
    fill(255, 0, 0, 30); 
    popMatrix();
  }
}


class SimpleGraph{
  
  float x, y;
  int w = 10;
  
  int varValue;
  
  SimpleGraph(int varValue_, float x_){
    
    varValue = varValue_;
    x = x_;
    
  }
  
  void display(){
    
    pushMatrix();
    translate(0, height-10);
    
    fill(0, 255, 0);
    rect(x, y, w, -varValue*100);
    
    textFont(fonts);
    text(varValue, x, y);
    popMatrix();
  }
}





