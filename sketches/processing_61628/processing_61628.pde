
import controlP5.*;
import processing.video.*;

PImage currentImage;
PImage carNumber;
PImage letter;
PImage borough;
PImage newyork;
PImage fin;

PFont fontA;
PFont gulim48;

ControlP5 cp5;
Movie intro;
ListBox l;
MultiList ml;

public color myColorBackground = color(254, 254, 254);
public String keyStr = "";
public int stat=0;
public int lock=0;
boolean once=true;
String[] s = {
  "New", "Level skip", "Open our 'Google-Docs'", "Quit"
};
int prevtimer=0;
int currtimer=0;
int trigger=0;
int ppp=0;
int mX, mY;
int deadlock=0;

void setup() {
  size(500, 440);
  frameRate(300);
  noStroke();
  cp5 = new ControlP5(this);
  carNumber = loadImage("car_1_p.jpg");
  letter = loadImage("emptyletter.jpg");
  borough = loadImage("buroughpark.jpg");
  newyork = loadImage("newyork_resize.jpg");
  fin = loadImage("fin.jpg");
  fontA = loadFont("BradleyHandITC-30.vlw");
  gulim48 = loadFont("Gulim-48.vlw");

  l = cp5.addListBox("Menu")
    .setPosition(0, 18)
      .setSize(120, 120)
        .setItemHeight(23)
          .setBarHeight(18)
            .setColorBackground(color(40, 128))
              .setColorActive(color(255, 128));
  l.actAsPulldownMenu(true);
  l.getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);

  for (int i=0;i<4;i++) {
    l.addItem(s[i], i);
  }

  background(0);
  linkWeb(1);
}

void draw() {
  switch (trigger) {
  case 1:
    fill(ppp, 0, 0);
    ellipse(120, 290, ppp/15, ppp/15);
    ppp++;
    break;
  case 2:
    fill(ppp, 0, 0);
    ellipse(120, 135, ppp/15, ppp/15);
    ppp++;
    break;
  case 3:
    fill(ppp, 0, 0);
    ellipse(290, 27, ppp/15, ppp/15);
    ppp++;
    break;
  case 4:
    fill(ppp, 0, 0);
    ellipse(290, 399, ppp/15, ppp/15);
    ppp++;
    break;
  case 5:
    fill(ppp, 0, 0);
    ellipse(430, 290, ppp/15, ppp/15);
    ppp++;
    break;
  case 6:
    fill(ppp, 0, 0);
    ellipse(120, 290, ppp/15, ppp/15);
    ellipse(120, 135, ppp/15, ppp/15);
    ellipse(290, 27, ppp/15, ppp/15);
    ellipse(290, 399, ppp/15, ppp/15);
    ellipse(430, 290, ppp/15, ppp/15);
    stroke(ppp, 0, 0);
    line(120, 290, 430, 290);
    line(290, 27, 120, 290);
    line(290, 27, 430, 290);
    line(290, 399, 120, 135);
    ppp++;
    break;
  case 7:
    fill(ppp, 0, 0);
    ellipse(mX, mY, ppp/15, ppp/15);
    ppp++;
    break;
  case 8:
    fill(ppp, 0, 0);
    textFont(gulim48, 25);
    text("Answer is -> ", 110, 417);
    prevtimer++;
    if (prevtimer>(255*3)) {
      trigger=0;
    }
    ppp++;
    break;
  case 9:
    fill(ppp, 0, 0);
    textFont(gulim48, 20);
    text("Click  --->", 230, 25);
    text(" ↓↓", 230, 50);
    prevtimer++;
    if (prevtimer>(255*2)) {
      trigger=0;
    }
    ppp++;
    break;
  default:
    break;
  }
  if (ppp>255) {
    if (trigger==6) {
      delay(1000);
    }
    ppp=0;
    trigger=0;
    re_draw();
  }
  //초기화
  if (keyStr.equals("100")) {
    stat=0; 
    lock=0;
  }
  //레벨 1의 정답
  if (keyStr.equals("1")) {
    stat=1; 
    lock=0;
  }
  //레벨 2의 정답
  if (keyStr.equals("2")) {
    stat=2; 
    lock=0;
  }
  //레벨 3의 정답
  if (keyStr.equals("3")) {
    stat=3; 
    lock=0;
  }
  if (lock==0) { 
    nextStage();
  }
}

