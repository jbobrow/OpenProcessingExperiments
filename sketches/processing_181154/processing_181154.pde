
/*@pjs font="Arial.ttf"*/
int counter;
int gridSize;
int redT = 0;
int redA = 0;
int blueT = 0;
int blueA = 0;
int greenT = 0;
int greenA = 0;
int redRange = 1;
int blueRange = 1;
int greenRange = 1;
int equalized = 0;
int released = 0;
int cpl = 50;
int vk = 2;
color selectedColor = color(128, 128, 128);
var clickSound = new Audio("http://mod.zlotskiy.com/EdMaxPrime/pjs/click.ogg");
var calmSound = new Audio("http://mod.zlotskiy.com/EdMaxPrime/pjs/exhale.ogg");
String place = "/help/instructions.rtf";
String back = "/help/instructions.rtf";
String helpText;
String renderTick;
String code;
String[] editing;
String[] help;
DPixel[][] grid; // The two dimensional array that has all the pixels in it
Brush brush; // The user's brush
PFont f;
PImage hueAndSat;
boolean paused;
boolean stats;
boolean info;
boolean debug;
boolean eqSoundPlayed = false;
boolean playSounds = true;
float speed;
float eqCond = 0.75;

void setup() {  //setup function called initially, only once
  size(400, 400);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  f = createFont("Arial.ttf",14,true);
  released = false;
  paused = true;
  stats = false;
  info = false;
  debug = false;
  editing = new String[] {"-gen1.5", "0|0|0", "255|255|255", "1.6", "grid(random", "255|255|255"};
  brush = new Brush(128,128,128,1);
  renderTick = "btn";
  code = "";
  colorMode(HSB, 360, 100, 100);
  hueAndSat = createImage(360, 100, RGB);
  for(int h = 0; h < hueAndSat.width; h++) {
    for(int s = 0; s < hueAndSat.height; s++) {
      color c = color(h, 100 - s, 100);
      hueAndSat.pixels[s * hueAndSat.width + h] = c;
    }
  }
  colorMode(RGB, 256, 256, 256);
  help = new String[] {
  "<bold>Key Bindings\n</bold>If you are using a mobile device, see the\n<doset(text,6>mobile devices</this>topic for a workaround.\n\n<rgb 0 0 200>m <rgb 64 64 64><tab>to switch between the simulation and the \npause menu.<br><rgb 0 0 200>p <rgb 64 64 64><tab>to pause/resume the simulation<br><rgb 0 0 200>r <rgb 64 64 64><tab>to reset the grid using the current generator<br><rgb 0 0 200>s <rgb 64 64 64><tab>to show statistics during the simulation<br><rgb 0 0 200>i <rgb 64 64 64><tab>to inspect individual pixels. See the \n<doset(text,4>Statistics and Pixel Inspector</this> topic.\n",
  "<bold>Brush mode\n</bold>This feature will be added in version 1.7\n<rgb 0 0 200>Random <rgb 0 0 0>places a random color wherever \nyou click.<br><rgb 0 0 200>Normal <rgb 0 0 0>uses the colorpicker\'s selected color \nto paint pixels. These pixels can \nexchange colors with their neighbors.<br><rgb 0 0 200>Border <rgb 0 0 0>paints yellow pixels that do not \nexchange color with their neighbors.<br><rgb 0 0 200>Wormhole <rgb 0 0 0>wormholes of the same color act \nlike color teleporters(even through \nborders) if there are atleast two \nof them. 3 act in a triangle, \n4 in a square, etc.<br><rgb 0 0 200>Smart <rgb 0 0 0>they will do their best to be the color \nthey originally had, selectively \npermeable(support ranges).",
  "<bold>Color pickers\n</bold>Added in 1.6, these allow you to pick any \ncolor. From left to right, here are their \ncomponents:\n\n<rgb 0 0 200>Spectrum <rgb 0 0 0>all possible rainbow colors(left to \nright) and saturations(top to bottom). \nA little circle shows where you \nlast clicked.\n<rgb 0 0 200>Slider <rgb 0 0 0>darkens the image(100 is brightest, 0 is \ndarkest). You must click the image to \nupdate the color.\n<rgb 0 0 200>Preview <rgb 0 0 0>a square shows your color, and \nthe numeric values below.",
  "<bold>Pause menu\n</bold>The pause menu was reworked in version 1.6, \nat the expense of simplicity. At the top you \nsee the play button, which plays the \nsimulation. The main menu button ends the \nsimulation and brings you to the main menu. \nThe help button brings you here. Next to \nthose are the key bindings. Below you will \nsee a color picker for the brush(see color \npicker topic). Next to that is the brush \nmode selector(see brush mode topic). Below \nthat are the ranges for red green and blue.\nRanges determine how different in color two \nneighboring pixels can be(play around with \nit!).",
  "<bold>Statistics\n</bold>Statistics can be shown while viewing the \nsimulation by pressing the S key. These show \nwhat the average color is(usually around 128 \nif the brush is not used).\n<bold>Pixel Inspector\n</bold>Turned on by pressing the i key. A tooltip \nbox gives specific information on every \npixel you hover over, a yellow border around \nthe pixel also appears to make it easier to \npaint on it.",
  "<bold>Making a grid\n</bold>There are two ways to do this. One of them \ninvolves going to the main menu and pressing \nplay. You are asked to choose the dimensions \nof the grid(big numbers like 80x80 run very \nslowly). Then you are asked to choose a \ngenerator, read the description next to the \nbutton before clicking it as some may ask \nyou to enter additional data. Generating \nshould only take a few seconds, and then you \nare brought to the pause menu(see pause \nmenu topic). The other way to do this is by \npressing the R key while veiwing the \nsimulation, making a grid identical to the one \nyou started with.",
  "<bold>Mobile Devices\n</bold>This should be able to run on most mobile \ndevices. However, neither the sound nor \nthe key bindings will work on mobile devices \nand tablets. Without the m key it is \nimpossible to get back to the pause menu \nfrom the simulation. In version 1.6, an \nalternative was added. You can enable and \ndisable the virtual keyboard below. A button named \n\"VK\" will appear in the bottom right \ncorner, which when pressed shows or hides \nthe keyboard(it only has the keys shown \nin the key bindings topic). The only drawback \nis that the keyboard covers the bottom of \nthe screen, to paint the pixels at the \nbottom of the grid simply press the red \nX on the keyboard.\nShow/hide the VK button: <y -3.0 em><dotoggle(vk;>click here</this>",
  "<bold>Sounds you hear\n</bold>As of version 1.5, there are two sounds that \nare played. One of them happens when a button \nis clicked, and the other happens when the \ngrid reaches 75% equilibrium(watch the white \nnumber at the top left corner during the \nsimulation). Most modern browsers will play \nthe sounds even if there is no internet \nconnection. You can change the sound \nsettings below.\n\nPlay calm sound at <y -2.0 em><rgb 0 0 200>$eqCond%<rgb 0 0 0><doset(eqCond,++>Raise</this><doset(eqCond,-->Lower</this><br><y 0.5 em>Sounds are <rgb 0 0 200>$sound<rgb 0 0 0>, <dotoggle(sound>Toggle</this>",
  "<bold>Older Versions\n</bold>Older versions of Dynamic Equilibrium \ninclude 1.5 and 1.1, that work on the web. \nThey have less features and contain bugs, \nprior to 1.6 they did not play well with \nmobile devices.<br><br><doGo(http://openprocessing.org/sketch/131291>v1.5</this> Faster than the old version, added \nsupport for range selectors, pixel \ninspector and sounds. Known bugs: \nequilibrium percentage does not work \nwith ranges, confusing user interface.<br><doGo(http://openprocessing.org/sketch/121602>v1.1</this>Very basic feature set, not \nrecommended. Codewise, it is basic."
  };
  helpText = "";
}

