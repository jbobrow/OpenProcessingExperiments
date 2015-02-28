
//CHAOS_GAME main file
//By Young Chen

//PROGRAM RESOURCES================================================================================================
/* @pjs preload = "Left.png", "Pause.png", "Right.png";*/
//CALCULATION VARIABLES============================================================================================
int sides = 5;              //Sides in the shape
float fraction_n = 1;       //Fraction (Numerator) of each distance
float fraction_d = 2;       //Fraction (Denominator) of each distance
int cluster = 200;          //Points per loop
int cluster_n = 0;          //Current cluster
//PROGRAM VARIABLES================================================================================================
PVector center = new PVector(300,300);
Polygon seed = new Polygon(sides, center, 250);
boolean running = false;
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<Button> buttons = new ArrayList<Button>();
PFont segoeUIL;
PFont segoeUI;



void setup() {
  println("Setup has Started");
  
  size(600, 600);
  background(200);
  println("Canvas has Started");
  seed = new Polygon(sides, center, 250);
  println("Seed has been created");
  seed.drawPolygon(); //Retrieve and store the shape object from the polygon generator
  println("Shapes have been created");
  points = seed.getPoints(); //Retrieve and store initial points from the polygon generator
  buttons.add(new Button(new PVector(20, 580), 30, 30, "Left.png"));
  buttons.add(new Button(new PVector(55, 580), 30, 30, "Pause.png"));
  buttons.add(new Button(new PVector(90, 580), 30, 30, "Right.png"));
  buttons.add(new Button(new PVector(130, 580), 30, 30, "Left.png"));
  buttons.add(new Button(new PVector(165, 580), 30, 30));
  buttons.add(new Button(new PVector(200, 580), 30, 30, "Right.png"));
  
  buttons.add(new Button(new PVector(400, 580), 30, 30, "Left.png"));
  buttons.add(new Button(new PVector(435, 580), 30, 30));
  buttons.add(new Button(new PVector(470, 580), 30, 30, "Right.png"));
  buttons.add(new Button(new PVector(510, 580), 30, 30, "Left.png"));
  buttons.add(new Button(new PVector(545, 580), 30, 30));
  buttons.add(new Button(new PVector(580, 580), 30, 30, "Right.png"));

  segoeUIL = createFont("Segoe UI Light", 20);
  segoeUI = createFont("Segoe UI", 28);
  drawTitle();

  println("Setup has Finished");
}


void draw() {
updateButtons();
updateText();
if(running){
    for(int i = 0; i<cluster; i++){
      iterate();
    }
    for(int i = cluster_n; i<points.size();  i++){
      strokeWeight(1);
      point(points.get(i).x,points.get(i).y);
    }
    cluster_n += cluster;
  }
}

void updateButtons(){
  for(int i = 0; i<buttons.size(); i++){
  buttons.get(i).Update();
    if(buttons.get(i).isClicked()){
      println("Button " + i + " was clicked! \n");
      onClick(i);
    }
  }
}

void updateText(){
  textFont(segoeUI);
  fill(0);
  text(sides, 157, 590);
  text(int(fraction_n), 427, 590);
  text(int(fraction_d), 537, 590);
  
}

void drawTitle(){
  textFont(segoeUIL);
  fill(50);
  text("Control", 22, 560);
  text("Sides", 140, 560);
  text("Numerator", 390, 560);
  text("Denominator", 490, 560);
}

void Restart(){
  running = false;
  cluster_n = 0;
  background(200);
  seed = new Polygon(sides, center, 250);
  seed.drawPolygon();
  points.clear();
  points = seed.getPoints();
  drawTitle();
  updateText();
  updateButtons();
}


