
// AdventureGame Sample / Written by n_ryota / http://cafe.eyln.com

//------------------------------------------
PImage bg, chara;
int bgAlpha = 0;
int charaAlpha = 0;
String[] scenario;
int scenarioCur = 0;
String message = "";
int messageCur = 0;
boolean prevMousePressed = false;

//------------------------------------------
void setup() {
  size(640, 480);
  textFont(createFont("Century", 20)); //String[] fontList = PFont.list(); println(fontList);
  scenario = loadStrings("scenario.txt");
}

//------------------------------------------
void draw() {
  if(bgAlpha<255) bgAlpha += 20;
  if(bg!=null) {
    tint(255, bgAlpha);
    image(bg, 0, 0);
  } else background(0, bgAlpha);
  
  if(chara!=null) {
    if(charaAlpha<255) charaAlpha += 20;
    tint(255, charaAlpha);
    image(chara, 0, 0);
  }
  
  int boardH = 80;
  int boardY = height-boardH;
  noStroke();
  fill(0, 0, 0, 200);
  rect(0, boardY, width, boardH);
  
  if(message.length()>0) {
    fill(255);
    textAlign(LEFT);
    text(message.substring(0, messageCur), 20, boardY+15, width-80, 20*2+20);
    if(messageCur<message.length()) messageCur++;
    else {
      fill(255, sin(radians(millis()/2)) * 255);
      ellipse(width-30, height-30, 20, 20);
      if(mousePressed && !prevMousePressed) {
        message = ""; messageCur = 0;
      }
    }
  }

 if(messageCur<=0) {
    for(;;) {
      if(scenarioCur>=scenario.length) {
        exit(); break;
      }
      println(nf(scenarioCur, 4) + ": " + scenario[scenarioCur]); // for debug
      if(doCommand(scenario[scenarioCur++])) {
        println("----"); // for debug
        break;
      }
    }
  }
  prevMousePressed = mousePressed;
}

boolean doCommand(String commandStr) {
  if(commandStr.length()<=0) {
    return true;
  } else if(commandStr.charAt(0)=='>') {
    String[] args = splitTokens(commandStr);
    if(args.length>0) {
      if(">image".equals(args[0])) {
        charaAlpha = 0;
        if(args.length>1) chara = loadImage(args[1]);
        else chara = null;
      } else if(">bg".equals(args[0])) {
        if(args.length>1) {
          bgAlpha = 0;
          bg = loadImage(args[1]);
          if (bg.width != width || bg.height != height) bg.resize(width, height);
        } else bg = null;
      }
    }
  } else {
    if(message.length()>0) message += "\n";
    message += commandStr;
  }
  return false;
}

