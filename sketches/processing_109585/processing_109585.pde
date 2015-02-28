
DotFont df;
Fireworks[] fw;
int keyValue;
int nowUse[];
int cashNum = 100;
 
void setup()
{
  int i,j;
  size(500,500);
  frameRate(30);
  background(0);
  noStroke();
  smooth();
  
  df = new DotFont();
  fw = new Fireworks[cashNum];
  nowUse = new int[cashNum];
  
  for(i=0;i<cashNum;i++){
    fw[i] = new Fireworks(i,0);
    nowUse[0] = 0;
  }
  
  
  
  keyValue = 33;
}
 
void draw()
{
  int i;
  noStroke();
  fill(0,0,0,63);
  rect(0,0,width,height);

  
  for(i=0;i<cashNum;i++){
     if(nowUse[i] == 1){ 
      fw[i].drawFireworks();
     }
  }
  
  if(random(1)<0.1){
    for(i=0;i<cashNum;i++){
      if(nowUse[i]==0){
        keyValue = int(random(33,64));
        fw[i].reset();
        fw[i].fwColor = color(204);
        nowUse[i] = 1;
        i = cashNum;
      }
    }
  }
  keyValue = 0;  
}
 
void keyPressed()
{
  int i;
  keyValue = intChar(key);
  for(i=0;i<cashNum;i++){
    if(nowUse[i]==0){
      fw[i].reset();
      nowUse[i] = 1;
      i = cashNum;
    }
  }
}

class Fireworks
{
  int myIndex,charNum,count;
  float cx,cy,cvx,cvy,g;
  float[][] x,y,vx,vy;
  
  color fwColor;
  
  Fireworks(int mi,int cn)
  {
    int i,j;
    charNum = cn;
    myIndex = mi;
    
    count = 0;
    cx = random(width);
    cy = height;
    cvx = random(-1,1);
    cvy = random(-1,-20);
    g = 0.1;
    colorMode(HSB,255,255,255,255);
    fwColor = color(0);
    
    x  = new float[5][7];
    y  = new float[5][7];
    vx = new float[5][7];
    vy = new float[5][7];
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        x[i][j] = 0;
        y[i][j] = 0;
        vx[i][j] = (i-2)/1;
        vy[i][j] = (j-3)/1;
      }
    }
  }
  
  void move()
  {
    int i,j;
    if(cvy<=0){
      cvy += g;
      cx += cvx;
      cy += cvy;
      if(-3<cvy){
        if(33<=keyValue && keyValue<=126 ){
          fwColor = color(hue(fwColor),saturation(fwColor),random(0,255),255);
        }
      }
    }else{
      for(i=0;i<5;i++){
          for(j=0;j<7;j++){
            vy[i][j] += g;
            x[i][j] += vx[i][j];
            y[i][j] += vy[i][j];
          }
      }
      fwColor = color(hue(fwColor),saturation(fwColor),255-255*((count+0.01)/60),255);
    }
  }
  
  void drawFireworks()
  {
    int i,j;
    noStroke();
    fill(fwColor);
    this.move();
    if(cvy<=0){
      ellipse(cx,cy,10,10);
    }else{
    
      if(count == 0){
        
      }
      for(i=0;i<5;i++){
          for(j=0;j<7;j++){
            if(df.dotData(charNum,i,j) == 1){
              ellipse(cx+x[i][j],cy+y[i][j],10,10);
            }
          }
        }
      count++;
      if(count == 60){
        reset();
      }
    }
  }
  
  
  void reset(){
    int i,j;
          cx = random(width);
          cy = height;
          
          cvx = random(-1,1);
          cvy = -5-5*random(1);
          count = 0;
          
          for(i=0;i<5;i++){
            for(j=0;j<7;j++){
              x[i][j] = 0;
              y[i][j] = 0;
              vx[i][j] = (i-2)/1;
              vy[i][j] = (j-3)/1;
            }
          }
          
          if(33<=keyValue && keyValue<=126 ){
            charNum = keyValue;
            fwColor = color(255-127*random(1)*random(1),random(127,255),205,255);
          }else{
            charNum = 32;
            fwColor = color(0);
            nowUse[myIndex] = 0;
          }

  }
}
 
//This HENTAI function is same to "int(c)".
//I tried it. but these expression was can't used in processing.js.
//May be, This is BUG of processing.js.
int intChar(char c)
{
  int i;
  char[] cData = new char[1];
  cData[0] = c;
  String check = new String(cData);
  String allChar = "                                 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ";
  for(i=0;i<128;i++){
    if( allChar.charAt(i) == check.charAt(0) ){
      return i;
    }
  }
  return 32;
}
 
//This HENTAI function is same to "int(str.charAt(index))".
int intStrCharAt(String str, int index)
{
  return intChar(str.charAt(index));
}
 
class DotFont
{
  Char57[] c57;
  color dotFontColor;
  DotFont(){
    int i;
    c57 = new Char57[256];
    for(i=0;i<256;i++){
      c57[i] = new Char57();
    }
     
    dotFontColor = color(0);
     
    makeFontData();
  }
   
  //this function needs HENTAI function "intStrCharAt()"
  //and HENTAI function "intStrCharAt()" needs HENTAI function "intChar()"
  void drawDotString(String str,int charMode,float x,float y,float charWidth)
  {
    int i;
    for(i=0;i<str.length();i++){
      //this line use HENTAI function "intStrCharAt()"
      drawDotFont(intStrCharAt(str,i),charMode,x+i*(1.25*charWidth),y,charWidth);
    }
     
  }
   
  void drawDotFont(int charNum,int charMode,float x,float y,float charWidth)
  {
    c57[charNum].charColor = dotFontColor;
    switch(charMode){
      case 0:
        c57[charNum].drawCharBox(x,y,charWidth);
        break;
 
      case 1:
        c57[charNum].drawCharDot(x,y,charWidth);
        break;
 
      case 2:
        c57[charNum].drawCharLine(x,y,charWidth);
        break;
 
      case 3:
        c57[charNum].drawCharSmooth(x,y,charWidth);
        break;
       
    }
  }
 
  int dotData(int index,int i,int j)
  {
    return c57[index].dotData[i][j];
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
    //dot is '0'
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
          s[4] = "00000" ;
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
          s[2] = "0_000" ;
          s[3] = "0___0" ;
          s[4] = "0000_" ;
          s[5] = "0____" ;
          s[6] = "0____" ;
          break;
        case 113://q
          s[0] = "_____" ;
          s[1] = "____0" ;
          s[2] = "000_0" ;
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
}
 
class Char57
{
  int i,j;
  int[][] dotData;
  color charColor;
  Char57()
  {
    dotData  = new int[5][7];
    for(i=0;i<5;i++){
      for(j=0;j<7;j++){
        dotData[i][j] = 0;
      }
    }
     
    charColor = color(0);
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
   
  //charMode 0
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
   
  //charMode 1
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
   
  //charMode 2
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
   
  //charMode 3
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