void onClick(int buttonID){
  switch(buttonID){
    case 0:
      Restart();
      println("RESTART! \n");
    break;
    case 1:
      running = false;
      println("STOP! \n");
    break;
    case 2:
      running = true;
      println("RUN! \n");
    break;
    case 3:
      sides--;
      if(sides<3){
        sides = 3;
      }
      Restart();
    break;
    case 4:
      sides = 3; 
      Restart();
    break;
    case 5:
      sides++;
      if(sides>9){
        sides = 9;
      }
      Restart();
    break;
    case 6:
      fraction_n--;
      if(fraction_n<1){
        fraction_n = 1;
      }
      println("Numerator was changed to: " + fraction_n);
      Restart();
    break;
    case 7:
      fraction_n = 1;
      Restart();
    break;
    case 8:
      fraction_n++;
      if(fraction_n>9){
        fraction_n = 9;
      }
      println("Numerator was changed to: " + fraction_n);
      Restart();
    break;
    case 9:
      fraction_d--;
      if(fraction_d<1){
        fraction_d = 1;
      }
      println("Denominator was changed to: " + fraction_d);
      Restart();
    break; 
    case 10:
      fraction_d = 1;
      Restart();
    break; 
    case 11:
      fraction_d++;
      if(fraction_d>9){
        fraction_d = 9;
      }
      println("Denominator was changed to: " + fraction_d);
      Restart();
    break;
    default:
    break;
  }
}

void iterate(){
  int vertex = int(random(sides)); //Retrieve a random vertex to go to 
  
  points.add(new PVector((points.get(vertex).x - points.get(points.size()-1).x)*fraction_n/fraction_d + points.get(points.size()-1).x, 
            (points.get(vertex).y - points.get(points.size()-1).y)*fraction_n/fraction_d + points.get(points.size()-1).y));

  
  
}

//Custom Button Class

class Button{
    int ID;
    int w;
    int h;
    PVector center;
    PImage icon;
    int[] mode_d = {0, 80, 239} ;   //Button mode_default
    int[] mode_h = {27, 161, 226};  //Button mode_hover
    int[] mode_p = {255, 255, 255}; //Button mode_pressed
    int[] button_mode = mode_d;     //Begin with mode_default
    int[] button_mode_prev = mode_d;   //Begin previous mode with mode_default
    
  
  
  Button(PVector center_, int w_, int h_){
    w = w_;
    h = h_;
    center = center_;
    icon = createImage(0,0, RGB);
    icon.loadPixels();
  }
  
  Button(PVector center_, int w_, int h_, String icon_file){
    w = w_;
    h = h_;
    center = center_;
    icon = loadImage(icon_file);
  }
  
  
  void Update(){
    button_mode_prev = button_mode; //Track the previous mode
    button_mode = mode_d; //Initialize update with mode_default
    if(mouseX > center.x - w/2 && mouseX < center.x + w/2 &&
       mouseY > center.y - h/2 && mouseY < center.y + h/2){
         if(mousePressed){
         button_mode = mode_p;  //Update button with mode_pressed
         } else {
         button_mode = mode_h;  //Update button with mode_hover
         }
       }       
     Draw();
       
       
    
  }
  
  
  void Draw(){
    rectMode(CENTER);
    strokeWeight(2);
    fill(button_mode[0], button_mode[1], button_mode[2]);
    rect(center.x, center.y, w, h);
    imageMode(CENTER);
    image(icon, center.x, center.y);
  }
  
  boolean isPressed(){
    return button_mode == mode_p;
    
  }
  
  boolean isClicked(){
    return ((button_mode_prev==mode_p)&&(button_mode==mode_h)); 
  }
  
  void SetID(int ID_){
    ID = ID_;
  }
  
  int GetID(){
    return ID;
  }
  
  
  
}

//Custom Polygon Class  

class Polygon{
  int sides;
  float angle;
  PVector center;
  int radius;
  ArrayList<PVector> points = new ArrayList<PVector>();
  PShape p;
  
  Polygon(int sides, PVector center, int radius ){
    this.sides = sides;
    angle = 360.0/sides;
    this.center = center;
    //Populate the points list with polygon vertices
    float i_angle = 0;
    for(int i = 0; i<sides; i++){
      PVector temp = new PVector();
      temp.x = this.center.x + radius*cos(radians(i_angle));
      temp.y = this.center.y + radius*sin(radians(i_angle));
      points.add(temp);
      i_angle+=angle;

    }
    
  }
  ArrayList getPoints(){
    return new ArrayList<PVector>(points); //Return a copy of our points. 
    //We do not want our points to be modified.
  }
  void drawPolygon() {
    strokeWeight(4);

    beginShape();
    fill(220);
    stroke(0);
    for (int i = 0; i<points.size(); i++){
      vertex(points.get(i).x, points.get(i).y);
    }
    endShape(CLOSE);

  }
}


