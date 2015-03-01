
heart mybheart[]= new heart[1];
heart mymheart[]= new heart[40];
heart mysheart[]= new heart[60];
heart mybheart1[]= new heart[1];
heart mymheart1[]= new heart[40];
heart mysheart1[]= new heart[60];
heart mysheart2[]= new heart[60];
heart mymheart2[]= new heart[40];
heart mymheart3[]= new heart[40];
heart mymheart4[]= new heart[10];

int count=0;
int state=0;

void setup() {
  size(500, 500);
  for (int i = 0; i < 60; i++){
     mysheart1[i]= new heart(color(255,255,255,random(80,200)),color(255,255,255,random(80,200)),random(width),random(height));
  }
  for(int k = 0; k < mymheart1.length; k++){
     mymheart1[k]= new heart(color(255),color(255),int(random(-5,width-50)),int(random(425,470))); 
  }
  for (int n = 0; n < mysheart2.length; n++){
     mysheart2[n]= new heart(color(random(150,255),random(50,250),random(50,250)),color(random(150,255),random(50,250),random(50,250)),int(random(-40,width)),int(random(410,470)));
  }
  for(int m = 0; m < mymheart2.length; m++){
    mymheart2[m]= new heart(color(90,200,65),color(50,160,25),int(random(-60,120)),int(random(45,220))); 
  }
  for (int f = 0; f < mybheart1.length; f++){
     mybheart1[f]= new heart( color(240,240,0),color(240,240,0), 370,0);
  }
  for (int j = 0; j < 60;j++){
      mysheart[j]= new heart(color(random(235,255),random(160,255),random(0,10)),color(random(230,255),random(150,255),random(0,10)),200+cos(j)*150,220+sin(j)*150);
  }
 for(int g = 0; g < 35; g++){
    mymheart3[g]= new heart(color(255,130,0),color(240,240,0),200+sin(g)*130,195+cos(g)*130); 
  }
  for (int s = 0; s < mybheart.length; s++){
      mybheart[s]= new heart( color(250,250,0), color(250,250,0), 200,150);
  }
  for(int h = 0; h < mymheart4.length; h++){
    mymheart4[h]= new heart(color(random(160,255),random(120,255),random(0,20)),color(50,160,25),random(-20,30),random(90,200)); 
  }
  for(int d = 0; d < mymheart.length; d++){
     mymheart[d]= new heart(color(random(160,255),random(120,205),random(0,20)),color(50,160,25),int(random(-45,120)),int(random(45,220))); 
 }
}

void draw() {
  count++;
  if (state == 0) {
    background(205,245,255,100);
    tree();
    fill(255);
    noStroke();
    rect(0,480,width,height);
    
    for(int i = 0; i < mysheart.length; i++){
      //mysheart1[i]= new heart(color(255,255,255,random(80,200)),color(255,255,255,random(80,200)),random(width),random(height));
      mysheart1[i].displayS();
      mysheart1[i].dropS();
  }
    for(int k = 0; k < mymheart1.length; k++){
     // mymheart[k]= new heart(color(255),color(255),int(random(-5,width-50)),int(random(425,470)));
      mymheart1[k].displayM1();
      mymheart1[k].snowM();
      mymheart1[k].jiggleM();
    }
    if (count>200) {
      state = 1;
    }
  } else if (state == 1) {
    background(90,190,255);
    tree();
    fill(80,225,60);
    noStroke();
    rect(0,480,width,height);
    
    for(int n = 0; n < 30; n++){
     // mysheart[n]= new heart(color(random(150,255),random(50,250),random(50,250)),color(random(150,255),random(50,250),random(50,250)),int(random(-40,width)),int(random(410,470)));
      mysheart2[n].displayS();
      mysheart2[n].bloomS();
      mysheart2[n].jigglesS();
    }
    for(int m = 0; m < mymheart2.length; m++){
    //  mymheart[m]= new heart(color(90,200,65),color(50,160,25),int(random(-45,120)),int(random(45,220))); 
      mymheart2[m].displayM1();
      mymheart2[m].springLeavesM();
      mymheart2[m].jiggleM();
    }
    for (int f = 0; f < mybheart1.length; f++){
     // mybheart[f]= new heart( color(240,240,0),color(240,240,0), 370,0);
      mybheart1[f].displayB1();
      mybheart1[f].springjiggleB();
    }
    if (count>400) {
      state = 2;
    }
  } else if (state == 2) {
    background(130,235,255);
    for(int j = 0; j < 30; j++){
    //  mysheart[j]= new heart(color(random(230,255),random(150,255),random(0,10)),color(random(230,255),random(150,255),random(0,10)),200+cos(j)*150,220+sin(j)*150);
      mysheart[j].displayS();
      mysheart[j].summerjiggleS();
    }
    for(int g = 0; g < 17; g++){
     // mymheart[g]= new heart(color(255,130,0),color(240,240,0),200+sin(g)*130,195+cos(g)*130);
      mymheart3[g].jiggleM();
      mymheart3[g].displayM2();
  }
    for (int s = 0; s < mybheart.length; s++){
     // mybheart[s]= new heart( color(240,240,0),color(240,240,0), 200,150);
      mybheart[s].displayB2();
      mybheart[s].displayB1();
      mybheart[s].jiggleB();
    }
    if (count>800) {
      state = 3;
    }
  } else if (state == 3) {
    background(140,205,255);
    tree();
    fill(150,150,0);
    noStroke();
    rect(0,480,width,height);
    for(int h = 0; h < 5; h++){
    // mymheart[h]= new heart(color(random(230,255),random(120,255),random(0,20)),color(240,240,0),random(120,330),random(90,200)); 
      mymheart4[h].leaveM();
      mymheart4[h].displayM1();
     mymheart4[h].jiggleM();
  }
    for(int d = 0; d < mymheart.length; d++){
    //  mymheart[d]= new heart(color(random(200,255),random(150,205),random(0,20)),color(50,160,25),int(random(-45,120)),int(random(45,220))); 
      mymheart[d].displayM1();
     mymheart[d].springLeavesM();
      mymheart[d].jiggleM();
    }
    if (count>1000) {
      count=0;
      state=0;
    }
  }
  textSize(35);
  fill(0);
  text("SEASONS  OF  LOVE", 100, 100);
  //print(count+"\n");
}

