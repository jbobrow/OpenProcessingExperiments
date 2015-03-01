
//HYPERTYPER
//CREATED BY EMMA ROSE WIRSHING
//VOID(KEYPRESSED) SOURCE:http://wiki.processing.org/index.php/Typed_input @author Tom Carden


boolean start = true;
boolean overMenu;
boolean overColor;
boolean overExit;
int bW = 0;
boolean overGuest;
boolean createAccount = false;
int bWL = 255;
boolean overHere;
color bG = color(219, 49, 49);
boolean overCUser;
boolean overCPass;
String typedText = "";
boolean typeCUser;
boolean typeCPass;
boolean overUser;
boolean overPass;
String cUser = "";
String cPass = "";
boolean typeUser;
boolean typePass;
String user = "";
String pass = "";
boolean overContinue;
int bWCC = 0;
int bWG = 0;
Table userPass;
boolean overGo;

void setup(){
  size(1200, 750);
  frameRate(170);
//  userPass = loadXML("userPass.xml"); 
userPass = loadTable("userPass.tsv");
//  userPass.addColumn("Username", Table.STRING);
//  userPass.addColumn("Password", Table.STRING);
}

void draw() {
//  saveTable(userPass, "userPass.tsv");
  rectMode(CENTER);
  background(bG);
  displayLogin();
  menuButton();
  if(createAccount) {
    displayAccount();
    menuButton();
  }
}

