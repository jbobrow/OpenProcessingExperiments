
/*@pjs font="http://mod.zlotskiy.com/EdMaxPrime/Fonts/Quicksand-Regular.otf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf";preload="http://mod.zlotskiy.com/EdMaxPrime/pjs/logo.png"*/
int counter;
int consoleSection;
int whenreleased;
PFont norm;
PFont mono;
PFont huge;
String place;
PImage logo;
Array script;
Array logContents;
Array params;

//Colors
String BLANCO = "<color>" + color(255) + "<color>"; //white
String ROJO = "<color>" + color(240, 38, 38) + "<color>"; //red
String AMARILLO = "<color>" + color(222, 222, 35) + "<color>"; //yellow

//Get rid of some methods
String[] match() {}

void setup() {  //setup function called initially, only once
  size(400,428);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  norm = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Quicksand-Regular.otf", 16, true);
  mono = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf", 14, true);
  huge = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf", 36, true);
  place = "/startup";
  logo = loadImage("http://mod.zlotskiy.com/EdMaxPrime/pjs/logo.png");
  script = new Array();
  logContents = new Array();
  consoleSection = 0;
  params = new Array();
  whenreleased = 60;
  
  //Printing area
  
  //Do once
  fill(0);
  textFont(norm);
  text("How are you seeing this?", 25, 25);
  logContents.push("Loaded images");
  rectMode(CORNER);
  var d = new Date();
  params["logoStart"] = d.getTime(); //Must be the last line
}

