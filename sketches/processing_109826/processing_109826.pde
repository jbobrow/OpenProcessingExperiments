
import krister.Ess.*;
import controlP5.*;
ControlP5 cp5;
String textValue = "";
String[][] s = new String[3][];
ControlP5 controlP5;
ListBox l;
PImage time;
PImage profile;
PImage my;
int mycase = 0;
String[] comment;
String[] commentSplit;
String[] commentAll;
String[] commentArt;
String[] commentPu;
String[] commentSp;
String[] commentSt;
String[] commentIn;
String[] commentMy;


int[][] matrix;
int[][] matrixAll;
int[][] matrixArt;
int[][] matrixPu;
int[][] matrixSp;
int[][] matrixSt;
int[][] matrixIn;
int[][] matrixMy;

int colLength, rowLength;
int colLengthAll, rowLengthAll;
int colLengthArt, rowLengthArt;
int colLengthPu, rowLengthPu;
int colLengthSp, rowLengthSp;
int colLengthSt, rowLengthSt;
int colLengthIn, rowLengthIn;
int colLengthMy, rowLengthMy;

PImage confu;
PFont f;
PFont D;
PFont C;
float t;
int age=0;
int r=0;
int i;
int di;
float stp_a, stp_b, stp_c, stp_d;
float dtp_a, dtp_b, dtp_c, dtp_d;
color a = color(255, 204, 0);
color b = color(70, 200, 245);
color c = color(51, 102, 153);
color d = color(204,51,153);

AudioChannel intro0,intro1_1,intro1_2,intro1_3,intro1_4,intro2,intro3;

