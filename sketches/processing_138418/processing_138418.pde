
/*@pjs font="http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf"*/
int moves;
int score;
int time;
int lang;
float difficulty;
int maxElements = 0;
int selectedElem = 1;
int sinceSelected;
PFont sax;
String[] english;
String[] spanish;
String[] glob;
String place;
String seed;
Grid user;
Grid level;
boolean popupBackground = false;
boolean animateConditions = false;
int[] levelbg;
var timer;

String[] split() {}

void setup() {  //setup function called initially, only once
  size(500, 300);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  moves = 0;
  score = 0;
  time = 0;
  sinceSelected = -2;
  sax = createFont("http://mod.zlotskiy.com/EdMaxPrime/Fonts/Raleway-Regular.otf", 14, true);
  textFont(sax);
  lang = 1; //0:english, 1:spanish, 2:glob
  makeLanguages();
  user = new Grid(10, width/4-3, 0, width/2, color(120, 154, 110), true);
  level = new Grid(10, width/4-3, 0, width/2, color(240, 63, 10), false);
  place = "/settings/lang?redir=/menu/main";
  seed = "";
  timer = {
      timeStarted : 0,
      timeEnded : 0,
      isRunning : false,
      startTime : function() {
          this.timeStarted = new Date().getTime();
      },
      checkTime : function() {
          return (new Date().getTime()) - this.timeStarted;
      },
      getFormat : function() {
          int time = this.checkTime();
          return nf(int(floor(time/1000/60)), 2) + ":" + nf(int(floor(time/1000)) % 60, 2);
      }
  };
  levelbg = {202, 224, 209};
  println(place);
}

