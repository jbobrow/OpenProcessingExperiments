
float boxx, boxy;
//float lastAngle=0;
float diameter;
float[] angles1 = { 55, 67.5, 21.25, 32.75, 98, 85.5};
float[] angles2 = { 84.25, 53.75, 15, 36.25, 118.75, 52 };
float[] angles3 = { 62, 62.5, 31.75, 49, 29.75, 125 };
float[] angles4 = { 124.5, 31.75, 32.5, 46.25, 125, 16.5 };
float[] angles5 = { 83.75, 42.5, 21.75, 50.25, 116.75, 45 };
float[] angles6 = { 102, 72.5, 14.25, 30, 92.5, 48.75 };
float[] angles7 = { 82.5, 62.5, 13.25, 25.75, 114.5, 61.5 };

color[] colors = {color(144,173,105), color(209,206,98), color(230, 155, 77), color(229,119,97), color(186,141,186), color(119,155,175) };
String[] foodLabels = {"Vegetable", "Grain", "Meat", "Fruit", "Dessert", "Others" };
Bar[] bar;
PieChart piechart1;
PieChart piechart2;
PieChart piechart3;
PieChart piechart4;
PieChart piechart5;
PieChart piechart6;
PieChart piechart7;

CheckBox checkBoxes1;
CheckBox checkBoxes2;
CheckBox checkBoxes3;
CheckBox checkBoxes4;
CheckBox checkBoxes5;

CheckBox[] checkBoxes;
 

PImage img;

float lastAngle = 0;
int barNumbers =0;
XML xml;

void setup(){
  xml = loadXML("week.xml");
  XML[] children = xml.getChildren("row");
  size (1150, 750);
  background (40);
  img = loadImage("background_processing.png");
  textFont (createFont("Frutiger LT Std 57 condensed", 18));
  noStroke();
  diameter = min(width, height)*0.08;
  piechart1=new PieChart(angles1, 315, 670);
  piechart2=new PieChart(angles2, 443, 670);
  piechart3=new PieChart(angles3, 565, 670);
  piechart4=new PieChart(angles4, 687, 670);
  piechart5=new PieChart(angles5, 812, 670);
  piechart6=new PieChart(angles6, 938, 670);
  piechart7=new PieChart(angles7, 1058,670);
  
  checkBoxes = new CheckBox[5];
  checkBoxes[0] = new CheckBox("A", 20.0, 210.0, 117,138, 153);
  checkBoxes[1] = new CheckBox("b", 20.0, 235.0, 0, 167, 181);
  checkBoxes[2] = new CheckBox("c", 20.0, 260.0, 181, 222, 226);
  checkBoxes[3] = new CheckBox("d", 20.0, 285.0, 67, 138, 196);
  checkBoxes[4] = new CheckBox("e", 20.0, 310.0, 54, 58, 96);
  
  
  //checkBoxes = {checkBox1, checkBox2,checkBox3, checkBox4, checkBox5};
 
  barNumbers = children.length;
  
  bar = new Bar[barNumbers*5]; 

  for (int i = 0; i < barNumbers; i++){
    float Awake = children[i].getFloat("Awake");
    float AwakeHeight = ((Awake/1440)*770);
    float AwakeWidth = 15;
    float startPointAwake = 600 - AwakeHeight;
    float totalWidth = 125;
    bar[i*5] = new Bar(Awake,AwakeHeight,AwakeWidth, 265+(totalWidth*i), startPointAwake,bar,"Awake",117, 138, 153);
    noStroke();
    
    float School = children[i].getFloat("School");
    float SchoolHeight = ((School/1440)*770);
    float SchoolWidth = 15;
    float startPointSchool = 600 - SchoolHeight;
    bar[i*5+1] = new Bar(School,SchoolHeight,SchoolWidth, 285+(totalWidth*i), startPointSchool,bar,"School",0,167,181);
    
 

    float Exercise = children[i].getFloat("Exercise");
    float ExerciseHeight = ((Exercise/1440)*770);
    float ExerciseWidth = 15;
    float startPointExercise = 600 - ExerciseHeight;
    bar[i*5+2]  = new Bar(Exercise,ExerciseHeight,ExerciseWidth, 305+(totalWidth*i), startPointExercise,bar,"Exercise",181, 222,226);


    float Eat = children[i].getFloat("Eat");
    float EatHeight = ((Eat/1440)*770);
    float EatWidth = 15;
    float startPointEat = 600 - EatHeight;
    bar[i*5+3] = new Bar(Eat,EatHeight,EatWidth, 325+(totalWidth*i), startPointEat,bar,"Eat",67,138,196);


    float OwnWork = children[i].getFloat("OwnWork");
    float OwnWorkHeight = ((OwnWork/1440)*770);
    float OwnWorkWidth = 15;
    float startPointOwnWork = 600 - OwnWorkHeight;
    bar[i*5+4] = new Bar(OwnWork,OwnWorkHeight,OwnWorkWidth, 345+(totalWidth*i), startPointOwnWork, bar,"OwnWork",86, 95, 137);
  
  }
  
}

class Bar {
  
  String BarName;
  
  //float x, y;       // the startpoint of a bar graph 
  float barx,bary;  // the same value as x, y these two values
  
  float Time; 
  float Height;
  float Width; 
  //float StartPoint;
  float red;
  float green;
  float blue;
  
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Bar[] others;
  