void setup() {
  stp_a = -PI/2;
  dtp_a = -PI/2;
  frameRate(100);
  background(255);
  size(1000, 700);
  r = 0;
  t = 0;
  f = loadFont("NanumGothic-25.vlw");
  D = loadFont("FranklinGothic-Medium-18.vlw");
  C = loadFont("FranklinGothic-Book-18.vlw");
  confu = loadImage("confu.jpg");
  time = loadImage("time.png");
  my = loadImage("my.png");
  String lines[] = loadStrings("example.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthAll = lines.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthAll= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixAll = new int[rowLengthAll][colLengthAll]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthAll; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsAll = split(lines[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthAll; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixAll[i][j] = Integer.valueOf(columnsAll[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
  
    String linesArt[] = loadStrings("example_art.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthArt = linesArt.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthArt= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixArt = new int[rowLengthArt][colLengthArt]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthArt; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsArt = split(linesArt[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthArt; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixArt[i][j] = Integer.valueOf(columnsArt[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
  
 
  
 String linesPu[] = loadStrings("example_Pu.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthPu = linesPu.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthPu= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixPu = new int[rowLengthPu][colLengthPu]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthPu; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsPu = split(linesPu[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthPu; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixPu[i][j] = Integer.valueOf(columnsPu[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
  
   String linesSp[] = loadStrings("example_Sp.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthSp = linesSp.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthSp= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixSp = new int[rowLengthSp][colLengthSp]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthSp; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsSp = split(linesSp[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthSp; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixSp[i][j] = Integer.valueOf(columnsSp[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
  
 String linesSt[] = loadStrings("example_St.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthSt = linesSt.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthSt= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixSt = new int[rowLengthSt][colLengthSt]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthSt; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsSt = split(linesSt[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthSt; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixSt[i][j] = Integer.valueOf(columnsSt[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
 
  String linesIn[] = loadStrings("example_In.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthIn = linesIn.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthIn= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixIn = new int[rowLengthIn][colLengthIn]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthIn; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsIn = split(linesIn[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthIn; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixIn[i][j] = Integer.valueOf(columnsIn[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  }
 
   String linesMy[] = loadStrings("example_My.csv"); // 'exmaple.csv' 라는 파일을 불러오면, 라인별로 자동으로 분리되어 스트링 배열에 저장됩니다.
  rowLengthMy = linesMy.length; // 라인의 총 갯수를 행 길이에 저장합니다.
  colLengthMy= split(lines[0], ',').length; // 첫번째 라인에서 열 숫자를 구합니다. 각각의 열은 ,로 구분되있기 때문에 split을 써서 스트링 배열을 얻습니다. 그리고 이 배열의 길이가 열길이가 됩니다. 
  matrixMy = new int[rowLengthMy][colLengthIn]; // 이중배열을 선언합니다. [행][열]의 길이만큼 공간을 할당합니다.
  for (int i = 0 ; i < rowLengthMy; i++) { // 행의 길이 만큼 루프를 돕니다.
    String[] columnsMy = split(linesMy[i], ','); // 매 행의 열 값을 얻습니다. 위에서 말한 방식과 같이 ,로 구분된 열의 값을 split함수를 통해 분리시켜 스트링 배열을 얻습니다.
    for (int j =0; j< colLengthMy; j++) { // 열의 길이 만큼 루프를 돕니다.
      matrixMy[i][j] = Integer.valueOf(columnsMy[j]); // 위에서 얻은 개별 행의 열값들을 매트릭스 배열에 할당합니다. i는 행번호 j는 열번호가 되겠지요. Integer.valueOf는 스트링 숫자를 진짜 정수 숫자로 변환하는 역할을 합니다.
    }
  } 

 
  rowLength = rowLengthAll;
  colLength = colLengthAll;
  matrix = matrixAll;
         commentMy = loadStrings("comment_My.txt");   
  commentAll = loadStrings("comment.txt");
  commentArt = loadStrings("comment_art.txt");
     commentPu = loadStrings("comment_Pu.txt");
      commentSp = loadStrings("comment_Sp.txt");
          commentSt = loadStrings("comment_St.txt");
            commentIn = loadStrings("comment_In.txt");       
  comment = commentAll;
  
    PFont font = createFont("arial",20);
       textFont(font);
      cp5 = new ControlP5(this);
      
      cp5.addTextfield("press the CONTROL key")
     .setPosition(10,height/2-130)
     .setSize(200,30)
     .setFont(createFont("arial",20))
     .setAutoClear(false)
     .setColorCaptionLabel(0)
     .setText("input your age")
     ;
     
    
     
          


  controlP5 = new ControlP5(this);
  l = controlP5.addListBox("Field",880,10,120,300);
  l.actAsPulldownMenu(true);
  l.setItemHeight(23);

  s[1] = new String[] {
    "All","Art","Industry","Public","Sports","Study","Publisher"
  };
 
  for(int i=0;i<s[1].length;i++) {
    l.addItem(s[1][i],i);
  }

Ess.start(this);
intro0=new AudioChannel("intro0.mp3");
intro1_1=new AudioChannel("intro1_1.mp3");
intro1_2=new AudioChannel("intro1_2.mp3");
intro1_3=new AudioChannel("intro1_3.mp3");
intro1_4=new AudioChannel("intro1_4.mp3");
intro2=new AudioChannel("intro2.mp3");
intro3=new AudioChannel("intro3.mp3");
}


void draw() {
  background(255);
  t = t+0.01;
  if(t<32&&mousePressed){
   t=34;
}
  if(t<32){
      textFont(C);
  fill(100);
  text("If you want to skip this, plz click the screen", 10, 20);
  }
  if (t>0&&t<18) {
    textFont(D);
    textMode(CENTER);

    //공자 이미지 띄우기
    if (t>0) {
      imageMode(CENTER);
      tint(255, t*100);
      image(confu, width/2, height/2);
      if(t>0.7){intro0.play();}
    } 

    //지학 그림 그리기 (1살 = PIX0.02)
    if (t>4) {
      intro1_1.play();
      noFill();
      strokeWeight(15);
      strokeCap(SQUARE);
      if (t<6) {
        stroke(a);
        dtp_a=stp_a+PI*0.02*(t-4)*7.5; //(7.5 = 나이 / 2)
        arc(width/2, height/2, 450, 450, stp_a, dtp_a);
      }
      else if (t>6) {
        stroke(a);
        dtp_a=stp_a+PI*0.02*15;
        arc(width/2, height/2, 450, 450, stp_a, dtp_a);
      }
    }


    
    //이립 그림 그리기
    if (t>7) {
       intro1_2.play();
      stp_b=dtp_a;
      dtp_b=dtp_b;
      stroke(b);
      noFill();
      strokeWeight(15);
      strokeCap(SQUARE);
      if (t<9) {

        dtp_b=stp_b+PI*0.02*(t-7)*7.5; //(7.5 = 나이 / 2)
        arc(width/2, height/2, 450, 450, stp_b, dtp_b);
      }
      else if (t>9) {
        stroke(b);
        dtp_b=stp_b+PI*0.02*15;
        arc(width/2, height/2, 450, 450, stp_b, dtp_b);
      }
    }

    //불혹 그림 그리기
    if (t>10) {
       intro1_3.play();
      stp_c=dtp_b;
      dtp_c=dtp_b;
      stroke(c);
      noFill();
      strokeWeight(15);
      strokeCap(SQUARE);
      if (t<12) {
        dtp_c=stp_c+PI*0.02*(t-10)*5; //(7.5 = 나이구간 / 2)
        arc(width/2, height/2, 450, 450, stp_c, dtp_c);
      }
      else if (t>12) {
        stroke(c);
        dtp_c=stp_c+PI*0.02*10;
        arc(width/2, height/2, 450, 450, stp_c, dtp_c);
      }
    }


      //지천명 그림 그리기
      if (t>13) {
         intro1_4.play();
        stp_d=dtp_c;
        dtp_d=dtp_c;
        stroke(d);
        noFill();
        strokeWeight(15);
        strokeCap(SQUARE);
        if (t<15) {
          dtp_d=stp_d+PI*0.02*(t-13)*5; //(7.5 = 나이구간 / 2)
          arc(width/2, height/2, 450, 450, stp_d, dtp_d);
        }
        else if (t>15) {
          stroke(d);
          dtp_d=stp_d+PI*0.02*10;
          arc(width/2, height/2, 450, 450, stp_d, dtp_d);
        }
      }
    //지학 설명하기
 noStroke();
    if (t>6) {
      fill(a);
      rect(50, 270, 300, 40);
      fill(255);
      text("At 15, I decided to study in deapth.", 60, 295);
    }
        //이립 설명하기
    if (t>9) {
      fill(b);
      rect(50, 310, 300, 40);
      fill(255);
      text("At 30, I had a firm will.", 60, 335);
    }
    
        //불혹 설명하기
    if (t>12) {
      fill(c);
      rect(50, 350, 300, 40);
      fill(255);
      text("At 40, I could resist any temptation.", 60, 375);
    }
    
          //지천명 설명하기
      if (t>15) {
        fill(d);
        rect(50, 390, 300, 40);
        fill(255);
        text("At 50, I could know my fate.", 60, 415);
      }

      //나이 그림 그리기
      //나이 그리기
    }


  else if (t>18&&t<32) {
if(t>18.3){intro2.play();}

    noFill();
    stroke(a);
    dtp_a=stp_a+PI*0.02*15;
    arc(width/2, height/2, 450, 450, stp_a, dtp_a);
    stroke(b);
    dtp_b=stp_b+PI*0.02*15;
    arc(width/2, height/2, 450, 450, stp_b, dtp_b);
    stroke(c);
    dtp_c=stp_c+PI*0.02*10;
    arc(width/2, height/2, 450, 450, stp_c, dtp_c);
    stroke(d);
    dtp_d=stp_d+PI*0.02*10;
    arc(width/2, height/2, 450, 450, stp_d, dtp_d);

    if (t>20) {
      textFont(f);
      fill(100);
      text("CAREER", width/2, height/2);
    }

    if (t>22) {
        if(t>22.6){intro3.play();}
 noStroke();
 textFont(D);
      fill(a);
      rect(50, 270, 450, 40);
      fill(255);
      text("The age a man decides his field", 60, 295);
    }   
    if (t>24) {
        fill(b);
      rect(50, 310, 450, 40);
      fill(255);
      text("The age a man becomes an expert", 60, 335);
    }

    if (t>26) {
      fill(c);
      rect(50, 350, 450, 40);
      fill(255);
        text("The age a man becomes a master", 60, 375);
    }


    if (t>28) {
      
        fill(d);
        rect(50, 390, 450, 40);
        fill(255);
        text("The age a man becomes a great man all over the world", 60, 415);
        r=1;
    }
  }
  //intro 끝 본문 시작
  //지학 데이터
  if (t>34) {
 Ess.stop(); 
    
    
    
    if (t<35) { 
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(a);                                           
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2, -PI/2+PI*0.02*(t-34)*(matrix[i][0]));
      }
    }
    else if (t>35) { 
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(a);
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2, -PI/2+PI*0.02*(matrix[i][0]));
      }
    }
  }

  //이립 데이터  
  if (t>35) {
    if (t<36) {
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(b);
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][0]), -PI/2+PI*0.02*(t-35)*(matrix[i][1]));
      }
    }

    else if (t>36) {
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(b);
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][0]), -PI/2+PI*0.02*(matrix[i][1]));
      }
    }
  }
  //불혹 데이터
  if (t>36) {
    if (t<37) {
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(c);
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][1]), -PI/2+PI*0.02*(t-36)*(matrix[i][2]));
      }
    }
      else if (t>37) {
        for (int i =0; i < rowLength; i++) {
          noFill();
          strokeWeight(5);
          strokeCap(SQUARE);
          stroke(c);
          arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][1]), -PI/2+PI*0.02*(matrix[i][2]));
        }
      }
    }
  

  //지천명 데이터

  if (t>37) {
    if (t<38) {
      for (int i =0; i < rowLength; i++) {
        noFill();
        strokeWeight(5);
        strokeCap(SQUARE);
        stroke(d);
        arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][2]), -PI/2+PI*0.02*(t-37)*(matrix[i][3]));
      }
    }
