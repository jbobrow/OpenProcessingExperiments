
//TIMED TYPING TEST
//CREATED BY EMMA ROSE WIRSHING
//VOID(KEYPRESSED) SOURCE:http://wiki.processing.org/index.php/Typed_input @author Tom Carden

boolean overBox1; //TRACKS WHETHER MOUSE IS OVER CERTAIN BUTTONS
boolean overBox2;
boolean overBox3;
boolean overBox4;
int testSelection; //HOLDS WHICH TEST THE USER SELECTS
String typedText = ""; //RECORDS TEXT THE USER TYPEDS
String wizard = "Dorothy lived in the midst of the great Kansas prairies, with Uncle Henry, who was a farmer, and Aunt Em, who was the farmer's wife. Their house was small, for the lumber to build it had to be carried by wagon many miles. There were four walls, a floor and a roof, which made one room; and this room contained a rusty looking cookstove, a cupboard for the dishes, a table, three or four chairs, and the beds. Uncle Henry and Aunt Em had a big bed in one corner, and Dorothy a little bed in another corner. There was no garret at all and no cellar - except a small hole dug in the ground, called a cyclone cellar, where the family could go in case one of those great whirlwinds arose, mighty enough to crush any building in its path. It was reached by a trap door in the middle of the floor, from which a ladder led down into the small, dark hole.\n\nWhen Dorothy stood in the doorway and looked around, she could see nothing but the great gray prairie on every side. Not a tree nor a house broke the broad sweep of flat country that reached to the edge of the sky in all directions. The sun had baked the plowed land into a gray mass, with little cracks running through it. Even the grass was not green, for the sun had burned the tops of the long blades until they were the same gray color to be seen everywhere. Once the house had been painted, but the sun blistered the paint and the rains washed it away, and now the house was as dull and gray as everything else."; 
String harry = "When he was dressed he went down the hall into the kitchen. The table was almost hidden beneath all Dudley's birthday presents. It looked as though Dudley had gotten the new computer he wanted, not to mention the second television and the racing bike. Exactly why Dudley wanted a racing bike was a mystery to Harry, as Dudley was very fat and hated exercise - unless of course it involved punching somebody. Dudley's favorite punching bag was Harry, but he couldn't often catch him. Harry didn't look it, but he was very fast.\n\nPerhaps it had something to do with living in a dark cupboard, but Harry had always been small and skinny for his age. He looked even smaller and skinnier than he really was because all he had to wear were old clothes of Dudley's, and Dudley was about four times bigger than he was. Harry had a thin face, knobbly knees, black hair, and bright green eyes. He wore round glasses held together with a lot of Scotch tape because of all the times Dudley had punched him on the nose. The only thing Harry liked about his own appearance was a very thin scar on his forehead that was shaped like a bolt of lightning. He had had it as long as he could remember, and the first question he could ever remember asking his Aunt Petunia was how he had gotten it.";
String charlie = "Mr.Bucket was the only person in the family with a job. He worked in a toothpaste factory, where he sat all day long at a bench and screwed the little caps on to the tops of the tubes of toothpaste after the tubes had been filled. But a toothpaste cap-screwer is never paid very much money, and poor Mr.Bucket, however hard he worked, and however fast he screwed on the caps, was never able to make enough to buy one half of the things that so large a family needed. There wasn't even enough money to buy proper food for them all. The only meals they could afford were bread and margarine for breakfast, boiled potatoes and cabbage for lunch, and cabbage soup for supper. Sundays were a bit better. They all looked forward to Sundays because then, although they had exactly the same, everyone was allowed a second helping.\n\nThe Buckets, of course, didn't starve, but every one of them - the two old grandfathers, the two old grandmothers, Charlie's father, Charlie's mother, and especially little Charlie himself - went about from morning till night with a horrible empt feeling in their tummies.\n\nCharlie felt it worst of all. And although his father and mother often went without their own share of lunch or supper so that they could give it to him, it still wasn't nearly enough for a growing boy.";
String alice = "First, she dreamed of little Alice herself, and once again the tiny hands were clasped upon her knee, and the bright eager eyes were looking up into hers - she could hear the very tones of her voice, and see that queer little toss of her head to keep back the wandering hair that would always get into her eyes - and still as she listened, or seemed to listen, the whole place around her became alive with the strange creatures of her little sister's dream.\n\nThe long grass rustled at her feet as the White Rabbit hurried by - the frightened Mouse splashed his way through the neighboring pool - she could hear the rattle of the teacups ans the March Hare and his friends shared their never-ending meal, and the shrill voice of the Queen ordering off her unfortunate guests to execution - once more the pig-baby was sneezing on the Duchess's knee, while plates and dishes crashed around it - once more the shriek of the Gryphon, the squeaking of the Lizard's slate-pencil, and the choking of the suppressed guinea-pigs, filled the air, mixed up with the distant sobs of the miserable Mock Turtle.\n\nSo she sat on, with closed eyes, and half believed herself in Wonderland, though she knew she had but to open them again, and all would change to dull reality.";
//BODY TEXT THAT USER HAS TO COPY
PFont body; //DECLARES NEW FONT
int startTime; //HOLDS TIME THAT TEST STARTS
int x=1; //VARIABLE TO COMPARE STRINGS
color textCol = color(0, 0, 0); //DECLARES TEXT COLOR
int endTime; //HOLDS TIME THAT TEST ENDS
int rate; //HOLDS TYPING SPEED
boolean runOnce = true; //MAKES LOOP RUN ONCE
boolean start = true; //DECLARES WHETHER THE START SCREEN IS ON
boolean typeWizard = false; //DECLARES WHICH TEST IS SELECTED
boolean typeHarry = false;
boolean typeCharlie = false;
boolean typeAlice = false;
boolean overMenu; //TRACKS WHETHER MOUSE IS OVER MENU BUTTON
boolean overExit; //TRACKS WHETHER MOUSE IS OVER EXIT BUTTON
boolean overColor; //TRACKS WHETHER MOUSE IS OVER COLOR BUTTON
color bG = color(random(0,255), random(0,255), random(0,255)); //CHOOSES RANDOM BACKGROUND COLOR
int wordCount; //DECLARES WORD COUNT OF PASSAGES
String[] letters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"}; //USED FOR DECORATION
boolean ready = false; //HOLDS WHETHER OR NOT USER IS TYPING
boolean runOnceOnce = true; //ANOTHER RUNONCE VARIABLE

