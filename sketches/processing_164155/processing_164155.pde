
int counter;
int whenclicked;
int updateID;
int scrollIndex;
int rightClickCoords;
Array cycleTimes;
float msgOffset;
String place;
String editing;
String next;
String last;
World current;
var saves;
var lchart;
var chartData;
var chartOpts;
boolean rightClick;
color backGround;
color buttonNormal;
color buttonHover;
color textLight;
color textDark;
color sliderBg;
color sliderFg;
color titleLabel;
color titleText;
color pauseMenu;
color textTile1;
color textTile2;

void setup() {  //setup function called initially, only once
  size(300, 500);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  last = "/world/create/speed";
  place = "/world/create/speed";
  next = "/world/create/vegetation";
  editing = "speed";
  whenclicked = 50;
  msgOffset = 5;
  cycleTimes = [];
  backGround = #AA3939;
  buttonNormal = #801515;
  buttonHover = #A63030;
  buttonDisabled = #D46A6A;
  textLight = #FFAAAA;
  textDark = #550000;
  sliderBg = #FFAAAA;
  sliderFg = #D46A6A;
  titleLabel = #801515;
  titleText = #F0B4B4;
  pauseMenu = #9C4024;
  textTile1 = #DB5A5A;
  textTile2 = #DB785A;
  var script = document.createElement("script");
  script.id = "soasScript";
  script.type = "text/javascript";
  script.src = "https://rawgit.com/nnnick/Chart.js/master/Chart.js";
  document.body.appendChild(script);
  //Processing.loadSketchFromSources(document.getElementById("pjsComplexSketch"), ["http://mod.zlotskiy.com/EdMaxPrime/pjs/animals_r172.pde"]);
  chartData = { labels : [], datasets : [] };
  chartOpts = { pointHitDetectionRadius : 5, datasetFill : false, pointDot : true };
  scrollIndex = 0;
  rightClick = false;
  rightClickCoords = [0, 0];
  saves = [];
  current = new World();
}

