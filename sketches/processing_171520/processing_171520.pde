
int xpos;
int ypos;
char hrdigit1;
char hrdigit2;
int min1;
char mindigit2;
char secdigit1;
char secdigit2;
void setup(){
  size(800,560);
  background(0);
  smooth();
  frameRate(1);
  draw();
}

void draw() {
  noStroke();
  digit1();
  digit2();
  digit3();
  digit4();
  digit5();
  digit6();
}
void digit1(){
  int hr = hour();
  String shr = str(hr);
  char hr1 = shr.charAt(0);
  int hrdigit1 = hr1;
  xpos = 0;
  ypos = 0;
  if(hrdigit1==48){tick0();}
  if(hrdigit1==49){tick1();}
  if(hrdigit1==50){tick2();}
  if(hrdigit1==51){tick3();}
  if(hrdigit1==52){tick4();}
  if(hrdigit1==53){tick5();}
  if(hrdigit1==54){tick6();}
  if(hrdigit1==55){tick7();}
  if(hrdigit1==56){tick8();}
  if(hrdigit1==57){tick9();}
  
}
void digit2(){
  int hr = hour();
  String shr = str(hr);
  if(shr.length()>1){
    char hr2 = shr.charAt(1);
    int hrdigit2 = hr2;
    xpos = 200;
    ypos = 0;
    if(hrdigit2==48){tick0();}
    if(hrdigit2==49){tick1();}
    if(hrdigit2==50){tick2();}
    if(hrdigit2==51){tick3();}
    if(hrdigit2==52){tick4();}
    if(hrdigit2==53){tick5();}
    if(hrdigit2==54){tick6();}
    if(hrdigit2==55){tick7();}
    if(hrdigit2==56){tick8();}
    if(hrdigit2==57){tick9();}
  }else if(shr.length()==1){
    char hr2 = shr.charAt(0);
    int hrdigit2 = hr2;
    xpos = 200;
    ypos = 0;
    if(hrdigit2==48){tick0();}
    if(hrdigit2==49){tick1();}
    if(hrdigit2==50){tick2();}
    if(hrdigit2==51){tick3();}
    if(hrdigit2==52){tick4();}
    if(hrdigit2==53){tick5();}
    if(hrdigit2==54){tick6();}
    if(hrdigit2==55){tick7();}
    if(hrdigit2==56){tick8();}
    if(hrdigit2==57){tick9();}
  }else{
    tick0();
  }
}
void digit3(){
  int min = minute();
  String smin = str(min);
  char min1 = smin.charAt(0);
  int mindigit1 = min1;
  xpos = 0;
  ypos = 160;
  if(mindigit1==48){tick0();}
  if(mindigit1==49){tick1();}
  if(mindigit1==50){tick2();}
  if(mindigit1==51){tick3();}
  if(mindigit1==52){tick4();}
  if(mindigit1==53){tick5();}
  if(mindigit1==54){tick6();}
  if(mindigit1==55){tick7();}
  if(mindigit1==56){tick8();}
  if(mindigit1==57){tick9();}
}
void digit4(){
  int min = minute();
  String smin = str(min);
  if(smin.length()>1){
    char min2 = smin.charAt(1);
    int mindigit2 = min2;
    xpos = 200;
    ypos = 160;
    if(mindigit2==48){tick0();}
    if(mindigit2==49){tick1();}
    if(mindigit2==50){tick2();}
    if(mindigit2==51){tick3();}
    if(mindigit2==52){tick4();}
    if(mindigit2==53){tick5();}
    if(mindigit2==54){tick6();}
    if(mindigit2==55){tick7();}
    if(mindigit2==56){tick8();}
    if(mindigit2==57){tick9();}
  }else if(smin.length()==1){
    char min2 = smin.charAt(0);
    int mindigit2 = min2;
    xpos = 200;
    ypos = 160;
    if(mindigit2==48){tick0();}
    if(mindigit2==49){tick1();}
    if(mindigit2==50){tick2();}
    if(mindigit2==51){tick3();}
    if(mindigit2==52){tick4();}
    if(mindigit2==53){tick5();}
    if(mindigit2==54){tick6();}
    if(mindigit2==55){tick7();}
    if(mindigit2==56){tick8();}
    if(mindigit2==57){tick9();}
  }else{
    tick0();
  }
}
void digit5(){
  int sec = second();
  String ssec = str(sec);
  char sec1 = ssec.charAt(0);
  int secdigit1 = sec1;
  xpos = 0;
  ypos = 320;
  if(secdigit1==48){tick0();}
  if(secdigit1==49){tick1();}
  if(secdigit1==50){tick2();}
  if(secdigit1==51){tick3();}
  if(secdigit1==52){tick4();}
  if(secdigit1==53){tick5();}
  if(secdigit1==54){tick6();}
  if(secdigit1==55){tick7();}
  if(secdigit1==56){tick8();}
  if(secdigit1==57){tick9();}
}
void digit6(){
  int sec = second();
  String ssec = str(sec);
  if(ssec.length()>1){
    char sec2 = ssec.charAt(1);
    int secdigit2 = sec2;
    xpos = 200;
    ypos = 320;
    if(secdigit2==48){tick0();}
    if(secdigit2==49){tick1();}
    if(secdigit2==50){tick2();}
    if(secdigit2==51){tick3();}
    if(secdigit2==52){tick4();}
    if(secdigit2==53){tick5();}
    if(secdigit2==54){tick6();}
    if(secdigit2==55){tick7();}
    if(secdigit2==56){tick8();}
    if(secdigit2==57){tick9();}
  }else if(ssec.length()==1){
    char sec2 = ssec.charAt(0);
    int secdigit2 = sec2;
    xpos = 200;
    ypos = 320;
    if(secdigit2==48){tick0();}
    if(secdigit2==49){tick1();}
    if(secdigit2==50){tick2();}
    if(secdigit2==51){tick3();}
    if(secdigit2==52){tick4();}
    if(secdigit2==53){tick5();}
    if(secdigit2==54){tick6();}
    if(secdigit2==55){tick7();}
    if(secdigit2==56){tick8();}
    if(secdigit2==57){tick9();}
  }else{
    tick0();
  }
}
void tick1(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick2(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick3(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}

void tick4(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick5(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick6(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick7(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick8(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==0)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick9(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==1)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}
void tick0(){
  for(int x=0;x<2;x++){
    for(int y=0;y<2;y++){
      if((x==1)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else if((x==1)&&(y==0)){
        fill(random(255),random(255),random(255));
      }else if((x==0)&&(y==1)){
        fill(random(255),random(255),random(255));
      }else{
        fill(0);
      }
      rect(x*100+200+xpos,y*80+40+ypos,100,80);
    }
  }
}


