
/*@pjs font="Arial.ttf, Courier.ttf" preload="http://mod.zlotskiy.com/EdMaxPrime/pjs/logo.png"*/
int counter;
PFont f;
PFont c;
String place;
PImage logo;
ArrayList console;
ArrayList script;
String[] newestToOldest;
JButton play;
JButton help;
JButton help2;
JButton commands;
JButton cmdTurn;
JButton cmdGo;
JButton cmdPickup;
JButton cmdSlot;

void setup() {  //setup function called initially, only once
  size(400,428);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  f = createFont("Arial", 14, true);
  c = createFont("Courier", 14, true);
  place = "/startup";
  logo = loadImage("http://mod.zlotskiy.com/EdMaxPrime/pjs/logo.png");
  console = new ArrayList();
  script = new ArrayList();
  newestToOldest = new String[6];
  //All the buttons
  play = new JButton(50,height/2,"Play","Go(/methods/generate_level");
  help = new JButton(150,height/2,"How To Play","Go(/help/1");
  
  fill(0);
  textFont(f);
  text("How are you seeing this?", 25, 25);
  for(int i = 0; i < 8; i++) {
      console.add(" ");
  }
  log("[dash] Successfully loaded interpreter");
  log("[dash] ();{}");
}

void draw() {  //draw function loops 
  //This is the banner at the beginning
  if(place.equals("/startup") == true) {
      image(logo, 0, 0);
      displayLog();
      if(frameCount > 180) {
          place="/";
      }
  }
  //This is the main menu
  else if(place.equals("/") == true) {
      background(200);
      play.display();
      help.display();
  }
  //This is the help menu
  else if(place.equals("/help/1") == true) {
      textFont(f);
      text("Dash the robot is bored of his life at the factory. Help him",10,10,width-20,height-40);
  }
}

void log(String message) {
    console.add(message);
    newestToOldest[5] = console.get(console.size()-6);
    newestToOldest[4] = console.get(console.size()-5);
    newestToOldest[3] = console.get(console.size()-4);
    newestToOldest[2] = console.get(console.size()-3);
    newestToOldest[1] = console.get(console.size()-2);
    newestToOldest[0] = console.get(console.size()-1);
}

void displayLog() {
    int count = 14;
    stroke(255);
    fill(0);
    rectMode(CORNER);
    rect(0,300,width,128);
    fill(255);
    textFont(c);
    for(int i = 0; i < newestToOldest.length(); i++) {
        text(newestToOldest[i],2,300+(i+1)*19);
    }
}
String substring(String s, int a, int z) {
    String r = "";
    char[] string = s;
    for(int i = a; i < z; i++) {
        r += string[i];
    }
    
    return r;
}
void mouseReleased() {
    
}
class Unit{
    int size;
    int xpos;
    int ypos;
    color type;
    
    Unit(int x, int y, color c) {
        xpos = x;
        ypos = y;
        size = 20;
        type = c;
    }
    color getType() {
        return type;
    }
    void display() {
        stroke(0);
        fill(type);
        rectMode(CORNER);
        rect(xpos, ypos, size, size);
    }
}
class JButton{
    int xpos;
    int ypos;
    int delay;
    boolean clicked;
    String message;
    String action;
    
    JButton(int x, int y, String t, String a){
        xpos = x;
        ypos = y;
        message = t;
        action = a;
    }
    void display() {
        if(mouseX > xpos && mouseX < xpos+80 && mouseY > ypos && mouseY < ypos+20){
            noStroke();
            fill(250,40,20);
            rectMode(CORNER);
            rect(xpos,ypos,80,20);
            fill(255);
            textFont(f);
            text(message,xpos+2,ypos+15);
            //Check if the user is pressing the button
            if(mousePressed) {
                delay = frameCount;
                clicked = true;
                noStroke();
                fill(50);
                rectMode(CORNER);
                rect(xpos,ypos,80,20);
                fill(255);
                textFont(f);
                text(message,xpos+2,ypos+15);
            } else {
                if(delay < frameCount-100) {
                    clicked = false;
                } else {
                    clicked = false;
                    clicked();
                }
            }
        } else {
            noStroke();
            fill(255);
            rectMode(CORNER);
            rect(xpos,ypos,80,20);
            fill(0);
            textFont(f);
            text(message,xpos+2,ypos+15);
        }
    }
    void clicked() { //This is called when the mouse is pressed over the button
        if(action.indexOf("Go(") != -1) { //This is the Go(var location method
            place = substring(action,3,action.length); //Set the in-game place to the command parameter
        }
    }
    void move(int x, int y) { //Method that easily moves the top left corner of the button
        xpos = x;
        ypos = y;
    }
}

class Robot{
    int xpos = 0; //These two variables are the coordinates of his top-left corner
    int ypos = 0;
    color type; //What color the robot currently is
    char direction = 'w'; //What direction the robot is facing
    Robot(int x, int y, color c) {xpos = x; ypos = y; type = c;} //The constructor of this class
    //Method that displays him
    void display() {
        rectMode(CORNER); //Setting the rectangle mode to upperleftX,upperLeftY,width,height
        stroke(0);
        fill(100);
        rect(xpos,ypos,20,20); //The body
        ellipseMode(CENTER);
        fill(type);
        ellipse(xpos+10,ypos+10,10,10);
    }
    void interpret(String command) { //Interprets and carries out commands
        String[] cmd = split(command, " ");
        if(cmd[0].equals("turn")) {
            
        } else if(cmd[0].equals("move")) {
            
        }
    }
}