void setup() {
  size(1200, 750);
  frameRate(120);
}

void draw() {
  rectMode(CENTER);
  background(bG);
  PFont title = loadFont("Futura-Medium-170.vlw"); //SETS FONT
  displayTitleText();
  decoration();
  menuButton();
  if(testSelection ==1) {
    start = false; //NOT ON START SCREEN
    directions();
    menuButton();
    if(ready) {
      if(runOnceOnce) {
        startTime = millis(); //DECLARES START TIME
        runOnceOnce = false; //RUNS ONLY ONCE
      }
      displayWizard();
      menuButton();
      typeWizard = true; //USER IS TAKING WIZARD TYPING TEST
    }
    else if(keyPressed) {
      ready=true; //USER IS READY WHEN THEY PRESS A KEY
    }
  }
  if(testSelection ==2) {
    start = false;
    directions();
    menuButton();
    if(ready) {
      if(runOnceOnce) {
        startTime = millis();
        runOnceOnce = false;
      }
      displayHarry();
      menuButton();
      typeHarry = true;
    }
    else if(keyPressed) {
      ready=true;
    }
  }
  if(testSelection ==3) {
    start = false;
    directions();
    menuButton();
    if(ready) {
      if(runOnceOnce) {
        startTime = millis();
        runOnceOnce = false;
      }
      displayCharlie();
      menuButton();
      typeCharlie = true;
    }
    else if(keyPressed) {
      ready=true;
    }
  }
  if(testSelection ==4) {
    start = false;
    directions();
    menuButton();
    if(ready) {
      if(runOnceOnce) {
        startTime = millis();
        runOnceOnce = false;
      }
      displayAlice();
      menuButton();
      typeAlice = true;
    }
    else if(keyPressed) {
      ready=true;
    }
  }
}

void decoration() {
  textSize(10);
  fill(255);
  for (int l=0; l<900000; l=l+15) {
    text(letters[int(random(0,25))], l, 40); //DECORATES TOP BORDER WITH RANDOM LETTERS
  }
}

