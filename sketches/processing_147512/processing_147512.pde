
/*  Path number:
1    olin -- maxey    black path
2    Library--top corner   red path
3     Science -- olin    light blue path
4    Science -- lyman    blue path
5    libs -- jewett    white path
6    libs -- out north    yellow
7
*/


int prob1 = 40;  //number of people from olin-maxey
int prob2 = 20;    //number of people from library to top corner
int prob3 = 10;   // number of people from science to olin
int prob4 = 15;   //number of people from science to lyman
int prob5 = 100;   //number of people from jewett to library
int prob6 = 100;    // number or people from libs to out north

color q1 = (color(0));
color q2 = (color(255,0,0));
color q3 = (#00BFFF);
color q4 = (color(0,0,250));
color q5 = (color(255));
color q6 = (#FFFF00);

float s2 =0.4;           //speed of people


float duration1;
float duration2;         //how long are people expected to be on screen?
float duration3;
float duration4;
float duration5;
float duration6;


person[] people0 = new person[1000];
person[] people1 = new person[1000]; //array of people walking both ways on path 1

person[] people2 = new person[1000];  // arrays of walkers on path 2
person[] people3 = new person[1000];

person[] people4 = new person[1000];
person[] people5 = new person[1000];

person[] people6 = new person[1000];
person[] people7 = new person[1000];

person[] people8 = new person[1000];
person[] people9 = new person[1000];

person[] people10 = new person[1000];
person[] people11 = new person[1000];

int spacing1;
int spacing2;    //the spacing of the people on path 2
int spacing3;
int spacing4;
int spacing5;
int spacing6;



int n1 = 0;
int j1 = 0;
int n2 = 0;
int j2 = 0;
int n3 = 0;
int j3 = 0;
int n4 = 0;
int j4 = 0;
int n5 = 0;
int j5 = 0;
int n6 = 0;
int j6 = 0;


void setup(){
  size(675,430);
  duration1=sqrt(pow(height,2)+pow((2*width/3-10)-(width/2-40),2))/s2;
  duration2=height/s2;
  spacing1=round(2*duration1/prob1);
  spacing2=round(2*duration2/prob2);
  duration3=sqrt(pow(height/2,2)+pow((width/2-40),2))/s2;
  spacing3=round(2*duration3/prob3);
  duration4=width/s2;
  spacing4=round(2*duration4/prob4);
  duration5=sqrt(pow(height-40,2)+pow((width),2))/(s2/2);
  spacing5=round(2*duration5/prob5);
  duration6=sqrt(pow(height-40,2)+pow((width-width/4-30),2))/(s2/2);
  spacing6=round(2*duration6/prob6);
  for ( int i = 0; i<people0.length; i++ ) {
    people0[i] = new person(width/2-40,0,s2);
    people1[i] = new person(2*width/3-10,height,-s2);
  }
  for ( int i = 0; i<people2.length;i++) {
    people2[i] = new person(50,0,s2);
    people3[i] = new person(50,height,-s2);
  }
  for ( int i = 0; i<people4.length;i++) {
    people4[i] = new person(0,height/2,s2);
    people5[i] = new person(width/2-40,0,-s2);
  }
  for ( int i = 0; i<people6.length;i++) {
    people6[i] = new person(0,height/2,s2);
    people7[i] = new person(width,height/2,-s2);
  }
  for ( int i = 0; i<people8.length;i++) {
    people8[i] = new person(0,height-40,s2);
    people9[i] = new person(width,0,-s2);
  }
  for ( int i = 0; i<people10.length;i++) {
    people10[i] = new person(0,height-40,s2);
    people11[i] = new person(3*width/4-30,0,-s2);
  }
}

void draw(){
  background(50,205,50);
  noStroke();
  fill(60);
  quad(75,height-50,75,height-80,115,height-40, 85,height-40);  //shape in bottom left
  fill(150);
  rect(65,30,10,height);     //paths aorund edge
  rect(65,30,width-85,10);
  rect(0,height-40,width-30,10);
  rect(width-30,30,10,height);
  rect(width/2-55,0,30,35);             //path to olin doors
  ellipse(75,height-40,20,20);
  strokeWeight(10);
  stroke(150);
  line(20,2*height/3,70,height-30);     //paths by science
  line(20,2*height/3,70,height/3);
  line(0,2*height/3-30,20,2*height/3);
  line(0,2*height/3,20,2*height/3);
  line(2*width/3-10,height-35,2*width/3-10,height);    //path through Maxey
  line(width/3+85,height-35,width/3+85,height);        //path btwn tennis and Maxew W
  noStroke();
  
  for (int i = 0; i<j1; i++ ){
    people0[i].display(q1);
    people0[i].walk1();
    people1[i].display(q1);
    people1[i].walk1();
  }
  if(j1<people0.length){
    if(frameCount/spacing1 == n1){
      j1++;
      n1++;
    }
  }
  for (int i = 0; i<j2; i++ ){
    people2[i].display(q2);
    people2[i].walk2();
    people3[i].display(q2);
    people3[i].walk2();
  }
  if(j2<people2.length){
    if(frameCount/spacing2 == n2){
      j2++;
      n2++;
    }
  }
  for (int i = 0; i<j3; i++ ){
    people4[i].display(q3);
    people4[i].walk3();
    people5[i].display(q3);
    people5[i].walk3();
  }
  if(j3<people4.length){
    if(frameCount/spacing3 == n3){
      j3++;
      n3++;
    }
  }
  for (int i = 0; i<j4; i++ ){
    people6[i].display(q4);
    people6[i].walk4();
    people7[i].display(q4);
    people7[i].walk4();
  }
  if(j4<people6.length){
    if(frameCount/spacing4 == n4){
      j4++;
      n4++;
    }
  }
  for (int i = 0; i<j5; i++ ){
    people8[i].display(q5);
    people8[i].walk5();
    people9[i].display(q5);
    people9[i].walk5();
  }
  if(j5<people8.length){
    if(frameCount/spacing5 == n5){
      j5++;
      n5++;
    }
  }
  for (int i = 0; i<j6; i++ ){
    people10[i].display(q6);
    people10[i].walk6();
    people11[i].display(q6);
    people11[i].walk6();
  }
  if(j5<people10.length){
    if(frameCount/spacing6 == n6){
      j6++;
      n6++;
    }
  }
  fill(80);
  rect(0,2*height/3+15,15,height/3);         //library
  rect(0,40,35,height/4);                    //science
  rect(60,0,width/2,15);                     //Olin
  rect(60,0,width/3-10,25);
  rect(width/2-20,0,width/7,25);
  rect(3*width/4,0,width/3,15);              //Jewett
  rect(3*width/4,0,30,30);                   //Jewett west
  rect(width-15,0,15,5*height/6);            //Lyman
  rect(75,height-30,width/3,30);             //tennis courts
  rect(width/2-15,height-25, width/5-30,25);    //Maxey west
  rect(width/2,height-7,width/3,7);
  rect(3*width/4-55,height-20,width/4+20,20);      //Maxey
  noStroke();
  fill(255);
  text("Olin",width/4,10);
  text("Olin East",width/2,10);
  text("Jewett",width-100,10);
  text("Tennis Courts",width/4-20,height-10);
  text("Maxey West",width/2+5,height-10);
  text("Maxey",3*width/4,height-10);
  rotate(radians(90));
  translate(40,-50);
  text("Science",30,30);
  translate(height/5,-(width-61));
  text("Lyman",30,0);
  translate(height/2-20,(width-45));
  text("Library",30,30);

}
class person {
  color c;
  float xpos;
  float ypos;
  float speed;
  float r;
  float a = 0;
  float dest;
  float offset;
  color d;
  
  person(float tempXpos,float tempYpos,float tempSpeed){
    xpos = tempXpos+random(-5,5);
    ypos = tempYpos;
    speed = tempSpeed+random(-0.1,0.1);
    r = 5;
    dest = random(-0.1,0.1);
    a = xpos;
    d = color(random(255),random(255),random(255));
  }
  
  void display(color c){
    strokeWeight(.2);
    stroke(0);
    fill(c);
    ellipse(xpos,ypos,r,r);
    noStroke();
  }
  void display1(color c){
    strokeWeight(1);
    stroke(0);
    fill(d);
    ellipse(xpos,ypos,r,r);
    noStroke();
  }
  void walk1(){
    ypos+=speed;
    if(xpos>width/2-40){
      xpos +=speed/abs(speed)*.15;
    }
    if(ypos<height/2){
    xpos+= dest/3;
    } else if(ypos>height/2){
    xpos-=dest/2;
    }
    if(xpos>2*width/3-10){
      xpos -=speed/abs(speed)*.15;
    }
    if(xpos<width/3+80 && ypos>height/50){
      xpos+=.1;
    } else if(xpos>width/2-20 && ypos>height-50){
      xpos-=.1;
    }
    if(xpos<3*width/4-65 && ypos>height-60){
      xpos+=.3;
    } else if(xpos>3*width/4-50 && ypos>height-60){
      xpos-=.3;
    }
  }
  void walk2(){
    if(ypos>15 && ypos<55){
      xpos+=.1*speed/abs(speed);
    } else if(ypos>height-130 && ypos<height-80){
      xpos-=.1*speed/abs(speed);
    }
    ypos += speed;
    if(abs(ypos-a)<height/2){
    xpos+= dest/3;
    } else if(abs(ypos-a)>height/2){
    xpos-=1.5*dest/3;
    }
  }
  void walk3(){
  if(xpos<width/2-30){
    xpos+=2*speed/3;
  }
  ypos+=-speed/abs(speed)*.2; 
  if(ypos<height/4){
    ypos+= dest;
    } else if(ypos>height/4){
    ypos-=dest;
    }
   if(xpos<width/2-50){
     if(ypos<35){
       ypos+=.3;
       xpos+=.2;
     }
   }
  }
  void walk4(){
   xpos+=speed;
   if(xpos<width/2){
     ypos+=dest; 
   } else if(xpos>width/2){
     ypos-=dest;
   }
  }
  void walk5(){
    xpos+=speed;
    if(abs(xpos-90)<35 && abs(ypos-385)<50){
      xpos-=speed;
      ypos+=-.4;
    }
    if(abs(xpos-90)>35 && abs(ypos-385)>50){
    ypos+=-.6*speed;
    }
    if (xpos<width/2){
      ypos+=dest*random(1,2);
    } else if(xpos>width/2){
      ypos-=dest*random(1,2);
    }
  }
  void walk6(){
   xpos+=speed;
   if(abs(xpos-90)<20 && abs(ypos-385)<50){
      xpos-=speed;
      ypos+=-.4;
    }
    if(abs(xpos-90)>35 && abs(ypos-385)>50){
    ypos+=-speed;
    } else{
      ypos-=.1;
    }
    if(xpos>3*width/4-10){
      xpos-=speed;
    }
    if(ypos<height/2){
      ypos+=dest;
    } else if(ypos>height/2){
      ypos-=dest;
    }
    if(xpos>3*width/4-55 && ypos<40){
      xpos-=.3;
    }
  }
}


