
Char57[] c57;
int mode;//mode 0:square dot  1:round dot  2:line  3:smooth
int buttonIndex;
String allChar = "                                 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ";

color charColor,normalColor,selected,undecided,decided,functionColor;
int nowChar;
String glovalStr;
void setup()
{
  int i,j;
  size(500,500);
  background(255);
  smooth();
    
  c57 = new Char57[256];
  for(i=0;i<256;i++){
    c57[i] = new Char57();
  }
  mode = 1;
  buttonIndex = 0;
  
  normalColor    = color(255,127,  0);
  selected  = color(127,  0,  0);
  functionColor  = color(195,195,195);
  undecided = normalColor;
  decided   = selected;
  charColor = normalColor;
  nowChar = 'A';
  
  glovalStr = "Hello World!";
  
  makeFontData();

}



//-----
void draw()
{
  int i;
  int charNum;
  
  background(255);
  
  charNum = 16*int((mouseY-180)/36)+int((mouseX-50)/25);
  
  if(33<=charNum && charNum<=126){
    nowChar = charNum;
  }else{
    nowChar = 32;
  }
  
  
  charColor = normalColor;
  if(12<glovalStr.length()){
    drawString(glovalStr,mode,50,50,400);
  }else{
    drawString(glovalStr,mode,width/2-16*glovalStr.length(),50,32*glovalStr.length());
  }
  charColor = normalColor;
  
  drawButton();

 
  switch(mode){
    case 0://square dot
      for(i=33;i<127;i++){
        if(i==nowChar){
          charColor = selected;
        }else{
          charColor = normalColor;
        }
        c57[i].drawCharBox((i % 16)*25+50,180+int(i/16)*36,20);
      }
      charColor = undecided;
      c57[nowChar].drawCharBox(50,120,80);
      break;
    
    case 1://round dot
      for(i=33;i<127;i++){
        if(i==nowChar){
          charColor = selected;
        }else{
          charColor = normalColor;
        }
        c57[i].drawCharDot((i % 16)*25+50,180+int(i/16)*36,20);
      }
      charColor = undecided;
      c57[nowChar].drawCharDot(50,120,80);
      break;
   
   case 2://line 
      for(i=33;i<127;i++){
        if(i==nowChar){
          charColor = selected;
        }else{
          charColor = normalColor;
        }
        c57[i].drawCharLine((i % 16)*25+50,180+int(i/16)*36,20);
      }
      charColor = undecided;
      c57[nowChar].drawCharLine(50,120,80);
      break;
   
   case 3://smooth 
      for(i=33;i<127;i++){
        if(i==nowChar){
          charColor = selected;
        }else{
          charColor = normalColor;
        }
        c57[i].drawCharSmooth((i % 16)*25+50,180+int(i/16)*36,20);
      }
      charColor = undecided;
      c57[nowChar].drawCharSmooth(50,120,80);
      break;
  }
}

void keyPressed()
{
  if(32<=key && key<=126){
    glovalStr = glovalStr + allChar.charAt(key);
  }
  if(key == CODED){
    if(keyCode == UP){
      if(mode<3){
        mode++;
      }else{
        mode = 0;
      }
    }
    if(keyCode == DOWN){
      if(0<mode){
        mode--;
      }else{
        mode = 3;
      }
    }
    if(keyCode == RIGHT){
      if(nowChar<127){
        nowChar++;
      }else{
        nowChar = 33;
      }
    }
    if(keyCode == LEFT){
      if(33<nowChar){
        nowChar--;
      }else{
        nowChar = 126;
      }
    }
  }
  
  if(keyCode == DELETE){
    if(0<glovalStr.length()){
      glovalStr = glovalStr.substring(0,glovalStr.length()-1);
    }
  }
  
  if(keyCode == BACKSPACE){
    if(0<glovalStr.length()){
      glovalStr = glovalStr.substring(0,glovalStr.length()-1);
    }
  }
}