void menuButton(){
  strokeWeight(2);
  textSize(15);
  if (mouseX<800 && mouseX>100 && mouseY>650) { //DRAWS BUTTONS IF MOUSE IS IN LOWER SCREEN
    fill(0);
    stroke(255);
    rect(width/2, 725, 130, 25);
    rect((width/2)-140, 725, 130, 25);
    rect((width/2)+140, 725, 130, 25);
    fill(255);
    text("TOP MENU", (width/2)-35, height-20);
    text("EXIT", (width/2)-155, height-20);
    text("CHANGE COLOR", (width/2)+80, height-20);
    //TRACK WHICH BUTTON MOUSE CLICKS ON
    if (mouseX< 665 && mouseX>535 && mouseY>705 && mouseY<745) {
      overMenu = true;
      overExit = false;
      overColor = false;
    } 
    else if(mouseX<530 && mouseX>400 && mouseY>705 && mouseY<745) {
      overExit = true;
      overMenu = false;
      overColor = false;
    }
    else if(mouseX>670 && mouseX<800 && mouseY>705 && mouseY<745) {
      overColor = true;
      overExit = false;
      overMenu = false;
    }
    else {
      overMenu = false;
      overExit = false;
      overColor = false;
    }
    stroke(0);
  }
  else {
    fill(0);
    stroke(255);
    rect(width/2, 735, 150, 50);
    fill(255);
    textSize(20);
    text("OPTIONS", (width/2)-43, height-10);
    stroke(0);
    overMenu = false;
    overExit = false;
    overColor = false;
  }
}

void displayTitleText() {
  int selection1 = 2;
  int selection2 = 2;
  int selection3 = 2;
  int selection4 = 2;
  smooth();
  PFont title = loadFont("Futura-Medium-170.vlw");
  textFont(title);
  textSize(80);
  fill(0);
  text("TIMED TYPING TEST", 243, 150);
  fill(255);
  textSize(80);
  text("TIMED TYPING TEST", 250, 150);
  textSize(50);
  text("SELECT A TOPIC", 420, 225);
  //TRACKS WHICH SELECTION IS CLICKED ON
  if(mouseX>350 && mouseX<850 && mouseY<337.5 && mouseY>262.5) {
    selection1 = 7;
    selection2 = 2;
    selection3 = 2;
    selection4 = 2;
    overBox1 = true;
    overBox2 = false;
    overBox3 = false;
    overBox4 = false;
  }
  else if (mouseX>350 && mouseX<850 && mouseY<437.5 && mouseY>362.5) {
    selection1 = 2;
    selection2 = 7;
    selection3 = 2;
    selection4 = 2;
    overBox1 = false;
    overBox2 = true;
    overBox3 = false;
    overBox4 = false;
  }
  else if (mouseX>350 && mouseX<850 && mouseY<537.5 && mouseY>462.5) {
    selection1 = 2;
    selection2 = 2;
    selection3 = 7;
    selection4 = 2;
    overBox1 = false;
    overBox2 = false;
    overBox3 = true;
    overBox4 = false;
  }
  else if (mouseX>350 && mouseX<850 && mouseY<637.5 && mouseY>562.5) {
    selection1 = 2;
    selection2 = 2;
    selection3 = 2;
    selection4 = 7;
    overBox1 = false;
    overBox2 = false;
    overBox3 = false;
    overBox4 = true;
  }
  else {
    selection1 = 2;
    selection2 = 2;
    selection3 = 2;
    selection4 = 2;
    overBox1 = false;
    overBox2 = false;
    overBox3 = false;
    overBox4 = false;
  }
  strokeWeight(selection1);
  rect(width/2, 300, 500, 75, 7);
  fill(0);
  textSize(30);
  text("The Wizard of Oz", 480, 312.5);
  fill(255);
  strokeWeight(selection2);
  rect(width/2, 400, 500, 75, 7);
  fill(0);
  textSize(30);
  text("Harry Potter", 520, 412.5);
  fill(255);
  strokeWeight(selection3);
  rect(width/2, 500, 500, 75, 7);
  fill(0);
  textSize(30);
  text("Charlie and the Chocolate Factory", 375, 512.5);
  fill(255);
  strokeWeight(selection4);
  rect(width/2, 600, 500, 75, 7);
  fill(0);
  textSize(30);
  text("Alice in Wonderland", 460, 612.5);
  fill(255);
  strokeWeight(2);
}

