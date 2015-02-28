
float A;
void setup() {
  A=0;
  size(1000,100);
  background(255);
  smooth();
  strokeWeight (10);
  stroke(59,145,255);
  noFill();
}

void draw() {
  frameRate(2);
  if(key =='a'||key=='A') {
    line(A+30,80,A+30,40);
    line(A+70,80,A+70,40);
    arc(A+50,40,40,40,PI,TWO_PI);
    line(A+45,60,A+55,60);
  } 
  if(keyCode==BACKSPACE) {
    background(255);
    A=0;
  }
  if(key =='b'||key=='B') {
    line(A+25,80,A+25,20);
    arc(A+45,35,30,30,radians(250),radians(370));
    arc(A+45,60,40,40,radians(260),radians(450));
  }
  if(key =='c'||key=='C') {
    arc(A+50,50,70,70,radians(60),radians(300));
  }
  if(key =='d'||key=='D') {
    line(A+25,80,A+25,20);
    arc(A+25,50,90,60,radians(290),radians(430));
  }
  if(key =='e'||key=='E') {
    line(A+25,80,A+25,20);
    line(A+40,20,A+75,20);
    line(A+40,80,A+75,80);
    line(A+40,55,A+50,55);
  }
  if(key =='f'||key=='F') {
    line(A+25,80,A+25,20);
    line(A+40,20,A+75,20);
    line(A+40,55,A+50,55);
  }
  if(key =='g'||key=='G') {
    arc(A+50,50,70,70,radians(30),radians(300));
    line(A+60,55,A+85,55);
  }
  if(key =='h'||key=='H') {
    line(A+25,80,A+25,20);
    line(A+75,80,A+75,20);
    line(A+40,50,A+60,50);
  }
  if(key =='i'||key=='I') {
    line(A+50,80,A+50,45);
    ellipse(A+50,20,15,15);
  }
  if(key =='j'||key=='J') {
    line(A+60,45,A+60,65);
    arc(A+45,70,30,30,radians(0),radians(170));
    ellipse(A+60,20,15,15);
  }
  if(key =='k'||key=='K') {
    line(A+25,80,A+25,20);
    line(A+40,42,A+70,20);
    line(A+55,51,A+75,80);
  }
  if(key =='l'||key=='L') {
    line(A+25,80,A+25,20);
    line(A+25,80,A+65,80);
  }
  if(key =='m'||key=='M') {
    line(A+25,80,A+25,20);
    line(A+75,80,A+75,20);
    arc(A+50,20,50,50,radians(0),radians(180));
  }
  if(key =='n'||key=='N') {
    line(A+25,80,A+25,20);
    line(A+75,80,A+75,20);
    line(A+38,30,A+62,70);
  }
  if(key =='o'||key=='O') {
    ellipse(A+50,50,60,60);
  }
  if(key =='p'||key=='P') {
    line(A+25,80,A+25,20);
    arc (A+41,40,40,40,radians(270),radians(450));
  }
  if(key =='q'||key=='Q') {
    ellipse(A+50,50,60,60);
    line(A+80,80,A+90,90);
  }
  if(key =='r'||key=='R') {
    line(A+25,80,A+25,20);
    arc (A+41,40,40,40,radians(270),radians(450));
    line(A+75,80,A+60,65);
  }
  if(key =='s'||key=='S') {
    arc(A+47,32,40,35,radians(90),radians(280));
    arc(A+53,68,40,35,radians(270),radians(460));
    line(A+34,88,A+34,70);
    line(A+66,12,A+66,30);
  }
  if(key =='t'||key=='T') {
    line(A+50,80,A+50,45);
    arc(A+50,32,60,10,radians(180),radians(360));
  }
  if(key =='u'||key=='U') {
    line(A+25,70,A+25,20);
    line(A+75,70,A+75,20);
    arc(A+50,65,50,50,radians(0),radians(180));
  }
  if(key =='v'||key=='V') {
    line(A+50,80,A+20,20);
    line(A+50,80,A+80,20);
  }
  if(key =='w'||key=='W') {
    line(A+35,80,A+20,20);
    line(A+65,80,A+80,20);
    arc(A+50,80,30,50,radians(180),radians(360));
  }
  if(key =='x'||key=='X') {
    line(A+25,75,A+75,25);
    line(A+25,25,A+40,40);
    line(A+60,60,A+75,75);
  }
  if(key =='y'||key=='Y') {
    line(A+50,60,A+50,80);
    arc(A+50,15,50,50,radians(0),radians(180));
  }
  if(key =='z'||key=='Z') {
    line(A+25,70,A+75,30);
    line(A+20,15,A+75,15);
    line(A+20,85,A+75,85);
  }
  if(key =='1'||key=='1') {
    line(A+50,25,A+50,80);
    line(A+30,80,A+70,80);
    line(A+50,25, A+35,35);
  }
  if(key =='2'||key=='2') {
    line(A+20,80,A+70,80);
    line(A+20,80,A+65,40);
    arc(A+50,30,40,40,radians(180),radians(380));
  }
  if(key =='3'||key=='3') {
    arc(A+60,30,40,40,radians(200),radians(450));
    arc(A+60,70,40,40,radians(270),radians(500));
  }
  if(key =='4'||key=='4') {
    line(A+55,20,A+25,65);
    arc(A+50,65,50,20,radians(0),radians(180));
    line(A+60,65,A+60,90);
  }
  if(key =='5'||key=='5') {
    line(A+30,15,A+75,15);
    line(A+30,15,A+30,40);
    arc(A+50,60,50,50,radians(230),radians(480));
  }
  if(key =='6'||key=='6') {
    arc(A+50,50,40,70,radians(90),radians(300));
    arc(A+53,65,40,40,radians(190),radians(450));
  }
  if(key =='7'||key=='7') {
    line(A+40,80,A+80,15);
    line(A+30,15, A+80,15);
    line(A+35,45,A+45,45);
  }
  if(key =='8'||key=='8') {
    ellipse(A+50,25,30,30);
    ellipse(A+50,65,45,45);
  }
  if(key =='9'||key=='9') {
    ellipse(A+50,30,40,40);
    arc(A+50,50,47,80,radians(330),radians(500));
  }
  if(key =='0'||key=='0') {
    ellipse(A+50,50,50,80);
  }
  if(key =='<'){
    line(A+20,50,A+70,15);
    line(A+20,50,A+70,85);
  }
  if(key =='>'){
    line(A+30,15,A+80,50);
    line(A+80,50,A+30,85);
  }
  if(key =='?'){
    arc(A+50,30,35,35,radians(180),radians(450));
    line(A+50,50,A+50,60);
    ellipse(A+50,80,5,5);
  }
  if(key ==','){
    line(A+40,90,A+60,75);
  }
  if(key =='.'){
    ellipse(A+50,80,5,5);
  }
   if(key ==';'){
     ellipse(A+50,50,5,5);
     line(A+40,90,A+52,65);
   }
   if(key ==':'){
     ellipse(A+50,30,5,5);
     ellipse(A+50,70,5,5);
   }
   if(key =='/'){
     line(A+20,80,A+80,20);
   }
   if(key =='!'){
     line(A+50,20,A+50,55);
     ellipse(A+50,80,5,5);
   }
   if(key =='"'){
     line(A+45,5,A+45,25);
    line(A+60,5,A+60,25);
   }
   if(key =='('){
     arc(A+50,50,25,80,radians(90),radians(270));
   }
   if(key ==')'){
     arc(A+50,50,25,80,radians(270),radians(450));
   }
   if(key =='-'){
     line(A+35,50,A+65,50);
   }
   if(key =='_'){
      line(A+25,90,A+75,90);
   }
   if(key =='='){
     line(A+35,50,A+65,50);
     line(A+35,65,A+65,65);
   }

  if(key =='a'||key=='A'||key =='b'||key=='B'||key =='c'||
    key=='C'||key =='d'||key=='D'||key =='e'||key=='E'||key =='f'
    ||key=='F'||key =='g'||key=='G'||key =='h'||key=='H'||key =='i'
    ||key=='I'||key =='j'||key=='J'||key =='k'||key=='K'||key =='l'
    ||key=='L'||key =='m'||key=='M'||key =='n'||key=='N'||key =='o'
    ||key=='O'||key =='p'||key=='P'||key =='q'||key=='Q'||key =='r'
    ||key=='R'||key =='s'||key=='S'||key =='t'||key=='T'||key =='u'
    ||key=='U'||key =='v'||key=='V'||key =='w'||key=='W'||key =='x'
    ||key=='X'||key =='y'||key=='Y'||key =='z'||key=='Z'||key==' '
    ||key =='2'||key=='2'||key =='3'||key=='3'||key =='4'||key=='4'
    ||key =='5'||key=='5'||key =='6'||key=='6'||key =='7'||key=='7'
    ||key =='1'||key=='1'||key =='8'||key=='8'||key =='9'||key=='9'
    ||key =='0'||key=='0'||key =='<'||key =='>'||key =='?'
    ||key ==','||key =='.'||key ==';'||key ==':'||key =='/'||
    key =='!'||key =='"'||key =='('||key ==')'||key =='-'||key =='_'
    ||key =='=') {
    A=A+100;
  }
}
void keyReleased() {
  if(key =='a'||key=='A'||key =='b'||key=='B'||key =='c'||
    key=='C'||key =='d'||key=='D'||key =='e'||key=='E'||key =='f'
    ||key=='F'||key =='g'||key=='G'||key =='h'||key=='H'||key =='i'
    ||key=='I'||key =='j'||key=='J'||key =='k'||key=='K'||key =='l'
    ||key=='L'||key =='m'||key=='M'||key =='n'||key=='N'||key =='o'
    ||key=='O'||key =='p'||key=='P'||key =='q'||key=='Q'||key =='r'
    ||key=='R'||key =='s'||key=='S'||key =='t'||key=='T'||key =='u'
    ||key=='U'||key =='v'||key=='V'||key =='w'||key=='W'||key =='x'
    ||key=='X'||key =='y'||key=='Y'||key =='z'||key=='Z'||key==' '||
    keyCode==BACKSPACE||key =='2'||key=='2'||key =='3'||key=='3'||
    key =='4'||key=='4'||key =='5'||key=='5'||key =='6'||key=='6'
    ||key =='7'||key=='7'||key =='1'||key=='1'||key =='8'||key=='8'
    ||key =='9'||key=='9'||key =='0'||key=='0'||key =='<'||key =='>'||key =='?'||
    key ==','||key =='.'||key ==';'||key ==':'||key =='/'||
    key =='!'||key =='"'||key =='('||key ==')'||key =='-'||key =='_'
    ||key =='=') {
    noLoop();
  }
}
void keyPressed() {
  if (key =='a'||key=='A'||key =='b'||key=='B'||key =='c'||
    key=='C'||key =='d'||key=='D'||key =='e'||key=='E'||key =='f'
    ||key=='F'||key =='g'||key=='G'||key =='h'||key=='H'||key =='i'
    ||key=='I'||key =='j'||key=='J'||key =='k'||key=='K'||key =='l'
    ||key=='L'||key =='m'||key=='M'||key =='n'||key=='N'||key =='o'
    ||key=='O'||key =='p'||key=='P'||key =='q'||key=='Q'||key =='r'
    ||key=='R'||key =='s'||key=='S'||key =='t'||key=='T'||key =='u'
    ||key=='U'||key =='v'||key=='V'||key =='w'||key=='W'||key =='x'
    ||key=='X'||key =='y'||key=='Y'||key =='z'||key=='Z'||key==' '
    ||keyCode==BACKSPACE||key =='2'||key=='2'||key =='3'||key=='3'||
    key =='4'||key=='4'||key =='5'||key=='5'||key =='6'||key=='6'
    ||key =='7'||key=='7'||key =='1'||key=='1'||key =='8'||key=='8'
    ||key =='9'||key=='9'||key =='0'||key=='0'||key =='<'||key =='>'||key =='?'
    ||key ==','||key =='.'||key ==';'||key ==':'||key =='/'||
    key =='!'||key =='"'||key =='('||key ==')'||key =='-'||key =='_'
    ||key =='=') {
    loop();
  }
  if(A>950) {
    background(255);
    A=0;
  }
}


