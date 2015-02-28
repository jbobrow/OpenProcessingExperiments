
String app = "";
String app2 = "";
float numHold = 0;
float numHold2 = 0;
float numF1 = 0;
boolean isNum1Set = false;
boolean isNum2Set = false;
float numF2 = 0.0;
boolean charSet = false;
float finNum = 0;
char oprtr = '1';
char numUse = '0';
char actUse;
String numDesplay = "";
PFont f;
void setup(){
  size(450,400);
  f = loadFont("Monospaced-48.vlw");  
  textFont(f,48);
  fill(255);
  text("0",10,40);
  text("1",110,40);
  text("2",210,40);
  text("3",310,40);
  text("4",410,40);
  text("5",10,120);
  text("6",110,120);
  text("7",210,120);
  text("8",310,120);
  text("9",410,120);
  text("+",10,200);
  text("-",110,200);
  text("x",210,200);
  text("/",310,200);
  text("=",410,200);
  text("sin",10,280);
  text("cos",140,280);
  text("tan",270,280);
}
void draw(){
  fill(0);
  rectMode(CORNER);
  rect(20,300,380,75);
  fill(255);
  text(numDesplay, 30, 320, 360, 55, 2);
}
void mousePressed(){
  if(mouseX >= 0 && mouseX <= 80 && mouseY >= 0 && mouseY <= 70){
    numUse = '0';
    setNumber(numUse);
  }else if(mouseX >= 81 && mouseX <= 180 && mouseY >= 0 && mouseY <= 70){
    numUse = '1';
    setNumber(numUse);
  }else if(mouseX >= 181 && mouseX <= 280 && mouseY > 0 && mouseY <= 70){
    numUse = '2';
    setNumber(numUse);
  }else if(mouseX >= 281 && mouseX <= 380 && mouseY >= 0 && mouseY <= 70){
    numUse = '3';
    setNumber(numUse);
  }else if(mouseX >= 381 && mouseX <= 480 && mouseY >= 01 && mouseY <= 70){
    numUse = '4';
    setNumber(numUse);
  }else if(mouseX >= 0 && mouseX <= 80 && mouseY >= 71 && mouseY <= 140){
    numUse = '5';
    setNumber(numUse);
  }else if(mouseX >= 81 && mouseX <= 180 && mouseY >= 71 && mouseY <= 140){
    numUse = '6';
    setNumber(numUse);
  }else if(mouseX >= 181 && mouseX <= 280 && mouseY >= 71 && mouseY <= 140){
    numUse = '7';
    setNumber(numUse);
  }else if(mouseX >= 281 && mouseX <= 380 && mouseY >= 71 && mouseY <= 140){
    numUse = '8';
    setNumber(numUse);
  }else if(mouseX >= 381 && mouseX <= 480 && mouseY >= 71 && mouseY <= 140){
    numUse = '9';
    setNumber(numUse);
  }else if(mouseX >= 0 && mouseX <= 80 && mouseY >= 141 && mouseY <= 230){
    actUse = '+';
    setAction(actUse);
  }else if(mouseX >= 81 && mouseX <= 180 && mouseY >= 141 && mouseY <= 230){
    actUse = '-';
    setAction(actUse);
  }else if(mouseX >= 181 && mouseX <= 280 && mouseY >= 141 && mouseY <= 230){
    actUse = '*';
    setAction(actUse);
  }else if(mouseX >= 281 && mouseX <= 380 && mouseY >= 141 && mouseY <= 230){
    actUse = '/';
    setAction(actUse);
  }else if(mouseX >= 381 && mouseX <= 480 && mouseY >= 141 && mouseY <= 230){
    doTheMath();
  }else if(mouseX >= 0 && mouseX <= 120 && mouseY >= 231 && mouseY <= 290){
    actUse = 's';
    setAction(actUse);
  }else if(mouseX >= 121 && mouseX <= 250 && mouseY >= 231 && mouseY <= 290){
    actUse = 'c';
    setAction(actUse);
  }else if(mouseX >= 251 && mouseX <= 380 && mouseY >= 231 && mouseY <= 290){
    actUse = 't';
    setAction(actUse);
  }
}
void keyPressed(){
 //println(key);
 switch(key) {
    case'1':case'2':case'3':case'4':case'5':case'6':case'7':case'8':case'9':case'0':
     setNumber(key);
     break;
    case'+':case'-':case'*':case'/':
     setAction(key);
     break;
    case'c':case's':case't':
      setAction(key);
      break;
    case'=':
     doTheMath();
     break;
    case'q':
      clearAll();
      break;
    default:
     println("no not that one");
 }
}
void setNumber (char numS) {
  if( isNum1Set == false ) {
    //number 1
    char data1[] = {numS};
    String str1 = app + new String(data1);
    //println("the number enterned is " + str1);
    app = str1;
    numHold = float(app);
    numF1 = numHold;
    numDesplay = Float.toString(numF1);
    println("1");
  } else {
   //number 2
   if (numF2 == 0.0){
     println(app2);
     app2 = "0";
   }else {
     //app2 = Float.toString(numF2);
   }
   char data2[] = {numS};
   println(app2);
   String str2 = app2 + new String(data2);
   println(app2);
   app2 = str2;
   println(app2);
   numHold2 = float(app2);
   numF2 = numHold2;
   numDesplay = Float.toString(numF2);
   println(numF2);
   isNum2Set=true;
  }   
}

void setAction (char opS) {
  charSet = true;
  oprtr = opS;
  char data3[] = {oprtr};
  String tester = new String(data3);
  isNum1Set = true;
  numDesplay =  Float.toString(numF1);
  doTheMath();
  numF2 = 0;
}
void doTheMath () {
  if((isNum1Set==true)&&(isNum2Set==true)){
    switch(oprtr) {
      case'+':
        numF1 = (numF1 + numF2);
        break;
      case'-':
        numF1 = (numF1 - numF2);
        break;
      case'*':
        numF1 = (numF1 * numF2);
        break;
      case'/':
        numF1 = (numF1 / numF2);
        break;
      case'c':
        numF1 = cos(dToR());
        break;
      case't':
        numF1 = tan(dToR());
        break;
      case's': 
        numF1 = sin(dToR());
        break;
      default:
        numF1 = numF1;
    }
  showNum(numF1);
  isNum1Set = true;
  isNum2Set = true;
  }
}
void showNum (Float sNum) {
  numDesplay = Float.toString(sNum);
}
float dToR () {
  float deg = numF1;
  float rad = radians(deg); 
  return rad;
}
void clearAll() {
  numF1 = 0;
  isNum1Set = false;
  numF2 = 0;
  charSet = false;
}

