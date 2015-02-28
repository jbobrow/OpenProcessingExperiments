
/*@pjs font="http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf,http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf"*/
int counter;
String place;
PFont mono;
PFont regular;
PFont title;
int whenreleased;
boolean oncePerRedir;

String[] split() {} //get rid of this to use default javascript string.split()
Array.prototype.pushFrame = function(newElem, maxsize) {
    if(this.length < maxsize) {
      this[this.length] = newElem;
    }
    else if(this.length === maxsize) {
      for(var i = 0; i < maxsize; i++) {
        if(i === maxsize-1) {
          this[i] = newElem;
        } else {
          this[i] = this[i+1];
        }
      }
    } else {
      for(var i = this.length-maxsize; i < maxsize; i++) {
        if(i === maxsize-1) {
          this[i] = newElem;
        } else {
          this[i] = this[i+1];
        }
      }
    }
}

void setup() {  //setup function called initially, only once
  size(600, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  rectMode(CORNER);
  mono = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/saxmono.ttf", 16, true);
  regular = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf", 14, true);
  title = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Molot.otf", 36, true);
  textFont(regular);
  place = "race_game/index";
  whenreleased = 0;
  oncePerRedir = false;
  var arr = [55, 56, 57, 58, "hello"];
  var keys = [];
  for(key in arr) {
    if(arr.hasOwnProperty(key)) {keys[keys.length] = key; keys[keys.length] = arr[key];}
  }
  println(keys);
}

void draw() {  //draw function loops 
  whenreleased++;
  if(place.indexOf("race_game/index") == 0) {
      if(oncePerRedir == false) {
        background(245, 243, 191);
        textFont(title);
        fill(0);
        text("Racing Game", (width - textWidth("Racing Game"))/2, height/5);
        oncePerRedir = true;
        this.fill(0);
      }
      button("New Game", "redir=/levels?back=/index", 3*width/8, height/4, width/4);
      button("Help", "redir=/help", 3*width/8, height/4 + height/15, width/4);
      button("Credits", "redir=/help/credits", 3*width/8, height/4 + 2*height/15, width/4);
      fill(240);
      stroke(180);
      rect(0, height-20, width, 20);
      fill(0);
      textSize(12);
      text("Running version 1.0 (javascript canvas) made by Max Zlotskiy", 5, height-4);
  }
  else if(place.indexOf("race_game/levels") == 0) {
      if(oncePerRedir === false) {
        var coords = new Array();
        oncePerRedir = true;
      }
      background(245, 243, 191);
      fill(0);
      textFont(title);
      text("Level Select", (width - textWidth("Level Select"))/2, height/5);
      coords.pushFrame(mouseX + "," + mouseY, 60);
      noStroke();
      if(second() < 30) {fill(second()*4);}
      else {fill(243-(second()*4));}
      for(var i = 0; i < coords.length; i++) {
        int x = parseInt(coords[i].split(",")[0]);
        int y = parseInt(coords[i].split(",")[1]);
        ellipse(x, y, width/15, width/15);
      }
  }
}

void button(String msg, String action, int tempx, int tempy, int tempwide) {
    int high = height/15-4;
    fill(218, 190, 138);
    stroke(26, 99, 163);
    rect(tempx, tempy, tempwide, high);
    fill(26, 99, 163);
    if(mouseX >= tempx && mouseX <= tempx+tempwide && mouseY >=tempy && mouseY<=tempy+high) {
      fill(224, 218, 36);
      rect(tempx, tempy, tempwide, high);
      fill(30, 110, 185);
      if(whenreleased < 2) {
        doAction(action);
      }
    }
    textFont(mono);
    text(msg, tempx + (tempwide-textWidth(msg))/2, (tempy+high) - (high-16));
}

void doAction(action) {
  if(action.indexOf(";") != -1) {
        for(String act : action.split(";")) {
          doAction(act);
        }
  } else {
      if(action.indexOf("redir") == 0) {
            whenreleased++;
            String where = action.split("=")[1];
            if(where.indexOf(" then ") > -1) {
              for(String loc : where.split(" then ")) {
                place = "race_game" + loc;
                oncePerRedir = false;
                draw();
              }
            } else {
              if(where.indexOf("http://") == 0) {
                link(where);
              }
              place = "race_game" + where;
              oncePerRedir = false;
              draw();
            }
      }
      else if(action.indexOf("h?")) {
      
      }
  }
}

function getParam(String pname) {
    if(place.indexOf(pname) > -1) {
      for(String s : place.split("\\?")[1].split("&")) {
        if(s.indexOf(pname) == 0) {
          String value = s.split("=")[1];
          if(value.indexOf("[") == 0 && value.lastIndexOf("]") == value.length-1) {
            value = value.substring(1, value.length-1);
            return value.split(",");
          }
          else if(value.equals("true")) {
            return true;
          }
          else if(value.equals("false")) {
            return false;
          }
          else if(parseInt(value) != NaN && value.indexOf(".") == -1 && isNaN(value) == false) {
            return parseInt(value);
          }
          else if(parseFloat(value) != NaN && isNaN(value) == false) {
            return parseFloat(value);
          }
          else {
            return value;
          }
        }
      }
    } else {
      return "";
    }
}

void mouseReleased() {
    whenreleased = 0;
}
void println(msg) {
    println(msg);
}

class Direction { //NOTE: a direction does <b>not</b> include speed!
    /*The properties go from general to specific*/
    boolean hasDirection; //Am I moving?
    int cardinal; //North, south, east or west? 0 if none and 5 if diagonal
    int interval; //Northeast, Northwest, Southeast, Southwest? 0 if it's cardinal
    float slope; //y = mx + b, the "m"
    float howExtreme; //A percent(0-1) that shows how close to a cardinal
    
    Direction(options) {
      if(options != null) {
          if(options.has.equals("true")) {
            hasDirection = true;
          } else {
            hasDirection = false;
          }
          if(options.hasOwnProperty("cardinal")) {
            if(options.cardinal.equals("n")) { cardinal = 1; }
          }
      }
    }
}

class Car {
    float xpos;
    float ypos;
    color body;
    float speed;
    float nitro;
    float velocityX;
    float velocityY;
    Direction d;
}

void println(msg) {
  console.log(msg);
}

void textBox(options) {
    fill(options.fill[0], options.fill[1], options.fill[2]);
    stroke(options.brush[0], options.brush[1], options.brush[2]);
    rect(options.x, options.y, options.wide, options.high);
    fill(options.textColor[0], options.textColor[1], options.textColor[2]);
    if(mouseX >= options.x && mouseX <= options.x+options.wide && mouseY >=options.x && mouseY<=options.y+options.high && options.hover == true) {
      fill(options.fill2[0], options.fill2[1], options.fill2[2]);
      rect(options.x, options.y, options.wide, options.high);
      fill(options.textColor2[0], options.textColor2[1], options.textColor2[2]);
    }
    textFont(mono);
    if(options.textAlign.equals("center")) {
      text(options.txt, options.x+(options.wide-textWidth(options.txt))/2, options.y-(options.high-14)/2);
    }
    else if(options.textAlign.equals("right")) {
      text(options.txt, options.x+(options.wide-textWidth(options.txt)), options.y-(options.high-14)/2);
    } else {
      text(options.txt, options.x+textWidth(" "), options.y-(options.high-14)/2);
    }
}