void mouseClicked()
{
  if(33<=nowChar && nowChar<=126){
    glovalStr = glovalStr + allChar.charAt(nowChar);
  }
  
  switch(buttonIndex){
    case 1:
      mode = 0;
      break;
    case 2:
      mode = 1;
      break;
    case 3:
      mode = 2;
      break;
    case 4:
      mode = 3;
      break;
    case 5:
      glovalStr = glovalStr + ' ';
      break;
    case 6:
      if(0<glovalStr.length()){
        glovalStr = glovalStr.substring(0,glovalStr.length()-1);
      }
      break;
  }
}

void drawButton()
{
  buttonIndex = 0;
  onRect(1,300,120,30,30);
  drawString("A",0,308,124,16);
  onRect(2,340,120,30,30);
  drawString("A",1,348,124,16);
  onRect(3,380,120,30,30);
  drawString("A",2,388,124,16);
  onRect(4,420,120,30,30);
  drawString("A",3,428,124,16);
  onRect(5,300,160,150,30);
  drawString("SPACE",mode,324,164,96);
  onRect(6,300,200,150,30);
  drawString("DELETE",mode,316,204,116);
  charColor = normalColor;
}

void onRect(int bi,float x,float y,float w,float h)
{
  if(x < mouseX && mouseX < x+w && y < mouseY && mouseY < y+h){
    charColor = selected;
    buttonIndex = bi;
  }else{
    charColor = functionColor;
  }
  noFill();
  stroke(charColor);
  strokeWeight(2);
  rect(x,y,w,h);
}
//---------------------------------------------




void drawString(String str,int mode,float x,float y,float strW)
{
  int i,index;
  float charW = strW/(str.length()+0.25*(str.length()-1));
  
  switch(mode){
    case 0://square dot
      for(i=0;i<str.length();i++){
        index = charNumAt(str,i);
        c57[index].drawCharBox(x+i*(1.25*charW),y,charW);
      }
      break;
      
    case 1://round dot
      for(i=0;i<str.length();i++){
        index = charNumAt(str,i);
        c57[index].drawCharDot(x+i*(1.25*charW),y,charW);
      }
      break;
      
     case 2://line 
      for(i=0;i<str.length();i++){
        index = charNumAt(str,i);
        c57[index].drawCharLine(x+i*(1.25*charW),y,charW);
      }
      break;
      
    case 3://smooth 
      for(i=0;i<str.length();i++){
        index = charNumAt(str,i);
        c57[index].drawCharSmooth(x+i*(1.25*charW),y,charW);
      }
      break;
  }
}