void draw() {  //draw function loops
  released++;
  if(place.equals("/help/instructions.rtf")){
    background(250);
    textFont(f);
    text("    Welcome to Dynamic Equilibrium. This is a visualization of the concept. In nature things tend to reach a balance. On the screen you can create colored pixels and borders. When you run the simulation all of the pixels will try to balance out their colors with their neighbors. The borders will not allow colors to be transfered to them. This allows you to create interesting chain reactions.\n    Click play to start.",5,20,width-12,200);
    //button("READ THIS", "style(height:24,width:" + textWidth("  READ THIS  ") + ";set(back,/help/instructions.rtf;Go(/help/mobile", textWidth("IF YOU ARE USING A MOBILE DEVICE ") + 10, ofHeight("1/2") - 40);
    //text("version 1.6",5,height);
    renderText("version 1.6 <rgb 255 0 0>BETA", 5, height);
    button("Play","style(width:" + ofWidth("2/5") + ";Go(/game/create",ofWidth("3/10"),ofHeight("1/2"));
    button("Help","style(width:" + ofWidth("2/5") + ";Go(/help/menu;set(stats,true",ofWidth("3/10"),ofHeight("3/5"));
    button("More","style(width:" + ofWidth("2/5") + ";Go(/game/versions",ofWidth("3/10"),ofHeight("7/10"));
  }
  else if(place.equals("/game/create")) {
    background(250);
    text("Choose the dimensions of the simulation:",2,20);
    button("5x5","set(gridSize,5;Go(/game/generator",ofWidth("3/10"),24+ofHeight("1/10"));
    button("10x10","set(gridSize,10;Go(/game/generator",ofWidth("3/10"),24+2*(height/10));
    button("15x15","set(gridSize,15;Go(/game/generator",ofWidth("3/10"),24+3*(height/10));
    button("20x20","set(gridSize,20;Go(/game/generator",ofWidth("3/10"),24+4*(height/10));
    button("25x25","set(gridSize,25;Go(/game/generator",ofWidth("3/10"),24+5*(height/10));
    button("32x32","set(gridSize,32;Go(/game/generator",ofWidth("3/10"),24+6*(height/10));
    button("40x40","set(gridSize,40;Go(/game/generator",ofWidth("3/10"),24+7*(height/10));
    button("50x50","set(gridSize,50;Go(/game/generator",ofWidth("1/2"),24+ofHeight("1/10"));
    button("60x60","set(gridSize,60;Go(/game/generator",ofWidth("1/2"),24+2*(height/10));
    button("70x70","set(gridSize,70;Go(/game/generator",ofWidth("1/2"),24+3*(height/10));
    button("80x80","set(gridSize,80;Go(/game/generator",ofWidth("1/2"),24+4*(height/10));
    button("95x95","set(gridSize,95;Go(/game/generator",ofWidth("1/2"),24+5*(height/10));
    button("100x100","set(gridSize,100;Go(/game/generator",ofWidth("1/2"),24+6*(height/10));
    button("110x110","set(gridSize,110;Go(/game/generator",ofWidth("1/2"),24+7*(height/10));
    button("Back", "Go(/help/instructions.rtf",5,24+8*(height/10));
  }
  else if(place.equals("/game/generator")) {
    background(250);
    text("Choose a generator to be used:",2,20);
    button("Random", "set(selected," + editing[5] + ";Go(/game/gen/random", 5, 30);
    text("Makes a grid of random colors", ofWidth("1/5") + 5, 30 + 14);
    button("Field", "set(stats,true;set(selected," + editing[1] + ";Go(/game/gen/field", 5, 30 + ofHeight("3/20"));
    text("Makes a gradient of two colors", ofWidth("1/5") + 5, 30 + ofHeight("3/20") + 14);
    button("Rainbow", "grid(rainbow;Go(/game/menu", 5, 30 + ofHeight("6/20"));
    text("Makes a horizontal rainbow(red is at the left\nand purple is at the right).", ofWidth("1/5") + 5, 30 + ofHeight("6/20") + 14);
    button("Text", "set(back,/game/generator;Go(?", 5, 30 + ofHeight("9/20"));
    text("Draws some text with a background color and a \nfill color.", ofWidth("1/5") + 5, 30 + ofHeight("9/20") + 14);
    button("Back", "Go(/game/create",5,24+8*(height/10));
  }
  else if(place.equals("/game/gen/random")) {
    fill(250);
    rect(0, 0, width - 1, ofHeight("3/4"));
    fill(0);
    textFont(f);
    text("Choose a color below to be used in the randomization. You can also edit the seed used to make the grid, which can be any piece of text. If the seed has the suffix \"-gen1.5\"(without the quotes) all colors will be used in the randomization. Press Done to generate.", 5, 14, width - 10, ofHeight("3/4"));
    colorPicker(5, ofHeight("3/10") + 10, "set(baseC,$r|$g|$b");
    fill(215);
    rect(ofWidth("13/20") + 7, ofHeight("3/10"), ofWidth("3/10") - 1, ofHeight("8/20"));
    fill(0);
    text("Current text: \n" + editing[0], ofWidth("13/20") + 10, ofHeight("3/10") + 20);
    button("Edit", "input(0", ofWidth("29/40"), ofHeight("3/10") + 60);
    button("Done", "grid(random;Go(/game/menu", ofWidth("29/40"), ofHeight("4/10") + 60);
    button("Back", "Go(/game/generator",5,24+8*(height/10));
  }
  else if(place.equals("/game/gen/field")) {
    fill(250);
    rect(0, 0, width - 1, ofHeight("3/4"));
    fill(0);
    textFont(f);
    text("Press the Left button to pick the leftmost color, press the right button to pick the rightmost color. Press done to generate.\nCurrently choosing the color on the " + (stats == true? "left" : "right"), 5, 14, width - 10, ofHeight("3/4"));
    if(stats == true) colorPicker(5, ofHeight("3/10") + 10, "set(fieldL,$r|$g|$b");
    else colorPicker(5, ofHeight("3/10") + 10, "set(fieldR,$r|$g|$b");
    fill(215);
    rect(ofWidth("13/20") + 7, ofHeight("3/10"), ofWidth("3/10") - 1, ofHeight("8/20"));
    fill(getColor(editing[1], "|")); rect(ofWidth("13/20") + 7, ofHeight("2/10") + 60, ofWidth("3/10") - 1, ofHeight("1/10"));
    button("Left", "set(stats,true;set(selected," + editing[1], ofWidth("29/40"), ofHeight("2/10") + 60);
    fill(getColor(editing[2], "|")); rect(ofWidth("13/20") + 7, ofHeight("3/10") + 60, ofWidth("3/10") - 1, ofHeight("1/10"));
    button("Right", "set(stats,false;set(selected," + editing[2], ofWidth("29/40"), ofHeight("3/10") + 60);
    button("Done", "grid(field;Go(/game/menu", ofWidth("29/40"), ofHeight("4/10") + 60);
    button("Back", "Go(/game/generator",5,24+8*(height/10));
  }
  else if(place.equals("/game/grid")) {
   redT=0; blueT=0; greenT=0;
   for(int x = 0; x < grid[0].length; x++) {
     for(int y = 0; y < grid[0].length; y++) {
       grid[x][y].displer();
       fill(255);
       if(paused==false) {grid[x][y].chooseNeighbor();}
       redT += grid[x][y].red;
       blueT += grid[x][y].blue;
       greenT += grid[x][y].green;
     }
   }
   text((paused? "paused" : "playing")+" "+round(100*(equalized/(gridSize*gridSize)))+"%",5,20);
   if(equalized/(gridSize * gridSize) >= eqCond && eqSoundPlayed == false && playSounds == true) { calmSound.play(); eqSoundPlayed=true; }
   brush.paint();
   redA = redT/(grid[0].length*grid[0].length);
   blueA = blueT/(grid[0].length*grid[0].length);
   greenA = greenT/(grid[0].length*grid[0].length);
   showStats();
  }
  else if(place.equals("/game/menu")) {
    background(250);
    fill(0);
    button("Play","Go(/game/grid;set(pause,false;set(vk,3",5, 5);
    button("Main menu", "Go(/help/instructions.rtf", 5, 5 + ofHeight("1/10"));
    button("Help", "Go(/help/menu;set(stats,true;set(text,3;set(stats,false;set(back,/game/menu", 5, 5 + ofHeight("1/5"));
    text("The game is " + booleanToString(paused, "") + " paused. Press:",ofWidth("1/5") + 5,20);
    renderText("<rgb 0 0 200>m <rgb 64 64 64>to switch between the game and this menu\n" +
               "<rgb 0 0 200>p <rgb 64 64 64>to toggle pause during the simulation\n" +
               "<rgb 0 0 200>r <rgb 64 64 64>to make a new grid with these settings\n" +
               "<rgb 0 0 200>s <rgb 64 64 64>to show statistics during the simulation\n" +
               "<rgb 0 0 200>i <rgb 64 64 64>to inspect individual pixels\n",
    ofWidth("1/5") + 5, 40);
    fill(0);
    colorPicker(5, ofHeight("14/40"), "set(brush,$r|$g|$b", color(brush.red, brush.green, brush.blue));
    fill(215); rect(ofWidth("3/5") + 7, ofHeight("14/40"), ofWidth("2/5") - 8, ofHeight("2/5")); fill(0);
    renderText("<rgb 255 0 0>Brush Mode:", ofWidth("3/5") + 7, ofHeight("14/40") + 14); fill(0);
    String temp = "width:" + textWidth("Turn on") + ",height:20,hover-text:Turn on,mode:toggle";
    text("Random ", ofWidth("13/20"), ofHeight("15/40") + 28);
    button(booleanToString(brush.mode == -1, "on"), "style(" + temp + ";set(brushmode,-1", ofWidth("17/20"), ofHeight("15/40") + 10); fill(0);
    text("Normal  ", ofWidth("13/20"), ofHeight("15/40") + 48);
    button(booleanToString(brush.mode == 0, "on"), "style(" + temp + ";set(brushmode,0", ofWidth("17/20"), ofHeight("15/40") + 30); fill(0);
    text("Borders ", ofWidth("13/20"), ofHeight("15/40") + 68);
    button(booleanToString(brush.mode == 1, "on"), "style(" + temp + ";set(brushmode,1", ofWidth("17/20"), ofHeight("15/40") + 50); fill(0);
    text("Wormhole ", ofWidth("13/20"), ofHeight("15/40") + 88);
    button(booleanToString(brush.mode == 2, "on"), "style(" + temp + ";set(brushmode,2", ofWidth("17/20"), ofHeight("15/40") + 70); fill(0);
    text("Smart pxls ", ofWidth("13/20"), ofHeight("15/40") + 108);
    button(booleanToString(brush.mode == 3, "on"), "style(" + temp + ";set(brushmode,3", ofWidth("17/20"), ofHeight("15/40") + 90); fill(0);
    temp = ",width:" + ofWidth("7/10") + ",text-pos:left";
    slider(ofWidth("3/10"), ofHeight("16/20"), "style(text:Red Range is $v    " + temp + ";set(rRange,$v", redRange, 30);
    slider(ofWidth("3/10"), ofHeight("17/20"), "style(text:Green Range is $v " + temp + ";set(gRange,$v", greenRange, 30);
    slider(ofWidth("3/10"), ofHeight("18/20"), "style(text:Blue Range is $v   " + temp + ";set(bRange,$v", blueRange, 30);
  }
  else if(place.equals("/help/menu")) {
    background(250);
    fill(0);
    button("Show/hide topics", "style(width:" + ofWidth("2/5") + ";toggle(stats", 5, 5);
    renderText(helpText, ofWidth("1/4") + 15, ofHeight("3/15"));
    int offset = 5;
    if(stats == false) offset = -1 * ofWidth("1/4");
    String temp = "style(width:" + ofWidth("1/2") + ",height:" + ofHeight("1/15") + ",stroke:false,abrv:" + (offset == 5? "false" : "true") + ";";
    button("Key Bindings", temp + "set(text,0;set(stats,false", 5 + offset, ofHeight("2/15"));
    button("Brush Mode", temp + "set(text,1;set(stats,false", 5 + offset, ofHeight("3/15"));
    button("Colorpickers", temp + "set(text,2;set(stats,false", 5 + offset, ofHeight("4/15"));
    button("Pause menu", temp + "set(text,3;set(stats,false", 5 + offset, ofHeight("5/15"));
    button("Statistics and Pixel Inspector", temp + "set(text,4;set(stats,false", 5 + offset, ofHeight("6/15"));
    button("Making a grid", temp + "set(text,5;set(stats,false", 5 + offset, ofHeight("7/15"));
    button("Mobile Devices", temp + "set(text,6;set(stats,false", 5 + offset, ofHeight("8/15"));
    button("Sounds that you hear", temp + "set(text,7;set(stats,false", 5 + offset, ofHeight("9/15"));
    button("Older versions", temp + "set(text,8;set(stats,false", 5 + offset, ofHeight("10/15"));
    button("Back", "Go(" + back,5,24+8*(height/10));
  }
  else{ //Unknown location
    paused = true;
    background(250);
    fill(0);
    text("Something went wrong \n There is a chance that your grid still exists \n If it exists then it has been paused",5,20);
    button("Go Back","Go(/game/grid",5,200);
    button("Home","Go(/help/instructions.rtf",width-5-(width/5),200);
  }
  if(vk > 0) { //0:disabled 1:hidden 2:shown 3:keyboard
    if(vk == 2) {
      button("VK", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";set(vk,3", ofWidth("29/32"), ofHeight("29/32"));
    }
    else if(vk == 3) {
      fill(250);
      stroke(0);
      rect(0, ofHeight("7/8"), width - 1, ofHeight("1/8") - 1);
      button("X", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ",mode:x;set(vk,2", ofWidth("29/32"), ofHeight("29/32"));
      button("I", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";toggle(info", ofWidth("1/32"), ofHeight("29/32"));
      button("M", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";set(pause,true;set(vk,2;Go(/game/menu", ofWidth("5/32"), ofHeight("29/32"));
      button("P", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";toggle(pause", ofWidth("9/32"), ofHeight("29/32"));
      button("R", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";" + editing[4], ofWidth("13/32"), ofHeight("29/32"));
      button("S", "style(width:" + ofWidth("1/16") + ",height:" + ofHeight("1/16") + ";toggle(stats", ofWidth("17/32"), ofHeight("29/32"));
      button("What is this?", "style(width:" + textWidth(" What is this ") + ",height:" + ofHeight("1/16") + ";set(text,6;set(back," + place + ";set(vk,2;Go(/help/menu", ofWidth("21/32"), ofHeight("29/32"));
    }
    if(vk == 1 && (mouseX < ofWidth("7/8") && mouseY < ofHeight("7/8")) == true) {
      vk = 2;
    }
  }
}
void button(String t, String action, int x, int y) { //A regular button
  int h = (height/10)-4;
  int w = (width/5)-4;
  String hoverT = t;
  color linkColor = color(0, 0, 0);
  color bg = color(240);
  color bg2 = color(200);
  stroke(0);
  if(action.indexOf("style(") > -1) {
    String[] params = split(split(action.substring(action.indexOf("style("), action.length), ";")[0], "(");
    String[] pairs = split(params[1], ",");
    for(int i = 0; i < pairs.length; i++) {
      String name = split(pairs[i], ":")[0];
      String value = split(pairs[i], ":")[1];
      if(name.equals("hover-text")) hoverT = value;
      else if(name.equals("width")) w = int(value);
      else if(name.equals("height")) h = int(value);
      else if(name.equals("stroke")) {if(value.equals("false")) noStroke();}
      else if(name.equals("abrv")) {if(value.equals("true")) {t = split(t, " ")[0]; w = x + w; x = 0;}}
      else if(name.equals("mode")) {
          if(value.equals("link")) {linkColor = color(110, 110, 230); bg = color(230);}
          if(value.equals("x")) {linkColor = color(200, 200, 200); bg = color(247, 67, 40); bg2 = color(166, 60, 41);}
          else {if(t.equals("on")) {linkColor = color(255); bg = color(50, 110, 220); bg2 = color(50, 110, 190);} else {bg = color(180, 200, 220); bg2 = color(160, 180, 190);}}
      }
    }
  }
  fill(bg);
  if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
      fill(bg2);
      t = hoverT;
      if(released < 3) {
        if(playSounds) clickSound.play();
        String[] actions = split(action, ";");
        for(int i = 0; i < actions.length; i++) {
          doAction(actions[i]);
        }
        released++;
      }
  }
  rectMode(CORNER);
  rect(x,y,w,h); //A rectangle
  fill(linkColor);
  textFont(f);
  int baseline = centerY(t,h,y);
  if(h < height/10 - 4) baseline = y + h/2 + 5;
  text(t,centerX(t,w,x),baseline);
}
void renderText(String t, int x, int y) { //Added in 1.6
  String[] texts = splitTokens(t,"<>");
  int nextX = x;
  int nextY = y;
  int currentHeight = 14;
  color currentColor = color(0, 0, 0);
  PFont currentFont = f;
  boolean bold = false;
  for(int i = 0; i < texts.length; i++) {
    texts[i] = replaceAll(texts[i], "$eqCond", "" + int(eqCond * 100));
    texts[i] = replaceAll(texts[i], "$sound", playSounds? "on" : "off");
    if(texts[i].indexOf("rgb") == 0) {
      String[] params = split(texts[i], " ");
      currentColor = color(int(params[1]), int(params[2]), int(params[3]));
    }
    else if(texts[i].indexOf("size") == 0) {
      currentHeight = int(split(texts[i], " ")[1]);
      currentFont = createFont("Arial.ttf", currentHeight, true);
    }
    else if(texts[i].indexOf("bold") == 1 || texts[i].indexOf("bold") == 0) {
      if(texts[i].indexOf("bold") == 0) bold = true;
      else bold = false;
    }
    else if(texts[i].indexOf("y") == 0) {
      String measure = split(texts[i], " ")[1];
      String unit = split(texts[i], " ")[2];
      int amount = 0;
      if(unit.equals("em")) amount = currentHeight;
      if(measure.indexOf("/") != -1) amount *= int(split(measure,"/")[0]) / int(split(measure,"/")[1]);
      else amount *= float(measure);
      nextY += amount;
    }
    else if(texts[i].indexOf("br") == 0) {
      nextY += currentHeight;
      nextX = x;
    }
    else if(texts[i].indexOf("do") == 0) {
      String style = "style(width:" + (textWidth(texts[i + 1]) + 10);
      style = style + ",height:" + (currentHeight + 4) + ",stroke:false,mode:link;";
      button(texts[i + 1], style + texts[i].substring(2, texts[i].length), nextX, nextY - currentHeight + 1);
      nextX += (textWidth(texts[i + 1]) + 10);
      texts[i + 1] = "";
    }
    else if(texts[i].indexOf("/this") == 0) {}
    else if(texts[i].indexOf("move") == 0) {
      String[] params = split(texts[i], " ");
      int amount = 0;
      if(params[2].equals("em")) amount = currentHeight;
      else amount = textWidth(params[2]);
      amount *= float(params[1]);
      nextX += amount;
      if(params[4].equals("em")) amount = currentHeight;
      else amount = textWidth(params[2]);
      amount *= float(params[1]);
      nextY += amount;
    }
    else if(texts[i].indexOf("tab") == 0) {
      int tab = (nextX - x) % ((width - x)/18);
      nextX += ((width - x)/18 - tab);
    }
    else {
      fill(currentColor);
      textFont(currentFont);
      text(texts[i], nextX, nextY);
      if(bold) text(texts[i], nextX + 1, nextY + 1);
      String[] lines = split(texts[i], "\n");
      if(lines.length == 1) nextX += textWidth(texts[i]);
      else nextX = x + textWidth(lines[lines.length - 1]);
      nextY += (currentHeight + 5) * count(texts[i], "\n");
    }
  }
  textFont(f);
}
void colorPicker(int x, int y, String action) {
  stroke(0);
  image(hueAndSat, x, y, ofWidth("2/5"), ofWidth("2/5"));
  fill(0, 0, 0, map(cpl, 0, 99, 0, 255));
  rect(x - 1, y - 1, ofWidth("2/5") + 1, ofWidth("2/5") + 1);
  fill(0);
  slider(x + ofWidth("17/40"), y, "style(vertical:true,min:1,text-pos:value;set(light,$v", cpl, 100);
  if(mouseX >= x && mouseX <= x + ofWidth("2/5") && mouseY >= y && mouseY <= y + ofWidth("2/5") && mousePressed) {
    selectedColor = get(mouseX, mouseY);
  }
  noFill();
  int ex = map(hue(selectedColor), 0, 255, 0, ofWidth("2/5"));
  int ey = map(255 - saturation(selectedColor), 0, 255, 0, ofWidth("2/5"));
  ellipse(x + ex, y + ey, 5, 5);
  fill(selectedColor);
  rect(x + ofWidth("1/2"),y,ofWidth("1/10"),ofHeight("1/10"));
  fill(0);
  text("R: " + floor(red(selectedColor)) +
  "\nG: " + floor(green(selectedColor)) +
  "\nB: " + floor(blue(selectedColor)) +
  "\nH: " + floor(hue(selectedColor)) +
  "\nS: " + floor(saturation(selectedColor)) +
  "\nB: " + floor(brightness(selectedColor)),
  x + ofWidth("1/2"), y + ofHeight("1/10") + 14);
  String[] actions = split(action, ";");
  for(int i = 0; i < actions.length; i++) {
    actions[i] = actions[i].replace("$r",red(selectedColor)).replace("$g",green(selectedColor)).replace("$b",blue(selectedColor));
    actions[i] = actions[i].replace("$h",hue(selectedColor)).replace("$s",saturation(selectedColor)).replace("$l",brightness(selectedColor));
    doAction(actions[i].replace("$e", "$"));
  }
}
String strColor(color c, String sep) { //New in 1.6
  return floor(red(c)) + sep + floor(green(c)) + sep + floor(blue(c));
}
color getColor(String s, String sep) { // New in 1.6
  String[] c = split(s, sep);
  switch(c.length) {
    case 1:
      return color(int(c[0])); break;
    case 2:
      return color(int(c[0]), int(c[1])); break;
    case 3:
      return color(int(c[0]), int(c[1]), int(c[2])); break;
    case 4:
      return color(int(c[0]), int(c[1]), int(c[2]), int(c[3])); break;
    default:
      return color(0, 0, 0); break;
  }
} 
int count(String body, String search) { //Added in 1.6
  return split(body, search).length - 1;
}
int centerX(String t, int w, int x) { //This method returns the x position of horizontally aligned text
  return ((w-textWidth(t))/2)+x;
}
int centerY(String t, int h, int y) { //This method returns the y position of vertically aligned text
  return (h/2)+y+3;
}
int ofWidth(String fraction) { //New in 1.6
  int numerator = int(split(fraction, "/")[0]);
  int denominator = int(split(fraction, "/")[1]);
  return width * (numerator/denominator);
}
int ofHeight(String fraction) { //New in 1.6
  int numerator = int(split(fraction, "/")[0]);
  int denominator = int(split(fraction, "/")[1]);
  return height * (numerator/denominator);
}
boolean toggle(boolean b) {
  if(b) {return false;}
  else {return true;}
}
String strToggle(boolean b) {
  if(b) {return "off";}
  else {return "on";}
}
String replaceAll(String body, String search, String repl) {
  return join(split(body, search), repl);
}
void mouseReleased() { //Runs when the mouse is released
  released = 0;
}
void doAction(String action) { //Interprets general action script, specifically for DE
  //This bit seperates the method name from the parameters
  String[] a = split(action, "(");
  if(a[0].equals("Go")) { // Go(location
    if((a[1].equals("/game/menu") || a[1].equals("/game/grid")) && grid == null) return;
    place = a[1];
  }
  else if(a[0].equals("grid")) { // grid(generator
    if(a[1].equals("random")) {
      editing[0] = replaceAll(editing[0], " ", "");
      boolean useOld = false;
      if(editing[0].indexOf("-gen1.5") <= 15 && editing[0].indexOf("-gen1.5") >= 0) {editing[0]= editing[0].replace("-gen1.5", ""); useOld = true;}
      if(editing[0].length > 15) editing[0] = editing[0].substring(0, 16);
      int temp = 0;
      for(int i = 0; i < editing[0].length; i++) {
        temp += editing[0].charCodeAt(i);
      }
      randomSeed(temp); colorMode(RGB); color c = getColor(editing[5], "|");
      int diff = Math.min(Math.min(red(c), green(c), blue(c)), Math.min(256 - red(c), 256 - green(c), 256 - blue(c)));
      int rmin = red(c) - diff, rmax = red(c) + diff;
      int gmin = green(c) - diff, gmax = green(c) + diff;
      int bmin = blue(c) - diff, bmax = blue(c) + diff;
      rmax = Math.min(255, rmax); gmax = Math.min(255, gmax); bmax = Math.min(255, bmax);
      if(useOld) {
        rmin = 0;   gmin = 0;   bmin = 0;
        rmax = 255; gmax = 255; bmax = 255;
      }
      grid = new DPixel[gridSize][gridSize];
      for(int x = 0; x < gridSize; x++) { //Makes all of the pixels
        for(int y = 0; y < gridSize; y++) {
          grid[x][y] = new DPixel(x,y,int(floor(random(rmin,rmax))),int(floor(random(gmin,gmax))),int(floor(random(bmin,bmax))),gridSize);
        }
      }
      code = "v1.6pjs/random=" + temp + "," + (useOld == true? "-gen1.5" : "") + "," + replaceAll(strColor(c, "|"), "|", ",");
    }
    else if(a[1].equals("field")) {
      color c0 = getColor(editing[1], "|");
      color c1 = getColor(editing[2], "|");
      grid = new DPixel[gridSize][gridSize];
      for(int x = 0; x < gridSize; x++) { //Makes all of the pixels
        for(int y = 0; y < gridSize; y++) {
          grid[x][y] = new DPixel(x,y,
          round(map(x,0,gridSize,red(c0),red(c1))),
          round(map(x,0,gridSize,green(c0),green(c1))),
          round(map(x,0,gridSize,blue(c0),blue(c1))),gridSize);
        }
      }
      code = "v1.6pjs/field=" + strColor(c0, ",") + "," + strColor(c1, ",");
    }
    else if(a[1].equals("rainbow")) {
      grid = new DPixel[gridSize][gridSize];
      for(int x = 0; x < gridSize; x++) { //Makes all of the pixels
        for(int y = 0; y < gridSize; y++) {
          grid[x][y] = new DPixel(x,y,
          floor(red(hueAndSat.get(floor(map(x,0,gridSize,0,hueAndSat.width)), 0))),
          floor(green(hueAndSat.get(floor(map(x,0,gridSize,0,hueAndSat.width)), 0))),
          floor(blue(hueAndSat.get(floor(map(x,0,gridSize,0,hueAndSat.width)), 0))),gridSize);
        }
      }
    }
    brush.max = gridSize;
    place = "/game/grid";
    equalized = 0;
    eqSoundPlayed = false;
    editing[4] = "grid(" + a[1];
  }
  else if(a[0].equals("toggle")) {
    if(a[1].equals("brdbrush")) {brush.border=toggle(brush.border); brush.random = false;}
    else if(a[1].equals("rndbrush")) {brush.random=toggle(brush.random); brush.border = false;}
    else if(a[1].equals("stats")) {stats = stats? false : true;}
    else if(a[1].equals("sound")) {playSounds = playSounds? false : true;}
    else if(a[1].equals("pause")) {paused = paused? false : true;}
    else if(a[1].equals("info")) {info = info? false : true;}
    else if(a[1].equals("vk")) {vk = vk == 0? 2 : 0;}
  }
  else if(a[0].equals("error")) {
    error(a[1]);
  }
  else if(a[0].equals("input")) {
    String old = editing[int(a[1])];
    editing[int(a[1])] = prompt("The text should not exceed 15 characters(spaces are removed).", editing[0]);
    if(editing[int(a[1])] == null) {editing[int(a[1])] = old;}
  }
  else if(a[0].equals("set")) { //Added in 1.6
    String name = split(a[1], ",")[0];
    String value = split(a[1], ",")[1];
    if(name.equals("rRange")) {redRange = int(value);}
    else if(name.equals("gRange")) { greenRange = int(value); }
    else if(name.equals("bRange")) { blueRange = int(value); }
    else if(name.equals("brush")) { color c = getColor(value, "|"); brush.red=red(c); brush.green=green(c); brush.blue=blue(c); }
    else if(name.equals("pause")) { paused = boolean(value); }
    else if(name.equals("light")) { cpl = int(value); }
    else if(name.equals("gridSize")) { gridSize = int(value); }
    else if(name.equals("back")) { back = value; }
    else if(name.equals("brushmode")) { brush.mode = int(value); }
    else if(name.equals("stats")) { stats = boolean(value); }
    else if(name.equals("text")) { helpText = help[int(value)]; }
    else if(name.equals("eqCond")) { if(value.equals("++")) eqCond += 0.01; else if(value.equals("--")) eqCond -= 0.01; else eqCond = float(value); }
    else if(name.equals("vk")) { vk = int(value); }
    else if(name.equals("baseC")) { editing[5] = value; }
    else if(name.equals("fieldL")) { editing[1] = value; }
    else if(name.equals("fieldR")) { editing[2] = value; }
    else if(name.equals("selected")) { selectedColor = getColor(value, "|"); }
  }
}
int rng(int[] nums) { //Random integer generator
  return nums[int(floor(random(0,nums.length())))];
}
int slider(int x, int y, String action, int current, int range) {
  int w = ofWidth("2/5");
  int h = ofHeight("1/40");
  String t = "$v";
  int textX = (x+2*(width/5)-textWidth(t.replace("$v", current)))/2;
  int textY = y + 16 + h;
  color dragger = color(200);
  color dragColor = color(100);
  int minValue = 1;
  boolean vertical = false;
  if(action.indexOf("style(") > -1) {
    String[] params = split(split(action.substring(action.indexOf("style("), action.length), ";")[0], "(");
    String[] pairs = split(params[1], ",");
    for(int i = 0; i < pairs.length; i++) {
      String name = split(pairs[i], ":")[0];
      String value = split(pairs[i], ":")[1];
      if(name.equals("vertical")) {vertical = true; w = ofWidth("1/40"); h = ofHeight("2/5");}
      else if(name.equals("width")) w = int(value);
      else if(name.equals("height")) h = int(value);
      else if(name.equals("min")) {minValue = int(value); current = Math.max(minValue, current); current = Math.min(minValue + range - 1, current);}
      else if(name.equals("text")) t = value;
      else if(name.equals("d")) {String[] d = split(value, "|"); dragger = color(int(d[0]), int(d[1]), int(d[2]));}
      else if(name.equals("d-h")) {String[] d = split(value, "|"); dragColor = color(int(d[0]), int(d[1]), int(d[2]));}
      else if(name.equals("text-pos")) {
        if(value.equals("left")) { textX = x - textWidth(t) - 2; textY = centerY(t, h, y); }
        else if(value.equals("right")) { textX = x + w + 2; textY = centerY(t, h, y); }
        else if(value.equals("value")) { textX = x + w + 4; textY = y + current * (h/range) + 12;}
        else { textX = textX = (x + ofWidth("2/5") - textWidth(t.replace("$v", current)))/2; textY = y + 16 + h; }
      }
    }
  }
  int interval = vertical? Math.round(h/range) : Math.round(w/range);
  rectMode(CORNER);
  fill(230);
  stroke(0);
  rect(x, y, w, h, 5);
  fill(dragger);
  if(mousePressed && mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    if(vertical == false) {
      current = Math.min(Math.round((mouseX - x)/interval) + minValue, minValue + range);
    } else {
      current = Math.min(Math.round(map(mouseY - y, 0, h, minValue, minValue + range)), minValue + range); //Math.round((mouseY - y)/interval) + minValue;
    }
    String[] actions = split(action, ";");
    for(int i = 0; i < actions.length; i++) { //escape $v with $e
      doAction(actions[i].replace("$v", current).replace("$e", "$"));
    }
    fill(dragColor);
  }
  if(vertical == false) {
    rect(x + ((current - minValue) * interval), y, Math.min(w, h), Math.min(w, h));
  } else {
    rect(x, y + (current - minValue) * (h/range), Math.min(w, h), Math.min(w, h));
  }
  fill(0);
  text(t.replace("$v", current), textX, textY);
  return current;
}
void showStats() { //Shows the stats
 if(stats) {
  fill(0,0,0,128);
  rect(0,0,(width/4)+(width/8),3*(height/10));
  fill(255);
  text("Average Red:"+int(redA),5,40);
  text("Average Blue:"+int(blueA),5,60);
  text("Average Green:"+int(greenA),5,80);
  text("Code:" + code,5,100);
  }
  if(info) {
  stroke(224, 210, 54);
  fill(255, 64);
  int x = int(floor(mouseX / (width/gridSize)));
  int y = int(floor(mouseY / (height/gridSize))); 
  rect((width/gridSize)*x, (height/gridSize)*y, width/gridSize, height/gridSize);
    if(mouseX < width/2) {
      stroke(64, 128, 230);
      strokeWeight(2);
      fill(0);
      rect(mouseX+width/gridSize, (height/gridSize)*y, textWidth("x:00 y:00 rgb:000,000,000"), 20, 5);
      fill(255);
      text("x:"+x+" y:"+y+" rgb:"+
      round(grid[x][y].red)+","+round(grid[x][y].green)+","+round(grid[x][y].blue), mouseX+width/gridSize, (height/gridSize)*y+16);
      strokeWeight(1);
    } else {
      stroke(64, 128, 230);
      strokeWeight(2);
      fill(0);
      rect(mouseX-width/gridSize-textWidth("x:00 y:00 rgb:000,000,000"), (height/gridSize)*y, textWidth("x:00 y:00 rgb:000,000,000"), 20, 5);
      fill(255);
      text("x:"+x+" y:"+y+" rgb:"+round(grid[x][y].red)+","+round(grid[x][y].green)+","+round(grid[x][y].blue),
      mouseX-width/gridSize-textWidth("x:"+x+" y:"+y+" rgb:"+round(grid[x][y].red)+","+round(grid[x][y].green)+","+round(grid[x][y].blue)),
      (height/gridSize)*y+16);
      strokeWeight(1);
    }
 }
}
boolean withinRange(int num, int compare, int range) {
  if(num >= compare-range && num <= compare+range) { 
    return true;
  } else {
    return false;
  }
}
String booleanToString(boolean b, String type) { //Added in 1.6
  if(type.indexOf("!") != -1) { b = toggle(b); type = type.substring(1, type.length); }
  if(type.equals("is")) return b? "is" : "is not"
  if(type.equals("are")) return b? "are" : "are not"
  if(type.equals("on")) return b? "on" : "off";
  if(type.equals("")) return b? "" : "not";
  if(type.equals("no")) return b? "" : "no";
  if(type.equals("yn")) return b? "yes" : "no";
}
void keyReleased() {
  if(key != CODED) {
    if(key == 'p' || key == 'P') {
      if(place.equals("/game/grid")) paused = toggle(paused);
    } //P
    else if(key == 'r' || key == 'P') {
      doAction(editing[4]);
    }
    else if(key == 'm' || key == 'M') {
      paused = true;
      if(place.equals("/game/grid")) place = "/game/menu";
      else if(place.equals("/game/menu")) place = "/game/grid";
    }
    else if(key == 's' || key == 'S') {
      stats = toggle(stats);
    }
    else if(key == 'i' || key == 'I') {
      info = toggle(info);
    }
    else if(key == 'd' || key == 'D') {
      debug = toggle(debug);
    }
  } else {
    
  }
}