void draw() {  //draw function loops 
  if(sinceSelected >= 0) {sinceSelected++;}
  if(place.indexOf("/settings/lang") == 0) {
    maxElements = 3;
    if(!popupBackground) {
      fill(128, 64);
      rect(0, 0, width, height);
      popupBackground = true;
      fill(220);
      rect(width/4, height/6, width/2, 2*height/3);
    }
    fill(35, 67, 204);
    rect(width/4, height/6, width/2, 20);
    fill(255);
    text(getString(1), width/4, height/6+18);
    fill(240, 63, 10);
    rect(3*width/4-14, height/6+2, 12, 12);
    fill(255);
    text("X", 3*width/4-12, height/6+16);
    button(3*width/8, height/6+40, "English", "lang=0;"+place.split("\\?",2)[1], 1);
    button(3*width/8, height/6+64, "Espanol", "lang=1;"+place.split("\\?",2)[1], 2);
    button(3*width/8, height/6+88, "Glob", "lang=2;"+place.split("\\?",2)[1], 3);
  }
  else if(place.indexOf("/menu/win") == 0) {
    maxElements = 4;
    if(!popupBackground) {
      fill(128, 64);
      rect(0, 0, width, height);
      popupBackground = true;
      fill(220);
      rect(width/4, height/6, width/2, 2*height/3);
    }
    fill(35, 67, 204);
    rect(width/4, height/6, width/2, 20);
    fill(255);
    text(getString(13), width/4, height/6+18);
    fill(240, 63, 10);
    rect(3*width/4-14, height/6+2, 14, 14);
    fill(255);
    text("X", 3*width/4-12, height/6+16);
    button(3*width/8, height/6+40, getString(12), "redir=/menu/main", 1);
    button(3*width/8, height/6+64, getString(14), "level="+difficulty+";redir=/level", 2);
    button(3*width/8, height/6+88, getString(16), "level="+(difficulty+0.5)+";redir=/level", 3);
    button(3*width/8, height/6+112, getString(17), "level="+(difficulty+0.5)+";redir=/level", 4);
    fill(100);
    text(getString(15)+seed, width/4+5, height/6+150);
  }
  else if(place.indexOf("/menu/main") == 0) {
    background(204, 217, 237);
    maxElements = 6;
    user.xpos = width/4-3;
    user.display();
    fill(49, 115, 222);
    textSize(26);
    text("Reverse Painting", (width-textWidth("Reverse Painting"))/2, height/4);
    textSize(12);
    fill(0);
    text("Running version 1.2 javascript canvas", 5, height-4); //Version info
    text("The time is still glitchy", 5, height-24); //Update info
    textSize(14);
    int bu_y = height/4;
    /*button(5, bu_y, getString(3), 
      "level=1;redir=animate?bg=72,199,97&float=level,w/2+3,0&float=user,0,0&then=redir=/level",1);*/
    button(5, bu_y, getString(3), "level=1;redir=/transition/level.mov", 1);
    button(5, bu_y+24, getString(4), 
      "level=2;redir=animate?bg=92,214,96&float=level,w/2+3,0&float=user,0,0&then=redir=/level",2);
    button(5, bu_y+48, getString(5), 
      "level=3;redir=animate?bg=191,206,86&float=level,w/2+3,0&float=user,0,0&then=redir=/level",3);
    button(3*width/4,bu_y,getString(6),
      "level=0;redir=animate?bg=81,139,242&float=level,w/2+3,0&float=user,0,0&then=redir=/level",0);
    button(3*width/4, bu_y+24, getString(7), 
      "redir=/settings/lang?redir=/menu/main", 5);
    button(3*width/4, bu_y+48, getString(8), 
      "redir=/menu/help?redir=/menu/main");
  }
  else if(place.indexOf("/menu/help") == 0) {
    doAction(place.split("\\?", 2)[1]);
  }
  else if(place.indexOf("animate") == 0) {
    String params = place.split("\\?", 2)[1]; //Everything after the question mark
    String[] code = params.split("&"); //Every & seperated param
    for(int animateIndex = 0; animateIndex < code.length; animateIndex += 0) {
      String whatToDrawNow = code[animateIndex];
      if(animateConditions == true && whatToDrawNow.indexOf("then") == 0) {
        println(whatToDrawNow.split("=", 2)[1]+" under the condition that: "+animateConditions);
        whatToDrawNow = whatToDrawNow.split("=", 2)[1];
        doAction(whatToDrawNow);
        break;
      }
      else {
        doAction(whatToDrawNow);
        animateConditions = animateConditions && doAction(whatToDrawNow);
        animateIndex++;
      }
    }
    animateConditions = true;
  }
  
  else if(place.indexOf("/transition/level.mov") == 0) {
      color from = color(61, 227, 114);
      color to   = color(242, 113, 87);
      levelbg[0] = red(lerpColor(from, to, difficulty/10));
      levelbg[1] = green(lerpColor(from, to, difficulty/10));
      levelbg[2] = blue(lerpColor(from, to, difficulty/10));
      background(levelbg[0], levelbg[1], levelbg[2]);
      if(user.xpos > 1 && user.ypos < width/2 + 2) {
          user.xpos += (0 - user.xpos) * 0.1;
          level.xpos += (width/2 + 3 - level.xpos) * 0.1;
      } else {
          doAction("redir=/level");
      }
      level.display();
      user.display();
  }
  else if(place.indexOf("/transition/main_menu.mov") == 0) {
      background(204, 217, 237);
      if(user.xpos < width/4-4 || level.xpos > width/4-2) {
          user.xpos += (width/4 - 3 - user.xpos) * 0.05;
          level.xpos += (width/4 - 3 - level.xpos) * 0.05;
      } else {
          doAction("redir=/menu/main");
      }
      level.display();
      user.display();
  }
  
  else if(place.indexOf("/level") == 0) {
    maxElements = 4;
    int correct = 0;
    background(levelbg[0], levelbg[1], levelbg[2]);
    user.display();
    level.display();
    fill(100, 0, 100);
    time+= 60/frameRate;
    text(getString(9)+moves+" | "+getString(10)+timer.getFormat()+" | "+getString(11)+score, 5, height-30);
    for(int i = 0; i < user.boxes.length; i++) {
    if(((user.boxes[i][0]==red(user.orig) && user.boxes[i][1]==green(user.orig) && user.boxes[i][2]==blue(user.orig)) && (level.boxes[i][0]==red(level.orig) && level.boxes[i][1]==green(level.orig) && level.boxes[i][2]==blue(level.orig))) || (!(user.boxes[i][0]==red(user.orig) && user.boxes[i][1]==green(user.orig) && user.boxes[i][2]==blue(user.orig)) && !(level.boxes[i][0]==red(level.orig) && level.boxes[i][1]==green(level.orig) && level.boxes[i][2]==blue(level.orig)))){
        correct++;
    } else { correct--; }
    }
    if(progressBar(width/2, height-50, width/2-10, correct/user.boxes.length)) {
      score += round(5*difficulty);
      doAction("redir=/menu/win");
    }
    button(0, height-24, getString(12), "redir=/transition/main_menu.mov", 1);
    button(width/4, height-24, getString(8), "redir=/menu/help", 2);
    button(width/2, height-24, getString(14), "level="+difficulty, 3);
  }
}

void keyReleased() {
  if(key == CODED) {
    if(keyCode == UP || keyCode == LEFT) {
      selectedElem--;
      if(selectedElem < 1) { selectedElem = maxElements; }
    }
    else if(keyCode == DOWN || keyCode == RIGHT) {
      selectedElem++;
      if(selectedElem > maxElements) { selectedElem = 1; }
    }
  } else {
    if(key == "\n" || key == 10) {
      sinceSelected = 0;
    }
  }
}