//this HENTAI function is same to int( str.charAt(index) )
//but this expression.
//Is this BUG of processing.js?
int charNumAt(String str, int index)
{ 
  
   if(" ".charAt(0) == str.charAt(index)) {
     return 32;
   }
   if("!".charAt(0) == str.charAt(index)){
     return 33;
   }
   if("\"".charAt(0) == str.charAt(index)){
     return 34;
   }
   if("#".charAt(0) == str.charAt(index)){
     return 35;
   }
   if("$".charAt(0) == str.charAt(index)){
     return 36;
   }
   if("%".charAt(0) == str.charAt(index)){
     return 37;
   }
   if("&".charAt(0) == str.charAt(index)){
     return 38;
   }
   if("'".charAt(0) == str.charAt(index)){
     return 39;
   }
   if("(".charAt(0) == str.charAt(index)){
     return 40;
   }
   if(")".charAt(0) == str.charAt(index)){
     return 41;
   }
   if("*".charAt(0) == str.charAt(index)){
     return 42;
   }
   if("+".charAt(0) == str.charAt(index)){
     return 43;
   }
   if(",".charAt(0) == str.charAt(index)){
     return 44;
   }
   if("-".charAt(0) == str.charAt(index)){
     return 45;
   }
   if(".".charAt(0) == str.charAt(index)){
     return 46;
   }
   if("/".charAt(0) == str.charAt(index)){
     return 47;
   }
   if("0".charAt(0) == str.charAt(index)){
     return 48;
   }
   if("1".charAt(0) == str.charAt(index)){
     return 49;
   }
   if("2".charAt(0) == str.charAt(index)){
     return 50;
   }
   if("3".charAt(0) == str.charAt(index)){
     return 51;
   }
   if("4".charAt(0) == str.charAt(index)){
     return 52;
   }
   if("5".charAt(0) == str.charAt(index)){
     return 53;
   }
   if("6".charAt(0) == str.charAt(index)){
     return 54;
   }
   if("7".charAt(0) == str.charAt(index)){
     return 55;
   }
  
   if("8".charAt(0) == str.charAt(index)){
     return 56;
   }
   if("9".charAt(0) == str.charAt(index)){
     return 57;
   }
   if(":".charAt(0) == str.charAt(index)){
     return 58;
   }
   if(";".charAt(0) == str.charAt(index)){
     return 59;
   }
   if("<".charAt(0) == str.charAt(index)){
     return 60;
   }
   if("=".charAt(0) == str.charAt(index)){
     return 61;
   }
   if(">".charAt(0) == str.charAt(index)){
     return 62;
   }
   if("?".charAt(0) == str.charAt(index)){
     return 63;
   }
   if("@".charAt(0) == str.charAt(index)){
     return 64;
   }
   if("A".charAt(0) == str.charAt(index)){
     return 65;
   }
   if("B".charAt(0) == str.charAt(index)){
     return 66;
   }
   if("C".charAt(0) == str.charAt(index)){
     return 67;
   }
   if("D".charAt(0) == str.charAt(index)){
     return 68;
   }
   if("E".charAt(0) == str.charAt(index)){
     return 69;
   }
   if("F".charAt(0) == str.charAt(index)){
     return 70;
   }
   if("G".charAt(0) == str.charAt(index)){
     return 71;
   }
   if("H".charAt(0) == str.charAt(index)){
     return 72;
   }
   if("I".charAt(0) == str.charAt(index)){
     return 73;
   }
   if("J".charAt(0) == str.charAt(index)){
     return 74;
   }
   if("K".charAt(0) == str.charAt(index)){
     return 75;
   }
   if("L".charAt(0) == str.charAt(index)){
     return 76;
   }
   if("M".charAt(0) == str.charAt(index)){
     return 77;
   }
   if("N".charAt(0) == str.charAt(index)){
     return 78;
   }
   if("O".charAt(0) == str.charAt(index)){
     return 79;
   }
  
   if("P".charAt(0) == str.charAt(index)) {
     return 80;
   }
   if("Q".charAt(0) == str.charAt(index)) {
     return 81;
   }
   if("R".charAt(0) == str.charAt(index)) {
     return 82;
   }
   if("S".charAt(0) == str.charAt(index)) {
     return 83;
   }
   if("T".charAt(0) == str.charAt(index)) {
     return 84;
   }
   if("U".charAt(0) == str.charAt(index)) {
     return 85;
   }
   if("V".charAt(0) == str.charAt(index)) {
     return 86;
   }
   if("W".charAt(0) == str.charAt(index)) {
     return 87;
   }
   if("X".charAt(0) == str.charAt(index)) {
     return 88;
   }
   if("Y".charAt(0) == str.charAt(index)) {
     return 89;
   }
   if("Z".charAt(0) == str.charAt(index)) {
     return 90;
   }
   if("[".charAt(0) == str.charAt(index)) {
     return 91;
   }
   if("\\".charAt(0) == str.charAt(index)){
     return 92;
   }
   if("]".charAt(0) == str.charAt(index)){
     return 93;
   }
   if("^".charAt(0) == str.charAt(index)){
     return 94;
   }
   if("_".charAt(0) == str.charAt(index)){
     return 95;
   }
   if("`".charAt(0) == str.charAt(index)){
     return 96;
   }
   if("a".charAt(0) == str.charAt(index)){
     return 97;
   }
   if("b".charAt(0) == str.charAt(index)){
     return 98;
   }
   if("c".charAt(0) == str.charAt(index)){
     return 99;
   }
   if("d".charAt(0) == str.charAt(index)){
     return 100;
   }
   if("e".charAt(0) == str.charAt(index)){
     return 101;
   }
   if("f".charAt(0) == str.charAt(index)){
     return 102;
   }
   if("g".charAt(0) == str.charAt(index)){
     return 103;
   }
   
  
   if("h".charAt(0) == str.charAt(index)) {
     return 104;
   }
   if("i".charAt(0) == str.charAt(index)) {
     return 105;
   }
   if("j".charAt(0) == str.charAt(index)) {
     return 106;
   }
   if("k".charAt(0) == str.charAt(index)) {
     return 107;
   }
   if("l".charAt(0) == str.charAt(index)) {
     return 108;
   }
   if("m".charAt(0) == str.charAt(index)) {
     return 109;
   }
   if("n".charAt(0) == str.charAt(index)) {
     return 110;
   }
   if("o".charAt(0) == str.charAt(index)) {
     return 111;
   }
   if("p".charAt(0) == str.charAt(index)) {
     return 112;
   }
   if("q".charAt(0) == str.charAt(index)) {
     return 113;
   }
   if("r".charAt(0) == str.charAt(index)) {
     return 114;
   }
   if("s".charAt(0) == str.charAt(index)) {
     return 115;
   }
   if("t".charAt(0) == str.charAt(index)) {
     return 116;
   }
   if("u".charAt(0) == str.charAt(index)) {
     return 117;
   }
   if("v".charAt(0) == str.charAt(index)) {
     return 118;
   }
   if("w".charAt(0) == str.charAt(index)) {
     return 119;
   }
   if("x".charAt(0) == str.charAt(index)) {
     return 120;
   }
   if("y".charAt(0) == str.charAt(index)) {
     return 121;
   }
   if("z".charAt(0) == str.charAt(index)) {
     return 122;
   }
   if("{".charAt(0) == str.charAt(index)) {
     return 123;
   }
   if("|".charAt(0) == str.charAt(index)) {
     return 124;
   }
   if("}".charAt(0) == str.charAt(index)) {
     return 125;
   }
   if("~".charAt(0) == str.charAt(index)) {
     return 126;
   }
  
   return 0;
}


