
Button[] but = new Button[6];
Button playbut;
Button stopbut;
int total;
int gamestate = 1;
String t1 = "Welcome to the TeachProcesisng Interpreter, v0.7";
String t2 = "Experiment with the buttons to get great results!";
String t3 = "Coming soon: The Loop Update (v1.0)";
String zClicker = "Coming later: The Statement Update (v1.1)";
String Debugger1 = "";
String Debugger2 = "";
boolean allowAppending = false;
int stage = 0; //0 for naming variables, 1 for giving them values
PFont f;
artVar[] artVars = new artVar[256];
artShape[] artShapes = new artShape[256];
artEquation[] artEquations = new artEquation[256];
artIf[] artIfs = new artIf[256];
artEOFif[] artEOFifs = new artEOFif[256];
artWhile[] artWhiles = new artWhile[256];
artEOFwhile[] artEOFwhiles = new artEOFwhile[256];
artFunct[] artFuncts = new artFunct[256];
artCaller[] artCallers = new artCaller[256];
artEOFfunct[] artEOFfuncts = new artEOFfunct[256];
int numartvars = 0;
int numartshapes = 0;
int numartequations = 0;
int numartifs = 0;
int numartEOFifs = 0;
int numartwhiles = 0;
int numartEOFwhiles = 0;
int numartfuncts = 1;
int numartcallers = 1;
int numartEOFfuncts = 1;
boolean highlighter = false;
int tMilli1 = 0; //timer
int tMilli2 = 0;

void setup() {
  size(400,500);
  f = createFont("Arial",16,true);
  but[0] = new Button(305,120,90,30,true,"");
  but[1] = new Button(305,155,90,30,true,"");
  but[2] = new Button(305,190,90,30,true,"");
  but[3] = new Button(305,225,90,30,true,"");
  but[4] = new Button(305,260,90,30,true,"");
  playbut = new Button(310,85,40,30,true,"Play");
  stopbut = new Button(355,85,40,30,true,"Stop");
  for (int i = 0;i<256;i++) {
    artIfs[i] = new artIf("","");
    artFuncts[i] = new artFunct("");
    artWhiles[i] = new artWhile("","");
    artVars[i] = new artVar("","","");
    artShapes[i] = new artShape("");
    artEquations[i] = new artEquation("","","","");
    artEOFifs[i] = new artEOFif();
    artEOFwhiles[i] = new artEOFwhile();
    artEOFfuncts[i] = new artEOFfunct();
    artCallers[i] = new artCaller();
    fShape[i] = new flaggedShape("",-100,-100,-100,-100,-100);
  }
  artFuncts[0] = new artFunct("draw");
  artFuncts[0].line = 0;
  artEOFfuncts[0] = new artEOFfunct();
  artEOFfuncts[0].line = 2;
}

void draw() {
  if (isRunning == false) {
    tMilli1 = millis();
  }
  selfDraw();
}

void selfDraw() {
  clearQueue();
  //println("Gamestate: " + gamestate);
  background(255);
  for (int i = 0;i<5;i++) {
      but[i].render();
      playbut.render();
      stopbut.render();
    }
  text(t1,0,16);
  text(t2,0,32);
  text(t3,0,48);
  text(zClicker,0,64);
  text(Debugger1,0,80);
  text(Debugger2,0,96);
  fill(224);
  rect(10,300,380,190);
  fill(0,0,255,127);
  rect(10,100,280,190);
  showOthers();
  showOtherStatements();
  switch(gamestate) {
//    case 0:
//      println("Case: 0");
//      isRunning = true;
//      gamestate = 2;
//      println("Draw the shapes!");
//      drawFShapes();
//      break;
    case 1:
    lineinprog = 0;
      total = numartvars + numartshapes + numartequations + numartifs + numartEOFifs;
      //doLevels();
      doButtonLayout();
      showBoxes();
      showStatements();
      showOthers();
      showOtherStatements();
      allowAppending = true;
      if (highlighter == true) {
        highlighter();
      }
      displayInfo();
      if (playbut.isClicked() == true) {
        isRunning = true;
        gamestate = 2;
      }
      break;
    case 2:
      if (isRunning == true) {
        runProgram();
      }
      if (stopbut.isClicked() == true) {
        isRunning = false;
        gamestate = 1;
      }
      drawFShapes();
      break;
  }
}

void keyPressed() {
  if ((keyCode == DELETE || keyCode == BACKSPACE) && isWriting == false) {
    for (int i = 0;i<total;i++) {
      if (artVars[i].line == rectat) {
        artVars[i].delete(i);
        lineat -= 1;
        i = total;
      }
      else if (artShapes[i].line == rectat) {
        artShapes[i].delete(i);
        lineat -= 1;
        i = total;
      }
      else if (artEquations[i].line == rectat) {
        artEquations[i].delete(i);
        lineat -= 1;
        i = total;
      }
    }
    shiftLineDown(rectat);
  }
  if ((keyCode == ENTER || keyCode == RETURN) && isWriting == false) {
    //println("50 miles to Connecticut!");
    shiftLineUp(rectat);
  }
  /*if ((key == 'z' || key == 'Z') && zClicker == "Press 'z' to continue") {
    println(allowAppending);
  }*/
  if (allowAppending == true) {
    //for names and values
    if (key!=CODED&&key!=ENTER&&key!=RETURN&&key!=DELETE&&key!=BACKSPACE) {
      if (stage == 0) {
        println("Where is Connecticut?");
        if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
          artVars[numartvars].vname += key;
        }
        else if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par1 += key;
          println("Connecticut is due south!");
        }
        else if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/" || curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
          artEquations[numartequations].voutput += key;
          println("Connecticut is due South");
        }
        else if (curVarType == "if") {
          artIfs[numartifs].par1 += key;
        }
        else if (curVarType == "while") {
          artWhiles[numartwhiles].par1 += key;
        }
        else if (curVarType == "NPFunct") {
          artFuncts[numartfuncts].vname += key;
        }
        else if (curVarType == "caller") {
          artCallers[numartcallers].vname += key;
        }
      }
      else if (stage == 1) {
        if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
          artVars[numartvars].vval += key;
        }
        else if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par2 += key;
        }
        else if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/" || curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
          artEquations[numartequations].vinput1 += key;
        }
        else if (curVarType == "if") {
          artIfs[numartifs].par2 += key;
        }
        else if (curVarType == "while") {
          artWhiles[numartwhiles].par2 += key;
        }
      }
      else if (stage == 2) {
        if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par3 += key;
        }
        else if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
          artEquations[numartequations].vinput2 += key;
        }
      }
      else if (stage == 3) {
        if (curVarType == "rect" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par4 += key;
        }
      }
      else if (stage == 4) {
        if (curVarType == "triangle") {
          artShapes[numartshapes].par5 += key;
        }
      }
      else if (stage == 5) {
        if (curVarType == "triangle") {
          artShapes[numartshapes].par6 += key;
        }
      }
    }
    else if (keyCode == DELETE || keyCode == BACKSPACE) {
      if (stage == 0) {
        if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
          artVars[numartvars].vname = shortenString(artVars[numartvars].vname);
        }
        if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par1 = shortenString(artShapes[numartshapes].par1);
        }
        if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
          artEquations[numartequations].voutput = shortenString(artEquations[numartequations].voutput);
        }
        if (curVarType == "if") {
          artIfs[numartifs].par1 = shortenString(artIfs[numartifs].par1);
        }
        else if (curVarType == "while") {
          artWhiles[numartwhiles].par1 = shortenString(artWhiles[numartwhiles].par1);
        }
        else if (curVarType == "NPFunct") {
          artFuncts[numartfuncts].vname = shortenString(artFuncts[numartfuncts].vname);
        }
        else if (curVarType == "caller") {
          artCallers[numartcallers].vname = shortenString(artCallers[numartcallers].vname);
        }
      }
      else if (stage == 1) {
        if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
          artVars[numartvars].vval = shortenString(artVars[numartvars].vval);
        }
        if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par2 = shortenString(artShapes[numartshapes].par2);
        }
        if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/" || curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
          artEquations[numartequations].vinput1 = shortenString(artEquations[numartequations].vinput1);
        }
        else if (curVarType == "if") {
          artIfs[numartifs].par2 = shortenString(artIfs[numartifs].par2);
        }
      }
      else if (stage == 2) {
        if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par3 = shortenString(artShapes[numartshapes].par3);
        }
        if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/" || curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
          artEquations[numartequations].vinput2 = shortenString(artEquations[numartequations].vinput2);
        }
      }
      else if (stage == 3) {
        if (curVarType == "rect" || curVarType == "point" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
          artShapes[numartshapes].par4 = shortenString(artShapes[numartshapes].par4);
        }
      }
      else if (stage == 4) {
        if (curVarType == "triangle") {
          artShapes[numartshapes].par5 = shortenString(artShapes[numartshapes].par5);
        }
      }
      else if (stage == 5) {
        if (curVarType == "triangle") {
          artShapes[numartshapes].par6 = shortenString(artShapes[numartshapes].par6);
        }
      }
    }
    else if (keyCode == RETURN || keyCode == ENTER) {
      if (stage == 0) {
        stage = 1;
        if (curVarType == "NPFunct") {
          stage = -1;
          isWriting = false;
          numartfuncts+=1;
          numartEOFfuncts+=1;
        }
        if (curVarType == "caller") {
          stage = -1;
          isWriting = false;
          numartcallers+=1;
        }
      }
      else if (stage == 1) {
        if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
            stage = 2;
        }
        if (curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
          stage = -1;
          isWriting = false;
          numartvars+=1;
        }
        if (curVarType == "rect" || curVarType == "line" || curVarType == "ellipse" || curVarType == "triangle") {
            stage = 2;
        }  
        if (curVarType == "point") {
          stage = -1;
          isWriting = false;
          numartshapes+=1;
        }
        if (curVarType == "if") {
          stage = -1;
          isWriting = false;
          numartifs+=1;
          numartEOFifs+=1;
        }
        if (curVarType == "while") {
          stage = -1;
          isWriting = false;
          numartwhiles+=1;
          numartEOFwhiles+=1;
        }
        else if (allowable() == true) {
          Debugger1 = "";
          Debugger2 = "";
          if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
            stage = -1;
            isWriting = false;
            numartvars+=1;
          }
          println("Something created! " + allowAppending + " " + stage);
        }
        else {
          if (artVars[numartvars].vtype == "String") {
            Debugger1 = "Strings may only have alphanumeric characters!";
          }
          if (artVars[numartvars].vtype == "int") {
            Debugger1 = "Ints must be positive or negative WHOLE NUMBERS!";
          }
          if (artVars[numartvars].vtype == "float") {
            Debugger1 = "Floats must be decimals!";
          }
          if (artVars[numartvars].vtype == "char") {
            Debugger1 = "Chars must be single alphanumeric characters!";
          }
          Debugger2 = "Also, make sure no variables have the same name.";
        }
      }
      else if (stage == 2) {
        if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
          stage = -1;
          isWriting = false;
          numartequations+=1;
          allowAppending = false;
        }
        else {
          stage = 3;
        }
      }
      else if (stage == 3) {
        if (allowable() == true) {
          stage = 4;
          Debugger1 = "";
          Debugger2 = "";
          if (curVarType == "rect" || curVarType == "line" || curVarType == "ellipse") {
            stage = -1;
            isWriting = false;
            numartshapes+=1;
            allowAppending = false;
          }
          println("Something created! " + allowAppending + " " + stage);
        }
        else {
            Debugger1 = "Shapes may only use ints, or variables that represent ints!";
        }
      }
     else if (stage == 4) {
       stage = 5;
      }
     else if (stage == 5) {
       if (curVarType == "triangle") {
         stage = -1;
         isWriting = false;
         numartshapes+=1;
         allowAppending = false;
       }
     }
   }
  }
}