void tree() {
  stroke(100, 70, 50);
  strokeWeight(20);
  line(70, 230, 120, 150);
  line(10, 230, 5, 120);
  line(70, 230, 130, 200);
  line(30, 230, 35, 100); 
  line(50, 230, 80, 150);
  fill(100, 70, 50); 
  noStroke();
  rect(0, 230, 80, 520);
  stroke(0);
  strokeWeight(0.5);
  smooth();
  line(10, 220, 0, 500);
  line(70, 220, 80, 500);
  line(40, 230, 40, 500);
  strokeWeight(1);
  line(20, 240, 15, 450);
  line(60, 300, 65, 470);
}



class heart{
float x,y;
color c;
color b;
int count=0;
heart(color tempc, color tempb, float tempXpos, float tempYpos) { // The construfilltor is defined with arguments.
    c = tempc;
    b= tempb;
    x = tempXpos;
    y = tempYpos;
  }
 //B heart
void displayB1() {
stroke(b);
fill(c);
beginShape();
    vertex(55+x, 65+y);
    bezierVertex(55+x, -5+y, 230+x, 5+y, 55+x, 155+y);
    vertex(55+x, 65+y);
    bezierVertex(55+x, -5+y, -130+x, 5+y, 55+x, 155+y);
    endShape();
    stroke(c);
    strokeWeight(2);
    line(55+x,65+y,55+x,153+y);
}
void displayB2() {
stroke(b);
fill(c);
count++;
if (count>40){
beginShape();
    vertex(55+x, 85+(y-25));
    bezierVertex(55+x, -5+(y-25), 290+x, 5+(y-25), 55+x, 205+(y-25));
    vertex(55+x, 85+(y-25));
    bezierVertex(55+x, -5+(y-25), -190+x, 5+(y-25), 55+x, 205+(y-25));
    endShape();
    stroke(c);
    strokeWeight(2);
    line(55+x,85+(y-25),55+x,203+(y-25));
}
if (count>60){
  count=0;
}
}
void jiggleB() { 
    x = x + random(-2,2);
    y = y + random(-2,2);
    x = constrain(x,180,230);
    y = constrain(y,140,200);
  }
void springjiggleB() { 
    x = x + random(-3,3);
    y = y + random(-4,2);
    x = constrain(x,350,390);
    y = constrain(y,-10,50);
  }
  
  // S heart
  void displayS() {
stroke(b);
fill(c);
beginShape();
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 85+x, 5+y, 50+x, 30+y);
    vertex(50+x, 15+y);
    bezierVertex(50+x, -5+y, 15+x, 5+y, 50+x, 30+y);
    endShape();
     stroke(c);
    strokeWeight(2);
    line(50+x,15+y,50+x,28+y);
}
void bloomS(){
count++;
if (count > 60){
count=0;
x=int(random(-40,width));
y=int(random(410,470));
}
stroke(80,225,60);
strokeWeight(3);
line(50+x,30+y,50+x,495);
}
void dropS(){
  y= y+2.5;
  if (y > height){
    y=random(10);
  }
}
void summerjiggleS() { 
    x = x + random(-1,1);
    y = y + random(-1,1);
}
 void jigglesS() { 
    x = x + random(-2,2);
    y = y + random(-2,2);
  }


// M heart

void displayM1() {
stroke(b);
fill(c);
beginShape();
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, 120+x, 5+y, 50+x, 60+y);
    vertex(50+x, 25+y);
    bezierVertex(50+x, -5+y, -20+x, 5+y, 50+x, 60+y);
    endShape();
     stroke(c);
    strokeWeight(1);
    line(50+x,25+y,50+x,58+y);
}
void displayM2() {
stroke(b);
fill(c);
count++;
if (count>35){
beginShape();
    vertex(50+x, 20+(y+15));
    bezierVertex(50+x, -5+(y+15), 100+x, 5+(y+15), 50+x, 40+(y+15));
    vertex(50+x, 20+(y+15));
    bezierVertex(50+x, -5+(y+15), -0+x, 5+(y+15), 50+x, 40+(y+15));
endShape();
  stroke(c);
  strokeWeight(3);
  line(50+x,20+(y+15),50+x,37+(y+15));
}
if (count>55){
  count=0;
}
}
void springLeavesM(){
count++;
if (count > 60){
count=0;
x = int(random(-50,120));
y = int(random(45,220));
}
}

void leaveM(){
  x= x+3;
  y= y+2;
  if ((y> height)||(x>width)){
    y=random(90,200);
    x=random(-20,30);
  }
}

void snowM(){
count++;
if (count > 60){
count=0;
x=int(random(-10,width-50));
y=int(random(430,470));
}
}
void jiggleM() { 
  x = x + random(-0.3,0.3);
  y = y + random(-0.3,0.3);
}
}