void setChar57(int index,String[] s) //s:array num=7   string length=5
{
  int i,j,v;
  int[] d = new int[5];
  
  for(i=0;i<5;i++){
    for(j=0;j<7;j++){
      if(s[j].charAt(i) == "0".charAt(0)){
        c57[index].dotData[i][j] = 1;
        stroke(0);
      }
    }
  }
}


void makeFontData()
{
  //dot char is '0'
  int i;
  String[] s = new String[7];
  
  s[0] = "_____" ;
  s[1] = "_____" ;
  s[2] = "_____" ;
  s[3] = "_____" ;
  s[4] = "_____" ;
  s[5] = "_____" ;
  s[6] = "_____" ;
  
  for(i=0;i<=32;i++){
    setChar57(i,s);
    
  }
  
  for(i=127;i<256;i++){
    setChar57(i,s);
  }
  
  for(i=33;i<=126;i++){
    switch(i){
      case  33://!
        s[0] = "__0__" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "_____" ;
        s[6] = "__0__" ;
        break;
      case  34://"
        s[0] = "_0_0_" ;
        s[1] = "_0_0_" ;
        s[2] = "_0_0_" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  35://#
        s[0] = "_0_0_" ;
        s[1] = "_0_0_" ;
        s[2] = "00000" ;
        s[3] = "_0_0_" ;
        s[4] = "00000" ;
        s[5] = "_0_0_" ;
        s[6] = "_0_0_" ;
        break;
      case  36://$
        s[0] = "__0__" ;
        s[1] = "_0000" ;
        s[2] = "0_0__" ;
        s[3] = "_000_" ;
        s[4] = "__0_0" ;
        s[5] = "0000_" ;
        s[6] = "__0__" ;
        break;
      case  37://%
        s[0] = "00__0" ;
        s[1] = "00_0_" ;
        s[2] = "___0_" ;
        s[3] = "__0__" ;
        s[4] = "_0___" ;
        s[5] = "_0_00" ;
        s[6] = "0__00" ;
        break;
      case  38://&
        s[0] = "_00__" ;
        s[1] = "0__0_" ;
        s[2] = "0__0_" ;
        s[3] = "_00__" ;
        s[4] = "0__00" ;
        s[5] = "0__0_" ;
        s[6] = "_00_0" ;
        break;
      case  39://'
        s[0] = "__0__" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  40://(
        s[0] = "__0__" ;
        s[1] = "_0___" ;
        s[2] = "0____" ;
        s[3] = "0____" ;
        s[4] = "0____" ;
        s[5] = "_0___" ;
        s[6] = "__0__" ;
        break;
      case  41://)
        s[0] = "__0__" ;
        s[1] = "___0_" ;
        s[2] = "____0" ;
        s[3] = "____0" ;
        s[4] = "____0" ;
        s[5] = "___0_" ;
        s[6] = "__0__" ;
        break;
      case  42://*
        s[0] = "__0__" ;
        s[1] = "0_0_0" ;
        s[2] = "_000_" ;
        s[3] = "0_0_0" ;
        s[4] = "__0__" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  43://+
        s[0] = "_____" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "00000" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "_____" ;
        break;
      case  44://,
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_____" ;
        s[3] = "_00__" ;
        s[4] = "_00__" ;
        s[5] = "__0__" ;
        s[6] = "_0___" ;
        break;
      case  45://-
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_____" ;
        s[3] = "00000" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  46://.
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_____" ;
        s[3] = "_00__" ;
        s[4] = "_00__" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  47:///
        s[0] = "____0" ;
        s[1] = "___0_" ;
        s[2] = "___0_" ;
        s[3] = "__0__" ;
        s[4] = "_0___" ;
        s[5] = "_0___" ;
        s[6] = "0____" ;
        break;
      case  48://0
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0__00" ;
        s[3] = "0_0_0" ;
        s[4] = "00__0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  49://1
        s[0] = "__0__" ;
        s[1] = "_00__" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "_000_" ;
        break;
      case  50://2
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "___0_" ;
        s[4] = "__0__" ;
        s[5] = "_0___" ;
        s[6] = "00000" ;
        break;
      case  51://3
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "____0" ;
        s[3] = "_000_" ;
        s[4] = "____0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  52://4
        s[0] = "___0_" ;
        s[1] = "__00_" ;
        s[2] = "_0_0_" ;
        s[3] = "0__0_" ;
        s[4] = "00000" ;
        s[5] = "___0_" ;
        s[6] = "___0_" ;
        break;
      case  53://5
        s[0] = "00000" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "____0" ;
        s[5] = "____0" ;
        s[6] = "0000_" ;
        break;
      case  54://6
        s[0] = "__00_" ;
        s[1] = "_0___" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  55://7
        s[0] = "00000" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "___0_" ;
        s[4] = "___0_" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case  56://8
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "_000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  57://9
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "_0000" ;
        s[4] = "____0" ;
        s[5] = "___0_" ;
        s[6] = "_00__" ;
        break;
      case  58://:
        s[0] = "_____" ;
        s[1] = "_00__" ;
        s[2] = "_00__" ;
        s[3] = "_____" ;
        s[4] = "_00__" ;
        s[5] = "_00__" ;
        s[6] = "_____" ;
        break;
      case  59://;
        s[0] = "_00__" ;
        s[1] = "_00__" ;
        s[2] = "_____" ;
        s[3] = "_00__" ;
        s[4] = "_00__" ;
        s[5] = "__0__" ;
        s[6] = "_0___" ;
        break;
      case  60://<
        s[0] = "___0_" ;
        s[1] = "__0__" ;
        s[2] = "_0___" ;
        s[3] = "0____" ;
        s[4] = "_0___" ;
        s[5] = "__0__" ;
        s[6] = "___0_" ;
        break;
      case  61://=
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "00000" ;
        s[3] = "_____" ;
        s[4] = "00000" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  62://>
        s[0] = "_0___" ;
        s[1] = "__0__" ;
        s[2] = "___0_" ;
        s[3] = "____0" ;
        s[4] = "___0_" ;
        s[5] = "__0__" ;
        s[6] = "_0___" ;
        break;
      case  63://?
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "___0_" ;
        s[4] = "__0__" ;
        s[5] = "_____" ;
        s[6] = "__0__" ;
        break;
      case  64://@
        s[0] = "__00_" ;
        s[1] = "_0__0" ;
        s[2] = "0__00" ;
        s[3] = "0_0_0" ;
        s[4] = "0_0_0" ;
        s[5] = "0_0_0" ;
        s[6] = "_0_00" ;
        break;
      case  65://A
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "00000" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case  66://B
        s[0] = "0000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0000_" ;
        break;
      case  67://C
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0____" ;
        s[3] = "0____" ;
        s[4] = "0____" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  68://D
        s[0] = "000__" ;
        s[1] = "0__0_" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0__0_" ;
        s[6] = "000__" ;
        break;
      case  69://E
        s[0] = "00000" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "00000" ;
        break;
      case  70://F
        s[0] = "00000" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "0____" ;
        break;
      case  71://G
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0____" ;
        s[3] = "0__00" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  72://H
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "00000" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case  73://I
        s[0] = "_000_" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "_000_" ;
        break;
      case  74://J
        s[0] = "____0" ;
        s[1] = "____0" ;
        s[2] = "____0" ;
        s[3] = "____0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  75://K
        s[0] = "0___0" ;
        s[1] = "0__0_" ;
        s[2] = "0_0__" ;
        s[3] = "00___" ;
        s[4] = "0_0__" ;
        s[5] = "0__0_" ;
        s[6] = "0___0" ;
        break;
      case  76://L
        s[0] = "0____" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0____" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "00000" ;
        break;
      case  77://M
        s[0] = "0___0" ;
        s[1] = "00_00" ;
        s[2] = "0_0_0" ;
        s[3] = "0_0_0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case  78://N
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "00__0" ;
        s[3] = "0_0_0" ;
        s[4] = "0__00" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case  79://O
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  80://P
        s[0] = "0000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0000_" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "0____" ;
        break;
      case  81://Q
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0_0_0" ;
        s[5] = "0__0_" ;
        s[6] = "_00_0" ;
        break;
      case  82://R
        s[0] = "0000_" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case  83://S
        s[0] = "_000_" ;
        s[1] = "0___0" ;
        s[2] = "0____" ;
        s[3] = "_000_" ;
        s[4] = "____0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  84://T
        s[0] = "00000" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case  85://U
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case  86://V
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "_0_0_" ;
        s[6] = "__0__" ;
        break;
      case  87://W
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "0_0_0" ;
        s[3] = "0_0_0" ;
        s[4] = "0_0_0" ;
        s[5] = "0_0_0" ;
        s[6] = "_0_0_" ;
        break;
      case  88://X
        s[0] = "0___0" ;
        s[1] = "_0_0_" ;
        s[2] = "_0_0_" ;
        s[3] = "__0__" ;
        s[4] = "_0_0_" ;
        s[5] = "_0_0_" ;
        s[6] = "0___0" ;
        break;
      case  89://Y
        s[0] = "0___0" ;
        s[1] = "0___0" ;
        s[2] = "_0_0_" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case  90://Z
        s[0] = "00000" ;
        s[1] = "____0" ;
        s[2] = "___0_" ;
        s[3] = "__0__" ;
        s[4] = "_0___" ;
        s[5] = "0____" ;
        s[6] = "00000" ;
        break;
      case  91://[
        s[0] = "000__" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0____" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "000__" ;
        break;
      case  92://\
        s[0] = "0____" ;
        s[1] = "_0___" ;
        s[2] = "_0___" ;
        s[3] = "__0__" ;
        s[4] = "___0_" ;
        s[5] = "___0_" ;
        s[6] = "____0" ;
        break;
      case  93://]
        s[0] = "__000" ;
        s[1] = "____0" ;
        s[2] = "____0" ;
        s[3] = "____0" ;
        s[4] = "____0" ;
        s[5] = "____0" ;
        s[6] = "__000" ;
        break;
      case  94://^
        s[0] = "__0__" ;
        s[1] = "_0_0_" ;
        s[2] = "0___0" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  95://_
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_____" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "00000" ;
        break;
      case  96://`
        s[0] = "_0___" ;
        s[1] = "__0__" ;
        s[2] = "___0_" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
      case  97://a
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_000_" ;
        s[3] = "____0" ;
        s[4] = "_0000" ;
        s[5] = "0___0" ;
        s[6] = "_0000" ;
        break;
      case  98://b
        s[0] = "0____" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0000_" ;
        break;
      case  99://c
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_0000" ;
        s[3] = "0____" ;
        s[4] = "0____" ;
        s[5] = "0____" ;
        s[6] = "_0000" ;
        break;
      case 100://d
        s[0] = "____0" ;
        s[1] = "____0" ;
        s[2] = "____0" ;
        s[3] = "_0000" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_0000" ;
        break;
      case 101://e
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_000_" ;
        s[3] = "0___0" ;
        s[4] = "00000" ;
        s[5] = "0____" ;
        s[6] = "_0000" ;
        break;
      case 102://f
        s[0] = "___00" ;
        s[1] = "__0__" ;
        s[2] = "00000" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case 103://g
        s[0] = "_____" ;
        s[1] = "____0" ;
        s[2] = "_00_0" ;
        s[3] = "0___0" ;
        s[4] = "_0000" ;
        s[5] = "____0" ;
        s[6] = "0000_" ;
        break;
      case 104://h
        s[0] = "0____" ;
        s[1] = "0____" ;
        s[2] = "0____" ;
        s[3] = "0000_" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case 105://i
        s[0] = "__0__" ;
        s[1] = "_____" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case 106://j
        s[0] = "___0_" ;
        s[1] = "_____" ;
        s[2] = "___0_" ;
        s[3] = "___0_" ;
        s[4] = "___0_" ;
        s[5] = "0__0_" ;
        s[6] = "_00__" ;
        break;
      case 107://k
        s[0] = "0____" ;
        s[1] = "0____" ;
        s[2] = "0__0_" ;
        s[3] = "0_0__" ;
        s[4] = "00___" ;
        s[5] = "0_0__" ;
        s[6] = "0__0_" ;
        break;
      case 108://l
        s[0] = "_0___" ;
        s[1] = "_0___" ;
        s[2] = "_0___" ;
        s[3] = "_0___" ;
        s[4] = "_0___" ;
        s[5] = "_0___" ;
        s[6] = "__00_" ;
        break;
      case 109://m
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "00_0_" ;
        s[3] = "0_0_0" ;
        s[4] = "0_0_0" ;
        s[5] = "0_0_0" ;
        s[6] = "0_0_0" ;
        break;
      case 110://n
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0000_" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "0___0" ;
        break;
      case 111://o
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_000_" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_000_" ;
        break;
      case 112://p
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0_00_" ;
        s[3] = "0___0" ;
        s[4] = "0000_" ;
        s[5] = "0____" ;
        s[6] = "0____" ;
        break;
      case 113://q
        s[0] = "_____" ;
        s[1] = "____0" ;
        s[2] = "_00_0" ;
        s[3] = "0___0" ;
        s[4] = "_0000" ;
        s[5] = "____0" ;
        s[6] = "____0" ;
        break;
      case 114://r
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_0_00" ;
        s[3] = "_00__" ;
        s[4] = "_0___" ;
        s[5] = "_0___" ;
        s[6] = "_0___" ;
        break;
      case 115://s
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "_0000" ;
        s[3] = "0____" ;
        s[4] = "_000_" ;
        s[5] = "____0" ;
        s[6] = "0000_" ;
        break;
      case 116://t
        s[0] = "__0__" ;
        s[1] = "__0__" ;
        s[2] = "00000" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "___00" ;
        break;
      case 117://u
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "0___0" ;
        s[6] = "_0000" ;
        break;
      case 118://v
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "0___0" ;
        s[5] = "_0_0_" ;
        s[6] = "__0__" ;
        break;
      case 119://w
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0___0" ;
        s[3] = "0_0_0" ;
        s[4] = "0_0_0" ;
        s[5] = "0_0_0" ;
        s[6] = "_0_0_" ;
        break;
      case 120://x
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "0___0" ;
        s[3] = "_0_0_" ;
        s[4] = "__0__" ;
        s[5] = "_0_0_" ;
        s[6] = "0___0" ;
        break;
      case 121://y
        s[0] = "_____" ;
        s[1] = "0___0" ;
        s[2] = "0___0" ;
        s[3] = "0___0" ;
        s[4] = "_0000" ;
        s[5] = "___0_" ;
        s[6] = "000__" ;
        break;
      case 122://z
        s[0] = "_____" ;
        s[1] = "_____" ;
        s[2] = "00000" ;
        s[3] = "___0_" ;
        s[4] = "__0__" ;
        s[5] = "_0___" ;
        s[6] = "00000" ;
        break;
      case 123://{
        s[0] = "__00_" ;
        s[1] = "_0___" ;
        s[2] = "_0___" ;
        s[3] = "0____" ;
        s[4] = "_0___" ;
        s[5] = "_0___" ;
        s[6] = "__00_" ;
        break;
      case 124://|
        s[0] = "__0__" ;
        s[1] = "__0__" ;
        s[2] = "__0__" ;
        s[3] = "__0__" ;
        s[4] = "__0__" ;
        s[5] = "__0__" ;
        s[6] = "__0__" ;
        break;
      case 125://}
        s[0] = "_00__" ;
        s[1] = "___0_" ;
        s[2] = "___0_" ;
        s[3] = "____0" ;
        s[4] = "___0_" ;
        s[5] = "___0_" ;
        s[6] = "_00__" ;
        break;
      case 126://~
        s[0] = "_____" ;
        s[1] = "_00__" ;
        s[2] = "0__00" ;
        s[3] = "_____" ;
        s[4] = "_____" ;
        s[5] = "_____" ;
        s[6] = "_____" ;
        break;
        
    }
    setChar57(i,s);
  }
}