void nextStage() {
  switch (stat) {
  case 0:
    fill(0);
    rect(0, 0, 500, 475);
    currentImage=letter;
    image(currentImage, 50, 10);
    textFont(fontA, 20);
    fill(30);
    trigger = 8;
    text("lepl  26/94", 330, 50);
    textFont(fontA, 30);
    text("my dear friend", 100, 110);

    textFont(fontA, 22);
    textLeading(50);
    text("Confirmed your suggestion\nnext site will be here, Borough Park.\nlet's punish kick ass pigs!", 90, 210);
    image(borough, 264, 225);

    cp5.addTextfield("")
      .setPosition(290, 392)
        .setSize(130, 30)
          .setFont(createFont("arial", 20))
            .setId(0);
    break;

  case 1:
    if (deadlock==0) {
      linkWeb(3);
      deadlock++;
    }
    prevtimer=second();
    cp5.remove("");
    fill(0);
    rect(0, 0, 500, 475);
    switch(trigger) {
    case 88:
      carNumber = loadImage("car_1_p.jpg");
      break;
    case 102:
      carNumber = loadImage("car_2_p.jpg");
      break;
    case 103:
      carNumber = loadImage("car_3_p.jpg");
      break;
    }
    currentImage = carNumber;
    image(currentImage, 0, 0);
    rect(0, 408, 500, 475);

    switch(trigger) {
    case 88:
      fill(255);
      textFont(gulim48, 17);
      textLeading(30);
      text("“사진이 너무 흐려져서 정방형 보간법을 적용해야 \n   할 것 같은데, 이 보간법이 주위 몇개의 \n   픽셀에서 값을 추출하는 것이였죠?”\n   아래에 답을 적어서 넘겨주세요!", 120, 295);
      break;
    case 102:
      fill(255);
      textFont(gulim48, 17);
      textLeading(30);
      text("“좋아요, 거의 다 되었군요, 하나만 더 물어볼게요\n   이 보간법에서 연산은 몇 번 수행하는 거였죠? \n\n   아래에 답을 적어서 넘겨주세요!", 120, 295);
      break;
    case 103:
      fill(255);
      textFont(gulim48, 18);
      textLeading(30);
      text("“아! 번호판이 보이는군요!\n   좋습니다, 이제 범인의 신원을 확인할 수 \n   있겠어요!\n   Go버튼으로 넘어갑시다!", 120, 295);
      break;
    }
    cp5.addTextfield("Answer")
      .setPosition(330, 413)
        .setSize(100, 14).setId(9)
          .setFocus(true);
    cp5.addBang("Go!").setPosition(469, 410).setSize(28, 28).setId(6).getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);
    break;

  case 2:
    cp5.remove("Go!");
    cp5.remove("Answer");

    fill(0);
    rect(0, 0, 500, 475);
    currentImage = newyork;
    image(currentImage, 0, 0);
    rect(0, 408, 500, 475);
    currtimer=0;
    //    prevtimer=0;
    trigger=9;

    cp5.addNumberbox("X")
      .setValue(0)
        .setPosition(15, 413)
          .setSize(100, 14)
            .setId(4)
              .getCaptionLabel().align(cp5.CENTER, -5);

    cp5.addNumberbox("Y")
      .setValue(0)
        .setPosition(135, 413)
          .setSize(100, 14)
            .setId(5)
              .getCaptionLabel().align(cp5.CENTER, -5);


    cp5.addTextfield("input form: XXX,YYY")
      .setPosition(330, 413)
        .setSize(100, 14).setId(10)
          .setFocus(true);
    //     .getCaptionLabel().align(cp5.CENTER, 30);

    cp5.addBang("Go!!")
      .setPosition(469, 410)
        .setSize(28, 28)
          .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
            ;
    ml = cp5.addMultiList("Scene of crime", 380, 0, 120, 12).setId(7);
    MultiListButton scenes;
    scenes = ml.add("Scene of crime, Click!! ", 1);
    scenes = ml.add("Borough Park,   120,290", 2);
    scenes = ml.add("Gowanus Expy,  120,135", 3);
    scenes = ml.add("Myrtle Ave,     290,27", 4);
    scenes = ml.add("Northland ave,  290,399", 5);
    scenes = ml.add("Canarsie Park,   430,290", 6);

    cp5.getController("X").setBehavior(new ControlBehavior() {
      public void update() { 
        setValue(mouseX);
      }
    }
    );

    cp5.getController("Y").setBehavior(new ControlBehavior() {
      public void update() { 
        setValue(mouseY);
      }
    }
    );

    break;
  case 3:
    cp5.remove("X");
    cp5.remove("Y");
    cp5.remove("Scene of crime");
    cp5.remove("Go!!");
    cp5.remove("input form: XXX,YYY");
    linkWeb(7);
    currentImage=fin;
    textFont(gulim48, 48);
    image(currentImage, 33, 40);
    text("끝, 수고하셨습니다!!!!", 20, 410);
    break;
  default:
    println("Something wrong.");
    break;
  }
  lock=1;
  keyStr="";
}

