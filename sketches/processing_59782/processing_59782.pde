

color dotColor= color(192);
color dotColorOver = color(255);
color dotColorClicked = color(255,0,0);



Dot[] dots = new Dot[25];
Line[] lines = new Line[40];
 

int selectedDot=99, startDot= 99, endDot = 99;
 

boolean drawing;
boolean solved;
 
void setup() { 
  size(460, 460);
  
  frameRate(50);
   
  drawing=false;
  solved=false;
  
 
  dots[0] = new Dot(30,30);
  dots[1] = new Dot(130,30);
  dots[2] = new Dot(230,30);
  dots[3] = new Dot(330,30);
  dots[4] = new Dot(430,30);
  dots[5] = new Dot(30,130);
  dots[6] = new Dot(130,130);
  dots[7] = new Dot(230,130);
  dots[8] = new Dot(330,130);
  dots[9] = new Dot(430,130);
  dots[10] = new Dot(30,230);
  dots[11] = new Dot(130,230);
  dots[12] = new Dot(230,230);
  dots[13] = new Dot(330,230);
  dots[14] = new Dot(430,230);
  dots[15] = new Dot(30,330);
  dots[16] = new Dot(130,330);
  dots[17] = new Dot(230,330);
  dots[18] = new Dot(330,330);
  dots[19] = new Dot(430,330);
  dots[20] = new Dot(30,430);
  dots[21] = new Dot(130,430);
  dots[22] = new Dot(230,430);
  dots[23] = new Dot(330,430);
  dots[24] = new Dot(430,430);

 
  for(int i=0; i<25; i++) {
    dots[i].c = dotColor;
    dots[i].display(dots[i].c);
  }
  

  lines[0] = new Line(0,1);
  lines[1] = new Line(0,5);
  lines[2] = new Line(1,2);
  lines[3] = new Line(1,6);
  lines[4] = new Line(2,3);
  lines[5] = new Line(2,7);
  lines[6] = new Line(3,4);
  lines[7] = new Line(3,8);
  lines[8] = new Line(4,9);
  lines[9] = new Line(5,6);
  lines[10] = new Line(5,10);
  lines[11] = new Line(6,7);
  lines[12] = new Line(6,11);
  lines[13] = new Line(7,8);
  lines[14] = new Line(7,12);
  lines[15] = new Line(8,9);
  lines[16] = new Line(8,13);
  lines[17] = new Line(9,14);
  lines[18] = new Line(10,11);
  lines[19] = new Line(10,15);
  lines[20] = new Line(11,12);
  lines[21] = new Line(11,16);
  lines[22] = new Line(12,13);
  lines[23] = new Line(12,17);
  lines[24] = new Line(13,14);
  lines[25] = new Line(13,18);
  lines[26] = new Line(14,19);
  lines[27] = new Line(15,16);
  lines[28] = new Line(15,20);
  lines[29] = new Line(16,17);
  lines[30] = new Line(16,21);
  lines[31] = new Line(17,18);
  lines[32] = new Line(17,22);
  lines[33] = new Line(18,19);
  lines[34] = new Line(18,23);
  lines[35] = new Line(19,24);
  lines[36] = new Line(20,21);
  lines[37] = new Line(21,22);
  lines[38] = new Line(22,23);
  lines[39] = new Line(23,24);
 
}
 
void draw() {
  background(255);
   
  for(int i=0; i<25; i++) {
    dots[i].display(dots[i].c);
  }
 
  
  for(int i=0; i<40; i++) {
    if (lines[i].visible==true) { lines[i].display();}
  }
   
  
  if (drawing==true) {    
    line(dots[selectedDot].x,dots[selectedDot].y,mouseX,mouseY);
      
  }
}
 
void mousePressed() {
  
}
 
void mouseReleased() {
  if(solved==false) {

    drawing=false; 
    for(int i=0; i<25; i++) {
      if((dots[i].selected()==true) && (i!=startDot)) {
        drawing=true;
        dots[i].c=dotColorClicked;
        selectedDot=i;
        break;
      }
    }
     
    if (drawing==true) {
      if(startDot==99) {
        startDot=selectedDot;
      } else if (endDot==99) {
        endDot=selectedDot;
       
        drawLine(startDot,endDot);
        
        
       
      }
      startDot=selectedDot;
      endDot=99;
    } else {
      startDot=99;
      endDot=99;
    }
  }
}
 