class Char57
{
  int i,j;
  int[][] dotData;
  Char57()
  {
    dotData  = new int[5][7];
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        dotData[i][j] = 0;
      }
    }
  }
  
  boolean getDotBit(int i,int j)
  {
    int dd = dotData[i][j];
    if(dd == 1){
      return true;
    }else{
      return false;
    }
  }
  
  void drawCharDot(float x,float y,float charW)
  {
    int i,j;
    float w = charW/5;
    
    noStroke();
    fill(charColor);
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        if(dotData[i][j] == 1){
          ellipse(x+i*w+0.2*w+1,y+j*w+0.2*w+1,0.8*w,0.8*w);
        } 
      }
    }
  }
  
  void drawCharBox(float x,float y,float charW)
  {
    int i,j;
    float w = charW/5;
    
    noStroke();
    fill(charColor);
    
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        if(dotData[i][j] == 1){
          rect(x+i*w,y+j*w,w,w);
        }
      }
    }
  }
  
  void drawCharLine(float x,float y,float charW)
  {
    int i,j;
    float w = charW/5;
    
    stroke(charColor);
    strokeWeight(0.5*w);
    noFill();
    
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        if(dotData[i][j] == 1){
          line(x+i*w+0.2*w,y+j*w+w/2,x+i*w+0.8*w,y+j*w+w/2);
          if(i<5-1 && dotData[i+1][j] == 1){
              line(x+i*w+w/2,y+j*w+w/2,x+(i+1)*w+w/2,y+(j)*w+w/2);
          }
        }
      }
    }
  }
  
  void drawCharSmooth(float x,float y,float charW)
  {
    int i,j;
    float w = charW/5;
    
    stroke(charColor);
    strokeWeight(0.8*w);
    noFill();
    
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        if(dotData[i][j] == 1 ){
          line(x+i*w+w/2,y+j*w+w/2,x+i*w+w/2,y+j*w+w/2);
          if(j<7-1 && dotData[i][j+1] == 1 ){
            line(x+i*w+w/2,y+j*w+w/2,x+(i)*w+w/2,y+(j+1)*w+w/2);
          }
          if(i<5-1){
            if(dotData[i+1][j] == 1 ){
              line(x+i*w+w/2,y+j*w+w/2,x+(i+1)*w+w/2,y+(j)*w+w/2);
            }else{
              if(0<j && dotData[i+1][j-1] == 1  && dotData[i][j-1] == 0 ){
                line(x+i*w+w/2,y+j*w+w/2,x+(i+1)*w+w/2,y+(j-1)*w+w/2);
              }
              if(j<7-1 && dotData[i+1][j+1] == 1  && dotData[i][j+1] == 0 ){
                line(x+i*w+w/2,y+j*w+w/2,x+(i+1)*w+w/2,y+(j+1)*w+w/2);
              }
            }
          }
        }
      }
    }
  }

}
