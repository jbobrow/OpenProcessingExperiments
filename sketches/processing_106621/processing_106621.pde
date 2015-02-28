
/* @pjs font = "Raleway-Bold.ttf, Raleway-Light.ttf";
        preload = "red.png, green.png, blue.png, splashPage.png, instructions.png, reset.png";*/

int level = 0;
float counter;
String finalTime;
Boolean matched = false;
/*
Levels:
0 = splash page
1 = instructions
2 = game
3 = score
*/

//Objetos
//Componentes
WheelComponent wheel1;
WheelComponent wheel2;
WheelComponent wheel3;

PImage splashPage;
PImage instructions;
PImage reset;

PFont boldType;
PFont lightType;

// Color variables
  // computer
  int R;
  int G;
  int B;
  
  // user
  int userR = 130;
  int userG = 130;
  int userB = 130;

// layout
int mainRadius = 280;

void setup(){
  size(800, 600);
  colorMode(RGB);

  //Objetos  
  //Componentes
  wheel1 = new WheelComponent("red", userR, 140, 120);
  wheel2 = new WheelComponent("green", userG, 140, 300);
  wheel3 = new WheelComponent("blue", userB, 140, 480);

  boldType = createFont("Raleway-Bold.ttf", 68);   
  lightType = createFont("Raleway-Light.ttf", 34);
  
  splashPage = loadImage("splashPage.png");
  instructions = loadImage("instructions.png"); 
  reset = loadImage("reset.png"); 
  
  randomColor();  
}

void css(String style){
  if(style == "labelStyle"){
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(34);
    textFont(lightType);
  }
  if(style == "timeStyle"){
    fill(0);
    textAlign(LEFT, CENTER);
    textSize(34);
    textFont(lightType);
  }  
}

void randomColor(){
  R = round(random(0, 255));
  G = round(random(0, 255));
  B = round(random(0, 255));
//  println(R);
//  println(G);
//  println(B);
}

void checkColor(String time){
  int range = 25;
  if(  (userR - range) < R && R < (userR + range)
    && (userG - range) < G && G < (userG + range)
    && (userB - range) < B && B < (userB + range)){
      matched = true;
      finalTime = time;
      level ++;
    }
}

//void keyPressed() {
//  if (key == ' ') {
//    println(userR + ", " + userG + ", " + userB);
//  }
//}

void mousePressed(){
  if(level == 0){
    level ++;
    counter = millis();
  }else if(level == 1){
    level ++;
  } else if(level == 3){
    level = 2;
    startGame();
  }
}


void startGame(){
  counter = millis();
  randomColor();
  matched = false;
}


void draw(){  
  background(255);
  
  if(level == 0){              // SPLASH
    image(splashPage, 0, 0);  
    
  }else if(level == 1){        // INSTRUCTIONS

    wheel1.display();
    wheel2.display();
    wheel3.display();

    // Computer ellipse
    noStroke();
    fill(R, G, B);
    ellipse(600, height/2, mainRadius, mainRadius);  
    
    // User ellipse
    noStroke();
    fill(userR, userG, userB);
    ellipse(400, height/2, mainRadius, mainRadius);      

    // Instructions
    imageMode(CORNER);
    image(instructions, 0, 0);
      
    // Text
    int timeToStart = round(10 - (millis() - counter)/1000);
    fill(255);
    textFont(boldType);
    textAlign(LEFT);
    text(timeToStart, 340, 555);
    
    if(timeToStart <= 0){
      level ++;
      startGame();
    }
    
  }else if(level == 2){    // GAME
    
    // Background
    noStroke();
    fill(230);
    rect(20, 20, width-40, height-40);
    
    wheel1.display();
    wheel2.display();
    wheel3.display();
    
    // Computer ellipse
    noStroke();
    fill(R, G, B);
    ellipse(600, height/2, mainRadius, mainRadius);  
    
    // User ellipse
    noStroke();
    fill(userR, userG, userB);
    ellipse(400, height/2, mainRadius, mainRadius);
    
    // Time
    int timeToFinish = round(80 - (millis() - counter)/1000);
    int minutes = round(timeToFinish / 60);
    int seconds = timeToFinish % 60;
    css("timeStyle");
    String time = nf(minutes, 2, -1) + ":" + nf(seconds, 2, -1);
    text(time, 460, 480);
    if(timeToFinish <= 0){
      level++;
      finalTime = time;
    }
    
    checkColor(time);
    
  }else if(level == 3){      // End game
    
    wheel1.display();
    wheel2.display();
    wheel3.display();
    
    // Computer ellipse
    noStroke();
    fill(R, G, B);
    ellipse(600, height/2, mainRadius, mainRadius);  
    
    // User ellipse
    noStroke();
    fill(userR, userG, userB);
    ellipse(400, height/2, mainRadius, mainRadius);
    
    // Background
    noStroke();
    fill(0, 90);
    rect(20, 20, width-40, height-40);    
    
    imageMode(CENTER);
    image(reset, 600, height/2);
    
    if(matched){
      // Text
      fill(255);
      textAlign(LEFT, BOTTOM);
      textFont(lightType);
      text("YAY!", 335, 284);
      textAlign(LEFT);
      textFont(lightType, 21);     
      text("Your time was", 325, 310);
      textFont(lightType);
      text(finalTime, 325, 340);
      
    }else{
      // Text
      fill(255);
      textAlign(LEFT, BOTTOM);
      textFont(lightType);
      text("OOPS!", 330, 284);
      textAlign(LEFT);
      textFont(lightType, 21);
      text("RGB is hard\nto mix, I know... :S", 325, 310);    
    }
  }
}

class WheelComponent{
  //Data vars
  String name;
  float angle;
  int value;
  PImage wheelImage;

  //Layout vars
  int radius;
  float weight;
  int posX;
  int posY;
  int wheelColor;
  
  WheelComponent(String tempName, int tempVar, int tempX, int tempY){
    //Data vars
    name = tempName;
    value = tempVar;
    wheelImage = loadImage(name+".png");

    //Layout vars
    radius = 55;
    weight = 30;
    posX = tempX;
    posY = tempY;
    angle = map(value, 0, 255, PI, -PI);
  }
  
  void display(){
    
    String textLabel;
    
    // Calculando ângulo
    if(dist(posX, posY, mouseX, mouseY) <= (radius + weight/2) && mousePressed){
      angle = atan2(mouseY - posY, mouseX - posX);
      value = round(map(angle, -PI, PI, 255, 0));
    }

    // Atribuindo valor
    if(name == "red"){
      wheelColor = color(value, 0, 0);
      userR = value;
      textLabel = "R";
    }else if(name == "green"){
      wheelColor = color(0, value, 0);
      userG = value;
      textLabel = "G";
    }else{
      wheelColor = color(0, 0, value);
      userB = value;
      textLabel = "B";      
    }
      
    //Desenhando
    pushMatrix();
      translate(posX, posY);     
   
      //Fundo
      noStroke();
      fill(wheelColor);
      ellipse(0, 0, 2*radius, 2*radius);
      
      //Wheel
      imageMode(CENTER);
      image(wheelImage, 0, 0);

      //Texto
      fill(0);
      css("labelStyle");
//      text(nf(value, 0, 2), 0, 0);
      text(textLabel, 0, -3);  

      //Bolinha
      rotate(angle);
      noFill();
      stroke(255, 100);
      strokeWeight(2);
      ellipse(radius, 0 , 30, 30);
    
    popMatrix();
  }
}