else if (t>38) { 
  for (int i =0; i < rowLength; i++) {
    noFill();
    strokeWeight(5);
    strokeCap(SQUARE);
    stroke(d);
    arc(width/2, height/2, 100+(i*16), 100+(i*16), -PI/2+PI*0.02*(matrix[i][2]), -PI/2+PI*0.02*(matrix[i][3]));
   
  }

}
if(t>38){    }
}
//데이터그리기 끝 설명 시작(마우스 토글식)

if(t>38){


if(age==1){
noStroke();
fill(255);
arc(width/2, height/2, 1300, 1300, -PI/2+PI*0.02*int(cp5.get(Textfield.class,"press the CONTROL key").getText()), HALF_PI*3);
}

  
if(r==1){
ellipseMode(CENTER);
int di=(floor(dist(mouseX,mouseY,width/2,height/2))/8);

noStroke();
fill(255,150);
ellipse(width/2, height/2, di*16, di*16);

  textFont(D,15);
fill(100);
 commentSplit = split(comment[di],'-');
  for(int i=0; i<5; i++){
  textAlign(LEFT);
  if(i==0){fill(100);}
  if(i==1){fill(a);}
  if(i==2){fill(b);}
  if(i==3){fill(c);}
  if(i==4){fill(d);}
    text(commentSplit[i],10,115+(i*20));

}
//프로필사진띄우기
noTint();
profile = loadImage(commentSplit[0]+".jpg");
imageMode(CORNER);
image(profile,10,10);
}

//레퍼런스
textFont(D,15);
strokeWeight(0.7);
stroke(80);
fill(80);
textAlign(CENTER);
text("0",width/2,height/2-15);
    line(width/2,(height/2)-30,width/2,(height/2)-250);
    text("50",width/2,height/2+27);
    line(width/2,height/2+30,width/2,(height/2)+250);
        text("25",width/2+20,height/2+5);
    line(width/2+30,height/2,width/2+250,height/2);
            text("75",width/2-20,height/2+5);
    line(width/2-30,height/2,width/2-250,height/2);
noFill();
ellipse(width/2,height/2,80,80);

}
//내 데이터
if(mycase==1){
  noFill();
  imageMode(CORNER);
image(my,0,height/2);
}