  Bar(float time, float height_t, float width_t, float input_x, float input_y, Bar[] other_bar, String name,float r,float g, float b){
      Time = time;
      Height = height_t;
      Width = width_t;
      //x = input_x;
      //y = input_y;
      barx = input_x;
      bary = input_y;
      
      others = other_bar;
      BarName = name;
      red = r;
      green = g;
      blue = b;
  }
 
 
 
  void update() {
    
    for(int i=0; i<others.length; i++) {
      if(others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }  
    }
    
    if(otherslocked == false) {
      
      overEvent();
      pressEvent();
    }
    
    //if(press) {
      //println("mouse clicked down");  //
     
    //}
  }
  
  void overEvent() {
    if(overRect(barx, bary, Width, Height)) {
      
      over = true;
    } else {
      over = false;
    }
  }
  
  void pressEvent() {
    if(over && mousePressed || locked) {
      
      press = true;
      locked = true;
    } else {
     
      press = false;
    }
  }
  
  void releaseEvent() {
    locked = false;  
  }
  
  void display() {
    if(BarName.equals("Awake") && checkBoxes[0].on == true || BarName.equals("School") && checkBoxes[1].on == true 
      ||BarName.equals("Exercise") && checkBoxes[2].on == true ||BarName.equals("Eat") && checkBoxes[3].on == true ||BarName.equals("OwnWork") && checkBoxes[4].on == true){
      fill(red, green, blue);
      noStroke();
  
      rect(barx, bary, Width, Height);
    }
    
    if(over && BarName.equals("Awake") && checkBoxes[0].on == true || over && BarName.equals("School") && checkBoxes[1].on == true ||
      over && BarName.equals("Exercise") && checkBoxes[2].on == true || over && BarName.equals("Eat") && checkBoxes[3].on == true ||
      over && BarName.equals("OwnWork") && checkBoxes[4].on == true
      || press && BarName.equals("Awake") && checkBoxes[0].on == true || press && BarName.equals("School") && checkBoxes[1].on == true ||
      press && BarName.equals("Exercise") && checkBoxes[2].on == true || press && BarName.equals("Eat") && checkBoxes[3].on == true ||
      press && BarName.equals("OwnWork") && checkBoxes[4].on == true  ) {
      
      textSize(18);
      fill(red,green,blue);
      int dayPercentage= round (Time/1440*100);
      text(BarName +":\n" +Time + " mins"+"\n"+ "It takes "+ dayPercentage + " % " + "of a day.", 26, 375);
      
      
    }

  }
}




void draw(){
  background(40);
  image(img,0,0);
  piechart1.display();
  piechart2.display();
  piechart3.display();
  piechart4.display();
  piechart5.display();
  piechart6.display();
  piechart7.display();

 

  for(int i=0; i<5; i++){ 
    //checkboxes[i].update(); 
    checkBoxes[i].display(); 
  }
  
  
  for(int i=0; i<barNumbers*5; i++){ 
    bar[i].update(); 
    bar[i].display(); 
  }

  textSize(18);
  fill (150);
  text("Thursday",275,620); 
  fill (150);
  text("Friday", 405,620); 
  fill (150);
  text("Saturday",526,620);
  fill (150);
  text("Sunday", 653,620);
  fill (150);
  text("Monday", 775,620);
  fill (150);
  text("Tuesday", 895,620);
  fill (150);
  text("Wednesday", 1010,620);
 
}



class PieChart{
   String pieChartName;
   float[] angles;
   float xPos,yPos;
  
  PieChart(float[] sentAngles, float sentxPos, float sentyPos){
  angles = sentAngles;
  xPos = sentxPos;
  yPos = sentyPos; 
  }
 
 void display(){

  noStroke();
  float lastAngle = 0;
  for (int i = 0; i < angles.length; i++) {
    fill(colors[i]);
    arc(xPos, yPos, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
   
    
  }
   if (overRect(xPos-(diameter/2), yPos-(diameter/2) , diameter, diameter) ){
      for (int i = 0; i < angles.length; i++){
      int foodPercentage= round (angles[i]/360*100);
      fill(colors[i]);
      text (foodLabels[i] + " " + foodPercentage + " %", 30, 593+20*i) ;
      }
    }
  } 
 
 }

boolean overRect(float x, float y, float width, float height) {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
              
    return true;
  } else {
   
    return false;
  }
}

class CheckBox {
  String label; 
  Float xLoc;
  Float yLoc;
  Boolean on = false;
  
  float red;
  float green;
  float blue;
  
  CheckBox (String sentLabel, Float sentX, Float sentY, float r, float g, float b){
    label = sentLabel;
    xLoc = sentX;
    yLoc = sentY;
    
     red = r;
      green = g;
      blue = b;
  }
  
  void display(){
    if(on == false){
      fill(0, 0, 0);
    }else{
      fill(red, green, blue);
    }
    noStroke();
    rect(xLoc, yLoc, 20, 15);
  }
  
  void check(){
    on = true;
  }
  
  void noCheck(){
    on = false;
  }
}

void mouseReleased(){
    for (int i = 0; i < checkBoxes.length; i++){
      if(overRect(checkBoxes[i].xLoc, checkBoxes[i].yLoc, 20, 15)){
        if(checkBoxes[i].on == true){
          checkBoxes[i].noCheck();
        }else{
          checkBoxes[i].check();
        }
      }
    }
    
    for(int i=0; i<barNumbers*5; i++) {
    bar[i].releaseEvent();
  }
}



