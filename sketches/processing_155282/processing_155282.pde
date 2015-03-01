
//in progress:
//more buttons??
//moving buttons??
//code optimisation

float diam=50;
float gap=50;
int num=0;
float time=30000; 
float timet;
int nbtns=6;
float tempmillis=0;
int select=int(random(nbtns));
int gamestate=1;
int e=100;
int m=360;
int h=360;

Button [] b = new Button[nbtns];

void scoreboard() {
  strokeWeight(1);
  fill(0,0,360);
  rect(width/2-50,height/2-75/2,100,75);
  line(width/2-50,height/2,width/2+50,height/2);
  fill(360,360,360);
  text(num,width/2,height/2);
  text(parseFloat(Math.round(timet * 100) / 100).toFixed(2),width/2,height/2+75/2);
}

void setup() {
  textAlign(CENTER, BOTTOM);
  colorMode(HSB,360);
  size(500, 500);
  background(360,0,360);
  noFill();
  smooth();
  textSize(32);

}

void setupcircles() {
  b[0]=new Button(gap,gap,diam,0,0);
  b[1]=new Button(width-gap,gap,diam,0,0);
  b[2]=new Button(gap,height-gap,diam,0,0);
  b[3]=new Button(width-gap,height-gap,diam,0,0);
  b[4]=new Button(width/2,height/3,diam,0,0);
  b[5]=new Button(width/2,2*height/3,diam,0,0); 
}
    

void circles() {
  for (int i=0;i<nbtns;i++) {
    b[i].display();
  }
}

void draw() {
  if (gamestate==1) {
    startbutton();
    tempmillis=millis();
    num=0;
    select=int(random(nbtns));
  }
  if (gamestate==2) {    
    timet=(time+tempmillis-millis())/1000;
    if (timet<=0) {
      gamestate=3;
    }
    background(360,0,360);
    scoreboard();
    circles();
    selector();
  }
  if (gamestate==3) {
    endscreen();
  }
}

void mousePressed() {
  if (gamestate==1) {
    if (mouseX>width/2-55 && mouseX<width/2+55 && mouseY>height/2-75/2 && mouseY<height/2+75/2) {
      gamestate=2;
      setupcircles();
    }
    if (mouseX>width/2-70 && mouseX<width/2+70 && mouseY>height/2-100 && mouseY<height/2-62.5) {
      m=100;
      h=360;
      e=360;
      diam=30;
    }
    if (mouseX>width/2-200 && mouseX<width/2-90 && mouseY>height/2-100 && mouseY<height/2-62.5) {
      e=100;
      m=360;
      h=360;
      diam=50;
    }
    if (mouseX>width/2+90 && mouseX<width/2+200 && mouseY>height/2-100 && mouseY<height/2-62.5) {
      h=100;
      m=360;
      e=360;
      diam=15;
    }
  }
  if (gamestate==2) {
    if (sqrt(sq(mouseX-b[select].xpos)+sq(mouseY-b[select].ypos))<diam/2) {
      newselect();
      num+=1;
    }
  }
  if (gamestate==3) {
    if (mouseX>width/2-55 && mouseX<width/2+55 && mouseY>height/2+75/2 && mouseY<height/2+75) {
      gamestate=1;
    }
  }
}

void startbutton() {
  background(360,0,360);
  noFill();
  rect(width/2-55,height/2-75/2,110,75/2);
  rect(width/2-70,height/2-100,140,75/2);
  rect(width/2-200,height/2-100,110,75/2);
  rect(width/2+90,height/2-100,110,75/2);
  fill(360,360,360);
  text("START",width/2,height/2);
  fill(e,360,360);
  text("EASY",width/2-150,height/2-62.5);
  fill(m,360,360);
  text("MEDIUM",width/2,height/2-62.5);
  fill(h,360,360);
  text("HARD",width/2+150,height/2-62.5);
}

void endscreen() {
  background(360,0,360);
  noFill();
  rect(width/2-55,height/2+75/2,110,75/2);
  fill(360,360,360);
  text("Your score was: " + num,width/2,height/2);
  text("RESET",width/2,height/2+75);
}
  
void newselect() {
  int sel[] = new int [nbtns-1];
  int j=0;
  for (int i=0;i<nbtns;i++) {
    if (i!=select) {
      sel[j]=i;
      j+=1;
    }
  }
  select=sel[int(random(nbtns-1))];
}

void selector() {
  for (int i=0;i<nbtns;i++) {
    b[i].h=0;
    b[i].s=0;
  }
  b[select].h=55;
  b[select].s=360;
}
class Button {
  float xpos;
  float ypos;
  float diam;
  float h;
  float s;
  float b;
  
  Button(float tempxpos,float tempypos,float tempdiam, float temph, float temps) {
    xpos=tempxpos;
    ypos=tempypos;
    diam=tempdiam;
    h=temph;
    s=temps;
  }
  
  void display() {
    if (sqrt(sq(mouseX-xpos)+sq(mouseY-ypos))<diam/2) {
      strokeWeight(3);
    }
    else{
      strokeWeight(1);
    }
    fill(h,s,360);
    ellipse(xpos,ypos,diam,diam);
  }
}