/*background=#B897F0 button=#5BADF5 hover_fill=#8CC4F5 title=#F55BCE tile1=99, 184, 88 tile2=99, 184, 188 new=#802B67
weatherNormal=#9669E0 weatherHover=#B069E0*/
void draw() {  //draw function loops 
  whenclicked++;
  if(place.indexOf("/world/create/speed") >= 0) {
      editing = "speed"; last = "/world/create/speed"; next = "/world/create/vegetation";
      background(backGround);
      title("World Speed: " + current.speed, 10);
      slider(70, 1, 10, 9, current.speed, editing);
      button(120, 450, "Next", "go=/world/create/vegetation");
  }
  else if(place.indexOf("/world/create/vegetation") >= 0) {
      editing = "vegetation"; last = "/world/create/speed"; next = "/world/create/terrain";
      background(backGround);
      title("Plant Coverage: " + current.vegetation, 10);
      slider(70, 1, 10, 9, current.vegetation, editing);
      button(80, 450, "Back", "go=/world/create/speed");
      button(160, 450, "Next", "go=/world/create/terrain");
  }
  else if(place.indexOf("/world/create/terrain") >= 0) {
      editing = "terrain"; last = "/world/create/vegetation"; next = "/world/create/gradient";
      background(backGround);
      title("Terrain Smoothness: " + current.terrain, 10);
      slider(70, 1, 10, 9, current.terrain, editing);
      button(80, 450, "Back", "go=/world/create/vegetation");
      button(160, 450, "Next", "go=/world/create/gradient");
  }
  else if(place.indexOf("/world/create/gradient") >= 0) {
      editing = "gradient"; last = "/world/create/terrain"; next="/world/make";
      background(backGround);
      title("Mountain Height: " + current.gradient, 10);
      slider(70, 1, 20, 19, current.gradient, editing);
      current.startedGeneration = new Date().getTime();
      button(80, 450, "Back", "go=/world/create/terrain");
      button(160, 450, "Next", "go=/world/make");
  }
  else if(place.indexOf("/world/make") >= 0) {
      last = "/world/create/gradient";
      background(backGround);
      int timeNow = new Date().getTime();
      title("Generating World...", 10);
      slider(70, 0, 5, 6, floor((timeNow - current.startedGeneration)/1000), "time");
      noStroke();
      fill(backGround);
      rect(80, 90, 140, 50);
      button(120, 100, "Cancel", "go=/world/create/gradient");
      if(floor((timeNow - current.startedGeneration)/1000) >= 6) {
          current.reset();
          current.generateHeightMap();
          current.generateWorld();
          doAction("go=/world/play");
          updateID = setInterval(function() {
                  Date st = new Date();
                  var ends = Processing.getInstanceById("pjsComplexSketch").getWorld().startCycle();
                  Processing.getInstanceById("pjsComplexSketch").addTime(ends - st.getTime());
              },
              (11 - current.speed)*40
          );
          console.log(updateID);
      }
  }
  else if(place.indexOf("/world/play") >= 0) {
      msgOffset -= 0.5; //deprecated
      if(msgOffset < -width/2 - current.message.length*10) {
          msgOffset = width;
      }
      background(200);
      current.renderAll();
      fill(textDark);
      textSize(14);
      text("Day #" + current.day + ": " + current.message, 0, height - 2);
      minibutton(width - 15, height - 18, "\u22EE", "toggle=rightClick");
      if(rightClick == true) {
          var list = ["Pause", "Quit", "About 1.7", "Save...", "Share"];
          var listActions = [
            "pause=true;go=/world/pause",
            "pause=true;reset=world;go=/world/speed",
            "pause=true;go=/world/info",
            "go=/world/play?box=Saving is not yet supported. Closing your browser tab will delete the world.",
            "go=/world/play?box=Sharing is not yet supported."
          ];
          for(int i = 0; i < 5; i++) {
              noStroke();
              if(mouseX >= rightClickCoords[0] && mouseX <= rightClickCoords[0] + 100 &&
              mouseY >= rightClickCoords[1] + i * 25 && mouseY <= rightClickCoords[1] + (i + 1) * 25) {
                  fill(96, 134, 219);
                  if(mousePressed == true) {
                      if(mouseButton == LEFT) doAction(listActions[i]);
                  }
              } else {
                  fill(255);
              }
              rect(rightClickCoords[0], rightClickCoords[1] + i * 25, 100, 25);
              fill(160);
              text(list[i], rightClickCoords[0] + 5, rightClickCoords[1] + (i + 1) * 25 - 5);
          }
      }
  }
  else if(place.indexOf("/world/pause") >= 0) {
      stroke(0);
      fill(pauseMenu); noStroke();
      rect(60, 80, 160, 360);
      title("          Paused", 100);
      fill(textTile1); rect(70, 142, 140, 30);
      fill(textLight); textSize(16);
      text("Day #" + getWorld().day, 85, 160);
      fill(textTile2); rect(70, 172, 140, 40); fill(textLight);
      text("Time is " + int(floor((getWorld().cycles*48)/60)) + ":" + nf(getWorld().cycles*48 % 60, 2), 85, 190);
      textSize(12); fill(textLight); text("*24-hour format", 85, 205); textSize(14);
      fill(textTile1); rect(70, 212, 140, 40); fill(textLight);
      text("Charts api is", 85, 230); textSize(12); fill(textLight);
      text("   " + ((Chart)? "loaded" : "unloaded"), 85, 245); textSize(14);
      fill(textTile2); rect(70, 252, 140, 30);
      fill(textLight); textSize(14);
      text("Weather: " + getWorld().weather, 85, 270);
      button(110, 305, "extra:13:Edit Events", "editing=select;go=/events/show?from=0");
      if(Chart) {button(110, 335, "extra:13:See Charts", "chart=0;go=/chart/make");}
      else {button(110, 335, "extra:13:API Unloaded?", "chart=loading;go=/chart/error");}
      button(110, 365, "extra:13:Options", "go=/world/options?err=Nothing to see here.");
      button(110, 395, "extra:13:Unpause", "pause=false;go=/world/play");
      
  }
  else if(place.indexOf("/chart/make") >= 0) {
      if(editing.length > 1 && editing.indexOf(",") > -1) { //valid chart string
          next = "/chart/show";
      } else {
          next = "/error/params?err=You did not select any data to be shown.\nPlease go back and fix this.";
      }
      last = "?render=/world/play;go=/world/pause";
      background(backGround);
      title("Choose A Graph", 10);
      fill(#C18A0D); noStroke(); textSize(14);
      text("The amount of grass eaten  each day", 10, 75, 200, 40);
      if(editing.indexOf("1") == -1)  { button(230, 70, "Add", "chart=1"); } //old code: size=500,300;go=/chart/any;chart=0
      else { button(230, 70, "Remove", "chart=-1"); }
      stroke(255);
      line(20, 110, 280, 110); textSize(14);
      text("The total amount of grass each day (Cumulative)", 10, 120, 200, 40);
      if(editing.indexOf("2") == -1)  { button(230, 115, "Add", "chart=2"); }
      else { button(230, 115, "Remove", "chart=-2"); }
      stroke(255);
      line(20, 155, 280, 155); textSize(14);
      text("The Grazer population for each day", 10, 165, 200, 40);
      if(editing.indexOf("3") == -1)  { button(230, 160, "Add", "chart=3"); } //old code: size=500,300;go=/chart/any;chart=2
      else { button(230, 160, "Remove", "chart=-3"); }
      stroke(255);
      line(20, 200, 280, 200); textSize(14);
      text("The deaths in the Grazer population each day", 10, 210, 200, 40);
      if(editing.indexOf("4") == -1)  { button(230,205,"Add", "chart=4"); }
      else { button(230,205,"Remove", "chart=-4"); }
      stroke(255);
      line(20, 245, 280, 245); textSize(14);
      text("The births of Grazers each day", 10, 255, 200, 40);
      if(editing.indexOf("5") == -1)  { button(230,250,"Add", "chart=5"); }
      else { button(230,250,"Remove", "chart=-5"); }
      stroke(255);
      line(20, 290, 280, 290);
      text("How much the Grazers moved in total for each day", 10, 300, 200, 40);
      if(editing.indexOf("6") == -1) { button(230,295,"Add", "chart=6"); }
      else { button(230,295,"Remove", "chart=-6"); }
      stroke(255);
      line(20, 335, 280, 335);
      text("Average Grazer ages for each day", 10, 345, 200, 40);
      if(editing.indexOf("7") == -1) { button(230,340,"Add", "chart=7"); }
      else { button(230,340,"Remove", "chart=-7"); }
      stroke(255);
      line(20, 380, 280, 380);
      text("Sea Level", 10, 390, 200, 40);
      if(editing.indexOf("8") == -1) { button(230,385,"Add", "chart=8"); }
      else { button(230,385,"Remove", "chart=-8"); }
      button(100, 450, "Back", "render=/world/play;go=/world/pause");
      button(180, 450, "Go =>", "size=500,300;go=/chart/show;chart=99");
  }
  else if(place.indexOf("/chart/show") >= 0) {
      last = "?kill;size=300,500;go=/chart/make";
      button(50, 0, "Back", "kill;size=300,500;go=/chart/make");
  }
  else if(place.indexOf("/chart/error") >= 0) {
      background(backGround);
      last = "?render=/world/play;go=/world/pause";
      title("Charts API", 10);
      fill(#97F088);
      textSize(14);
      String loaded = Chart? "loaded" : "unloaded";
      text("The Chart.js library is: " + loaded, 5, 90);
      fill(255);
      text("The javascript version of this sketch(the one you are seeing now) uses Chart.js to display the charts. Since Chart.js is a separate" +
      " javascript library, it must be loaded by the browser. This sketch attaches a <script> to the document, and the browser loads Chart.js" +
      " asynchronously. This means it does not load it before the game starts, it loads it while the simulation is running." , 5, 100, width - 10, height);
      fill(180);
      rect(0, height/2 - 10, width, 70);
      fill(234);
      text("The reason you are seeing this page is because either:" + 
        "\n\u2022 Chart.js has not yet loaded" + 
        "\n\u2022 Or because it failed to load", 5, height/2, width - 10, height);
      fill(#DBDBA2);
      rect(0, height/2 + 60, width, 70);
      fill(#F5AB45);
      text("What you can do is you can wait for it to load, or press the reload button below (may take a few seconds). OR you can view it on an external website.", 5, height/2 + 70, width - 10, height);
      button(60, 440, "Back", "render=/world/play;go=/world/pause");
      button(120, 440, "Link", "go=/chart/error?box=The website is currently not finished, we hope to have it up soon!");
      button(180, 440, "Reload", "reload=script");
  }
  else if(place.indexOf("/world/info") >= 0) {
      background(backGround);
      title("Version 1.7", 10);
      fill(#C18A0D);
      textSize(14);
      text("Features include:", 5, 100);
      text("\u2022 Better support for keyboard (use \nN and B keys)", 15, 120);
      text("\u2022 Animals now show their \ngenetic traits", 15, 160);
      text("\u2022 Added inheritance and \nrandom mutations", 15, 180);
      text("\u2022 Added the events system", 15, 220);
      text("\u2022 Many many bugfixes", 15, 240);
      text("\u2022 Performance improvments \nand better animal movement", 15, 260);
      text("\u2022 Fixed the 'average age' \nstatistic for charts", 15, 300);
      button(90, 400, "Back", "render=/world/play;go=" + last);
      //button(150, 300, " More", "link=http://mod.zlotskiy.com/EdMaxPrime/pjs/soas.html");
  }
  else if(place.indexOf("/events/show") >= 0) {
      background(backGround);
      int start = int(getParam("from"));
      int end = start + floor((height - 150)/80);
      if(end < current.calendar.length) next = "/events/show?from=" + end;
      title("Calendar", 10);
      String[][] events = current.calendar.getFrom(start, end);
      for(int i = 0; i < events.length; i++) {
        if(events[i][0].equals("") == false && events[i][1].equals("") == false) {
          stroke(textTile1);
          if(editing.indexOf("+" + (start + i)) == -1) fill(textTile1);
          else fill(textTile2);
          rect(15, 50 + i * 80, 270, 70);
          fill(255);
          textSize(20);
          text(events[i][0], 20, 75 + i * 80);
          if(editing.indexOf("+" + (i + start)) == -1) {
              checkbox(width - 80, 55 + i * 80, i + start, false);
          } else {
              checkbox(width - 80, 55 + i * 80, i + start, true);
          }
          button(width - 80, 85 + i * 80, "Edit", "go=/events/edit?id=" + (i + start));
          textSize(14);
          text(events[i][1], 20, 85 + i * 80, width - 16, 40);
        }
      }
      if(start == 0) button(12, 440, "Back", "render=/world/play;go=/world/pause");
      else if(start > 0) button(12, 440, "Back", "go=/events/show?from=" + (start - (end - start)));
      if(current.calendar.events.length > 1 && editing.indexOf("+") != -1) button(84, 440, "Delete", "delete_event=" + editing);
      else {
          stroke(buttonDisabled);
          fill(buttonDisabled);
          textSize(16);
          rect(84, 440, 60, 30);
          fill(250);
          text("Delete", 89, 460);
          textSize(14);
      }
      if(current.calendar.events.length < 98) button(156, 440, "Add", "go=/events/create");
      else button(156, 440, "Add", "go=/events/show?from=" + start + "&box=The calendar is too full.");
      if(end < current.calendar.events.length) button(228, 440, "Next", "go=/events/show?from=" + end);
      else {
          stroke(buttonDisabled);
          fill(buttonDisabled); //#7ABCF5
          textSize(16);
          rect(228, 440, 60, 30);
          fill(250);
          text("Next", 233, 460);
          textSize(14);
      }
  }
  else {
      background(backGround);
      fill(#C18A0D);
      textSize(34);
      text("Error", 5, 50);
      textSize(16);
      fill(255, 128, 128);
      text(getParam("err"), 10, 80);
      fill(255, 255, 0);
      text(place, 10, 200);
      button(120, 240, "Back", "go=" + last);
  }
  if(getParam("box").equals("Something went wrong. Sorry!") == false && getParam("box").equals("No parameters") == false) {
      stroke(0);
      fill(pauseMenu);
      rect(width/6, 2*height/5, 2*width/3, height/5);
      fill(textLight);
      text(getParam("box"), width/6 + 5, 2*height/5 + 25, 2*height/5 - 10, 80);
      stroke(textDark)
      fill(titleLabel);
      rect(width/6, 2*height/5, 2*width/3, 20, 6);
      fill(titleText);
      text("Error", width/6 + 5, 2*height/5 + 16);
      button(120, 270, "Ok", "go=" + place.replace("box=" + getParam("box")));
  }
}

String getParam(String name) {
    if(split(place, "?").length < 2) {
        return "No parameters";
    }
    String[] params = split(split(place, "?", 2)[1], "&");
    for(int i = 0; i < params.length; i++) {
        String n = split(params[i], "=", 2)[0];
        String v = split(params[i], "=", 2)[1];
        if(n.equals(name) == true) {
            return v;
        }
    }
    return "Something went wrong. Sorry!";
}

void title(String txt, int y) {
    fill(titleLabel);
    rect(0, y, width, 35);
    fill(titleText);
    textSize(28);
    text(txt, 10, y+30);
}

void slider(int y, float min, float max, float intervals, float current, String action) {
    float intervalValue = (max - min)/intervals;
    float pixelsPerInterval = 210/intervals;
    stroke(sliderBg);
    fill(sliderBg);
    rect(30, y, 240, 5, 3);
    fill(sliderFg);
    rect(15 + (current/intervalValue)*pixelsPerInterval, y-15, 10, 30);
    if(current > min) {
    button(90, y + 30, "<<<", "decrease=" + action + "," + intervalValue);
    }
    if(current < max) {
    button(150, y + 30, ">>>", "increase=" + action + "," + intervalValue);
    }
}

void button(int x, int y, String txt, String action) {
    stroke(buttonNormal);
    fill(buttonNormal);
    int extra = 0;
    if(txt.indexOf("extra:") > -1) {
        extra = int(split(txt, ":" , 3)[1]) * 6;
        txt = split(txt,":",3)[2];
    }
    if(mouseX >= x-extra/2 && mouseX <= x+60+extra/2 && mouseY >= y && mouseY <= y+30) { 
        fill(buttonHover);
        if(whenclicked < 2) {
            if(mouseButton == LEFT) doAction(action);
        }
    }
    textSize(16);
    rect(x-extra/2, y, 60+extra, 30);
    fill(textLight);
    text(txt, x - extra/2 + ((60 + extra) - externals.context.measureText(txt).width)/2, y+20);
    textSize(14);
}

void checkbox(int x, int y, String ifPressed, boolean checked) {
    stroke(buttonNormal);
    fill(buttonNormal);
    if(mouseX >= x && mouseX <= x+60 && mouseY >= y && mouseY <= y+30) {
        fill(buttonHover);
        if(whenclicked < 2) {
            console.log(editing + " and " + ifPressed);
            if(checked == false) {
                editing += ("+" + ifPressed);
                checked = true;
            }
            else {
                if(editing.indexOf(ifPressed) != -1) {editing = editing.replace("+" + ifPressed, ""); checked = false;}
            }
        }
    }
    textSize(26);
    rect(x, y, 60, 30);
    fill(textLight);
    if(checked == true) text("\u2611", x + (60 - externals.context.measureText("\u2611").width)/2, y + 20);
    else text("\u2610", x + (60 - externals.context.measureText("\u2610").width)/2, y + 20);
    textSize(14);
}

void minibutton(int x, int y, String txt, String action) {
  fill(textDark);
  if(mouseX >= x && mouseX <= x + 16 && mouseY >= y && mouseY <= y + 16) {
    fill(255, 64);
    rect(x-4, y, 16, 16);
    fill(255, 255, 0);
    if(whenclicked < 2) {
        if(mouseButton == LEFT) doAction(action);
    }
  }
  textSize(16);
  text(txt, x, y + 16);
  textSize(14);
}

void addTime(int time) {
    if(time == -1) { return cycleTimes; }
    else if(time == -2) { cycleTimes = new Array(); }
    else { cycleTimes.push(time); }
}

void doAction(String action) {
    String[] actions = split(action, ";");
    for(int i = 0; i < actions.length; i++) {
        String cmd = split(actions[i], "=")[0];
        String val = join(subset(split(actions[i], "="), 1), "=");
        if(cmd.equals("go") == true) {
            last = place;
            if(val.indexOf("?") == 0) {
                doAction(val.substring(1, val.length));
            } else {
                place = val;
            }
        }
        else if(cmd.equals("increase") == true) {
            String varname = split(val, ",", 2)[0];
            float varval = float(split(val, ",", 2)[1]);
            if(varname.equals("speed")) {
                current.speed += varval;
            }
            else if(varname.equals("vegetation")) {
                current.vegetation += varval; 
            }
            else if(varname.equals("terrain")) {
                current.terrain += varval; 
            }
            else if(varname.equals("gradient")) {
                current.gradient += varval; 
            }
        }
        else if(cmd.equals("decrease") == true) { 
            String varname = split(val, ",", 2)[0];
            float varval = float(split(val, ",", 2)[1]);
            if(varname.equals("speed")) {
                current.speed -= varval;
            }
            else if(varname.equals("vegetation")) {
                current.vegetation -= varval;
            }
            else if(varname.equals("terrain")) {
                current.terrain -= varval;
            }
            else if(varname.equals("gradient")) {
                current.gradient -= varval;
            }
        }
        else if(cmd.equals("render") == true) {
            place = val;
            draw();
        }
        else if(cmd.equals("log") == true) {
            console.log(val);
        }
        else if(cmd.equals("reload") == true) {
            if(val.equals("script") == true) {
                var child = document.getElementById("soasScript");
                child.parentNode.removeChild(child);
                var script = document.createElement("script");
                script.id = "soasScript";
                script.type = "text/javascript";
                script.src = "https://rawgit.com/nnnick/Chart.js/master/Chart.js";
                document.body.appendChild(script);
            }
            else if(val.equals("world") == true) {
                current.reset();
            }
        }
        else if(cmd.equals("save") == true) {
            if(val.equals("temp") == true) {
                saves.push(current);
            }
            else if(val.equals("storage") == true) {
                if(window.localStorage) {
                    localStorage
                } else {
                    place = place + "?box=Your browser does not support this feature.";
                }
            }
            else if(val.equals("editing") == true) {
                
            }
            else if(val.equals("link") == true) {
                
            }
        }
        else if(cmd.equals("pause") == true) {
            if(val.equals("true") == true) {
                clearInterval(updateID);
            }
            else if(val.equals("false") == true) {
                updateID = setInterval(function() {
                  Date st = new Date();
                  var ends = Processing.getInstanceById("pjsComplexSketch").getWorld().startCycle();
                  Processing.getInstanceById("pjsComplexSketch").addTime(ends - st.getTime());
                },
                (11 - current.speed)*40
                );
            }
            else if(val.equals("toggle") == true) {
                if(place.equals("/world/pause") == true) {
                    doAction("pause=false");
                } else {
                    doAction("pause=true");
                }
            }
        }
        else if(cmd.equals("chart") == true) {
            if(parseInt(val) == NaN) {
                editing = val;
                return;
            }
            val = int(val);
            var opts = {pointHitDetectionRadius : 10};
            Chart.defaults.global.responsive = true;
            if(val < 0) {
                editing = editing.replace("+" + abs(val), "");
            } else if(val == 0) {
                editing = "0";
            } else if(val == 99) { //harcoded number meaning "generate chart"
                if(getWorld().day == 0) { //if this is the first day, throw an error
                    doAction("go=" + place + "?box=No charts are available on the first day. Please wait until the next day to do this.");
                }
                if(datacodes.length < 3) { //if there are no variables chosen, throw an error
                    doAction("go=" + place + "?box=You must specify at least one variable!");
                }
                String[] datacodes = split(editing, "+");
                int xInterval = 1; //default value
                if(getWorld().day > 21) {
                    var factors = factorsOf(getWorld().day - 1, 20);
                    if(factors.length == 1) {
                        factors = factorsOf(getWorld().day - 2, 20);
                        xInterval = (getWorld().day - 2) / max(factors);
                    }
                    else {
                        xInterval = (getWorld().day - 1) / max(factors);
                    }
                } else {
                    xInterval = 1;
                }
                for(int i = 1; i < datacodes.length; i++) { //i is 1 because we want to skip the first dummy code '0'
                    datacodes[i] = int(datacodes[i]); //to integer
                    var cdataData = new Array(); //make empty array, holds actual data
                    for(int d = 0; d <= (getWorld().day - 1); d += xInterval) { //loop through every nth day(n = xInterval)
                        if(xInterval > 1 && d > 0) {
                            int total = 0;
                            for(int skippedDay = d - xInterval + 1; skippedDay <= d; skippedDay++) {
                                total += getWorld().getStat(datacodes[i], d);
                            }
                            cdataData.push(total/xInterval);
                        } else {
                            cdataData.push(getWorld().getStat(datacodes[i], d)); //add data for that day
                        }
                        if(datacodes[i] == 2) { //this is solely for grass population
                            cdataData[cdataData.length - 1] /= 5; //divide by 5 to show the amount of grass tiles, not steps
                        }
                    }
                    switch(datacodes[i]) {
                        case 1:
                            chartData.datasets.push({
                                label : "Grass Eaten",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "rgb(128, 255, 128)",
                                pointColor : "rgb(128, 255, 128)",
                                pointStrokeColor : "rgb(114, 230, 114)",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "rgb(164, 255, 164)",
                                data : cdataData
                            });
                        break;
                        case 2:
                            chartData.datasets.push({
                                label : "Grass Population",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "rgb(80, 156, 80)",
                                pointColor : "rgb(80, 156, 80)",
                                pointStrokeColor : "rgb(70, 180, 70)",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "rgb(128, 255, 128)",
                                data : cdataData
                            });
                        break;
                        case 3:
                            chartData.datasets.push({
                                label : "Animal Population",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "rgb(255, 128, 128)",
                                pointColor : "rgb(255, 128, 128)",
                                pointStrokeColor : "rgb(230, 114, 114)",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "rgb(255, 164, 164)",
                                data : cdataData
                            });
                        break;
                        case 4:
                            chartData.datasets.push({
                                label : "Animal Deaths",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "rgb(192, 96, 96)",
                                pointColor : "rgb(156, 80, 80)",
                                pointStrokeColor : "rgb(180, 70, 70)",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "rgb(192, 96, 96)",
                                data : cdataData
                            });
                        break;
                        case 5:
                            chartData.datasets.push({
                                label : "Animal Births",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "rgb(255, 192, 192)",
                                pointColor : "rgb(255, 192, 192)",
                                pointStrokeColor : "rgb(230, 162, 162)",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "rgb(255, 192, 192)",
                                data : cdataData
                            });
                        break;
                        case 6:
                            chartData.datasets.push({
                                label : "Movement",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "#AD8326",
                                pointColor : "#AD8326",
                                pointStrokeColor : "#634A12",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "#AD8326",
                                data : cdataData
                            });
                        break;
                        case 7:
                            chartData.datasets.push({
                                label : "Average Age",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "#000000",
                                pointColor : "#000000",
                                pointStrokeColor : "#000000",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "#000000",
                                data : cdataData
                            });
                        break;
                        case 8:
                            chartData.datasets.push({
                                label : "Sea Level",
                                fillColor : "rgba(255, 255, 255, 0.1)",
                                strokeColor : "#221CD9",
                                pointColor : "#221CD9",
                                pointStrokeColor : "#1E18CC",
                                pointHighlightFill : "#ffffff",
                                pointHighlightStroke : "#1E18CC",
                                data : cdataData
                            });
                        break;
                        default:
                            console.log("Unknown Code");
                        break;
                    }
                }
                for(int d = 0; d <= getWorld().day; d+= xInterval) {
                    chartData.labels.push("Day " + d);
                }
                lchart = new Chart(Processing.getInstanceById("pjsComplexSketch").externals.context).Line(chartData, chartOpts);
            } else {
                editing += "+" + val;
            }
        }
        else if(cmd.equals("size") == true) { //resize the sketch
            int w = int(split(val, ",", 2)[0]);
            int h = int(split(val, ",", 2)[1]);
            Processing.getInstanceById("pjsComplexSketch").size(w, h);
            translate(abs(w-width), abs(h-height));
            width = w;
            height = h;
        }
        else if(cmd.equals("kill") == true) { //destroy the chart
            lchart.destroy();
            chartData = { labels : [], datasets : [] };
        }
        else if(cmd.equals("toggle") == true) {
            if(val.equals("rightClick") == true) {
                rightClick = rightClick? false : true;
                rightClickCoords = [3 * width/5, 0.72 * height];
            }
        }
        else if(cmd.equals("add_event") == true) {
            current.calendar.add(val);
        }
        else if(cmd.equals("editing") == true) {
            editing = val;
        }
    }
}

void keyReleased() {
    if(key == CODED) {
        if(place.indexOf("/world/create") >= 0) {
            if(keyCode == LEFT) {
                doAction("decrease=" + editing + "," + 1);
            }
            else if(keyCode == RIGHT) {
                doAction("increase=" + editing + "," + 1);
            }
        }
        if(keyCode == UP) scrollIndex--;
        else if(keyCode == DOWN) scrollIndex++;
    } else {
        if(key == "\n" || key == 'n' || key == 'N') {
            doAction("go=" + next);
        }
        else if(key == 'b' || key == 'B') {
            doAction("go=" + last);
        }
        if(key == 'q' || key == 'Q') {
            clearInterval(updateID);
            console.log(current.stat_grassEaten);
            doAction("go=/world/create/speed");
        }
        else if(key == 'g' || key == 'G') {
            doAction("go=" + prompt("Where would you like to go?"));
        }
        else if(key == 's' || key == 'S') {
            console.log(current.animals[0].searchForAnimal(5));
        }
        else if(key == ' ') {
            if(place.indexOf("/world/pause") >= 0) {
                updateID = setInterval(function() {
                      Date st = new Date();
                      var ends = Processing.getInstanceById("pjsComplexSketch").getWorld().startCycle();
                      Processing.getInstanceById("pjsComplexSketch").addTime(ends - st.getTime());
                  },
                    (11 - current.speed)*50
                );
                doAction("go=/world/play");
            }
            else if(place.indexOf("/world/play") >= 0) {
                clearInterval(updateID);
                doAction("go=/world/pause");
            }
        }
        else if(key == '+' || key == 43) {
            current.raiseSeaLevel(current.seaLevel + 1);
        }
        else if(key == '-' || key == 189) {
            current.raiseSeaLevel(current.seaLevel - 1);
        }
        else if(key == 'e' || key == 'S') {
            String s = prompt("Which event would you like to add?");
            current.calendar.add(s);
        }
    }
}

void mouseReleased() {
    whenclicked = 0;
    if(mouseButton == RIGHT) {
        rightClick = true;
        rightClickCoords = [mouseX, mouseY];
    } else {
        rightClick = false;
    }
}

World getWorld() {
    return current;
}

int[] factorsOf(int n, int maximum) {
    var factors = new Array();
    for(int i = 1; i <= maximum; i++) {
        if(n % i == 0) factors.push(i);
    }
    return factors;
}

class Location {
    int gridX, gridY; //between 0-19, 0-31
    int stepX, stepY; //between 0-14
    int moveVertical, moveHorizontal;
    Location destination;
    Location(int gx, int gy, int sx, int sy) {
        gridX = gx; gridY = gy;
        stepX = sx; stepY = sy;
        moveVertical = 1;
        moveHorizontal = 1;
    }
    void moveTo(Location l) {
        int yoffset = l.gridY - gridY;
        int xoffset = l.gridX - gridX;
        destination = new Location(l.gridX, l.gridY, getWorld().PXLS/2 + 1, getWorld().PXLS/2 + 1);
        if(yoffset < 0) moveVertical = -1;
        else if(yoffset > 0) moveVertical = 1;
        else moveVertical = 0;
        if(xoffset < 0) moveHorizontal = -1;
        else if(xoffset > 0) moveHorizontal = 1;
        else moveHorizontal = 0;
    }
    void goNear(Location l, int fartherest) {
        int yoffest = floor(random(-fartherest, fartherest));
        int xoffset = floor(random(-fartherest, fartherest));
        yoffset = max(0, gridY + yoffset);
        xoffset = max(0, gridX + xoffset);
        yoffset = min(getWorld().HEIGHT, gridY + yoffset);
        xoffset = min(getWorld().WIDTH, gridX + xoffset);
        moveTo(new Location(gridX + xoffset, gridY + yoffset, 0, 0));
    }
    boolean move() {
        boolean movedToNewTile = false;
        if(destination.gridX != gridX || destination.stepX != stepX) {stepX+=moveVertical; getWorld().stat_moved[getWorld().day] += 1;}
        if(destination.gridY != gridY || destination.stepY != stepY) {stepY+=moveHorizontal; getWorld().stat_moved[getWorld().day] += 1;}
        if(stepX >= getWorld().PXLS) {
            stepX = 0;
            gridX++;
            movedToNewTile = true;
        }
        else if(stepX < 0) {
            stepX = getWorld().PXLS - 1;
            gridX--;
            movedToNewTile = true;
        }
        if(stepY >= getWorld().PXLS) {
            stepY = 0;
            gridY++;
            movedToNewTile = true;
        }
        else if(stepY < 0) {
            stepY = getWorld().PXLS - 1;
            gridY--;
            movedToNewTile = true;
        }
        return movedToNewTile;
    }
    int pixelXpos() { return (gridX * getWorld().PXLS) + stepX; }
    int pixelYpos() { return (gridY * getWorld().PXLS) + stepy; }
}

class Animal { //TODO: creatureHasLeftBlock and the actual traveling
    int energy;
    int age;
    int index;
    int xpos;
    int ypos;
    int stat1;
    int stat2;
    int stat3;
    int birthCooldown;
    int leaderIndex;
    boolean alive;
    Array goWhere;
    Array followers;
    int[] lastTile;
    
    Animal(int i, int x, int y) {
        index = i;
        xpos = x;
        ypos = y;
        stat1 = int(random(0, 5));
        stat2 = int(random(0, stat1 * 2));
        stat3 = int(random(stat1, stat2));
        age = 0;
        birthCooldown = 0;
        energy = 20; //maximum is 20
        goWhere = new Array();
        int ytile = int(floor(y/15));
        int xtile = int(floor(x/15));
        lastTile = [xtile, ytile];
        alive = true;
        followers = new Array();
        leaderIndex = index;
    }
    
    void update(boolean dayHasPassed, int newIndex) {
        if(alive == false) {
            return;
        }
        int xtile = floor(xpos/15);
        int ytile = floor(ypos/15);
        birthCooldown--;
        index = newIndex;
        Tile myTile = getWorld().getTile(xtile, ytile);
        if(goWhere.length == 0) {
            if(energy < 20) {
                if(myTile.grassStage >= 2) {
                    int amountToEat = 20 - energy;
                    int amountEaten = getWorld().tiles[ytile*20 + xtile].eatGrass(amountToEat);
                    energy = energy + amountEaten;
                    //console.log(index + " needs to eat " + amountToEat + " grasses, but ate " + amountEaten + " grasses, now at " + energy + "e");
                } else {
                    this.chooseDestination(1);
                }
            } else {
                this.chooseDestination(5);
            }
        } else {
            if(goWhere[0][0]>xpos) {
                xpos++;
                if(xpos % 15 == 0) {
                    lastTile = [xtile, ytile];
                    xtile++;
                }
            }
            else if(goWhere[0][0] < xpos) {
                xpos--;
                if(xpos % 15 == 14) {
                    lastTile = [xtile, ytile];
                    xtile--;
                }
            }
            else if(goWhere[0][1] > ypos) {
                ypos++;
                if(ypos % 14 == 0) {
                    lastTile[1] = ytile;
                    ytile++;
                }
            }
            else if(goWhere[0][1] < ypos) {
                ypos--;
                if(ypos % 15 == 14) {
                    lastTile[1] = ytile;
                    ytile--;
                }
            } else {
                goWhere = new Array();
                int newx = floor(xtile/15);
                int newy = floor(ytile/15);
                getWorld().tiles[newy*20 + newx].hasCreature = true;
                getWorld().tiles[newy*20 + newx].creatureIndex = this.index;
                getWorld().stat_moved[getWorld().day] -= 1;
            }
            try {
              getWorld().tiles[lastTile[1]*20 + lastTile[0]].hasCreature = false;
              getWorld().tiles[lastTile[1]*20 + lastTile[0]].creatureIndex = -1;
            } catch(err) {
              console.log(err);
              console.log("Thrown by " + index + " from: " + lastTile.join(", "));
            } finally {
              getWorld().stat_moved[getWorld().day] += 1;
            }
        }
        if(dayHasPassed == true) {
            age++;
            if(age % 3 == 0) { 
                energy-= 2;
            }
            if(age >= 15) {
                energy -= 3;
            }
            else if(age >= 10) {
                energy--;
            }
            getWorld().stat_population[getWorld().day + 1]++;
        }
        if(age > 5 && age < 10) {
            birthCooldown--;
            if(getWorld().cycles < 20) {
              Tile closestAnimal = searchForAnimal(1);
              if(birthCooldown <= 0 && closestAnimal != null) {
                  Animal baby = new Animal(getWorld().animals.length, xpos, ypos);
                  Animal mother = getWorld().animals[closestAnimal.creatureIndex];
                  try {
                    if(mother.birthCooldown <= 0) {
                      baby.stat1 = int((stat1 + mother.stat1)/2); //inheritance
                      baby.stat2 = int((stat2 + mother.stat2)/2);
                      baby.stat3 = int((stat3 + mother.stat3)/2);
                      getWorld().requestBirth(baby);
                      birthCooldown = 300;
                      getWorld().stat_births[getWorld().day]++;
                      getWorld().stat_population[getWorld().day]++;
                    }
                  } catch(err) { console.log("Undefined loophole");}
              }
            }
        }
        else if(age >= 20 || energy < -2) {
            getWorld().stat_deaths[getWorld().day]++;
            getWorld().stat_population[getWorld().day]--;
            getWorld().requestDeath(index);
            alive = false;
        }
        getWorld().tiles[ytile*20 + xtile].hasCreature = true;
        getWorld().tiles[ytile*20 + xtile].creatureIndex = this.index;
        int rnd = floor(random(0, 300));
        if(rnd == 0) {stat1++; stat1 = min(stat1, 20);}
        else if(rnd == 10) {stat2++; stat2 = min(stat2, 20);}
        else if(rnd == 20) {stat3++; stat3 = min(stat3, 20);}
    }
    
    void chooseDestination(int howfar) {
        int ytile = floor(ypos/15);
        int xtile = floor(xpos/15);
        Tile myTile = getWorld().getTile(xtile, ytile);
        switch(int(floor(random(1, 5)))) {
            case 1: //North
                if(ytile > howfar && getWorld().getTile(xtile, ytile-howfar).hasWater == false) {
                    goWhere.push({xtile*15+8, (ytile-howfar)*15-7});
                    requiredEnergy = howfar;
                    if(getWorld().getTile(xtile, ytile-howfar).elevation > myTile.elevation) {
                      requiredEnergy += getWorld().getTile(xtile, ytile-howfar).elevation - myTile.elevation;
                    }
                    energy -= requiredEnergy;
                }
            break;
            case 2: //East
                if(xtile < 19 - howfar && getWorld().getTile(xtile+howfar, ytile).hasWater == false) {
                    goWhere.push({(xtile+howfar)*15+8, ytile*15+8});
                    requiredEnergy = howfar;
                    if(getWorld().getTile(xtile+howfar, ytile).elevation > myTile.elevation) {
                      requiredEnergy += getWorld().getTile(xtile+howfar, ytile).elevation - myTile.elevation;
                    }
                    energy -= requiredEnergy;
                    }
            break;
            case 3: //South
                if(ytile < 31 - howfar && getWorld().getTile(xtile, ytile+howfar).hasWater == false) {
                    goWhere.push({xtile*15+8, (ytile+howfar)*15+8});
                    requiredEnergy = howfar;
                    if(getWorld().getTile(xtile, ytile+howfar).elevation > myTile.elevation) {
                      requiredEnergy += getWorld().getTile(xtile, ytile+howfar).elevation - myTile.elevation;
                    }
                    energy -= requiredEnergy;
                }
            break;
            case 4: //West
                if(xtile > howfar && getWorld().getTile(xtile-howfar, ytile).hasWater == false) {
                    goWhere.push({(xtile-howfar)*15-7, ytile*15+8});
                    requiredEnergy = howfar;
                    if(getWorld().getTile(xtile-howfar, ytile).elevation > myTile.elevation) {
                      requiredEnergy += getWorld().getTile(xtile-howfar, ytile).elevation - myTile.elevation;
                    }
                    energy -= requiredEnergy;
                }
            break;
        }
    }
    
    Tile searchForAnimal(int radius) {
        Tile closest = null;
        int xtile = floor(xpos/15);
        int ytile = floor(ypos/15);
        if(radius <= 0) { //That means we search infinitely until we find something
            radius = 1;
            whileSearchLoop : while(radius + xpos < 20 && radius + ypos < 32 && xpos - radius >= 0 && ypos - radius >= 0) {
                closest = searchForAnimal(radius);
                if(closest != null) {
                    break whileSearchLoop;
                }
                radius++;
            }
        } else {
            //add code for this
            forSearchLoop : for(int x = -1*radius; x <= radius; x++) {
                for(int y = -1*radius; y <= radius; y++) {
                    if(x > -1*radius && x < radius && y == -1*radius + 1) {
                        y = radius;
                    } else {
                        if(getWorld().getTile(xtile + x, ytile + y).hasCreature == true &&
                           getWorld().getTile(xtile + x, ytile + y).creatureIndex != this.index) {
                            closest = getWorld().getTile(xtile + x, ytile + y);
                            break forSearchLoop;
                        }
                    }
                }
            }
        }
        return closest;
    }
    
    void display() { //originally all 4 spaces
      if(alive == true) {
        ellipseMode(CENTER);
        noStroke();
        fill(stat1 * 12, stat2 * 12, stat3 * 12);
        ellipse(xpos, ypos, 14, 14);
        fill(energy * 12);
        ellipse(xpos, ypos, 5, 5);
        ellipseMode(CORNER);
        fill(255);
        textSize(14);
        text(index, xpos-7, ypos-7);
      }
    }
}

class Tile {
    int elevation;
    int xpos;
    int ypos;
    int grassStage;
    static float growthPerStage = 1.0;
    float grassGrowth;
    boolean hasCreature;
    boolean hasWater;
    static float frozenElevation = 60.0;
    int creatureIndex;
    
    Tile(int x, int y, int e, int g) {
        xpos = x;
        ypos = y;
        elevation = e;
        grassStage = g;
        hasCreature = false;
        hasWater = (e < getWorld().seaLevel)? true : false;
        creatureIndex = -1;
        grassGrowth = 0.0;
    }
    
    int getIndex() { //grid is 20x32
        return 20*ypos + xpos;
    }
    
    int eatGrass(int amount) {
        if(this.grassStage >= amount) {
            grassStage -= amount;
            getWorld().stat_grassEaten[getWorld().day] += amount;
            getWorld().stat_vegetation[getWorld().day] -= amount;
            return amount;
        } else {
            int howMuchWasEaten = grassStage;
            grassStage = 0;
            getWorld().stat_grassEaten[getWorld().day] += howMuchWasEaten;
            getWorld().stat_vegetation[getWorld().day] -= howMuchWasEaten;
            return howMuchWasEaten;
        }
    }
    
    void growGrass(boolean newDay) {
        if(growthPerStage >= 0) { 
        if(grassStage == -1) {
            if(current.getTile(xpos, ypos-1).grassStage >= 0 ||
               current.getTile(xpos, ypos+1).grassStage >= 0 ||
               current.getTile(xpos-1, ypos).grassStage >= 0 ||
               current.getTile(xpos+1, ypos).grassStage >= 0) {
                this.grassGrowth += 0.1;
                //console.log("(" + xpos + "," + ypos + ") - " + grassStage + "|" + grassGrowth);
            }
        }
        else if(grassStage < 5) {
            grassGrowth += 0.1;
        }
        if(grassGrowth >= growthPerStage) {
            grassGrowth = 0.0;
            grassStage++;
        }
        } else {
            grassGrowth = 0.0;
            if(elevation <= abs(growthPerStage)) {
                grassStage = -1;
            }
        }
        if(grassStage >= 1 && newDay == true) {
            getWorld().stat_vegetation[getWorld().day] += grassStage;
        }
        if(hasWater == true) {
            grassStage = -1;
            grassGrowth = 0.0;
        }
    }
    
    void display() {
        noStroke();
        if(elevation < Tile.frozenElevation) {
            if(hasWater == false) fill(#573B0C); //dirt
            else {fill(15, 186-elevation, 186 + elevation*4);} //water
        } else {
            if(hasWater == false) fill(240, 240, 240); //snow
            else {fill(160, 222 - elevation, 222 + elevation);} //ice
        }
        rect(xpos*15, ypos*15, 15, 15);
        if(grassStage >= 0 && elevation < Tile.frozenElevation) {
            fill(40 + 4*this.elevation, 128 + 3*this.elevation, 10);
            rectMode(CENTER);
            rect(xpos*15 + 7, ypos*15 + 7, grassStage*3, grassStage*3);
            rectMode(CORNER);
        }
        if(mouseX >= xpos*15 && mouseX <= xpos*15 + 15 && mouseY >= ypos*15 && mouseY <= ypos*15 + 15) {
            getWorld().message = elevation;
        }
    }
}

class World {
    float speed = 5;
    int vegetation = 5;
    int terrain = 5;
    int gradient = 5;
    int day = 0; //Each day is 30 cycles
    int cycles = 0; //How many cycles we already had in this day
    int startedGeneration;
    int seaLevel;
    int cloudStage;
    int highest;
    int WIDTH = 20;
    int HEIGHT = 32;
    int PXLS = 15; //pixels per tile
    int[][] heightmap;
    float avgHeight;
    var requests = {};
    String message;
    String weather;
    String[] diseases = ["Brain freeze", "Explosiveness", "Combustion", "Overgrowth", "Ungrowing"];
    Array happening;
    Array stat_deaths = new Array();
    Array stat_births = new Array();
    Array stat_population = new Array();
    Array stat_averageAge = new Array();
    Array stat_grassEaten = new Array();
    Array stat_moved = new Array();
    Array stat_vegetation = new Array();
    Array stat_seaLevel = new Array();
    Array animals = new Array();
    Array tiles = new Array();
    Calendar calendar;
    
    World() {
        animalPos = new int[640][0];
        for(int i = 0; i < 15; i++) {
            animals[i] = new Animal(i, int(random(8, 12)*15)+7, int(random(13, 17)*15)+7);
        }
        stat_deaths.push(0);
        stat_births.push(0);
        stat_population.push(animals.length);
        stat_averageAge.push(0);
        stat_grassEaten.push(0);
        stat_moved.push(0);
        stat_vegetation.push(0);
        stat_seaLevel.push(0);
        requests = {
            emptySpots : new Array(),
            newSpots : new Array()
        };
        day = 0;
        cycles = 0;
        seaLevel = 0;
        highest = 0;
        message = "The world has begun with " + animals.length + " brave animals.";
        //happening = [{name : "sun", until : 1, type : "weather"},{name:"rain",until:10,type:"weather"},{name:"sun",until:11,type:"weather"}];
        weather = "sun";
        cloudStage = 0;
        calendar = new Calendar();
    }
    
    Tile getTile(int x, int y) {
        if( (x >= 0) == false) {
            x = 0;
        }
        if( (x <= 19) == false) {
            x = 19;
        }
        if( (y >= 0) == false) {
            y = 0;
        }
        if( (y <= 31) == false) {
            y = 31;
        }
        return tiles[y*20 + x];
    }
    
    void generateWorld() {
        int[] grassX = new int[vegetation];
        int[] grassY = new int[vegetation];
        int grassSpots = 0;
        for(int v = 0; v < vegetation; v++) {
            if(v == 0) grassX[v] = int(floor(random(3)));
            else grassX[v] = int(floor(random(grassX[v-1]+1, grassX[v-1]+3)));
            grassY[v] = int(floor(random(0, 19)));
            while(grassY[v] < 31 && heightmap[grassX[v]][grassY[v]] < avgHeight*0.8) {
                grassY[v]++;
            }
        }
        grassX = sort(grassX);
        grassY = sort(grassY);
        for(int x = 0; x < 20; x++) { //x-loop
            for(int y = 0; y < 32; y++) { //y-loop
                if(grassX[grassSpots] == x && grassY[grassSpots] == y) {
                    console.log("grass at: (" + x + "," + y + ")");
                    tiles[y*20 + x] = new Tile(x, y, heightmap[x][y], 5);
                    grassSpots++;
                } else {
                    tiles[y*20 + x] = new Tile(x, y, heightmap[x][y], -1);
                }
            }
        }
        this.stat_vegetation[this.day] += grassSpots * 5;
        console.log("v=" + vegetation + ", t=" + terrain + ", g=" + gradient + ", s=" + speed);
        calendar.add("sun_20_" + seaLevel);
    }
    
    void generateHeightMap() {
        heightmap = new int[getWorld().WIDTH][getWorld().HEIGHT];
        int totalOfAverages = 0;
        avgHeight = 0;
        int totalHeight = 0;
        for(int x = 0; x < 20; x++) { //fill with random values
            for(int y = 0; y < 32; y++) {
                heightmap[x][y] = int(floor(random(1, gradient+1)*2));
            }
        }
        for(int i = 0; i < terrain; i++) {
            for(int x = 0; x < 20; x++) {
                for(int y = 0; y < 32; y++) {
                    /*Left column*/
                    if(x == 0) {
                      if(y == 0) {
                        heightmap[x][y] = int((heightmap[x][y+1] + heightmap[x+1][y] + heightmap[x+1][y+1])/3);
                      }
                      else if(y == heightmap[x].length - 1) {
                        heightmap[x][y] = int((heightmap[x][y-1] + heightmap[x+1][y] + heightmap[x+1][y-1])/3);
                      }
                      else {
                        heightmap[x][y] = int((heightmap[x][y-1] + heightmap[x+1][y-1] + heightmap[x+1][y] + 
                        heightmap[x+1][y+1] + heightmap[x][y+1])/5);
                      }
                    }
                    /*Right column*/
                    else if(x == heightmap.length - 1) {
                      if(y == 0) {
                        heightmap[x][y] = int((heightmap[x-1][y] + heightmap[x-1][y+1] + heightmap[x][y+1])/3);
                      }
                      else if(y == heightmap[x].length - 1) {
                        heightmap[x][y] = int((heightmap[x][y-1] + heightmap[x-1][y-1] + heightmap[x-1][y])/3);
                      }
                      else {
                        heightmap[x][y] = int((heightmap[x][y-1] + heightmap[x-1][y-1] + heightmap[x-1][y] + 
                        heightmap[x-1][y+1] + heightmap[x][y+1])/5);
                      }
                    }
                    /*Top row*/
                    else if(y == 0) {
                      
                    }
                    /*Bottom row*/
                    else if(y == heightmap[x].length - 1) {
                      
                    }
                    /*Everything in the middle*/
                    else {
                      heightmap[x][y] = int((heightmap[x][y-1] + heightmap[x+1][y-1] + heightmap[x+1][y] + 
                      heightmap[x+1][y+1] + heightmap[x][y+1] + heightmap[x-1][y+1] + 
                      heightmap[x-1][y] + heightmap[x-1][y-1])/8);
                    }
                    totalHeight += heightmap[x][y];
                    highest = max(highest, heightmap[x][y]);
                }
            }
            totalOfAverages += round(totalHeight/(heightmap.length * heightmap[0].length));
        }
        avgHeight = int(totalOfAverages / terrain);
        seaLevel = round(avgHeight*0.8);
    }
    
    void raiseSeaLevel(int elevation) {
        for(int x = 0; x < 20; x++) {
            for(int y = 0; y < 32; y++) {
                if(heightmap[x][y] < elevation) {
                    tiles[y*20 + x].hasWater = true;
                    tiles[y*20 + x].grassStage = -1;
                } else {
                    tiles[y*20 + x].hasWater = false;
                }
            }
        }
        seaLevel = elevation; console.log("New E:" + seaLevel);
    }
    
    void reset() {
        stat_deaths = [0];
        stat_births = [0];
        stat_population = [0];
        stat_averageAge = [0];
        stat_grassEaten = [0];
        stat_moved = [0];
        stat_vegetation = [0];
        stat_seaLevel = [0];
        animals = new Array();
        tiles = new Array();
        requests = { emptySpots : new Array(), newSpots : new Array() };
        day = 0;
        cycles = 0;
        for(int i = 0; i < 15; i++) {
            animals[i] = new Animal(i, int(random(8, 12)*15)+7, int(random(13, 17)*15)+7);
        }
        message = "The world has begun with " + animals.length + " brave animals.";
        calendar = new Calendar();
    }
    
    int startCycle() {
        cycles++;
        stat_deaths[day] = int(stat_deaths[day]);
        stat_births[day] = int(stat_births[day]);
        stat_population[day] = int(stat_population[day]);
        stat_averageAge[day] = int(stat_averageAge[day]);
        stat_grassEaten[day] = int(stat_grassEaten[day]);
        stat_moved[day] = int(stat_moved[day]);
        stat_vegetation[day] = int(stat_vegetation[day]);
        stat_seaLevel[day] = int(stat_seaLevel[day]);
        if(cycles >= 30) { //remember to tally age and then divide by thingies.length
            stat_seaLevel[day] = seaLevel;
            day++;
            cycles = 0;
            stat_deaths.push(0);
            stat_births.push(0);
            stat_population.push(0);
            stat_averageAge.push(0);
            stat_grassEaten.push(0); stat_moved[day-1] = floor(stat_moved[day-1]/15);
            stat_moved.push(0);
            stat_vegetation.push(0);
            stat_seaLevel.push(0);
            updateTiles(true);
            updateAnimals(true);
            message = stat_deaths[day-1] + " deaths, " + stat_births[day-1] + " births.";
            console.log("Day #" + (day-1) + "=" + stat_births[day-1] + " births," + 
            stat_deaths[day-1] + " deaths," + stat_population[day-1] + " animals," + 
            stat_grassEaten[day-1] + " grass eaten," + stat_moved[day-1] + " units moved," + 
            stat_vegetation[day-1] + " grass in total.");
            console.log(addTime(-1));
            addTime(-2);
        } else {
            updateAnimals(false);
            updateTiles(false);
        }
        for(int i = 0; i < requests.newSpots.length; i++) {
            animals.push(requests.newSpots[i]);
            animals[animals.length - 1].index = i;
        }
        updateWeather();
        requests.newSpots = new Array();
        calendar.update(day, cycles);
        return new Date().getTime();
    }
    
    void updateTiles(boolean newDay) {
        for(int i = 0; i < tiles.length; i++) {
            tiles[i].growGrass(newDay);
        }
    }
    
    void requestDeath(int index) {
        if(requests.emptySpots.indexOf(index) == -1) {
            requests.emptySpots.push(index);
        }
    }
    void requestBirth(Animal a) {
        if(requests.emptySpots.length == 0) {
            requests.newSpots.push(a);
        } else {
            animals[requests.emptySpots[0]] = a;
            requests.emptySpots.shift();
        }
    }
    
    int updateAnimals(boolean newDay) {
        int value = 0;
        int ageTotal = 0;
        int animalAmount = 0;
        for(int i = 0; i < animals.length; i++) {
            animals[i].update(newDay, i);
            if(animals[i].alive == true) { ageTotal += animals[i].age; animalAmount++; }
        }
        if(cycles == 29) {
            stat_averageAge[day] = (floor(ageTotal/animalAmount));
        }
    }
    
    void renderAll() {
        for(int i = 0; i < tiles.length; i++) {
            tiles[i].display();
        }
        for(int i = 0; i < animals.length; i++) {
            animals[i].display();
        }
        noStroke();
        fill(0, 80);
        rect(0, cloudStage - height, width, height);
    }
    
    void updateWeather() {
        if(weather.equals("rain") == true) {
            if(day % 3 == 0 && cycles == 0) {
                raiseSeaLevel(seaLevel + 1);
            }
        } else if(weather.equals("sun") == true) {
            this.cloudStage = -height;
        }
    }
    
    int getStat(int intRepresentation, int day) {
        switch(intRepresentation) {
            case 1:
                return stat_grassEaten[day];
            break;
            case 2:
                return stat_vegetation[day];
            break;
            case 3:
                return stat_population[day];
            break;
            case 4:
                return stat_deaths[day];
            break;
            case 5:
                return stat_births[day];
            break;
            case 6:
                return stat_moved[day];
            break;
            case 7:
                return stat_averageAge[day];
            break;
            case 8:
                return stat_seaLevel[day];
            break;
            default:
                return 0;
            break;
        }
    }
    
}
class Calendar {
    Array events;
    Array temperature;
    Array archive;
    Calendar() { events = new Array(); archive = new Array(); } //constructor
    void add(var event) {
        if(event instanceof String == true) {
            String[] params = split(event, "_");
            if(params[0].equals("rain") || params[0].equals("sun") || params[0].equals("flood") || params[0].equals("drought")) {
                var t = new Array();
                for(int i = 0; i < int(params[1]); i++) {
                    if(i < int(params[2])) t.push("hot");
                    else t.push("cold");
                }
                events.push({
                    name : params[0], 
                    type : "weather", 
                    duration : int(params[1]), 
                    sea: 0,
                    began : -1,
                    until : -1,
                    temperature : t,
                    toString : function() {
                        return "Event {name : " + this.name + ", type : 'weather', duration : " + this.duration +
                        ", sea : " + this.sea + ", began : " + this.began + ", until : " + this.until + "}";
                    },
                    formatted : function() {
                        return ["Weather Event", this.name + " for " + this.duration + " days", (this.until - getWorld().day) + " days left."];
                    },
                    start : function() {
                        getWorld().message = "Forecast: " + this.name + " for " + this.duration + " days";
                        getWorld().weather = this.name;
                        this.began = getWorld().day;
                        this.until = this.began + this.duration;
                        this.sea = getWorld().seaLevel;
                    }
                });
                archive.push(events[events.length - 1]);
            }
            else if(params[0].equals("animals") || params[0].equals("grasses")) {
                events.push({
                    type : "population",
                    name : params[0],
                    duration : int(params[1])
                });
                archive.push(events[events.length - 1]);
            }
            else if(current.diseases.indexOf(params[0]) != -1) {
                params[1] = int(params[1]);
                events.push({name : params[0], type : "disease", source : params[1], power : params[2]});
            }
        }
    }
    void remove(int index) {
        events.splice(index, 1);
    }
    String[] getFrom(int start, int end) {
        String[][] evts = new String[end - start][2];
        for(int i = 0; i < evts.length; i++) {
            if((i + start) < events.length) {
                evts[i] = events[i + start].formatted();
            } else {
                evts[i] = ["", ""];
            }
        }
        return evts;
    }
    String getTemperature(int day) {
        return events[0].temperature[day - events[0].began];
    }
    void update(int day, int cycle) {
        if(events[0].until == day || events[0].began == -1) {
            events.shift();
            if(events.length == 0) {
                add("sun_20_0");
            }
            events[0].start();
        }
        switch(events[0].name) {
            case "rain":
                if(getWorld().cloudStage < height) {
                  getWorld().cloudStage += ceil((height - getWorld().cloudStage)*(1/(4*events[0].duration))); //advance clouds
                }
                if(getTemperature(day).equals("hot") == true) {
                    if(cycle == 0 && getWorld().seaLevel < getWorld().highest - 1) {
                        if((events[0].until - day) % 5 == 0)getWorld().raiseSeaLevel(getWorld().seaLevel + 1);
                    }
                } else { //cold weather = snow
                    if(Tile.frozenElevation > getWorld().highest) Tile.frozenElevation = getWorld().highest;
                    else {
                        if(cycle == 0) Tile.frozenElevation--;
                    }
                }
            break;
            case "flood":
                int until = events[0].began + events[0].duration;
                if(day + 1 == events[0].until && cycle == 29) {
                    getWorld().raiseSeaLevel(events[0].sea); //sea level back to normal
                    Tile.frozenElevation = 60;
                } else {
                    if(cycle % 5 == 0 && getWorld().seaLevel < getWorld().highest - 1) { //every 5 cycles raise sea level
                        getWorld().raiseSeaLevel(getWorld().seaLevel + 1); //raise sea
                    }
                }
                if(getTemperature(day).equals("cold") == true) {
                    Tile.frozenElevation = getWorld().highest - 3;
                }
            break;
            case "drought":
                if(getTemperature(day).equals("hot") == true) {
                    if(Tile.growthPerStage >= 0) Tile.growthPerStage = -1;
                    else {
                        if(cycle == 0) {
                            if(-1*Tile.growthPerStage < getWorld().highest) Tile.growthPerStage--;
                        }
                    }
                } else {
                    Tile.growthPerStage = 500.0;
                }
                if(day + 1 == events[0].until && cycle == 29) {
                    getWorld().raiseSeaLevel(events[0].sea); // sea level back to normal
                    Tile.growthPerStage = 1.0;
                } else {
                    if(cycle % 5 == 0 && getWorld().seaLevel > 0) { //every 5 cycles lower sea level
                        getWorld().raiseSeaLevel(getWorld().seaLevel - 1); //lower sea
                    }
                }
            break;
            case "sun":
                if(getWorld().cloudStage >= -1*height) {
                    getWorld().cloudStage += ceil((-1*height - getWorld().cloudStage)*0.25); //fade clouds
                }
                if(getTemperature(day).equals("hot") == true) {
                    if((events[0].until - day) % 10 == 0 && getWorld().seaLevel > 0 && cycle == 0) {
                        getWorld().raiseSeaLevel(getWorld().seaLevel - 1);
                    }
                }
            break;
            default:
            break;
        }
    }
    String toString() {
        String evts = "";
        for(int i = 0; i < events.length; i++) {
            
        }
    }
}