boolean allowable() {
     if (artVars[numartvars].vtype == "String") {
      //"Strings may only have alphanumeric characters!";
      }
      else if (artVars[numartvars].vtype == "int") {
      //"Ints must be positive or negative WHOLE NUMBERS!";
        for (int i = 0;i<artVars[numartvars].vval.length();i++) {
          char zzz = artVars[numartvars].vval.charAt(i);
          if (zzz != '9' && zzz != '8' && zzz != '7' && zzz != '6' && zzz != '5' && zzz != '4' && zzz != '3' && zzz != '2' && zzz != '1' && zzz != '0') {
            return false;
          }
        }
      }
      //"Shapes may only use ints!
      else if (artVars[numartvars].vtype == "float") {
      //"Floats must be decimals!";
      }
      else if (artVars[numartvars].vtype == "char") {
     //"Chars must be single alphanumeric characters!";
      }
      //Will un-comment when I can think of a better way to implement!
//      for(int i = 0;i<numartvars;i++) {
//        //no same-names!
//        for (int i2 = 0;i2<numartvars;i++) {
//          if ((i!=i2) && artVars[i].vname==artVars[i2].vname) {
//            return false;
//          }
//        }
//      }
//Better-made later.
//     for (int i = 0;i<artShapes[numartshapes].par1.length();i++) {
//        char zzz = artShapes[numartshapes].par1.charAt(i);
//        if (zzz != '9' && zzz != '8' && zzz != '7' && zzz != '6' && zzz != '5' && zzz != '4' && zzz != '3' && zzz != '2' && zzz != '1' && zzz != '0') {
//          return false;
//        }
//      }
//     for (int i = 0;i<artShapes[numartshapes].par2.length();i++) {
//        char zzz = artShapes[numartshapes].par3.charAt(i);
//        if (zzz != '9' && zzz != '8' && zzz != '7' && zzz != '6' && zzz != '5' && zzz != '4' && zzz != '3' && zzz != '2' && zzz != '1' && zzz != '0') {
//          return false;
//        }
//      }
//      for (int i = 0;i<artShapes[numartshapes].par3.length();i++) {
//        char zzz = artShapes[numartshapes].par3.charAt(i);
//        if (zzz != '9' && zzz != '8' && zzz != '7' && zzz != '6' && zzz != '5' && zzz != '4' && zzz != '3' && zzz != '2' && zzz != '1' && zzz != '0') {
//          return false;
//        }
//      }
//      for (int i = 0;i<artShapes[numartshapes].par4.length();i++) {
//        char zzz = artShapes[numartshapes].par4.charAt(i);
//        if (zzz != '9' && zzz != '8' && zzz != '7' && zzz != '6' && zzz != '5' && zzz != '4' && zzz != '3' && zzz != '2' && zzz != '1' && zzz != '0') {
//          return false;
//        }
//      }
      return true;
}

void displayInfo() {
  if (curVarType == "int") {
    t1 = "You are creating an integer variable.";
    t2 = "Correct syntax for this is: int name = value;";
    t3 = "Integer variables may only take +/- whole numbers.";
    zClicker = "";
  }
  else if (curVarType == "boolean") {
    t1 = "You are creating an boolean variable.";
    t2 = "Correct syntax for this is: boolean name = value;";
    t3 = "Booleans may only the values 'true' or 'false'.";
    zClicker = "";
  }
  else if (curVarType == "String") {
    t1 = "You are creating an String variable.";
    t2 = "Correct syntax for this is: String name = \"value\";";
    t3 = "Strings can take any value.";
    zClicker = "They are most commonly used as words.";
  }
  //other variables here
  else if (curVarType == "rect") {
    t1 = "You are creating a rectangle.";
    t2 = "Correct syntax for this is: rect(x,y,width,height);";
    t3 = "Tip: Click the 'more' button in shapes,";
    zClicker = "and then click 'colors'.";
  }
  else if (curVarType == "ellipse") {
    t1 = "You are creating an ellipse (circle/oval).";
    t2 = "Correct syntax for this is: ellipse(x,y,radiusx,radiusy);";
    t3 = "Tip: Unlike rectangles, which are drawn from corners,";
    zClicker = "elipses are drawn from their center.";
  }
  else if (curVarType == "line") {
    t1 = "You are creating a line.";
    t2 = "Correct syntax for this is: line(startx,starty,endx,endy);";
    t3 = "Tip: stroke(); is needed for lines, not fill();";
    zClicker = "";
  }
  else if (curVarType == "triangle") {
    t1 = "You are creating a triangle.";
    t2 = "Correct syntax for this is: triangle(x1,y1,x2,y2,x3,y3);";
    t3 = "Tip: Triangles can be used to make complex";
    zClicker = "*cough*3D*cough* shapes!";
  }
  else if (curVarType == "point") {
    t1 = "You are creating a point.";
    t2 = "Correct syntax for this is: point(posx,posy);";
    t3 = "Tip: Like lines, points run on stroke();";
    zClicker = "";
  }
  else if (curVarType == "+=") {
    t1 = "You are adding a variable, and then changing the value of the variable.";
    t2 = "Correct syntax for this is: varname += thing1;";
    t3 = "Tip: If you add something to a string, it";
    zClicker = "sticks whatever was added at the end of itself.";
  }
  else if (curVarType == "-=") {
    t1 = "You are subtracting from a variable, and then changing the value";
    t2 = "of the variable.  Correct syntax for this is: varname -= thing1";
    t3 = "Tip: Remember what you learned in school: thing1 - thing2";
    zClicker = "isn't the same as thing2 - thing1";
  }
  else if (curVarType == "*=") {
    t1 = "You are multiplying a variable, and then changing the value of the variable.";
    t2 = "Correct syntax for this is: varname *= thing1";
    t3 = "Tip: Remember PEMDAS: Muliplication happens";
    zClicker = "before addition/subtraction";
  }
  else if (curVarType == "/=") {
    t1 = "You are dividing a variable, and then changing the value of the variable.";
    t2 = "Correct syntax for this is: varname /= thing1";
    t3 = "Tip: Division often results in fractions, but ints can't";
    zClicker = "hold fractions, so it chops of stuff past the decimal point.";
  }
  else if (curVarType == "+") {
    t1 = "You are adding things together";
    t2 = "Correct syntax for this is: varname = thing1 + thing2;";
    t3 = "Tip: If you add something to a string, it";
    zClicker = "sticks whatever was added at the end of itself.";
  }
  else if (curVarType == "-") {
    t1 = "You are subtracting things.";
    t2 = "Correct syntax for this is: varname = thing1 - thing2;";
    t3 = "Tip: Remember what you learned in school: thing1 - thing2";
    zClicker = "isn't the same as thing2 - thing1";
  }
  else if (curVarType == "*") {
    t1 = "You are multiplying things.";
    t2 = "Correct syntax for this is: varname = thing1 * thing2;";
    t3 = "Tip: Remember PEMDAS: Muliplication happens";
    zClicker = "before addition/subtraction";
  }
  else if (curVarType == "/") {
    t1 = "You are dividing things.";
    t2 = "Correct syntax for this is: varname = thing1 / thing2;";
    t3 = "Tip: Division often results in fractions, but ints can't";
    zClicker = "hold fractions, so it chops of stuff past the decimal point.";
  }
  else if (curVarType == "if") {
    t1 = "If statements are the building blocks of advanced code.";
    t2 = "Correct syntax for this is: if(condition) {code}";
    t3 = "Tip: When using statements and loops, you use ==";
    zClicker = "to see if something is equal, not '='";
  }
  else {
   t1 = "Welcome to the TeachProcesisng Interpreter, v0.7";
   t2 = "Experiment with the buttons to get great results!";
   t3 = "Coming soon: The Loop Update (v1.0)";
   zClicker = "Coming later: The Statement Update (v1.1)"; 
  }
}

