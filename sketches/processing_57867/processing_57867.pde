
/**
 *    Tiny processing interpreter for Brainfuck language, by kof 2012
 */

int stackLength = 16;
int [] dataTape = new int[stackLength];
char [] codeTape = new char[300];
int mem;
String console = "";


int [] inputData = {
  1, 2, 3, 4, 5
};
int inputCarret = 0;

int editCarret = 0;
int lnCarret = 0;

boolean paused = true;

int speed = 2;

int codelen;

ArrayList code;
int currentLine = 0;

String helloWorld = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>.";
String custom = "++++++[>++++++++++<-]++++++++[>+<-]>.+.++++++++.++.>>+++[>++++++++++<-]>++.>++++++[>+++++++++++<-]>.>++++++++[>+++++++++++<-]>+.<<<<.>>>>>+++++++[>+++++++++++<-]>--.++++.---------.<<<<<<.+.<++++++++++.";
int dataCarret = 0;
int codeCarret = 0;

void setup() {
  size(340, 340, P2D);
  textFont(loadFont("65Amagasaki-8.vlw"));
  textMode(SCREEN);

  eraseCode();
  setCode(custom);

  codelen = getLastSymbol();

  code = new ArrayList();
  code.add("\r");
}

void setCode(String _input) {
  for (int i =0 ; i < _input.length();i++) {
    codeTape[i] = _input.charAt(i);
  }
}

void eraseCode() {
  for (int i =0 ; i < codeTape.length;i++)
    codeTape[i]=' ';
}