void draw() {  //draw function loops 
  //Update some variables
  whenreleased++;
  /*This is some backgrounds*/
  if(place.substring(0, 5).equals("/help") == true) {
      background(200);
      fill(182, 191, 178); //152, 171, 138
      stroke(0);
      rect(-width/16, -height/16, width/2, height/2);
      fill(179, 178, 191); //149, 158, 171
      rect(width/5, height/5, width/2, height/2);
      fill(160);
      rect(width/2, height/16, width/2, height/2);
      fill(230);
      rect(2*width/5, -height/4, 3*width/5, height/2);
      strokeWeight(3);
      stroke(181, 176, 22);
      fill(128);
      rect(width/16, height/2, 7*width/8, 6*height/16, 5);
      strokeWeight(1);
  }
  //This is the banner at the beginning
  if(place.equals("/startup") == true) {
      image(logo, 0, 0);
      displayLog(1.0, 0.30);
      var d = new Date();
      if((d.getTime() - getParam("logoStart")) > 5000) {
          place="/";
      } else if((d.getTime() - getParam("logoStart")) > 1000 && (d.getTime() - getParam("logoStart")) < 2000 && logContents[logContents.length - 1].equals("Starting Macx OS...") == false) {
          logContents.push("Starting Macx OS...");
      } else if((d.getTime() - getParam("logoStart")) >= 2000 && (d.getTime() - getParam("logoStart")) < 3000 && logContents[logContents.length - 1].equals(ROJO + "!!! Java is not supported for obvious reasons&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp") == false) {
          logContents.push("Starting Dash virtual machine...");
          logContents.push(ROJO + "!!! Java is not supported for obvious reasons&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
      } else if((d.getTime() - getParam("logoStart")) >= 3000 && (d.getTime() - getParam("logoStart")) < 4000 && logContents[logContents.length - 1].equals(BLANCO + "Connecting to robot...") == false) {
          logContents.push(BLANCO + "Connecting to robot...");
      }
  }
  //This is the main menu
  else if(place.equals("/") == true) {
      background(200);
      fill(0);
      textFont(huge);
      text("Dash the Robot", 50, 50);
      button("Instructions", "go /help/1", width/4 + 2, height/4, "");
  }
  //This is the help menu
  else if(place.equals("/help/1") == true) {
      textFont(norm);
      fill(0);
      text(" Dash the robot is bored of his life at the packaging factory. Help him escape to the outside world to finally see the sunshine!\n\n Unfortunately Dash has little free will, only enough to realize he needs to escape. You must show him how to escape by feeding him commands. Avoid boxes, pistons and other oddities on the factory floor.",10,10,width-20,height-40);
  }
}

void button(String txt, var action, int x, int y, String theSize) {
    textFont(norm);
    int wide = width/2 - 4;
    int high = (count(txt, "\n") + 1) * (height/15 - 4);
    int txtRatio = 1;
    
    if(theSize != null && theSize != undefined && theSize != "") {
        if(theSize.indexOf(",") == 0) { //Determine the width and height of the button
          high = int(theSize.substring(1, theSize.length));
        } else if(theSize.indexOf(",") == -1) {
          wide = int(theSize);
        } else {
          wide = int(split(theSize, ",")[0]);
          high = int(split(theSize, ",")[1]);
        }
    }
    
    if(count(txt, "\n") > 0) { txtRatio = 1.5 - count(txt, "\n"); }
    
    if(mouseX >= x && mouseX <= x+wide && mouseY >= y && mouseY <= y+high) {
      if(mousePressed == true) {
        stroke(20);
        fill(215);
        rect(x, y, wide, high);
        fill(20);
        text(txt, x+5, y + height - (height - 16 * (count(txt, "\n") + txtRatio) ));
      } else {
        stroke(0);
        fill(230);
        rect(x, y, wide, high);
        fill(50);
        text(txt, x+5, y + height - (height - 16 * (count(txt, "\n") + txtRatio) ));
      }
      if(whenreleased <= 1) {
        console.log(action);
        doAction(action);
      }
    } else {
      stroke(0);
      fill(210);
      rect(x, y, wide, high);
      fill(0);
      text(txt, x+5, y + height - (height - 16 * (count(txt, "\n") + txtRatio) ));
    }
}

void displayLog(int percentWide, int percentHigh) {
    stroke(128);
    fill(20, 40, 68);
    rect(0, height * (1 - percentHigh), width * percentWide, height * percentHigh);
    fill(255);
    textFont(mono);
    int logIndex = consoleSection;
    int incrementScroll = 0;
    for(int i = consoleSection; i < floor( (height * percentHigh) / 18 + 5); i++) {
        if(logIndex >= logContents.length) {
          return; //No text left
        }
        var parts = split(logContents[logIndex], "<color>");
        String alreadyDrawn = "";
        for(int j = 0; j < parts.length; j++) {
            
            if(textWidth(alreadyDrawn) >= (width * percentWide)) {
              i++; //Start a new line
              incrementScroll++; //Scroll down one line to accomadate
            }
            if(isNaN(parts[j]) == true) {
              text(parts[j], textWidth(alreadyDrawn) + 5, height * (1 - percentHigh) + (18 * i) + 19);
              alreadyDrawn += parts[j];
            } else {
              fill(int(parts[j]));
            }
        }
        logIndex++;
    }
    consoleSection += incrementScroll;
}

boolean doAction(var action) { //Contains several button commands
    if(typeof action === "string") {
        if(action.split(" ", 2)[0].equals("go")) {
            place = action.split(" ", 2)[1];
        }
        else if(action.split(" ", 2)[0].equals("js")) {
            eval(action.split(" ", 2)[1]);
        }
        else if(action.charAt(0) == '?') {
            
        }
    }
    else if(Array.isArray(action) == true) {
      for(int i = 0; i < action.length; i++) {
        doAction(action[i]);
      }
    }
    return false;
}

String getParam(String param) {
    if(params.hasOwnProperty(param) == true) {
      return params[param];
    } else {
      params[param] = "";
      return "";
    }
}
void clearParams() {
    Array keep = new Array();
    String[] whitelist = getParam("@persist").split(",");
    for(int i = 0; i < whitelist.length; i++) {
        keep.push(getParam(whitelist[i]));
    }
    params = keep;
    params["@persist"] = join(keep, ",");
}
String substring(String s, int a, int z) {
    String r = "";
    char[] sttring = s;
    for(int i = a; i < z; i++) {
        r += sttring[i];
    }
    
    return r;
}
int count(String body, String search) {
    int matchIndex = 0;
    int timesFound = 0;
    for(int i = 0; i < body.length(); i++) {
        //console.log("mi: " + matchIndex + ", search: " + search.charAt(matchIndex) + ", body: " + body.charAt(i) + ", times: " + timesFound);
        if(matchIndex == search.length) {
          timesFound++;
          matchIndex = 0;
        }
        if(body.charAt(i) == search.charAt(matchIndex)) {
          matchIndex++;
        } else {
          matchIndex = 0;
        }
    }
    return timesFound;
}
void mouseReleased() {
    whenreleased = 0;
}
void keyReleased() {
    console.log("key:" + key + ", keyCode:" + keyCode);
}
class Unit{
    int size;
    int xpos;
    int ypos;
    int zindex;
    float motionx;
    float motiony;
    float hardness;
    boolean flammable;
    boolean moveable;
    color c;
    
    Unit(int x, int y, int z, color c) {
        xpos = x;
        ypos = y;
        zindex = z;
        size = width/20;
        motionx = 0;
        motiony = 0;
        flammable = false;
        moveable = false;
        hardness = 1.0;
        this.c = c;
    }
    void display() {
        stroke(0);
        fill(c);
        rectMode(CORNER);
        rect(xpos, ypos, size, size);
        fill(0, zindex * 40); //shading for distance
        rect(xpos, ypos, size, size);
    }
    boolean isTouching(Unit u) {
        if((u.zindex == this.zindex) && (
        (this.xpos + this.size > u.xpos || this.xpos < u.xpos + u.size) && 
        (this.ypos + this.size > u.ypos || this.ypos < u.ypos + u.size) )) {
            return true;
        }
        return false;
    }
}

class Box extends Unit{
    int type; //0 is cardboard, 1 is wood, 2 is metal
    
    Box(int x, int y, int z, int type) {
      xpos = x;
      ypos = y;
      size = width/20;
      this.type = type;
      motionx = 0;
      motiony = 0;
      switch(type) {
          case 0:
          this.c = color(245, 226, 103);
          this.moveable = true;
          this.flammable = true;
          break;
          case 1:
          this.c = color(212, 176, 114);
          this.moveable = true;
          this.flammable = true;
          break;
          case 2:
          this.c = color(165, 197, 199);
          this.moveable = false;
          this.flammable = false;
          break;
          default:
          this.c = color(type); //235, 200, 7
          this.moveable = false;
          this.flammable = false;
          break;
      }
    }
    void onCollide(Unit u) { //Someone is colliding with me
        switch(this.type) {
            case 0:
            
        }
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