void setDefault() {
  if (stat==0) {
    cp5.remove("");
  }
  if (stat==1) {
    cp5.remove("Go!");
    cp5.remove("Answer");
    cp5.remove("radioButton");
  }
  else if (stat==2) {
    cp5.remove("X");
    cp5.remove("Y");
    cp5.remove("Scene of crime");
    cp5.remove("Go!!");
    cp5.remove("input form: XXX,YYY");
  }
  keyStr="";
  keyStr="100";
  lock=0;
}

void skipLevel() {
  if (stat==0) { 
    keyStr="";
    keyStr="1";
  }
  else if (stat==1) { 
    keyStr="";
    keyStr="2";
  }
  else if (stat==2) { 
    keyStr="";
    keyStr="3";
  }
}

void linkWeb(int parameter) {
  switch(parameter) {
  case 1:
    link("http://youtu.be/-0G_UDqQgk0", "_new");
    break;
  case 2:
    link("http://youtu.be/GwPwr0vsd7Y", "_new");
    break;
  case 3:
    link("http://youtu.be/ebRBiiYNDkE", "_new");
    break;
  case 4:
    link("http://youtu.be/oCPZ6O6uwTE", "_new");
    break;
  case 5:
    link("http://youtu.be/1Q4l8hSMDDQ", "_new");
    break;
  case 6:
    link("http://youtu.be/57e7rPCOb3Y", "_new");
    break;
  case 7:  
    link("http://youtu.be/OzsCA-IU1Ls", "_new");
    break;
  case 100:
    link("https://docs.google.com/document/d/1FVxvsKRVCYR_Is-woaiddSG-utjnPY-2yhlLXZkFtsI/edit#", "_new");
    break;
  }
}

void mousePressed() {
  if (mouseX>0 && mouseX<=120 && mouseY>0 && mouseY<=25) {
    setDefault();
    re_draw();
  }
  if (stat == 2) {
    trigger=7; 
    mX=mouseX; 
    mY=mouseY;
  }
}

void mouseDragged() {
  if (stat==2 && currtimer==0) {
    mX=mouseX; 
    mY=mouseY;
    currtimer=1;
  }
}
void mouseReleased() {
  if (stat==2) {
    fill(0);
    stroke(10);
    line(mX, mY, mouseX, mouseY);
    currtimer=prevtimer=second();
    if (currtimer>prevtimer+15) {
      setDefault();
      re_draw();
      currtimer=0;
      mX=mouseX;
      mY=mouseY;
      trigger=8;
    }
  }
}