void mouseReleased() {
  if(sinceSelected >= -1) {
  sinceSelected = 0;
  } else {
  sinceSelected++;
  selectedElem =0;
  }
  if(place.indexOf("/menu/main") == 0) {
    if(mouseX>=user.xpos && mouseX<=user.xpos+user.side && mouseY >= user.ypos && mouseY <= user.ypos+user.side){
      user.paint({user.getIndex(mouseX, mouseY)}, true);
    }
  }
  else if(place.indexOf("/level") == 0) {
    if(mouseX>=user.xpos && mouseX<=user.xpos+user.side && mouseY >= user.ypos && mouseY <= user.ypos+user.side){
      user.paint({user.getIndex(mouseX, mouseY)}, true);
      moves++;
    }
  }
}

void button(int x, int y, String eltext, String action, int elemindex) {
  stroke(0);
  fill(255);
  if(selected(x, y, width/4-4, 20, elemindex)) {
    stroke(4*(60 % second()));
    fill(209, 189, 33);
    selectedElem = elemindex;
    if(sinceSelected <= 1 && sinceSelected >= 0) {
      doAction(action);
    }
  }
  rect(x, y, width/4-4, 20);
  fill(49, 115, 222);
  text(eltext, x+(width/4-textWidth(eltext)-4)/2, y+16);
}

boolean progressBar(int x, int y, int w, int fraction) {
  stroke(0);
  fill(255);
  rect(x,y,w,20);
  fill(0);
  rect(x+2,y+2,fraction*w,16);
  fill(160);
  text(ceil(fraction*100)+"%", x+w/2, y+18);
  if(ceil(fraction*100) == 100) { return true; }
  else { return false; }
}

int rng(int[] range) {
    return range[int(random(0, range.length))];
}

boolean selected(int x, int y, int w, int h, int elemindex) {
  if(((mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h ) || selectedElem == elemindex) && sinceSelected < 2) {
    return true;
  }
  return false;
}

function doAction(String accion) {
  if(accion.indexOf(";") > 1) { 
    for(int i = 0; i < accion.split(";").length; i++) {
      doAction(accion.split(";")[i]);
    }
  } else {
    if(accion.indexOf("redir") == 0) {
      accion.replaceAll("&",";");
      accion.replaceAll("//;","&");
      place = accion.split("=",2)[1];
      sinceSelected = -2;
      popupBackground = false;
      animateIndex = 0;
      timer.startTime();
      println("Redirecting to: "+place);
      return true;
    }
    else if(accion.indexOf("lang") == 0) {
      lang = int(accion.split("=")[1]);
      return true;
    }
    else if(accion.indexOf("bg") == 0){
      String[] strnums = accion.split(",");
      int[] nums = new int[strnums.length];
      for(int i = 0; i < nums.length; i++) {nums[i] = int(strnums[i]);}
      background(nums[0], nums[1], nums[2]);
      return true;
    }
    else if(accion.indexOf("float") == 0){
      String[] params = accion.split("=",2)[1].split(",");
      String thing =    params[0];
      int xpos =        int(eval(params[1].replaceAll("w",str(width)).replaceAll("h",height)
        .replaceAll("mX",str(mouseX)).replaceAll("mY",str(mouseY))));
      int ypos =        int(eval(params[2].replaceAll("w",str(width)).replaceAll("h",height)
        .replaceAll("mX",str(mouseX)).replaceAll("mY",str(mouseY))));
      if(thing.equals("user")) {
        if(user.xpos < xpos) { user.xpos++; }
        else if(user.xpos > xpos) { user.xpos--; }
        if(user.ypos < ypos) { user.ypos++; }
        else if(user.ypos > ypos) { user.ypos--; }
        user.display();
        if(user.xpos == xpos && user.ypos == ypos) { return true; }
        else { return false;}
      }
      else if(thing.equals("level")) {
        if(level.xpos < xpos) { level.xpos++; }
        else if(level.xpos > xpos) { level.xpos--; }
        if(level.ypos < ypos) { level.ypos++; }
        else if(level.ypos > ypos) { level.ypos--; }
        level.display();
        if(level.xpos == xpos && level.ypos == ypos) { return true; }
        else { return false; }
      }
    }
    else if(accion.indexOf("level") == 0) {
        time = 0;
        moves = 0;
        int[] rangeForColors = {0, 30, 60, 110, 166, 180, 200, 230, 255};
        level.orig = color(rng(rangeForColors), rng(rangeForColors), rng(rangeForColors));
        level.paint({level.boxes.length, level.orig}, false); //Clear the level board
        user.orig = color(rng(rangeForColors));
        user.paint({user.boxes.length, user.orig}, false); //Clear the user board
        int difficulty_param = float(accion.split("=")[1]); //Get the number after the =
        if(difficulty_param == 0) {difficulty_param = random(1,4);}
        difficulty = difficulty_param;
        int[] points = new int[round(difficulty*2)];
        int[] setback = new int[round(difficulty*2)];
        for(int i = 0; i < difficulty*2; i++) { //Populate the array with random points
          points[i] = floor(random(0, level.boxes.length)); //Put a random point on the board
          setback[i]=user.boxesPerSide * floor(random(0,user.boxesPerSide)) + floor(random(0,user.boxesPerSide));
          seed += points[i]+","+setback[i]+","
        }
        level.paint(points, true);
        user.paint(setback, true);
        seed = seed.substring(0, seed.length);
    }
    println("Action: "+accion+" "+animateConditions);
    return false;
  }
}