void mouseReleased() {
  if (overMenu == true) { //RESETS EVERYTHING WHEN MENU BUTTON IS PRESSED
    testSelection = 0;
    start = true;
    typeWizard = false;
    typeHarry = false;
    typeCharlie = false;
    typeAlice = false;
    runOnce = true;
    typedText = "";
    x=0;
    ready = false;
  }
  if (overExit == true) {
    exit();
  }
  if (overColor == true) {
    bG = color(random(0,255), random(0,255), random(0,255)); //CHANGE BACKGROUND COLOR
  }
  if (start == true) { //IF USER IS ON START SCREEN
    if (overBox1 == true) {
      testSelection = 1;
    }
    if (overBox2 == true) {
      testSelection = 2;
    }
    if (overBox3 == true) {
      testSelection = 3;
    }
    if (overBox4 == true) {
      testSelection = 4;
    }
  }
}

void directions() {
  background(bG);
  decoration();
  textSize(50);
  rect(width/2, height/2 - 50, 1050, 300);
  text("DIRECTIONS", (width/2)-140, 125);
  fill(0);
  textSize(20);
  text("TYPE THE WORDS ON THE SCREEN AS QUICKLY AND ACCURATELY AS YOU CAN.", 210, 250); 
  text("IF SOMETHING IS TYPED INCORRECTLY, THE COLOR OF THE WORDS WILL TURN FROM BLACK TO GRAY.",110, 300);
  text("THE TEST WILL END WHEN ALL OF THE WORDS HAVE BEEN CORRECTLY TYPED.",225,350);
  text("PRESS ANY KEY TO CONTINUE.", 450, 400);
}

void displayWizard(){
  wordCount = 9;
  background(bG);
  body = loadFont("Futura-Medium-15.vlw");
  textFont(body);
  textSize(15);
  fill(255);
  rect(width/2, height/4, 860, 320);
  rect(width/2, (3*height/4)-30, 860, 330);
  fill(textCol);
  text(wizard, width/2, (height/4)+25, 840, 350);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), width/2, 3*(height/4)-20, 840, 320); //DISPLAYS TYPED TEXT AND CURSOR
  if (wizard.equals(typedText) == true) { //CHECKS WHETHER USER INPUT MATCHES SCRIPT
    if (runOnce) {
        println(millis()-startTime);
        rate =(60*1000*wordCount)/(millis()-startTime); //CALCULATES TYPING SPEED
        runOnce=false;
     }
    background(bG);
    fill(255);
    rect(width/2, (height/2)-60, 800, 150, 7);
    fill(0);
    PFont title = loadFont("Futura-Medium-170.vlw");
    textFont(title);
    textSize(30);
    text("YOUR TYPING SPEED IS "+rate+" WORDS PER MINUTE", 120+width/8, (height/2)-60); 
    decoration();
    typeWizard = false; 
  }
}

void displayHarry(){
wordCount = 237;
  background(bG);
  body = loadFont("Futura-Medium-15.vlw");
  textFont(body);
  textSize(15);
  fill(255);
  rect(width/2, height/4, 860, 320);
  rect(width/2, (3*height/4)-30, 860, 330);
  fill(textCol);
  text(harry, width/2, (height/4)+25, 840, 350);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), width/2, 3*(height/4)-20, 840, 320);
  if (harry.equals(typedText) == true) {
    if (runOnce) {
        rate =(60*1000*wordCount)/(millis()-startTime);
        runOnce=false;
     }
    background(bG);
    fill(255);
    rect(width/2, (height/2)-60, 800, 150, 7);
    fill(0);
    PFont title = loadFont("Futura-Medium-170.vlw");
    textFont(title);
    textSize(30);
    text("YOUR TYPING SPEED IS "+rate+" WORDS PER MINUTE", 120+width/8, (height/2)-60); 
    decoration();
    typeHarry = false;
  }
}