void re_draw() {
  if (stat==0) { 
    keyStr="";
    keyStr="100";
  }
  else if (stat==1) { 
    keyStr="";
    keyStr="1";
  }
  else if (stat==2) { 
    keyStr="";
    keyStr="2";
  }
  else if (stat==3) { 
    keyStr="";
    keyStr="3";
  }
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup() && theEvent.name().equals("Menu")) {
    int test=5;
    test = (int)theEvent.group().value();
    println(test+" 메뉴에서 이벤트 발생");
    if (test==0) {
      setDefault();
      test=5;
    } //new메뉴
    if (test==1) {
      setDefault();
      skipLevel();
      test=5;
    } //skip메뉴
    if (test==2) {
      setDefault();
      re_draw();
      linkWeb(100);
      test=5;
    }//웹링크 메뉴
    if (test==3) {
      exit();
    }//exit 메뉴
  }

  println(theEvent.getController().getId()+"에서 이벤트 발생!");

  switch(theEvent.getController().getId()) {
    case(0):
    if ((theEvent.getController().getStringValue()).equals("borough park") ||
      (theEvent.getController().getStringValue()).equals("Borough park") ||
      (theEvent.getController().getStringValue()).equals("borough Park") ||
      (theEvent.getController().getStringValue()).equals("borough") ||
      (theEvent.getController().getStringValue()).equals("Borough") ||
      (theEvent.getController().getStringValue()).equals("Borough Park")) {
      //keyStr은 매번 초기화 해줘야 할듯하다. 스트링이라 뒤에 계속 추가되는듯
      keyStr = ""; 
      keyStr = "1";
    }
    println(theEvent.getController().getStringValue());
    break;
    case(1):
    myColorBackground = (int)(theEvent.getController().getValue());
    break;
    case(2):
    myColorBackground = (int)(theEvent.getController().getValue());
    break;
    case(3):
    keyStr = "";
    keyStr = (theEvent.getController().getStringValue());
    println(theEvent.getController().getStringValue());
    break;
    case(6):
    if (trigger==103) {
      keyStr = "";
      keyStr = "2";
      linkWeb(5);
    }
    break;
    case(7):
    if (theEvent.value()==1) {
      trigger=6;
    }
    if (theEvent.value()==2) {
      trigger=1;
    }
    if (theEvent.value()==3) {
      trigger=2;
    }
    if (theEvent.value()==4) {
      trigger=3;
    }
    if (theEvent.value()==5) {
      trigger=4;
    }
    if (theEvent.value()==6) {
      trigger=5;
    }
    break;
  case 9:
    if ( (theEvent.getController().getStringValue()).equals("16")) {
      trigger=102;
      setDefault();
      re_draw();
    } 
    else if ((theEvent.getController().getStringValue()).equals("8")) {
      trigger=103;
      setDefault();
      re_draw();
    }
    break;
  case 10:
    if ( (theEvent.getController().getStringValue()).equals("430,135") ||
      (theEvent.getController().getStringValue()).equals("430, 135") ||
      (theEvent.getController().getStringValue()).equals("430 , 135") ||
      (theEvent.getController().getStringValue()).equals("430 ,135") ||
      (theEvent.getController().getStringValue()).equals("430 135") ||
      (theEvent.getController().getStringValue()).equals("430135")) {
      keyStr="";
      keyStr="3";
      break;
    }
  }
}

void mouseClicked() {
  if (stat==0 && trigger==0 && mouseX>120 && mouseY>80) {
    linkWeb(2); 
    trigger=88;
  }
  if (stat==1 && trigger==88 && mouseX>120 && mouseY>80 && deadlock==1) {
    linkWeb(4); 
    trigger=88; 
    deadlock++;
  }
  if (stat==2 && mouseX>120 && mouseY>80 && deadlock==2) {
    linkWeb(6); 
    deadlock++;
  }
}
void keyPressed() {
  if (stat==0 && trigger==0) {
    linkWeb(2); 
    trigger=88;
  }
  if (stat==1 && trigger==88 && mouseX>120 && mouseY>80 && deadlock==1) {
    linkWeb(4); 
    trigger=88; 
    deadlock++;
  }
  if (stat==2 && mouseX>120 && mouseY>80 && deadlock==2) {
    linkWeb(6); 
    deadlock++;
  }
}