if(t>40){t=38;}
}




void controlEvent(ControlEvent theEvent) {
 
  if(theEvent.isGroup()) {
  int n = int(theEvent.group().value());
  if(n==0){matrix=matrixAll; colLength=colLengthAll; rowLength=rowLengthAll;   comment = commentAll; t=34; mycase=0;}
  if(n==1){matrix=matrixArt; colLength=colLengthArt; rowLength=rowLengthArt;   comment = commentArt; t=34;mycase=0;}
    if(n==2){matrix=matrixIn; colLength=colLengthIn; rowLength=rowLengthIn;   comment = commentIn; t=34;mycase=0;}
  if(n==3){matrix=matrixPu; colLength=colLengthPu; rowLength=rowLengthPu;   comment = commentPu; t=34; mycase=0;}
  if(n==4){matrix=matrixSp; colLength=colLengthSp; rowLength=rowLengthSp;   comment = commentSp; t=34; mycase=0;}
  if(n==5){matrix=matrixSt; colLength=colLengthSt; rowLength=rowLengthSt;   comment = commentSt; t=34;mycase=0;}
  if(n==6){matrix=matrixMy; colLength=colLengthMy; rowLength=rowLengthMy;   comment = commentMy; t=34;mycase=1;}
}
  
}


public void input(String theText) {
  // automatically receives results from controller input
  println("a textfield event for controller 'input' : "+theText);
}

void mouseClicked() {
  if (r == 0) {
    r = 1;
  } else{
    r = 0;
  }

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == CONTROL) {
      if(age==0){age=1;}
      else{age=0;}
    } 
    
      
    
    
}
}