void displayCharlie(){
wordCount = 237;
  background(bG);
  body = loadFont("Futura-Medium-15.vlw");
  textFont(body);
  textSize(15);
  fill(255);
  rect(width/2, height/4, 860, 320);
  rect(width/2, (3*height/4)-30, 860, 330);
  fill(textCol);
  text(charlie, width/2, (height/4)+25, 840, 350);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), width/2, 3*(height/4)-20, 840, 320);
  if (charlie.equals(typedText) == true) {
    if (runOnce) {
        rate =(60*1000*wordCount)/(millis()-startTime);
        runOnce=false;
     }
    background(bG);
    fill(255);
    rect(width/2, (height/2)-60, 800, 150, 7);
    fill(0);
    PFont title = loadFont("Futura-Medium-170.vlw");
    textFont(title);
    textSize(30);
    text("YOUR TYPING SPEED IS "+rate+" WORDS PER MINUTE", 120+width/8, (height/2)-60); 
    decoration();
    typeCharlie = false;
  }
}

void displayAlice(){
wordCount = 230;
  background(bG);
  body = loadFont("Futura-Medium-15.vlw");
  textFont(body);
  textSize(15);
  fill(255);
  rect(width/2, height/4, 860, 320);
  rect(width/2, (3*height/4)-30, 860, 330);
  fill(textCol);
  text(alice, width/2, (height/4)+25, 840, 350);
  text(typedText+(frameCount/10 % 2 == 0 ? "_" : ""), width/2, 3*(height/4)-20, 840, 320);
  if (alice.equals(typedText) == true) {
    if (runOnce) {
        rate =(60*1000*wordCount)/(millis()-startTime);
        runOnce=false;
     }
    background(bG);
    fill(255);
    rect(width/2, (height/2)-60, 800, 150, 7);
    fill(0);
    PFont title = loadFont("Futura-Medium-170.vlw");
    textFont(title);
    textSize(30);
    text("YOUR TYPING SPEED IS "+rate+" WORDS PER MINUTE", 120+width/8, (height/2)-60); 
    decoration();
    typeAlice = false;
  }
}
 
void keyPressed() {
if (typeWizard) {
    if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1)); //RECORDS USER TYPING
      x=x-1; //CHANGES COMPARATIVE STRINGS
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      typedText += "\n";
      x = x-1; //CHANGES COMPARATIVE STRINGS
      break;
    case ESC:
    case DELETE:
      x = x-1; //CHANGES COMPARATIVE STRINGS
      break;
    default:
      typedText += key;
        if (!wizard.substring(0,x).equals(typedText.substring(0,x))) { //IF USER INPUT DOESN'T MATCH SCRIPT
          textCol = color(170, 170, 170); //CHANGE FONT COLOR
        }
        else {
          textCol = color(0, 0, 0);
        }
        x++; //CHANGES COMPARATIVE STRINGS
      }
    }
  }
if (typeHarry) {
    if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      x=x-1;
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      typedText += "\n";
      x = x-1;
      break;
    case ESC:
    case DELETE:
      x = x-1;
      break;
    default:
      typedText += key;
        if (!harry.substring(0,x).equals(typedText.substring(0,x))) {
          textCol = color(170, 170, 170);
        }
        else {
          textCol = color(0, 0, 0);
        }
        x++;
      }
    }
  }
if (typeCharlie) {
    if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      x=x-1;
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      typedText += "\n";
      x = x-1;
      break;
    case ESC:
    case DELETE:
      x = x-1;
      break;
    default:
      typedText += key;
        if (!charlie.substring(0,x).equals(typedText.substring(0,x))) {
          textCol = color(170, 170, 170);
        }
        else {
          textCol = color(0, 0, 0);
        }
        x++;
      }
    }
  }
if (typeAlice) {
    if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      typedText = typedText.substring(0,max(0,typedText.length()-1));
      x=x-1;
      break;
    case TAB:
      typedText += "    ";
      break;
    case ENTER:
    case RETURN:
      typedText += "\n";
      x = x-1;
      break;
    case ESC:
    case DELETE:
      x = x-1;
      break;
    default:
      typedText += key;
        if (!alice.substring(0,x).equals(typedText.substring(0,x))) {
          textCol = color(170, 170, 170);
        }
        else {
          textCol = color(0, 0, 0);
        }
        x++;
      }
    }
  }
}