class Brush{
  int red;
  int green;
  int blue;
  int max;
  int mode; //-1 : random, 0 : normal, 1 : border, 2 : blackhole, 3 : whitehole, 4 : wormhole, 5 : smart
  boolean border;
  boolean random;
  Brush(int r, int g, int b, int m) {
    red = r;
    green = g;
    blue = b;
    max = m;
    border = false;
    random = false;
  }
  void setColor(int r, int g, int b) {red = r; green = g; blue = b;}
  void paint() {
    if(red < 0) {red = 0;}
    if(green < 0) {green = 0;}
    if(blue < 0) {blue = 0;}
    if(red > 255) {red = 255;}
    if(green > 255) {green = 255;}
    if(blue > 255) {blue = 255;}
    if(mousePressed && mouseX >= 0 && mouseX <= width && mouseY >= 0 && mouseY <= height) {
      int x = int(floor(mouseX / (width/max)));
      int y = int(floor(mouseY / (height/max)));
      if(border) {
        grid[x][y].red = 224;
        grid[x][y].green = 210;
        grid[x][y].blue = 54;
        grid[x][y].border = true;
      } 
      else if(random) {
        int[] randomRanges = {0, 50, 100, 150, 200, 255};
        grid[x][y].red = rng(randomRanges);
        grid[x][y].green = rng(randomRanges);
        grid[x][y].blue = rng(randomRanges);
        grid[x][y].border = false;
      } else {
        grid[x][y].red = this.red;
        grid[x][y].green = this.green;
        grid[x][y].blue = this.blue;
        grid[x][y].border = false;
      }
    }
  }
}
void error(String msg) {
  alert(msg);
}
class DPixel{ //Dynamic pixel class
  int xindex;
  int yindex;
  int red;
  int green;
  int blue;
  int size;
  int max;
  int rate;
  int pixelType = 0;
  boolean border;
  boolean steady;
  DPixel(int x, int y, int r, int g, int b, int m) {//The constructor of this class
    xindex = x; //The x coordinate in the array
    yindex = y; //The y coordinate in the array
    red = r; //How much red the pixel has
    green = g; //How much green the pixel has
    blue = b; //How much blue the pixel has
    max = m; //The maximum amount of pixels in each row or column
    size = width/m; //The size of each pixel
    border = false; //If border is true then it will not update its neighbors and others can't update it either
    steady = false;
  }
  void chooseNeighbor() {
    // The pixels are as follows:
    //| 1 | 2 | 3 |
    //| 8 |YOU| 4 |
    //| 7 | 6 | 5 |
    
    if(border == false) {
    if(xindex == 0 && yindex == 0) { //Upper left corner
      int client = int(floor(random(4,7)));
      balanceNeighbor(getPixel(client));
    }
    else if(xindex == 0 && yindex == max-1) { //Lower left corner
      int client = int(floor(random(2,5)));
      balanceNeighbor(getPixel(client));
    }
    else if(xindex == 0 && yindex != 0 && yindex != max-1) { //Left side
      int client = int(floor(random(2,7)));
      balanceNeighbor(getPixel(client));
    }
    else if(xindex == max-1 && yindex == 0) { //Upper right hand corner
      int client = int(floor(random(6,9)));
      balanceNeighbor(getPixel(client));
    }
    else if(xindex == max-1 && yindex == max-1) { //Lower right hand corner
      int client = rng(new int[]{8,1,2});
      balanceNeighbor(getPixel(client));
    }
    else if(xindex == max-1 && yindex != 0 && yindex != max-1) { //The right side
      int client = rng(new int[]{6,7,8,1,2});
      balanceNeighbor(getPixel(client));
    }
    else if(yindex == 0 && xindex != 0 && xindex != max-1) { //The top
      int client = int(floor(random(4,9)));
      balanceNeighbor(getPixel(client));
    }
    else if(yindex == max-1 && xindex != 0 && xindex != max-1) { //The bottom
      int client = rng(new int[]{8,1,2,3,4});
      balanceNeighbor(getPixel(client));
    }
    else { //The middle
      int client = int(floor(random(1,9)));
      balanceNeighbor(getPixel(client));
    }
    }
  }
  DPixel getPixel(int c) {
    switch(c) {
      case 1:
      return grid[xindex-1][yindex-1];
      break;
      case 2:
      return grid[xindex][yindex-1];
      break;
      case 3:
      return grid[xindex+1][yindex-1];
      break;
      case 4:
      return grid[xindex+1][yindex];
      break;
      case 5:
      return grid[xindex+1][yindex+1];
      break;
      case 6:
      return grid[xindex][yindex+1];
      break;
      case 7:
      return grid[xindex-1][yindex+1];
      break;
      case 8:
      return grid[xindex-1][yindex];
      break;
      default:
      return this;
      break;
    }
  }
  void balanceNeighbor(DPixel d) {
    red = constrain(red, 0, 255);
    green = constrain(green, 0, 255);
    blue = constrain(blue, 0, 255);
    int r = this.red - d.red;
    int b = this.blue - d.blue;
    int g = this.green - d.green;
    int diff = 0;
    if(Math.max(r, g, b) == r && r >= redRange) {
      diff = r - redRange;
      if(r < 8) { d.red++; this.red--; }
      else if(r < 16) { d.red+=2; this.red-=2; }
      else if(r < 32) { d.red+=3; this.red-=3; }
      else if(r < 64) { d.red+=4; this.red-=4; }
      else if(r < 128) { d.red+=5; this.red-=5; }
      else if(r < 256) { d.red+=6; this.red-=6; }
    } else if(Math.max(r, g, b) == b && b >= blueRange) {
      diff = b - blueRange;
      if(b < 8) { d.blue++; this.blue--; }
      else if(b < 16) { d.blue+=2; this.blue-=2; }
      else if(b < 32) { d.blue+=3; this.blue-=3; }
      else if(b < 64) { d.blue+=4; this.blue-=4; }
      else if(b < 128) { d.blue+=5; this.blue-=5; }
      else if(b < 256) { d.blue+=6; this.blue-=6; }
    } else if(Math.max(r, g, b) == g && g >= greenRange) {
      diff = g - greenRange;
      if(g < 8) { d.green++; this.green--; }
      else if(g < 16) { d.green+=2; this.green-=2; }
      else if(g < 32) { d.green+=3; this.green-=3; }
      else if(g < 64) { d.green+=4; this.green-=4; }
      else if(g < 128) { d.green+=5; this.green-=5; }
      else if(g < 256) { d.green+=6; this.green-=6; }
    } else {  }
    if(steady == false && diff < 4) {
      equalized++; steady = true;
    }
    if(steady == true && diff >= 4) {
      equalized--; steady = false;
    }
  }
  void displer() {
    rectMode(CORNER);
    fill(red,green,blue);
    noStroke();
    rect(xindex*size,yindex*size,size,size);
    if(steady && debug) { fill(250); rect(xindex*size, yindex*size,size,size); }
  }
}