void shiftLineUp(int linenum) {
  //println(artShapes[0].line + "========================================================================================shiftLineUp");
  linenum+=1;
  //for (int i = 0;i<total;i++) {
    for (int i2 = 0;i2<total;i2++) {
      if (artVars[i2].line >= linenum) {
        artVars[i2].line++;
      }
      if (artShapes[i2].line >= linenum) {
        artShapes[i2].line++;
      }
      if (artEquations[i2].line >= linenum) {
        artEquations[i2].line++;
      }
      if (artIfs[i2].line >= linenum) {
        artIfs[i2].line++;
      }
      if (artEOFifs[i2].line >= linenum) {
        artEOFifs[i2].line++;
      }
    }
  //}
  //println(artShapes[0].line + "========================================================================================shiftLineUpEnd");
}

void shiftLineDown(int linenum) {
  //for (int i = 0;i<total;i++) {
    for (int i2 = 0;i2<total;i2++) {
      if (artVars[i2].line >= linenum) {
        artVars[i2].line--;
      }
      if (artShapes[i2].line >= linenum) {
        artShapes[i2].line--;
      }
      if (artEquations[i2].line >= linenum) {
        artEquations[i2].line--;
      }
      if (artIfs[i2].line >= linenum) {
        artIfs[i2].line--;
      }
      if (artEOFifs[i2].line >= linenum) {
        artEOFifs[i2].line--;
      }
    }
  //}
}
void addFunct(String typeOf) {
  if (typeOf.equals("")) {
    curVarType = "NPFunct";
    //Else, StrFunct/intFunct/floatFunct/etc
  }
  artFuncts[numartfuncts].vpartype = "";
  artFuncts[numartfuncts].vpar = "";
  artFuncts[numartfuncts].line = lineat;
  artFuncts[numartfuncts].id = numartfuncts;
  lineat += 2;
  shiftLineUp(artFuncts[numartfuncts].line);
  shiftLineUp(artFuncts[numartfuncts].line);
  shiftLineUp(artFuncts[numartfuncts].line);
  addE0Ffunct("}");
  isWriting = true;
  lineat = artFuncts[numartfuncts].line+1;
}

void addCaller() {
  curVarType = "caller";
  artCallers[numartcallers].line = lineat;
  artCallers[numartcallers].type = "caller";
  shiftLineUp(artCallers[numartfuncts].line);
  lineat+=1;
  isWriting = true;
}

void addE0Ffunct(String typeOf) {
  if (typeOf == "}") {
    //Line 3 below statement/loop becomes a }
    artEOFfuncts[numartEOFfuncts].vtype = "}";
    artEOFfuncts[numartEOFfuncts].line = lineat;
  }
}


void addIf(String typeOf) {
    curVarType = "if";
    artIfs[numartifs].vtype = "if";
    artIfs[numartifs].line = lineat;
    lineat += 2;
    shiftLineUp(artIfs[numartifs].line);
    shiftLineUp(artIfs[numartifs].line);
    shiftLineUp(artIfs[numartifs].line);
    addE0Fif("}");
    isWriting = true;
    artIfs[numartifs].compare = typeOf;
    lineat = artIfs[numartifs].line+1;
    //Correct line right now!
}

void addE0Fif(String typeOf) {
  if (typeOf == "}") {
    //Line 3 below statement/loop becomes a }
    artEOFifs[numartEOFifs].vtype = "}";
    artEOFifs[numartEOFifs].line = lineat;
  }
}

void addWhile(String typeOf) {
  curVarType = "while";
  artWhiles[numartwhiles].vtype = "while";
  artWhiles[numartwhiles].line = lineat;
  lineat += 2;
  shiftLineUp(artWhiles[numartwhiles].line);
  shiftLineUp(artWhiles[numartwhiles].line);
  shiftLineUp(artWhiles[numartwhiles].line);
  addE0Fwhile("}");
  isWriting = true;
  artWhiles[numartwhiles].compare = typeOf;
  lineat = artWhiles[numartwhiles].line+1;
}

void addE0Fwhile(String typeOf) {
  if (typeOf == "}") {
    //Line 3 below statement/loop becomes a }
    artEOFwhiles[numartEOFwhiles].vtype = "}";
    artEOFwhiles[numartEOFwhiles].line = lineat;
  }
}


void showStatements() {
  //Clear here!  Plus, error must be where rect is made...
  //println(artShapes[0].line + "========================================================================================ShowStatements");
  pushMatrix();
    translate(0,((lineat-1)*16));
    if (curVarType == "NPFunct") {
      if (isWriting == true) {
        fill(0,0,255);
        text("void",10,316);
        if (stage == 0) {
          fill(255);
          rect(52,301,30,16);
        }
        fill(0);
        text(artFuncts[numartfuncts].vname,52,316);
        text("()",82,316);
        text(" {",145,316);
        text("}",11,348);
      }
    }
    if (curVarType == "caller") {
      //println("Drawin'");
      if (isWriting == true) {
        if (stage == 0) {
          fill(255);
          rect(10,301,50,16);
        }
        fill(0,0,255);
        text(artCallers[numartcallers].vname,11,316);
        fill(0);
        text("();",61,316);
        //Today, add keypresseds
      }
    }
    if (curVarType == "while") {
      //println("Delaware eludes us! " + stage);
      if (isWriting == true) {
        fill(200,200,0);
        text(curVarType + "(",10,316);
        if (stage == 0) {
          fill(255);
          rect(50,301,30,16);
        }
        fill(0);
        text(artWhiles[numartwhiles].par1,52,316);
        text(artWhiles[numartwhiles].compare,84,316);
        if (stage == 1) {
          fill(255);
          rect(155,301,30,16);
        }
        fill(0);
        text(artWhiles[numartwhiles].par2,107,316);
        fill(200,200,0);
        text(")",138,316);
        fill(0);
        text(" {",145,316);
        text("}",11,348);
      }
    }
    if (curVarType == "if") {
      //println("Comin' to Delaware! " + stage);
      if (isWriting == true) {
        fill(200,200,0);
        text(curVarType + "(",10,316);
        if (stage == 0) {
          fill(255);
          rect(50,301,30,16);
        }
        fill(0);
        text(artIfs[numartifs].par1,52,316);
        text(artIfs[numartifs].compare,84,316);
        if (stage == 1) {
          fill(255);
          rect(105,301,30,16);
        }
        fill(0);
        text(artIfs[numartifs].par2,107,316);
        fill(200,200,0);
        text(")",138,316);
        fill(0);
        text(" {",145,316);
        text("}",11,348);
      }
    }
    if (curVarType == "while") {
      //println("Delaware eludes us! " + stage);
      if (isWriting == true) {
        fill(200,200,0);
        text(curVarType + "(",10,316);
        if (stage == 0) {
          fill(255);
          rect(50,301,30,16);
        }
        fill(0);
        text(artWhiles[numartwhiles].par1,52,316);
        text(artWhiles[numartwhiles].compare,84,316);
        if (stage == 1) {
          fill(255);
          rect(105,301,30,16);
        }
        fill(0);
        text(artWhiles[numartwhiles].par2,107,316);
        fill(200,200,0);
        text(")",138,316);
        fill(0);
        text(" {",145,316);
        text("}",11,348);
      }
    }
  popMatrix();
}