class Grid {
  int[][] boxes;
  boolean clickable;
  int xpos;
  int ypos;
  int side;
  int boxesPerSide;
  color orig;
  Grid(int boxesPerSide, int x, int y, int w, color c, boolean click) {
    boxes = new int[boxesPerSide*boxesPerSide][3];
    xpos = x;
    ypos = y;
    side = w;
    clickable = click;
    orig = c;
    this.boxesPerSide = boxesPerSide;
    for(int i = 0; i < boxes.length; i++) {
      boxes[i][0] = red(c);
      boxes[i][1] = green(c);
      boxes[i][2] = blue(c);
    }
    return this;
  }
  void paint(int[] coords, boolean chainreaction) {
    if(coords[0] == boxes.length) {
      for(int i = 0; i < boxes.length; i++) {
        boxes[i][0] = red(coords[1]);
        boxes[i][1] = green(coords[1]);
        boxes[i][2] = blue(coords[1]);
      }
    }
    for(int i = 0; i < coords.length; i ++) {
      if(coords[i] >= 0 && coords[i] < boxes.length) {
      boxes[coords[i]][0] = 255-boxes[coords[i]][0];
      boxes[coords[i]][1] = 255-boxes[coords[i]][1];
      boxes[coords[i]][2] = 255-boxes[coords[i]][2];
      }
      if(chainreaction && coords[i] % boxesPerSide != 0 && coords[i] % boxesPerSide != boxesPerSide-1) {
      paint({coords[i]-1,coords[i]+1,coords[i]-boxesPerSide,coords[i]+boxesPerSide}, false);
      } else if(chainreaction) {
        if(coords[i] % boxesPerSide == 0) {
          paint({coords[i]+1, coords[i]+boxesPerSide, coords[i]-boxesPerSide}, false);
        } else {
          paint({coords[i]-1, coords[i]+boxesPerSide, coords[i]-boxesPerSide}, false);
        }
      }
    }
    return this;
  }
  int getIndex(int mx, int my) {
    mx -= xpos;
    my -= ypos;
    int mx = floor(mx/(side/boxesPerSide));
    int my = floor(my/(side/boxesPerSide));
    return mx+my*boxesPerSide;
  }
  void display() {
    for(int i = 0; i < boxes.length; i++) {
      int boxSide = side/boxesPerSide;
      stroke(256-boxes[i][0], 256-boxes[i][1], 256-boxes[i][2]);
      fill(boxes[i][0], boxes[i][1], boxes[i][2]);
      rectMode(CORNER);
      rect(xpos+((i % boxesPerSide)*boxSide), ypos+(floor(i/boxesPerSide)*boxSide), boxSide, boxSide);
    }
    return this; //Return the object to support chaining
  }
}
void makeLanguages() {
  english = {"Internal error 4", "Choose a language", "This game is in development", "easy", "normal", "hard", "random", "settings", "help", "moves: ", "time: ", "points: ", "Main menu", "Victory!", "Next puzzle", "Seed: ", "Harder", "Easier"};
  spanish = {"Error interno 4", "Eliges un idioma", "Este juego esta en desarrollo", "facil", "normal", "dificil", "azar", "configuracion", "ayuda", "movimientos: ", "tiempo: ", "puntos: ", "Menu principal", "Vences!", "Siguiente rompecabezas", "Semilla: ", "Mas dificil", "Mas facil"};
  glob = {"eeyuhr 4 ijntI", "ghfjkd hgjk ghjfkllll", "tt ghuio ij ey ujmdmklcre", "yuio", "rhngi", "addret", "enjmkg?", "cfgverdad", "!huib", "yuhm: ", "hyiufdT: ", "uupio: "};
}

void println(var msg) {
  console.log(msg);
}

String getString(int index) {
  if(lang == 0) {
    if(index < english.length) {return english[index];}
    else {return english[0];}
  }
  else if(lang == 1) {
    if(index < spanish.length) {return spanish[index];}
    else {return spanish[0];}
  }
  else if(lang == 2) {
    if(index < glob.length) {return glob[index];}
    else {return glob[0];}
  }
  return "Error 3: Unknown language";
}