void displayLogin() {
  PFont title = loadFont("Futura-Medium-170.vlw"); //SETS FONT
  PFont titleI = loadFont("Futura-MediumItalic-170.vlw"); //SETS FONT
  PFont med = loadFont("Futura-Medium-48.vlw");
  textFont(titleI);
  textSize(80);
  fill(255);
  text("HYPER TYPER", 365, 250);
  fill(0);
  textFont(title);
  textSize(60);
  text("WELCOME TO", 390, 150);
  textFont(titleI);
  textSize(80);
  fill(0);
  text("HYPER TYPER", 370, 250);
  textFont(title);
  textSize(60);
  fill(255);
  text("WELCOME TO", 395, 150);
  fill(0);
  rect(125, height/2, 100, height);
  rect(1075, height/2, 100, height);
  for (int i=0; i<8; i++) {
    fill(255);
    rect(100, 100*i, 50, 50);
    rect(150, (100*i)+50, 50, 50);
    rect(1050, 100*i, 50, 50);
    rect(1100, (100*i)+50, 50, 50);
  }
  fill(0);
  stroke(bW);
  textFont(med);
  rect(width/2, 615, 450, 60);
  stroke(bWL);
  line(648, 385, 688, 385);
  textSize(40);
  fill(255);
  stroke(0);
  text("LOG IN", (width/2)-70, 350);
  text("OR", (width/2)-30, 560);
  text("CONTINUE AS GUEST", 395, 630);
  textFont(med);
  textSize(16);
  text("DON'T HAVE AN ACCOUNT? CLICK HERE TO CREATE ONE.", width/2-225, 380);
  text("USERNAME", 310, 430);
  text("PASSWORD", 310, 490);
  strokeWeight(3);
  rect(width/2 + 40, 420, 450, 40);
  rect(width/2 + 40, 480, 450, 40);
  stroke(0);
  fill(0);
  textSize(20);
  if(typeUser) {
    user = typedText;
    typePass = false;
    text(user+(frameCount/10 % 2 == 0 ? "_" : ""), width/2 + 20, 430, 400, 40);
  }
  else if(typePass) {
    typeUser = false;
    pass = typedText;
    text(pass+(frameCount/10 % 2 == 0 ? "_" : ""), width/2 + 20, 490, 400, 40);
  }
  else {
    bW = 0;
    overGuest = false;
    overHere = false;
    overPass = false;
    overUser = false;
    bWL = 255;
    bWG = 0;
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  text(user, width/2 + 20, 430, 400, 40);
  text(pass, width/2 + 20, 490, 400, 40);
  stroke(bG);
  fill(0);
  rect(843, 519, 45, 27);
  fill(255);
  text("GO", 828, 527);
  if(mouseX>375 && mouseX<825 && mouseY<645 && mouseY>585){
    overUser = false;
    overPass = false;
    overHere = false;
    overGuest = true;
    bW = 255;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  else if(mouseX>648 && mouseX<685 && mouseY<388 && mouseY>371){
    overUser = false;
    overPass = false;
    overHere = true;
    overGuest = false;
    bWL = 0;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  else if(mouseX>415 && mouseX<865 && mouseY>400 && mouseY<440) {
    overUser = true;
    overPass = false;
    overHere = false;
    overGuest = false;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  else if (mouseX>415 && mouseX<865 && mouseY>460 && mouseY<500) {
    overPass = true;
    overUser = false;
    overHere = false;
    overGuest = false;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  else if(mouseX>820 && mouseX<866 && mouseY>505 && mouseY<533) {
    bWG = 255;
    overGo = true;
    overPass = false;
    overUser = false;
    overHere = false;
    overGuest = false;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  else {
    bW = 0;
    overGuest = false;
    overHere = false;
    overPass = false;
    overUser = false;
    bWL = 255;
    bWG = 0;
    textSize(20);
    fill(0);
    text(user, width/2 + 20, 430, 400, 40);
    text(pass, width/2 + 20, 490, 400, 40);
  }
  text(user, width/2 + 20, 430, 400, 40);
  text(pass, width/2 + 20, 490, 400, 40);
  stroke(bWG);
  fill(0);
  rect(843, 519, 45, 27);
  fill(255);
  text("GO", 828, 527);
}

void displayAccount(){
  background (bG);
  fill(0);
  rect(125, height/2, 100, height);
  rect(1075, height/2, 100, height);
  for (int i=0; i<8; i++) {
    fill(255);
    rect(100, 100*i, 50, 50);
    rect(150, (100*i)+50, 50, 50);
    rect(1050, 100*i, 50, 50);
    rect(1100, (100*i)+50, 50, 50);
  }
  textSize(25);
  text("CHOOSE YOUR USERNAME AND PASSWORD", 325, 100);
  textSize(18);
  text("USERNAME:", 300, 250);
  text("PASSWORD:", 300, 350);
  fill(255);
  stroke(0);
  strokeWeight(3);
  rect(width/2 + 50, 240, 450, 40);
  rect(width/2 + 50, 340, 450, 40);
  fill(0);
  if(typeCUser) {
    cUser = typedText;
    typeCPass = false;
    text(cUser+(frameCount/10 % 2 == 0 ? "_" : ""), 632, 252, 400, 40);
  }
  else if(typeCPass) {
    typeCUser = false;
    cPass = typedText;
    text(cPass+(frameCount/10 % 2 == 0 ? "_" : ""), 632, 352, 400, 40);
  }
  else{
    text(cUser, 632, 252, 400, 40);
    text(cPass, 632, 352, 400, 40);
  }
  text(cUser, 632, 252, 400, 40);
  text(cPass, 632, 352, 400, 40);
  stroke(bWCC);
  rect(width/2, 500, 200, 50);
  fill(255);
  textSize(30);
  text("CONTINUE", 520, 510);
  if (mouseX>425 && mouseX<875 && mouseY>220 && mouseY<260) {
    overCUser = true;
    overCPass = false;
  }
  else if (mouseX>425 && mouseX<875 && mouseY>320 && mouseY<360) {
    overCPass = true;
    overCUser = false;
  }
  else if(mouseX>500 && mouseX<700 && mouseY>475 && mouseY<525) {
    bWCC = 255;
    overContinue = true;
  }
  else {
    overCUser = false;
    overCPass = false;
    overContinue = false;
    bWCC = 0;
  }
}

void menuButton(){
  strokeWeight(2);
  textSize(15);
  if (mouseX<800 && mouseX>100 && mouseY>700) { //DRAWS BUTTONS IF MOUSE IS IN LOWER SCREEN
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

void mouseReleased(){
  if(overGuest){
    background(0);
  }
  else if(overHere) {
    createAccount = true;
  }
  else if(overExit) {
    exit();
  }
  else if(overMenu) {
    createAccount = false;
    typedText = "";
  }
  else if(overColor) {
    bG = color(random(0,255), random(0,255), random(0,255));
  }
  else if(overUser) {
    typeUser = true;
    typePass = false;
    typedText = "";
  }
  else if (overPass) {
    typeUser = false;
    typePass = true;
    typedText = "";
  }
  else if (overGo) {
//    TableRow result = userPass.findRow(user, "Username");
//    println(user);
    background(0);
//    if(result == user) {
//      background(0);
//    }
//    else if (result != user) {
//    }
  }
  else if(overCUser) {
    typeCUser = true;
    typeCPass = false;
    typedText = "";
  }
  else if(overCPass) {
    typeCPass = true;
    typeCUser = false;
    typedText = "";
  }
  else if(overContinue) {
    TableRow row = userPass.addRow();
    row.setString("Username", cUser);
    row.setString("Password", cPass);
    createAccount = false;
    typedText = "";
  }
  else {
    typedText = "";
    typeCUser = false;
    typeCPass = false;
    typeUser = false;
    typePass = false;
  }
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
      case BACKSPACE:
        typedText = typedText.substring(0,max(0,typedText.length()-1));
        break;
      case TAB:
        typedText += "    ";
        break;
      case ENTER:
      case RETURN:
        typedText += "\n";
        break;
      case ESC:
      case DELETE:
        break;
      default:
        typedText += key;
    }
  }
}