void showOtherStatements() {
//  //println("Where is Delaware?");
  for (int i = 0;i<numartfuncts;i++) {
    if (artFuncts[i].vpartype == "") {
      pushMatrix();
        translate(0,artFuncts[i].line*16);
        fill(0,0,255);
        text("void",10,316);
        fill(0);
        text(artFuncts[i].vname + "()",52,316);
        text(" {",145,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartcallers;i++) {
    if (artCallers[i].type.equals("caller")) {
      pushMatrix();
        translate(0,artCallers[i].line*16);
        fill(0,0,255);
        text(artCallers[i].vname + "();",10,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartifs;i++) {
    //println("Delaware is past these is mountains.");
    if (artIfs[i].vtype == "if") {
      //println("Almost there!");
      pushMatrix();
        translate(0,artIfs[i].line*16);
        fill(200,200,0);
        text("if(",10,316);
        fill(0);
        text(artIfs[i].par1 + " " + artIfs[i].compare + " " + artIfs[i].par2 + ") {",25,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartwhiles;i++) {
    //println("Delaware is past these is mountains.");
    if (artWhiles[i].vtype == "while") {
      //println("Almost there!");
      pushMatrix();
        translate(0,artWhiles[i].line*16);
        fill(200,200,0);
        text("while(",10,316);
        fill(0);
        text(artWhiles[i].par1 + " " + artWhiles[i].compare + " " + artWhiles[i].par2 + ") {",50,316);
        //println(artWhiles[i].par1 + " " + artWhiles[i].compare + " " + artWhiles[i].par2 + ") {");
      popMatrix();
    }
  }
  for (int i = 0;i<numartEOFfuncts;i++) {
    //println("Where is Delaware?");
    if (artEOFfuncts[i].vtype == "}") {
      pushMatrix();
        translate(0,artEOFfuncts[i].line*16);
        fill(0);
        text("}",10,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartEOFifs;i++) {
    //println("Where is Delaware?");
    if (artEOFifs[i].vtype == "}") {
      pushMatrix();
        translate(0,artEOFifs[i].line*16);
        fill(0);
        text("}",10,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartEOFwhiles;i++) {
    //println("Where is Delaware?");
    if (artEOFwhiles[i].vtype == "}") {
      pushMatrix();
        translate(0,artEOFwhiles[i].line*16);
        fill(0);
        text("}",10,316);
      popMatrix();
    }
  }
}
String curVarType = "";
boolean isWriting = false;
int lineat = 1;



void addVarBox(String typeOf) {
    curVarType = typeOf;
    artVars[numartvars] = new artVar(typeOf,"","");
    artVars[numartvars].line = lineat;
    lineat+=1;
    shiftLineUp(artVars[numartvars].line);
    isWriting = true;
}

void addShapeBox(String typeOf) {
  //Error clear here
  //Error happens inbetween box declaration and box drawing!
  println("lineat at start: " + lineat);
   curVarType = typeOf;
   artShapes[numartshapes] = new artShape(typeOf);
   artShapes[numartshapes].line = lineat;
   //println(artShapes[0].line + "========================================================================================addShapeBox");
   lineat+=1;
   shiftLineUp(artShapes[numartshapes].line);
   isWriting = true;
   //println(artShapes[0].line + "========================================================================================addShapeBoxEnd");
}

void addEquationBox(String typeOf) {
  curVarType = typeOf;
  artEquations[numartequations] = new artEquation("",typeOf,"","");
  artEquations[numartequations].line = lineat;
  lineat+=1;
  shiftLineUp(artEquations[numartequations].line);
  isWriting = true;
}

void showBoxes() {
  //println(artShapes[0].line + "========================================================================================ShowBoxes");
  pushMatrix();
    //translate(0,((artVars[numartvars].line+artShapes[numartshapes].line+artEquations[numartequations].line+artIfs[numartifs].line+artEOFifs[numartEOFifs].line)*16)+64);
    //println("trans to (0," + ((artVars[numartvars].line+artShapes[numartshapes].line+artEquations[numartequations].line)*16)+32 + ")");
    translate(0,(lineat-1)*16);
    if (curVarType == "String" || curVarType == "char" || curVarType == "int" || curVarType == "float" || curVarType == "boolean") {
      if (isWriting == true) {
        fill(0,255,0);
        text(curVarType,10,316);
        fill(255);
        if (stage == 0) {
          //println("rect!");
          rect(50,301,100,16);
        }
        fill(0);
        text(artVars[numartvars].vname,52,316);
        if (stage == 1) {
          fill(255);
          rect(170,301,100,16);
        }
        fill(0);
        if (curVarType == "String") {
          text("= \"  " + artVars[numartvars].vval,150,316);
          text(" \" ",271,316);
        }
        else {
          text("=    " + artVars[numartvars].vval,150,316);
        }
      }
    }
    else if (curVarType == "rect" || curVarType == "line" || curVarType == "ellipse") {
      //println("Your rect is at line: " + artShapes[0].line);
      //Error happens BEFORE boxes are drawn
      if (isWriting == true) {
        fill(255,0,0);
        text(curVarType + "(",10,316);
        fill(255);
        if (stage == 0) {
          rect(50,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par1,52,316);
        text(" ,",100,316);
        fill(255);
        if (stage == 1) {
          rect(115,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par2,117,316);
        text(" ,",165,316);
        fill(255);
        if (stage == 2) {
          rect(180,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par3,182,316);
        text(" ,",230,316);
        fill(255);
        if (stage == 3) {
          rect(245,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par4,247,316);
        fill(255,0,0);
        text(");",296,316);
      }
    }
    else if (curVarType == "point") {
      if (isWriting == true) {
        fill(255,0,0);
        text(curVarType + "(",10,316);
        fill(255);
        if (stage == 0) {
          rect(50,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par1,52,316);
        text(" ,",100,316);
        fill(255);
        if (stage == 1) {
          rect(115,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par2,117,316);
        fill(255,0,0);
        text(");",296,316);
      }
    }
    else if (curVarType == "triangle") {
      if (isWriting == true) {
        fill(255,0,0);
        text(curVarType + "(",10,316);
        fill(255);
        if (stage == 0) {
          rect(65,301,50,16);
        }
        fill(0);
        text(artShapes[numartshapes].par1,65,316);
        text(" ,",120,316);
        fill(255);
        if (stage == 1) {
          rect(130,301,40,16);
        }
        fill(0);
        text(artShapes[numartshapes].par2,132,316);
        text(" ,",180,316);
        fill(255);
        if (stage == 2) {
          rect(190,301,40,16);
        }
        fill(0);
        text(artShapes[numartshapes].par3,189,316);
        text(" ,",240,316);
        fill(255);
        if (stage == 3) {
          rect(247,301,40,16);
        }
        fill(0);
        text(artShapes[numartshapes].par4,248,316);
        text(" ,",295,316);
        fill(255);
        if (stage == 4) {
          rect(305,301,40,16);
        }
        fill(0);
        text(artShapes[numartshapes].par5,305,316);
        text(" ,",350,316);
        fill(255);
        if (stage == 5) {
          rect(360,301,30,16);
        }
        fill(0);
        text(" " + artShapes[numartshapes].par6,355,316);
        fill(255,0,0);
        text(");",387,316); 
      }
    }
    else if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
      if (isWriting == true) {
        //println("Stage: " + stage);
        if (stage == 0) {
          //println("RECT!");
          fill(255);
          rect(11,301,50,16);
        }
        fill(0);
        //println(artEquations[numartequations].voutput);
        text(artEquations[numartequations].voutput,16,316);
        text("=",63,316);
        if (stage == 1) {
          fill(255);
          rect(73,301,50,16);
        }
        fill(0);
        text(artEquations[numartequations].vinput1,73,316);
        text(curVarType,125,316);
        if (stage == 2) {
          fill(255);
          rect(135,301,50,16);
        }
        fill(0);
        text(artEquations[numartequations].vinput2,135,316);
        text(";",185,316);
      }
    }
    else if (curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
      if (isWriting == true) {
        //println("Stage: " + stage);
        if (stage == 0) {
          //println("RECT!");
          fill(255);
          rect(11,301,50,16);
        }
        fill(0);
        //println(artEquations[numartequations].voutput);
        text(artEquations[numartequations].voutput,16,316);
        text(artEquations[numartequations].vtype,63,316);
        if (stage == 1) {
          fill(255);
          rect(83,301,50,16);
        }
        fill(0);
        text(artEquations[numartequations].vinput1,84,316);
        text(";",135,316);
      }
    }
  popMatrix();
}

void showOthers() {
  //Clear...  PLUS, error must be lower down in draw loop because of the render!!!!!
  //println(artShapes[0].line + "========================================================================================ShowOthers");
  for (int i = 0;i<numartvars;i++) {
    if (artVars[i].vtype == "String") {
      pushMatrix();
        translate(0,artVars[i].line*16);
        fill(0,255,0);
        text(artVars[i].vtype,10,316);
        fill(0);
        text(artVars[i].vname + " = \"" + artVars[i].vval + "\"" + ";",70,316);
      popMatrix();
    }
    else if (artVars[i].vtype == "char") {
      pushMatrix();
        translate(0,artVars[i].line*16);
        fill(0,255,0);
        text(artVars[i].vtype,10,316);
        fill(0);
        text(artVars[i].vname + " = '" + artVars[i].vval + "'" + ";",70,316);
      popMatrix();
    }
    else { 
     pushMatrix();
        translate(0,artVars[i].line*16);
        fill(0,255,0);
        text(artVars[i].vtype,10,316);
        fill(0);
        text(artVars[i].vname + " = " + artVars[i].vval + ";",70,316);
      popMatrix(); 
    }
  }
  for (int i = 0;i<numartshapes;i++) {
    if (artShapes[i].vtype == "rect") {
      pushMatrix();
        translate(0,artShapes[i].line*16);
        //artShapes[i].line = lineat-1;
        //println(artShapes[i].line + "========================================================================================");
        fill(255,0,0);
        text(artShapes[i].vtype,10,316);
        fill(0);
        text("(" + artShapes[i].par1 + "," + artShapes[i].par2  + "," + artShapes[i].par3 + "," + artShapes[i].par4 + ");",70,316);
      popMatrix();
    }
    else if (artShapes[i].vtype == "ellipse") {
      pushMatrix();
        translate(0,artShapes[i].line*16);
        fill(255,0,0);
        text(artShapes[i].vtype,10,316);
        fill(0);
        text("(" + artShapes[i].par1 + "," + artShapes[i].par2  + "," + artShapes[i].par3 + "," + artShapes[i].par4 + ");",70,316);
      popMatrix();
    }
    else if (artShapes[i].vtype == "line") {
      pushMatrix();
        translate(0,artShapes[i].line*16);
        fill(255,0,0);
        text(artShapes[i].vtype,10,316);
        fill(0);
        text("(" + artShapes[i].par1 + "," + artShapes[i].par2  + "," + artShapes[i].par3 + "," + artShapes[i].par4 + ");",70,316);
      popMatrix();
    }
    else if (artShapes[i].vtype == "triangle") {
      pushMatrix();
        translate(0,artShapes[i].line*16);
        fill(255,0,0);
        text(artShapes[i].vtype,10,316);
        fill(0);
        text("(" + artShapes[i].par1 + "," + artShapes[i].par2  + "," + artShapes[i].par3 + "," + artShapes[i].par4 + "," + artShapes[i].par5 + "," + artShapes[i].par6 + ");",70,316);
      popMatrix();
    }
    else if (artShapes[i].vtype == "point") {
      pushMatrix();
        translate(0,artShapes[i].line*16);
        fill(255,0,0);
        text(artShapes[i].vtype,10,316);
        fill(0);
        text("(" + artShapes[i].par1 + "," + artShapes[i].par2 + ");",70,316);
      popMatrix();
    }
  }
  for (int i = 0;i<numartequations;i++) {
    if (curVarType == "+" || curVarType == "-" || curVarType == "*" || curVarType == "/") {
      pushMatrix();
        translate(0,artEquations[i].line*16);
        fill(0,0,255);
        text(artEquations[i].voutput + " = ",10,316);
        fill(0);
        text(artEquations[i].vinput1 + " " + artEquations[i].vtype + " " + artEquations[i].vinput2 + ";",50,316);
      popMatrix();
    }
    if (curVarType == "+=" || curVarType == "-=" || curVarType == "*=" || curVarType == "/=") {
      pushMatrix();
        translate(0,artEquations[i].line*16);
        fill(0,0,255);
        text(artEquations[i].voutput + shortenString(artEquations[i].vtype),10,316);
        fill(0);
        text(artEquations[i].vinput1 + ";",50,316);
      popMatrix();
    }
  }
}
//All code I made to make my life easier
double EIGHTH_PI = PI/8;
double SIXTEENTH_PI = PI/16;
boolean Bvar1 = false;
int Bvar2;

void Brotate(float var1,float var2,float var3) {
  translate(var2,var3);
  rotate(var1);
}

void startTimer() {
  if (Bvar1 == false) {
    Bvar2 = millis();
    Bvar1 = true;
  }
}

String Timer(int var1) {
  if (int((millis()-Bvar2)/1000)==int(var1/1000)) {
    Bvar1 = false;
    return "Complete!";
  }
  else {
    return "Incomplete!";
  }
}

String shortenString(String var1) {
  char[] var2 = new char[var1.length()+1];
  for(int i = 0;i<var1.length();i++) {
    var2[i] = var1.charAt(i);
    println(var2[i]);
  }
  String var3 = "";
  for(int i = 0;i<var1.length()-1;i++) {
    var3 += var2[i];
  }
  println("Var3 is " + var3);
  return var3;
}

int intify(String var1) {
  int var2 = var1.length(); //length
  int var5 = 0; //result
  int var3 = 1; //multiplier
  int var6 = var2-1; //loop variable
  int var4 = 0; //value of single char
  if (var6 < 0) {
    return 0;
  }
  do {
   var4 = int(var1.charAt(var6)) - 48;
    if (var4>9||var4<0) {
      //Error!!
    }
    else {
      var5 += (var3*var4);
    }
    var3*=10;
   var6--;
  }
  while(var6>=0);
  return var5;
}
class Button {
  float BPX;
  float BPY;
  float BSX;
  float BSY;
  boolean isActive;
  String Name;
  Button(float px,float py,float sx,float sy,boolean act,String name) {
    BPX = px;
    BPY = py;
    BSX = sx;
    BSY = sy;
    isActive = act;
    Name = name;
  }
  
  void render() {
    if (isActive == true) {
      fill(0,0,255);
      rect(BPX,BPY,BSX,BSY);
      fill(0);
      text(Name,BPX,BPY+BSY/2+8);
    }
  }
  
  boolean isClicked() {
    if (mouseX > BPX && mouseX < BPX+BSX && mouseY > BPY && mouseY < BPY+BSY && mousePressed == true) {
      mousePressed = false;
      return true;
    }
    return false;
  }
}
class artFunct {
  int line = -1;
  String vname = "";
  String vpartype = "";
  String vpar = "";
  int id = -1;
  artFunct(String n) {
    vname = n;
  }
  artFunct(String n,String partype,String par) {
    vname = n;
    vpartype = partype;
    par = par;
  }
}

class artCaller {
  String vname = "";
  String type = "";
  int line = -1;
  int id = -1;
  artCaller() {
  }
}
class artEOFfunct {
  String vtype = "";
  int line = -1;
  artEOFfunct() {
    vtype = "}";
  }
}

class artIf {
 int line = -1;
 String par1 = "";
 String par2 = "";
 String compare = "==";
 String vtype = "";
 artIf(String p1,String p2) {
   par1 = p1;
   par2 = p2;
 }
}
class artEOFif {
  String vtype = "";
  int line = -1;
  artEOFif() {
    vtype = "}";
  }
}

class artWhile {
 int line = -1;
 String par1 = "";
 String par2 = "";
 String compare = "==";
 String vtype = "";
 artWhile(String p1,String p2) {
   par1 = p1;
   par2 = p2;
 }
}
class artEOFwhile {
  String vtype = "";
  int line = -1;
  artEOFwhile() {
    vtype = "}";
  }
}
class artVar {
  int line = -1;
  String vtype;
  String vname;
  String vval;
  artVar(String t,String n,String v) {
    vtype = t;
    vname = n;
    vval = v;
  }
  String getType() {
    return vtype;
  }
  
  void delete(int num) {
    line = -10000;
    vtype = "";
    vname = "";
    vval = "";
    numartvars-=1;
  }
}
class artShape {
  int line = -1;
  String vtype = "";
  String par1 = "0";
  String par2 = "0";
  String par3 = "0";
  String par4 = "0";
  String par5 = "0";
  String par6 = "0";
  artShape(String t) {
    vtype = t;
  }
  String getType() {
    return vtype;
  }
  
  void delete(int num) {
    line = -10000;
    par1 = "";
    par2 = "";
    par3 = "";
    par4 = "";
    numartshapes-=1;
  }
}

class artEquation {
  int line = -1;
  String voutput = "";
  String vtype = "";
  String vinput1 = "";
  String vinput2 = "";
  artEquation(String toutput,String t,String tinput1,String tinput2) {
    voutput = toutput;
    vtype = t;
    vinput1 = tinput1;
    vinput2 = tinput2;
  }
  
  String getType() {
    return vtype;
  }
  
  void delete(int num) {
    line = -10000;
    voutput = "";
    vtype = "";
    vinput1 = "";
    vinput2 = "";
    numartshapes-=1;
  }
}

void drawShapes(int i) {
  String holdin1 = systemShapes[i].spar1;
  String holdin2 = systemShapes[i].spar2;
  String holdin3 = systemShapes[i].spar3;
  String holdin4 = systemShapes[i].spar4;
  String holdin5 = systemShapes[i].spar5;
  String holdin6 = systemShapes[i].spar6;
    if(systemShapes[i].stype == "rect") {
      pushMatrix();
        translate(10,100);
        println("drawing");
        fill(255);
        stroke(0);
//        println("(" + i + ".1)->" + systemShapes[i].spar1);
//        println("(" + i + ".2)->" + systemShapes[i].spar2);
//        println("(" + i + ".3)->" + systemShapes[i].spar3);
//        println("(" + i + ".4)->" + systemShapes[i].spar4);
        for (int i2 = 0;i2<totalnumvars;i2++) {
          //println(" (" + i2 + ")->" + systemVars[i2].sname + " = " + systemVars[i2].sval);
          if (systemShapes[i].spar1.equals(systemVars[i2].sname)) {
            //println("Yes 1");
            holdin1 = systemVars[i2].sval;
          } else {
            holdin1 = systemShapes[i].spar1;
            //println("HUH? i=" + i + ", i2 = " + i2 + ": systemShapes[i].spar1 = " + systemShapes[i].spar1 + "(len = " + systemShapes[i].spar1.length() + "), systemVars[i2].sname = " + systemVars[i2].sname + "(len = " + systemVars[i2].sname.length() + ")");
          }
          if (systemShapes[i].spar2.equals(systemVars[i2].sname)) {
            //println("Yes 2");
            holdin2 = systemVars[i2].sval;
          } else {
            holdin2 = systemShapes[i].spar2;
          }
          if (systemShapes[i].spar3.equals(systemVars[i2].sname)) {
            //println("Yes 3");
            holdin3 = systemVars[i2].sval;
          } else {
            holdin3 = systemShapes[i].spar3;        
          }
          if (systemShapes[i].spar4.equals(systemVars[i2].sname)) {
            //println("Yes 4");
            holdin4 = systemVars[i2].sval;
          }
           else {
            holdin4 = systemShapes[i].spar4;
          }
        }
//        println("new(" + i + ".1)->" + systemShapes[i].spar1);
//        println("new(" + i + ".2)->" + systemShapes[i].spar2);
//        println("new(" + i + ".3)->" + systemShapes[i].spar3);
//        println("new(" + i + ".4)->" + systemShapes[i].spar4);
//        println(holdin1 + " " + holdin2 + " " + holdin3 + " " + holdin4);
          rect(intify(holdin1),intify(holdin2),intify(holdin3),intify(holdin4));
//        println("rect?: " + intify(systemShapes[i].spar1) + "," + intify(systemShapes[i].spar2) + "," + intify(systemShapes[i].spar3) + "," + intify(systemShapes[i].spar4));
      popMatrix();
  }
  else if(systemShapes[i].stype == "ellipse") {
      pushMatrix();
        translate(10,100);
        println("drawing");
        fill(255);
        stroke(0);
        for (int i2 = 0;i2<totalnumvars;i2++) {
          if (systemShapes[i].spar1.equals(systemVars[i2].sname)) {
            //println("Yes 1");
            holdin1 = systemVars[i2].sval;
          } else {
            holdin1 = systemShapes[i].spar1;
          }
          if (systemShapes[i].spar2.equals(systemVars[i2].sname)) {
            //println("Yes 2");
            holdin2 = systemVars[i2].sval;
          } else {
            holdin2 = systemShapes[i].spar2;
          }
          if (systemShapes[i].spar3.equals(systemVars[i2].sname)) {
            //println("Yes 3");
            holdin3 = systemVars[i2].sval;
          } else {
            holdin3 = systemShapes[i].spar3;        
          }
          if (systemShapes[i].spar4.equals(systemVars[i2].sname)) {
            //println("Yes 4");
            holdin4 = systemVars[i2].sval;
          }
           else {
            holdin4 = systemShapes[i].spar4;
          }
        }
          ellipse(intify(holdin1),intify(holdin2),intify(holdin3),intify(holdin4));
      popMatrix();
  }
  else if(systemShapes[i].stype == "line") {
      pushMatrix();
        translate(10,100);
        println("drawing");
        fill(255);
        stroke(0);
        for (int i2 = 0;i2<totalnumvars;i2++) {
          if (systemShapes[i].spar1.equals(systemVars[i2].sname)) {
            //println("Yes 1");
            holdin1 = systemVars[i2].sval;
          } else {
            holdin1 = systemShapes[i].spar1;
          }
          if (systemShapes[i].spar2.equals(systemVars[i2].sname)) {
            //println("Yes 2");
            holdin2 = systemVars[i2].sval;
          } else {
            holdin2 = systemShapes[i].spar2;
          }
          if (systemShapes[i].spar3.equals(systemVars[i2].sname)) {
            //println("Yes 3");
            holdin3 = systemVars[i2].sval;
          } else {
            holdin3 = systemShapes[i].spar3;        
          }
          if (systemShapes[i].spar4.equals(systemVars[i2].sname)) {
            //println("Yes 4");
            holdin4 = systemVars[i2].sval;
          }
           else {
            holdin4 = systemShapes[i].spar4;
          }
        }
          line(intify(holdin1),intify(holdin2),intify(holdin3),intify(holdin4));
      popMatrix();
  }
  else if(systemShapes[i].stype == "point") {
    pushMatrix();
        translate(10,100);
        println("drawing");
        fill(255);
        stroke(0);
        for (int i2 = 0;i2<totalnumvars;i2++) {
          if (systemShapes[i].spar1.equals(systemVars[i2].sname)) {
            //println("Yes 1");
            holdin1 = systemVars[i2].sval;
          } else {
            holdin1 = systemShapes[i].spar1;
          }
          if (systemShapes[i].spar2.equals(systemVars[i2].sname)) {
            //println("Yes 2");
            holdin2 = systemVars[i2].sval;
          } else {
            holdin2 = systemShapes[i].spar2;
          }
        }
          println("Point at: " + intify(holdin1) + "," + intify(holdin2));
          point(intify(holdin1),intify(holdin2));
      popMatrix();
  }
  else if(systemShapes[i].stype == "triangle") {
      pushMatrix();
        translate(10,100);
        println("drawing");
        fill(255);
        stroke(0);
        for (int i2 = 0;i2<totalnumvars;i2++) {
          if (systemShapes[i].spar1.equals(systemVars[i2].sname)) {
            //println("Yes 1");
            holdin1 = systemVars[i2].sval;
          } else {
            holdin1 = systemShapes[i].spar1;
          }
          if (systemShapes[i].spar2.equals(systemVars[i2].sname)) {
            //println("Yes 2");
            holdin2 = systemVars[i2].sval;
          } else {
            holdin2 = systemShapes[i].spar2;
          }
          if (systemShapes[i].spar3.equals(systemVars[i2].sname)) {
            //println("Yes 3");
            holdin3 = systemVars[i2].sval;
          } else {
            holdin3 = systemShapes[i].spar3;        
          }
          if (systemShapes[i].spar4.equals(systemVars[i2].sname)) {
            //println("Yes 4");
            holdin4 = systemVars[i2].sval;
          }
           else {
            holdin4 = systemShapes[i].spar4;
          }
          if (systemShapes[i].spar5.equals(systemVars[i2].sname)) {
            //println("Yes 5");
            holdin5 = systemVars[i2].sval;
          }
           else {
            holdin5 = systemShapes[i].spar5;
          }
          if (systemShapes[i].spar6.equals(systemVars[i2].sname)) {
            //println("Yes 6");
            holdin6 = systemVars[i2].sval;
          }
           else {
            holdin6 = systemShapes[i].spar6;
          }
        }
        //println("Triangle at: " + intify(holdin1) + "," + intify(holdin2) + "," + intify(holdin3) + "," + intify(holdin4) + "," + intify(holdin5) + "," + intify(holdin6));
        triangle(intify(holdin1),intify(holdin2),intify(holdin3),intify(holdin4),intify(holdin5),intify(holdin6));
      popMatrix();
  }
}
  


class systemVar {
  String stype = "";
  String sname = "";
  String sval = "";
  
  systemVar(String var1,String var2,String var3) {
    stype = var1;
    sname = var2;
    sval = var3;
  }
}

class systemShape {
  String stype = "";
  String spar1 = "";
  String spar2 = "";
  String spar3 = "";
  String spar4 = "";
  String spar5 = "";
  String spar6 = "";
  
  systemShape(String var1,String var2,String var3,String var4,String var5) {
    stype = trim(var1);
    spar1 = trim(var2);
    spar2 = trim(var3);
    spar3 = trim(var4);
    spar4 = trim(var5);
  }
  systemShape(String var1,String var2,String var3) {
    stype = trim(var1);
    spar1 = trim(var2);
    spar2 = trim(var3);
  }
  systemShape(String var1,String var2,String var3,String var4,String var5,String var6,String var7) {
    stype = trim(var1);
    spar1 = trim(var2);
    spar2 = trim(var3);
    spar3 = trim(var4);
    spar4 = trim(var5);
    spar5 = trim(var6);
    spar6 = trim(var7);
  }
}
boolean isRunning = false;
int rectat = 0;

void mousePressed() {
  highlighter = true;
}

void highlighter() {
  //println(mouseX + " " + mouseY);
  for (int i = 0;i<12;i++) {
    if(mouseY >= (i*16)+300 && mouseY <= (i*16)+316 && mouseX >= 10 && mouseX <= 390) {
      fill(255,0,0,75);
      rect(10,(i*16)+300,380,16);
      rectat = i;
    }
  }
}

int Bstage = 0;
void doButtonLayout() {
  if (Bstage == 0) {
    but[0].Name = "Variable";
    but[1].Name = "Shapes";
    but[2].Name = "Math";
    but[3].Name = "Statements";
    but[4].Name = "Advanced";
    if (but[0].isClicked() == true) {
      Bstage = 1;
    }
    if (but[1].isClicked() == true) {
      Bstage = 3;
    }
    if (but[2].isClicked() == true) {
      Bstage = 6;
    }
    if (but[3].isClicked() == true) {
      //Debugger1 = "Statements not implemented";
      Bstage = 11;
    }
    if (but[4].isClicked() == true) {
      //Debugger1 = "Advanced coding coming in the Translations update.";
      Bstage = 30;
    }
  }
  else if (Bstage == 1) {
    but[0].Name = "int";
    but[1].Name = "boolean";
    but[2].Name = "String";
    but[3].Name = "more";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addVarBox("int");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      Debugger1 = "Booleans not implemented";
      //addVarBox("boolean");
      //stage = 0;
    }
    if (but[2].isClicked() == true) {
      addVarBox("String");
      stage = 0;
    }
    if (but[3].isClicked() == true) {
      Debugger1 = "Chars and floats not implemented";
      //Bstage = 2;
    }
    if (but[4].isClicked() == true) {
      Bstage = 0;
    }
  }
  else if (Bstage == 2) {
    //Chars and floats
  }
  else if (Bstage == 3) {
    but[0].Name = "Rect";
    but[1].Name = "Line";
    but[2].Name = "Ellipse";
    but[3].Name = "more";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addShapeBox("rect");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      addShapeBox("line");
      stage = 0;
    }
    if (but[2].isClicked() == true) {
      addShapeBox("ellipse");
      stage = 0;
    }
    if (but[3].isClicked() == true) {
      //Debugger1 = "Points and triangles not implemented yet.";
      Bstage = 4;
    }
    if (but[4].isClicked() == true) {
      Bstage = 0;
    }
  }
  else if (Bstage == 4) {
    but[0].Name = "Point";
    but[1].Name = "Triangle";
    but[2].Name = "Arc";
    but[3].Name = "Colors";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addShapeBox("point");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      addShapeBox("triangle");
      stage = 0;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "Arcs are not implemented yet.";
      //addShapeBox("arc");
      //stage = 0;
    }
    if (but[3].isClicked() == true) {
      Debugger1 = "Colors not implemented yet.";
      //Bstage = 5;
    }
    if (but[4].isClicked() == true) {
      Bstage = 3;
    }
  }
  else if (Bstage == 5) {
    //Colorings
  }
  else if (Bstage == 6) {
    but[0].Name = "Basic";
    but[1].Name = "Assigning"; // +=,-=,*=, and /=
    but[2].Name = "Others"; //%,=,++, and --
    but[3].Name = "Advanced"; //abs(), sqrt(), ^, etc
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      Bstage = 7;
    }
    if (but[1].isClicked() == true) {
      //Debugger1 = "That kind of math not implemented.";
      Bstage = 8;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "That kind of math not implemented.";
      //Bstage = 9;
    }
    if (but[3].isClicked() == true) {
      Debugger1 = "That kind of math not implemented.";
      //Bstage = 10;
    }
    if (but[4].isClicked() == true) {
      Bstage = 0;
    }
  }
  else if (Bstage == 7) {
    but[0].Name = "+";
    but[1].Name = "-";
    but[2].Name = "*";
    but[3].Name = "/";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addEquationBox("+");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      //Debugger1 = "Subtraction not implemented";
      addEquationBox("-");
      stage = 0;
    }
    if (but[2].isClicked() == true) {
      //Debugger1 = "Multiplication not implemented";
      addEquationBox("*");
      stage = 0;
    }
    if (but[3].isClicked() == true) {
      //Debugger1 = "Division not implemented";
      addEquationBox("/");
      stage = 0;
    }
    if (but[4].isClicked() == true) {
      Bstage = 6;
    }
  }
  else if (Bstage == 8) {
    but[0].Name = "+=";
    but[1].Name = "-=";
    but[2].Name = "*=";
    but[3].Name = "/=";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addEquationBox("+=");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      //Debugger1 = "Subtraction not implemented";
      addEquationBox("-=");
      stage = 0;
    }
    if (but[2].isClicked() == true) {
      //Debugger1 = "Multiplication not implemented";
      addEquationBox("*");
      stage = 0;
    }
    if (but[3].isClicked() == true) {
      //Debugger1 = "Division not implemented";
      addEquationBox("/=");
      stage = 0;
    }
    if (but[4].isClicked() == true) {
      Bstage = 6;
    }
  }
  else if (Bstage == 11) {
    but[0].Name = "If";
    but[1].Name = "Switch";
    but[2].Name = "?:";
    but[3].Name = "Loops";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      //Debugger1 = "If statements not implemented!";
      stage = 0;
      Bstage = 12;
    }
    if (but[1].isClicked() == true) {
      Debugger1 = "Switch statements not implemented!";
      //addSwitch();
      //stage = 15;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "Ternary statements not implemented!";
      //addTernary();
      //stage = 19;
    }
    if (but[3].isClicked() == true) {
      //Debugger1 = "Loops not implemented!";
      Bstage = 23;
    }
    if (but[4].isClicked() == true) {
      Bstage = 0;
    }
  }
  else if (Bstage == 12) {
    but[0].Name = "==";
    but[1].Name = "!=";
    but[2].Name = "Logical Ops";
    but[3].Name = "Inequalities";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addIf("==");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      Debugger1 = "!= not implemented!";
      //addIf("!=");
      //stage = 0;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "Logical Operators not implemented!";
      //Bstage = 12;
    }
    if (but[3].isClicked() == true) {
      Debugger1 = "Inequalities not implemented!";
      //Bstage = 13;
    }
    if (but[4].isClicked() == true) {
      Bstage = 11;
    }
  }
  else if (Bstage == 23) {
    but[0].Name = "While";
    but[1].Name = "Do While";
    but[2].Name = "For";
    but[3].Name = "N/A";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      Debugger1 = "While not implemented!";
      //Bstage = 24;
    }
    if (but[1].isClicked() == true) {
      Debugger1 = "Do While not implemented!";
      //Bstage = 27;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "For not implemented!";
      //Bstage = 30;
    }
    if (but[4].isClicked() == true) {
      Bstage = 11;
    }
  }
  else if (Bstage == 24) {
    but[0].Name = "==";
    but[1].Name = "!=";
    but[2].Name = "Logical Ops";
    but[3].Name = "Inequalities";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      addWhile("==");
      stage = 0;
    }
    if (but[1].isClicked() == true) {
      Debugger1 = "!= not implemented!";
      //addIf("!=");
      //stage = 0;
    }
    if (but[2].isClicked() == true) {
      Debugger1 = "Logical Operators not implemented!";
      //Bstage = 25;
    }
    if (but[3].isClicked() == true) {
      Debugger1 = "Inequalities not implemented!";
      //Bstage = 26;
    }
    if (but[4].isClicked() == true) {
      Bstage = 11;
    }
  }
  else if (Bstage == 30) {
    but[0].Name = "Functions";
    but[1].Name = "TBA"; //Transformations
    but[2].Name = "TBA";
    but[3].Name = "TBA";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      Bstage = 31;
    }
    if (but[4].isClicked() == true) {
      Bstage = 0;
    }
  }
  else if (Bstage == 31) {
    but[0].Name = "Void";
    but[1].Name = "TBA"; //Return types
    but[2].Name = "Caller"; //Don't know how to implement function callers :O
    but[3].Name = "";
    but[4].Name = "back";
    if (but[0].isClicked() == true) {
      Bstage = 32;
    }
    
    if (but[2].isClicked() == true) {
      addCaller();
    }
    if (but[4].isClicked() == true) {
      Bstage = 30;
    }
  }
  else if (Bstage == 32) {
    but[0].Name = "(String)";
    but[1].Name = "(int)"; //Return types
    but[2].Name = "more";
    but[3].Name = "No Pars";
    but[4].Name = "back";
    if (but[3].isClicked() == true) {
      addFunct("");
    }
    if (but[4].isClicked() == true) {
      Bstage = 31;
    }
  }
}
int totalnumvars = 0;
int shapePriority = 0;
int lineinprog;
systemVar[] systemVars = new systemVar[256];
systemShape[] systemShapes = new systemShape[256];

void runProgram() {
  println("runningProgram~");
  while (lineinprog < 256) {
    lineinprog = readCLine(lineinprog); 
  }
  lineinprog = 0;
  totalnumvars = 0;
  shapePriority = 0;
}

int readCLine(int l) {
 // println("L2: " + l);
  for (int i=0;i<numartvars;i++) {
    if (l == artVars[i].line) {
      if(artVars[i].getType() == "String") {
        systemVars[totalnumvars] = new systemVar("String",artVars[i].vname,artVars[i].vval);
        totalnumvars += 1;
      }
      if(artVars[i].getType() == "int") {
        systemVars[totalnumvars] = new systemVar("int",artVars[i].vname,artVars[i].vval);
        totalnumvars += 1;
      }
    }
  }
 for (int i = 0;i<numartshapes;i++) {
     //println(l + "?=" + artShapes[i].line);
    if (l == artShapes[i].line) {
      println("Delaware coming up on the left!");
      if (artShapes[i].vtype == "rect" || artShapes[i].vtype == "line" || artShapes[i].vtype == "ellipse") {
        systemShapes[i] = new systemShape(artShapes[i].vtype,artShapes[i].par1,artShapes[i].par2,artShapes[i].par3,artShapes[i].par4);
        //queueShape(artShapes[i].vtype,intify(artShapes[i].par1),intify(artShapes[i].par2),intify(artShapes[i].par3),intify(artShapes[i].par4),shapePriority);
      }
      else if (artShapes[i].vtype == "triangle") {
        systemShapes[i] = new systemShape(artShapes[i].vtype,artShapes[i].par1,artShapes[i].par2,artShapes[i].par3,artShapes[i].par4,artShapes[i].par5,artShapes[i].par6);
        //queueShape(artShapes[i].vtype,intify(artShapes[i].par1),intify(artShapes[i].par2),intify(artShapes[i].par3),intify(artShapes[i].par4),intify(artShapes[i].par5),intify(artShapes[i].par6),shapePriority);
      }
      else if (artShapes[i].vtype == "point") {
        systemShapes[i] = new systemShape(artShapes[i].vtype,artShapes[i].par1,artShapes[i].par2);
        //queueShape(artShapes[i].vtype,intify(artShapes[i].par1),intify(artShapes[i].par2),shapePriority);
      }
      drawShapes(i);
    }
  }
 for (int i = 0;i<numartequations;i++) {
   if (l == artEquations[i].line) {
      doMath(i);
    }
 }
 for (int i = 0;i<numartifs;i++) {
   if (l == artIfs[i].line) {
     if (artIfs[i].compare.equals("==")) {
       println(getVarVal(artIfs[i].par1) + " " + artIfs[i].par2);
       if (getVarVal(artIfs[i].par1).equals(artIfs[i].par2)) {
         println("Connecticut found!");
         println("Where is Delaware?");
         //YES!
       }
       else {
         println("Not in Connecticut!");
         //Makes the comp skip to the EOF associated with this if.
         //println("L: " + l);
         //println("EOF: " + artEOFifs[i].line);
         l = artEOFifs[i].line;
         //println("L2: " + l);
       }
     }
   }
 }
 println("L3: " + l);
 for (int i = 0;i<numartwhiles;i++) {
   println("I: " + i + " L4: " + l + " EOF: " + artEOFwhiles[i].line);
   if (l == artEOFwhiles[i].line) {
     l = artWhiles[i].line;
   }
   println("I: " + i + " L5: " + l);
   if (l == artWhiles[i].line) {
     if (artWhiles[i].compare.equals("==")) {
       println("Delaware straight ahead!  " + l);
       if (getVarVal(artWhiles[i].par1).equals(artWhiles[i].par2)) {
         println("Delaware is only a mile away!");
         //YES!
       }
       else {
         println("Still far from Delaware!");
         //Makes the comp skip to the EOF associated with this statement.
         //println("L: " + l);
         //println("EOF: " + artEOFifs[i].line);
         l = artEOFwhiles[i].line;
         //println("L2: " + l);
       }
     }
   }
 }
 for (int i = 0;i<numartfuncts;i++) {
   if (l == artEOFfuncts[i].line) {
     if (artFuncts[i].vname.equals("draw")) {
       tMilli2 = millis();
       if (tMilli2-tMilli1 > 500) {
         tMilli1 = millis();
         l = artFuncts[i].line; 
       }
       else {
         l = artFuncts[i].line - 1;
       }
     }
     else {
       //exit out of function, if nested, de-nest (somehow)
     }
     //Later on, parameters get added.
   }
 }
 l+=1;
 return l;
}

void doMath(int num) {
  println("Mathematical!");
  String addon1 = "";
  String addon2 = "";
  for (int i = 0;i<numartvars;i++) {
    println("We seem far from Connecticut...");
    if (trim(artEquations[num].voutput).equals(trim(systemVars[i].sname))) {
       for (int i2 = 0;i2<numartvars;i2++) {
         if (trim(artEquations[num].vinput1).equals(trim(systemVars[i2].sname))) {
           addon1 = systemVars[i2].sval;
           i2 = numartvars;
         }
         else {
           addon1 = artEquations[num].vinput1;
         }
       }
       for (int i2 = 0;i2<numartvars;i2++) {
         if (trim(artEquations[num].vinput2).equals(trim(systemVars[i2].sname))) {
           addon2 = systemVars[i2].sval;
           i2 = numartvars;
         }
         else {
           addon2 = artEquations[num].vinput2;
         }
       }
       println();
       if (artEquations[num].vtype.equals("+")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) + intify(addon2));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("-")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) - intify(addon2));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("*")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) * intify(addon2));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("/")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) / intify(addon2));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("+=")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) + intify(systemVars[i].sval));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("-=")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(systemVars[i].sval)-intify(addon1));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("*=")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(addon1) * intify(systemVars[i].sval));
          println("We're almost at Connecticut!");
       }
       if (artEquations[num].vtype.equals("/=")) {
       //   println("Addon1: " + addon1 + " Addon2: " + addon2 + " i: " + i);
          systemVars[i].sval = str(intify(systemVars[i].sval)/intify(addon1));
          println("We're almost at Connecticut!");
       }
    }
    else {
      //ERROR!
    }
  }
}

