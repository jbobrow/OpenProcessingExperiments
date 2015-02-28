
float col;
float angle_t, angle_o, angle_e, angle_d;
float lastangle_t,lastangle_o,lastangle_e,lastangle_d;
int tplay,twon,tlost,oplay,owon,olost,eplay,ewon,elost;
PFont font;
button button1;
button button2;
button button3;
button button4;
button button5;
button button6;
button button7;
detail detail1;
detail detail2;
detail detail3;

void setup(){
 size(700,700);
 smooth();
 textSize(28);
 font=loadFont("Constantia-48.vlw");
 textFont(font);
}

void draw(){
  
  if(angle_t > lastangle_t){
    lastangle_t +=1;
  } else if(angle_t < lastangle_t){
    lastangle_t -=1;
  }
  if(angle_o > lastangle_o){
    lastangle_o +=1;
  } else if(angle_o < lastangle_o){
    lastangle_o -=1;
  }
  if(angle_e > lastangle_e){
    lastangle_e +=1;
  } else if(angle_e < lastangle_e){
    lastangle_e -=1;
  }  
  if(angle_d > lastangle_d){
    lastangle_d +=1;
  } else if(angle_d < lastangle_d){
    lastangle_d -=1;
  }
  
  noStroke();
  fill(172);
  rect(0,0,width,height);
  
  textSize(28);
  textAlign(LEFT);
  
//  buttons
    button1=new button("Australia",width*.6,height*.6);
    button1.display();
    button2=new button("South Africa",width*.6,height*.6+40);
    button2.display();
    button3=new button("England",width*.6,height*.6+80);
    button3.display();
    button4=new button("Pakistan",width*.6,height*.6+120);
    button4.display();
    button5=new button("Sri Lanka",width*.6,height*.6+160);
    button5.display();
    button6=new button("New Zealand",width*.6,height*.6+200);
    button6.display();
    button7=new button("West Indies",width*.6,height*.6+240);
    button7.display();
  
  noFill();
  stroke(220);
  strokeWeight(width/15);
  ellipse(width/4,height/4,width*.4,height*.4);
  ellipse(width*.75,height/4,width*.4,height*.4);
  ellipse(width/4,height*.75,width*.4,height*.4);
  detail1=new detail(width/4,height/4,"Test");
  detail2=new detail(width*.75,height/4,"One Day");
  detail3=new detail(width/4,height*.75,"T-20");
  detail1.display(tplay,twon,tlost);
  detail2.display(oplay,owon,olost);
  detail3.display(eplay,ewon,elost);
  
  noFill();
  float angle_rad_t=radians(lastangle_t)-HALF_PI;
  float angle_rad_d=radians(lastangle_d);
  float angle_rad_o=radians(lastangle_o)-HALF_PI;
  float angle_rad_e=radians(lastangle_e)-HALF_PI;
  
  stroke(22,48,255);
  strokeCap(SQUARE);
  
//  test
  arc(width/4,height/4,width*.4,height*.4,-HALF_PI,angle_rad_t);
//  number of draws in test
  stroke(35,217,62);
  arc(width/4,height/4,width*.4,height*.4,angle_rad_t,angle_rad_t+angle_rad_d);
//  oneday
  stroke(22,48,255);
  arc(width*.75,height/4,width*.4,height*.4,-HALF_PI,angle_rad_o);
//  t-20 or entertaintment version
  arc(width/4,height*.75,width*.4,height*.4,-HALF_PI,angle_rad_e); 
  
  fill(0,86,138);
  textSize(38);
  text("India versus :",width*.7,height*.55);
  fill(255);
  textSize(12);
  textAlign(LEFT);
  text("Indian wins are blue, draw's are green, losses are gray",width*.45,height*.97);
  text("Data source internet (as available on march'13)",width*.45,height*.99);
}

class button{
  float xpos,ypos;
  String s;
  button(String st,float xpost,float ypost){
   s=st;
   xpos=xpost;
   ypos=ypost;
  }
  
  void display(){
    if(overRect()){
  fill(col);
    }else{fill(101,125,105);}
  rect(xpos,ypos+2,width*.3,-30,5);
  fill(200,10,10);
  text(s,xpos,ypos);
  }
  
  boolean overRect()  {
  if (mouseX >= xpos && mouseX <= xpos+width*.3 && 
      mouseY >= ypos-30 && mouseY <= ypos+2) {
    return true;
  } else {
    return false;
  }
}

}

class detail{
  float xx,yy;
  int pp,ww,ll;
  String ss;
  detail(float x, float y,String s){
  xx=x;
  yy=y;
  ss=s;
  }
  void display(int pp,int ww, int ll){
    textSize(20);
    textAlign(CENTER);
    fill(0);
    text(ss,xx,yy-60);
    text("Played: "+pp,xx,yy-30);
    text("Won: "+ww,xx,yy);
    text("Lost: "+ll,xx,yy+30);
  }
}

void mousePressed() {
  
  if (button1.overRect()) {
    tplay=86;
    twon=24;
    tlost=38;
    oplay=109;
    owon=37;
    olost=64;
    eplay=7;
    ewon=3;
    elost=4;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);   
  } 
  if (button2.overRect()) {
    tplay=27;
    twon=7;
    tlost=12;
    oplay=66;
    owon=24;
    olost=40;
    eplay=7;
    ewon=5;
    elost=2;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);

  }
   if (button3.overRect()) {
    tplay=107;
    twon=20;
    tlost=40;
    oplay=86;
    owon=46;
    olost=35;
    eplay=7;
    ewon=3;
    elost=4;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);

  }
   if (button4.overRect()) {
    tplay=59;
    twon=9;
    tlost=12;
    oplay=124;
    owon=49;
    olost=71;
    eplay=5;
    ewon=3;
    elost=1;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);
  }
  if (button5.overRect()) {
    tplay=35;
    twon=14;
    tlost=6;
    oplay=139;
    owon=75;
    olost=52;
    eplay=5;
    ewon=3;
    elost=2;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);
  }
  if (button6.overRect()) {
    tplay=52;
    twon=18;
    tlost=9;
    oplay=88;
    owon=46;
    olost=37;
    eplay=4;
    ewon=0;
    elost=4;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);
  }
  if (button7.overRect()) {
    tplay=88;
    twon=14;
    tlost=30;
    oplay=106;
    owon=46;
    olost=57;
    eplay=3;
    ewon=1;
    elost=2;
    angle_t=round(360*twon/tplay);
    angle_o=round(360*owon/oplay);
    angle_e=round(360*ewon/eplay);
    angle_d=round(360*(tplay-twon-tlost)/tplay);
  }
}