void mouseMoved() {
  if(solved==false) {
    for(int i=0; i<25; i++) {
      if(selectedDot==i) {
   
      } else
      if(dots[i].selected()==true) {
        dots[i].c=dotColorOver;
      } else {
        dots[i].c=dotColor;
      }
    }
  }
}
 

void mouseDragged() {
  mouseMoved();
}
 
class Dot {
  int x; 
  int y; 
  int s; 
  color c; 
  boolean selected;
   
  Dot(int localX, int localY) {
   
    x = localX;
    y = localY;
    s = 10;
  
  }
   
  void display(int dotColor) {
    fill(dotColor);
    stroke(0);
    strokeWeight(1);
    ellipse(x,y,s,s);
  }
   
  boolean selected() {
 
    float disX = x - mouseX;
    float disY = y - mouseY;
   
    if(sqrt(sq(disX) + sq(disY)) < s/2 ) {
      return true;
    } else {
      return false;
    }   
  }
}
 
class Line {
  int startX, startY;
  int endX, endY;
  boolean visible;
  
   
  Line(int startDot, int endDot) {
     
    startX=dots[startDot].x;
    startY=dots[startDot].y;
    endX=dots[endDot].x;
    endY=dots[endDot].y;
    visible=false;
    
  }
 
  void display() {
     stroke(0,189,255);
     strokeWeight(1.5);
     line(startX,startY,endX,endY);
  }
}
 
void drawLine(int startDot,int endDot) {
   
  int a = 40;
  int b = 40;
   
  if(startDot < endDot) {
    a = startDot;
    b = endDot;
  } else if(startDot > endDot) {
    a = endDot;
    b = startDot;
  } else {
    drawing=false;
  }
   
  if(drawing==true) {
    if((a==0)&&(b==1)) { lines[0].visible=true; }
    if((a==0)&&(b==5)) { lines[1].visible=true; }
    if((a==1)&&(b==2)) { lines[2].visible=true; }
    if((a==1)&&(b==6)) { lines[3].visible=true; }
    if((a==2)&&(b==3)) { lines[4].visible=true; }
    if((a==2)&&(b==7)) { lines[5].visible=true; }
    if((a==3)&&(b==4)) { lines[6].visible=true; }
    if((a==3)&&(b==8)) { lines[7].visible=true; }
    if((a==4)&&(b==9)) { lines[8].visible=true; }
    if((a==5)&&(b==6)) { lines[9].visible=true; }
    if((a==5)&&(b==10)) { lines[10].visible=true; }
    if((a==6)&&(b==7)) { lines[11].visible=true; }
    if((a==6)&&(b==11)) { lines[12].visible=true; }
    if((a==7)&&(b==8)) { lines[13].visible=true; }
    if((a==7)&&(b==12)) { lines[14].visible=true; }
    if((a==8)&&(b==9)) { lines[15].visible=true; }
    if((a==8)&&(b==13)) { lines[16].visible=true; }
    if((a==9)&&(b==14)) { lines[17].visible=true; }
    if((a==10)&&(b==11)) { lines[18].visible=true; }
    if((a==10)&&(b==15)) { lines[19].visible=true; }
    if((a==11)&&(b==12)) { lines[20].visible=true; }
    if((a==11)&&(b==16)) { lines[21].visible=true; }
    if((a==12)&&(b==13)) { lines[22].visible=true; }
    if((a==12)&&(b==17)) { lines[23].visible=true; }
    if((a==13)&&(b==14)) { lines[24].visible=true; }
    if((a==13)&&(b==18)) { lines[25].visible=true; }
    if((a==14)&&(b==19)) { lines[26].visible=true; }
    if((a==15)&&(b==16)) { lines[27].visible=true; }
    if((a==15)&&(b==20)) { lines[28].visible=true; }
    if((a==16)&&(b==17)) { lines[29].visible=true; }
    if((a==16)&&(b==21)) { lines[30].visible=true; }
    if((a==17)&&(b==18)) { lines[31].visible=true; }
    if((a==17)&&(b==22)) { lines[32].visible=true; }
    if((a==18)&&(b==19)) { lines[33].visible=true; }
    if((a==18)&&(b==23)) { lines[34].visible=true; }
    if((a==19)&&(b==24)) { lines[35].visible=true; }
    if((a==20)&&(b==21)) { lines[36].visible=true; }
    if((a==21)&&(b==22)) { lines[37].visible=true; }
    if((a==22)&&(b==23)) { lines[38].visible=true; }
    if((a==23)&&(b==24)) { lines[39].visible=true; }
  }
     
}