boolean ifIsVar(String par1) {
  for (int r = 0;r<numartvars;r++) {
    if (artVars[r].vname.equals(par1)) {
      return true;
    }
  }
  return false;
}

String getVarVal(String varname) {
  for (int r = 0;r<numartvars;r++) {
    println(r + " is r, " + artVars[r].vname + " is the name, compared to " + varname);
    if (trim(artVars[r].vname).equals(trim(varname))) {
      return artVars[r].vval;
    }
  }
  return varname;
}
flaggedShape[] fShape = new flaggedShape[256];
int numflaggedshapes = 0;

void queueShape(String type,int par1,int par2,int par3,int par4,int p) {
  fShape[numflaggedshapes] = new flaggedShape(type,par1,par2,par3,par4,p);
  shapePriority += 1;
  numflaggedshapes += 1;
  println("Queueing shapes!");
}
void queueShape(String type,int par1,int par2,int par3,int par4,int par5,int par6,int p) {
  fShape[numflaggedshapes] = new flaggedShape(type,par1,par2,par3,par4,par5,par6,p);
  shapePriority += 1;
  numflaggedshapes += 1;
  println("Queueing shapes!");
}
void queueShape(String type,int par1,int par2,int p) {
  fShape[numflaggedshapes] = new flaggedShape(type,par1,par2,p);
  shapePriority += 1;
  numflaggedshapes += 1;
  println("Queueing shapes!");
}

