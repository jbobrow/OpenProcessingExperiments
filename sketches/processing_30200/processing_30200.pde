
char [] sma = {
  'q','w','e','r','t','z','u','i','o','p','a','s','d','f','g','h','j','k','l','y','x','c','v','b','n','m'
};
char [] big = {
  'Q','W','E','R','T','Z','U','I','O','P','A','S','D','F','G','H','J','K','L','Y','X','C','V','B','N','M'
};
char [] num = {
  '1','2','3','4','5','6','7','8','9'
};
char [] ger = {
  'ä','ö','ü','Ä','Ö','Ü','ß'
};
char [] sym = {
  '!','?','§','$','%','&','+','-','*','_','#','<','>'
};

boolean smasel = true;
boolean bigsel = true;
boolean numsel = true;
boolean gersel = true;
boolean symsel = true;

char [] pwchars = {
};

int pwlength = 10;

String[] pw = {"[Kein Passwort erstellt]"};

PFont f50;
PFont f15;
PFont f25;

void setup() {
  size(500,600);
  f50=loadFont("AgencyFB-Reg-50.vlw");
  f15=loadFont("AgencyFB-Reg-15.vlw");
  f25=loadFont("AgencyFB-Reg-25.vlw");
}

void draw() {
  background(255);
  fill(0);
  textAlign(CENTER);
  textFont(f50);
  text("pwCreator",250,50);
  textFont(f15);
  text("Geschrieben von Lukas Wagner",250,65);
  textAlign(LEFT);
  textFont(f25);
  text("1. Zeichensätze auswählen",10,100);
  text("Kleinbuchstaben",50,135);
  text("Großbuchstaben",50,170);
  text("Ziffern (nur 1-9)",50,205);
  text("Deutsche Umlaute (auch ß)",50,240);
  text("Sonderzeichen (! , ? , § , $ , % , & , + , - , * , _ , # , < , >)",50,275);
  text("2. Zeichenanzahl wählen (Tasten [+] und [-])",10,310);
  fill(200);
  rect(25,320,40,32);
  if(mouseX>69 && mouseX<89&& mouseY>320 && mouseY<335) {
    fill(150);
  }
  else {
    fill(200);
  }
  rect(69,320,20,15);
  if(mouseX>69 && mouseX<89 && mouseY>337 && mouseY<352) {
    fill(150);
  }
  else {
    fill(200);
  }
  rect(69,337,20,15);
  fill(0);
  triangle(79,322,87,333,71,333);
  triangle(79,350,87,339,71,339);
  textAlign(RIGHT);
  text(pwlength,55,345);
  textAlign(LEFT);
  text("3. Passwort erstellen",10,380);
  if(mouseX>(250-textWidth("Zufälliges Passwort generieren")/2-10) && mouseX<(250+textWidth("Zufälliges Passwort generieren")/2+10) && mouseY>390 && mouseY<422) {
    fill(150);
  }
  else {
    fill(200);
  }
  rect(250-textWidth("Zufälliges Passwort generieren")/2-10,390,textWidth("Zufälliges Passwort generieren")+20,32);
  fill(0);
  textAlign(CENTER);
  text("Zufälliges Passwort generieren",250,415);
  textAlign(LEFT);
  text("4. Passwort überprüfen",10,450);
  textAlign(CENTER);
  text(pw[0],250,485);
  textAlign(LEFT);
  text("5. Passwort speichern",10,520);
  if(mouseX>(250-textWidth("Als Textdokument exportieren")/2-10) && mouseX<(250+textWidth("Als Textdokument exportieren")/2+10) && mouseY>530 && mouseY<562) {
    fill(150);
  }
  else {
    fill(200);
  }
  rect(250-textWidth("Als Textdokument exportieren")/2-10,530,textWidth("Als Textdokument exportieren")+20,32);
  fill(0);
  textAlign(CENTER);
  text("Als Textdokument exportieren",250,555);
  textAlign(LEFT);
  noFill();
  rect(25,120,15,15);
  rect(25,155,15,15);
  rect(25,190,15,15);
  rect(25,225,15,15);
  rect(25,260,15,15);
  if(smasel) {
    tick(130);
  }
  if(bigsel) {
    tick(165);
  }
  if(numsel) {
    tick(200);
  }
  if(gersel) {
    tick(235);
  }
  if(symsel) {
    tick(270);
  }
}

void mousePressed() {
  if(mouseX>25 && mouseX<40 && mouseY>120 && mouseY<135) {
    smasel=!smasel;
  }
  if(mouseX>25 && mouseX<40 && mouseY>155 && mouseY<170) {
    bigsel=!bigsel;
  }
  if(mouseX>25 && mouseX<40 && mouseY>190 && mouseY<205) {
    numsel=!numsel;
  }
  if(mouseX>25 && mouseX<40 && mouseY>225 && mouseY<240) {
    gersel=!gersel;
  }
  if(mouseX>25 && mouseX<40 && mouseY>260 && mouseY<275) {
    symsel=!symsel;
  }
  if(mouseX>69 && mouseX<89&& mouseY>320 && mouseY<335 && pwlength<50) {
    pwlength++;
  }
  if(mouseX>69 && mouseX<89 && mouseY>337 && mouseY<352 && pwlength>1) {
    pwlength--;
  }
  if(mouseX>(250-textWidth("Zufälliges Passwort generieren")/2-10) && mouseX<(250+textWidth("Zufälliges Passwort generieren")/2+10) && mouseY>390 && mouseY<422) {
    createPW();
  }
  if((mouseX>(250-textWidth("Als Textdokument exportieren")/2-10) && mouseX<(250+textWidth("Als Textdokument exportieren")/2+10) && mouseY>530 && mouseY<562) && !online) {
    saveStrings("Passwort.txt",pw);
  }
}

void keyPressed(){
  if(key=='+' && pwlength<50){
    pwlength++;
  }
  if(key=='-' && pwlength>1) {
    pwlength--;
  }
}

void tick(int y) {
  fill(0,150,0);
  beginShape();
  vertex(32,y+2);
  vertex(23,y-7);
  vertex(23,y-11);
  vertex(32,y-3);
  vertex(45,y-22);
  vertex(45,y-14);
  endShape();
}

void createPW(){
  pwchars=new char[0];
  if(smasel) {
    pwchars=concat(pwchars,sma);
  }
  if(bigsel) {
    pwchars=concat(pwchars,big);
  }
  if(numsel) {
    pwchars=concat(pwchars,num);
  }
  if(gersel) {
    pwchars=concat(pwchars,ger);
  }
  if(symsel) {
    pwchars=concat(pwchars,sym);
  }
  if(pwchars.length==0){
    pw[0]="[Keine Zeichensätze ausgewählt]";
  }
  else{
    pw[0]="";
    for(int i=0;i<pwlength;i++){
      pw[0]=pw[0]+pwchars[round(random(-0.5,pwchars.length+0.49-1))];
    }
  }
}