void draw() {
  background(255);

  ////////////////////
  // debugger       //
  ////////////////////
  int y = 20;
  int x = 10;

  stroke(0);

  for (int i = 0 ; i < dataTape.length;i++) {

    if (i==dataCarret) {

      fill(#FFCC00);
      rect(x-2, y+2, 20, -10);
    }
    fill(0);

    text(dataTape[i], x, y);
    x += 20;

    if (x>width-20) {
      x=10;
      y+=10;
    }
  }


  stroke(0, 80);
  line(10, y, width-10, y);

  x=5;
  y+=20;


  for (int i = 0 ; i < codelen;i++) {

    if (i==codeCarret) {
      fill(#FFCC00);
      stroke(0);
      rect(x+5, y-8, 8, 10);
    }

    fill(0);
    x+=7;
    text(codeTape[i], x, y);
    if (x>width-20) {
      y+=10; 
      x=5;
    }
  }

  y+=10;
  stroke(0, 80);
  line(10, y, width-10, y);
  y+=20;

  ////////////////////
  // editor         //
  ////////////////////
  fill(0);
  for (int i = 0 ; i < code.size();i++) {
    String line = (String)code.get(i);

    if (lnCarret==i) {
      fill(0);
      text(line.substring(0, constrain(editCarret+1, 0, line.length())), 10, 8*i+y);
      fill(255, 0, 0);
      text("|");
      fill(0);
      text(line.substring(constrain(editCarret+1, 0, line.length()), line.length()));
    }
    else {

      text(line, 10, 8*i+y);
    }
  }


  //text("|");
  noStroke();


  ////////////////////
  // console         //
  ////////////////////

  y+= 100;

  fill(0);
  text("console:", 10, y-2);
  rect(5, y, width-10, height-y-5);
  fill(255);

  y+=5;
  text(console, 10, y, width-10, height-y-10);

  //if (!paused) {

  if (frameCount%speed==0) {
    compile(codeCarret);    
    //codeCarret++;
   // if (codeCarret>getLastSymbol())
   //   codeCarret=0;
    //}
  }
}

int getLastSymbol() {
  int q = 0;
  for (int i = 0;i<codeTape.length;i++) {
    if (codeTape[i]==' ') {
      q=i;
      break;
    }
  } 

  return q;
}

void preprocessor() {

  //codeTape = new char[200];
  // eraseCode();
  console = "";

  int cnt = 0;
  for (int c = 0;c<code.size();c++) {

    String line = (String)code.get(c);

    for (int i = 0 ; i < line.length();i++) {
      if (
      line.charAt(i)=='>' ||
        line.charAt(i)=='<' ||
        line.charAt(i)=='+' ||
        line.charAt(i)=='-' ||
        line.charAt(i)=='.' ||
        line.charAt(i)==',' ||
        line.charAt(i)=='[' ||
        line.charAt(i)==']'
        ) {
        codeTape[cnt] = line.charAt(i);
        cnt++;
      }
    }
  }
}

void compile(int pos) {

  codeCarret = pos;
  int level = 0;


  //for(int i =0 ; i < code.length;i++){
  if (codeTape[codeCarret]=='>') {
    dataCarret++;
    if (dataCarret>dataTape.length-1)
      dataCarret=0;

    codeCarret++;
  }
  else if (codeTape[codeCarret]=='<') {
    dataCarret--;
    if (dataCarret<0)
      dataCarret=dataTape.length-1;

    codeCarret++;
  }
  else if (codeTape[codeCarret]=='+') {
    dataTape[dataCarret]++;
    if (dataTape[dataCarret]>255)
      dataTape[dataCarret] = 0;

    codeCarret++;
  }
  else if (codeTape[codeCarret]=='-') {
    dataTape[dataCarret]--;
    if (dataTape[dataCarret]<0)
      dataTape[dataCarret] = 255;

    codeCarret++;
  }
  else if (codeTape[codeCarret]==',') {
    dataTape[dataCarret] = inputData[inputCarret];
    inputCarret++;
    codeCarret++;
  }
  else if (codeTape[codeCarret]=='.') {
    //print((char)dataTape[dataCarret]);
    put();
    codeCarret++;
  }
  else if (codeTape[codeCarret]=='[') {
    level++;
    if (dataTape[dataCarret] == 0) {
      int seek = codeCarret;
      while (seek > codeTape.length-1 || codeTape[seek]!=']') {
        seek++;
      }
      codeCarret = seek;
      codeCarret++;
    }
    codeCarret++;
  }
  else if (codeTape[codeCarret]==']') {
    level--;
    if (dataTape[dataCarret] != 0) {
      int seek = codeCarret;
      while (codeTape[seek]!='[' || seek<0) {
        seek--;
      }
      codeCarret = seek;
    }
    codeCarret++;
  }



  if (codeCarret==getLastSymbol()) {
    codeCarret=0; 
    dataCarret=0;
    //console = "";

    dataTape = new int[stackLength];

    println("bang! end of program");

    paused = true;
  }

  //codeCarret++;

  //}
}

void put() {
  console += (char)dataTape[dataCarret];
}

void keyPressed() {

  String line = (String)code.get(currentLine);
  String backup = (String)code.get(currentLine);

  if (keyCode == RIGHT) {
    editCarret++;
    String L = (String)code.get(lnCarret);
    editCarret=constrain(editCarret, 0, L.length());
  }
  else if (keyCode == LEFT) {
    editCarret--;
    String L = (String)code.get(lnCarret);
    editCarret=constrain(editCarret, 0, L.length());
  }else if(keyCode == UP){
   lnCarret--;
  lnCarret = constrain(lnCarret,0,code.size()); 
  }else if(keyCode == DOWN){
   lnCarret++;
  lnCarret = constrain(lnCarret,0,code.size()); 
  }
  else if (keyCode == DELETE) {
  }
  else if (key=='>') {
    line+=">";
    editCarret++;
  }
  else if (key=='<') {
    line+="<";
    editCarret++;
  }
  else if (key=='+') {
    line+="+";
    editCarret++;
  }
  else if (key=='-') {
    line+="-";
    editCarret++;
  }
  else if (key=='.') {
    line+=".";
    editCarret++;
  }
  else if (key==',') {
    line+=",";
    editCarret++;
  }
  else if (key=='[') {
    line+="[";
    editCarret++;
  }
  else if (key==']') {
    line+="]";
    editCarret++;
  }
  else if (keyCode==BACKSPACE) {
    if (line.length()>0)
      line = line.substring(0, editCarret)+line.substring(editCarret+1,line.length());
    else
      //if (code.size()>1)
        //code.remove(code.size());

    editCarret--;
  }
  else if (key==' ') {
    line+=" ";
    editCarret++;
  }
  else if (keyCode==ENTER) {
    code.add("");
    line="\r";
    currentLine++;
  }
  else if (key>='a' && key <='z') {
    line+=(char)key;
    editCarret++;
  }
  else if (key=='R') {
    paused = !paused;
  }
  else if (key>='0' && key <='9') {
    line+=(char)key;
    editCarret++;
  }

  if (!backup.equals(line))
    code.set(currentLine, (String)line);

  codelen = getLastSymbol();
  editCarret = constrain(editCarret,0,line.length());
}

void keyReleased() {
  preprocessor();
}