class flaggedShape {
  String ftype;
  int fpar1 = -100;
  int fpar2 = -100;
  int fpar3 = -100;
  int fpar4 = -100;
  int fpar5 = -100;
  int fpar6 = -100;
  int priority = 0;
  flaggedShape(String type,int par1,int par2,int par3,int par4,int p) {
    ftype = type;
    fpar1 = par1;
    fpar2 = par2;
    fpar3 = par3;
    fpar4 = par4;
    priority = p;
  }
  
  flaggedShape(String type,int par1,int par2,int par3,int par4,int par5,int par6,int p) {
    ftype = type;
    fpar1 = par1;
    fpar2 = par2;
    fpar3 = par3;
    fpar4 = par4;
    fpar5 = par5;
    fpar6 = par6;
    priority = p;
  }
  
  flaggedShape(String type,int par1,int par2,int p) {
    ftype = type;
    fpar1 = par1;
    fpar2 = par2;
    priority = p;
  }
}

void drawFShapes() {
  println("Drawing queue!");
  for (int i = 0;i<numflaggedshapes;i++) {
    println(fShape[i].ftype);
    if (fShape[i].ftype == "rect") {
      println("Rect here!");
      rect(fShape[i].fpar1,fShape[i].fpar2,fShape[i].fpar3,fShape[i].fpar4);
    }
    if (fShape[i].ftype == "line") {
      line(fShape[i].fpar1,fShape[i].fpar2,fShape[i].fpar3,fShape[i].fpar4);
    }
    if (fShape[i].ftype == "ellipse") {
      ellipse(fShape[i].fpar1,fShape[i].fpar2,fShape[i].fpar3,fShape[i].fpar4);
    }
    if (fShape[i].ftype == "point") {
      point(fShape[i].fpar1,fShape[i].fpar2);
    }
    if (fShape[i].ftype == "triangle") {
      triangle(fShape[i].fpar1,fShape[i].fpar2,fShape[i].fpar3,fShape[i].fpar4,fShape[i].fpar5,fShape[i].fpar6);
    }
  }
}

void clearQueue() {
  //println("Queue cleared");
  for (int i = 0;i<256;i++) {
    fShape[i] = new flaggedShape("",-100,-100,-100,-100,-100);
  }
  numflaggedshapes = 0;
}


