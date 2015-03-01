
PImage lineImage,mapImage,GuineaMap,SeirraMap,LiberiaMap,NigeriaMap,NC;
Table data;
int Min,Max;
float t;
float placeX = -50;
float placeY = 500;
float placeX2 = 0;
float placeY2 = 550;
PFont CL,CB,EB;
;

void setup(){
  size(1680,1080);
  data = loadTable("EVD.csv", "header, csv");
  lineImage = loadImage("mal.png");
  mapImage = loadImage("ma.png");
  GuineaMap = loadImage("Guinea.png");
  SeirraMap = loadImage("Seirra.png");
  LiberiaMap = loadImage("Liberia.png");
  NigeriaMap = loadImage("Nigeria.png");
  NC = loadImage("NC.png");
  CL = loadFont("Code-Light-26.vlw");
  CB = loadFont("Code-Bold-48.vlw");
  EB = loadFont("Ebrima-32.vlw");
}

void draw(){
  background(#323232);
  textFont(EB);
  tint(255, 50);
  image(mapImage,820,100,800,859);
  table1();
  table2();
  tint(255, 255);
  image(lineImage,820,100,800,859);
  image(NC,1520,925,73,8);
  Text ();
}




void table1(){ 
  float mx = mouseX;
  float my = mouseY;
  strokeWeight(1);
  stroke(#F0F0F0,100);
  line (200+placeX, 150+placeY, 832+placeX, 150+placeY);
  line (200+placeX, placeY, 200+placeX, 150+placeY);
  stroke(#F0F0F0,30);
  line (400+placeX, placeY, 400+placeX, 150+placeY);
  line (600+placeX, placeY, 600+placeX, 150+placeY);
  line (800+placeX, placeY, 800+placeX, 150+placeY);
  noStroke();
  for (int i=0;i<10;i++){
    fill(#323232);
    rect(210+placeX,i*15+placeY,600,10);
  }
  fill(#F0F0F0);
  textSize(11);
  textAlign(CENTER);
  text("0",200+placeX,170+placeY);
  text("500",400+placeX,170+placeY);
  text("1000",600+placeX,170+placeY);
  text("1500",800+placeX,170+placeY);
  
  fill(#2f2f2f);
  stroke(#606060);
  rect(880+placeX,placeY+80,155,70);
  fill(#43a2a1);
  rect(830+placeX+180, placeY+90,10 , 20);
  fill(#ed7777);
  rect(830+placeX+180, placeY+120,10 , 20);
  fill(#F0F0F0,150);
  textSize(11.5);
  textAlign(LEFT);
  text("Number of Cases",720+placeX+180,15+placeY+90);
  text("Number of Deaths",720+placeX+180,45+placeY+90);
  
  for (TableRow row : data.rows ()) {
    int i =0;
    int No = row.getInt("No");
    
    float GuineaCases = row.getFloat("GuineaCases");
    float GuineaDeaths = row.getFloat("GuineaDeaths"); 
    
    float SierraCases = row.getFloat("SierraCases");
    float SierraDeaths = row.getFloat("SierraDeaths"); 
    
    float LiberiaCases = row.getFloat("LiberiaCases");
    float LiberiaDeaths = row.getFloat("LiberiaDeaths");
    
    float NigeriaCases = row.getFloat("NigeriaCases");
    float NigeriaDeaths = row.getFloat("NigeriaDeaths");
    
    float gc = map(GuineaCases,0,1500,0,600);
    float gd = map(GuineaDeaths,0,1500,0,600);
     
    float lc = map(LiberiaCases,0,1500,0,600);
    float ld = map(LiberiaDeaths,0,1500,0,600);
     
    float sc = map(SierraCases,0,1500,0,600);
    float sd = map(SierraDeaths,0,1500,0,600);
     
    float nc = map(NigeriaCases,0,1500,0,600);
    float nd = map(NigeriaDeaths,0,1500,0,600); 
    
 
    if (mx<=270+placeX2 && mx>170+placeX2&& my<=400+placeY2&&my>=200+placeY2 && No==1){
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20);    
      noStroke();  
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      }if (mx<=370+placeX2 &&mx>270+placeX2&&my<=400+placeY2&&my>=200+placeY2 && No==2){ 
      fill(#43a2a1);
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20); 
      noStroke();
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      }if (mx<=470+placeX2 &&mx>370+placeX2&& my<=400+placeY2&&my>=200+placeY2  && No==3){ 
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20); 
      noStroke();
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      }if (mx<=570+placeX2 &&mx>470+placeX2 && my<=400+placeY2 && my>=200+placeY2  && No==4){ 
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20); 
      noStroke();
      
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      }if (mx<=670+placeX2 &&mx>570+placeX2&& my<=400+placeY2&&my>=200+placeY2  && No==5){ 
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20); 
      noStroke();
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      } if (mx<=770+placeX2 &&mx>670+placeX2&& my<=400+placeY2&&my>=200+placeY2 &&No==6){ 
      fill(#43a2a1);
      rect(200+placeX, placeY+30,gc , 20);
      rect(200+placeX, placeY+60,lc , 20);
      rect(200+placeX, placeY+90,sc , 20);
      rect(200+placeX, placeY+120,nc , 20);
      
      fill(#ed7777);
      rect(200+placeX, placeY+30,gd , 20);
      rect(200+placeX, placeY+60,ld , 20);
      rect(200+placeX, placeY+90,sd , 20);
      rect(200+placeX, placeY+120,nd , 20); 
      noStroke();
      float tg = map (GuineaCases,0,1500,0,255);
      float ts = map (SierraCases ,0,1500,0,255);
      float tl = map (LiberiaCases,0,1500,0,255);
      float tn = map (NigeriaCases,0,1500,0,255);
      tint(255, tg);
      image(GuineaMap,846,388,83.5,69);  
      tint(255, tl);
      image(LiberiaMap,881.6,441.6,49,50);
      tint(255, ts);
      image(SeirraMap,862,422,34,39);
      tint(255, tn);
      image(NigeriaMap,1050,380,140,114); 
      textAlign(LEFT);
      if(gc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Guinea",100+placeX,placeY+43);
      fill(#F0F0F0,150);
      textSize(10);
      fill(#F0F0F0,150);
      text("Guinea",870,415);
      }if(lc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Liberia",100+placeX,placeY+73);
      textSize(10);
      fill(#F0F0F0,150);
      text("Liberia",870,500);
      strokeWeight(1);
      stroke(#F0F0F0,150);
      line(906,466,885,485);
      }if(sc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Sierra Leone",100+placeX,placeY+103);
      textSize(10);
      fill(#F0F0F0,150);
      textLeading(12);
      text("Sierra Leone",825,450,40,40);
      line(874,440,860,460);
      }if(nc>0){
      textSize(12);
      fill(#F0F0F0,255);
      text("Nigeria",100+placeX,placeY+133);
      textSize(14);
      fill(#F0F0F0,150);
      text("Nigeria",1080,445);
      }
      }
  }
  println(mx,my);
}


void table2(){ 
  float mx = mouseX;
  float my = mouseY;
  strokeWeight(1);
  stroke(#F0F0F0,100);
  line (150+placeX2, 400+placeY2, 790+placeX2, 400+placeY2);
  line (150+placeX2, 200+placeY2, 150+placeX2, 400+placeY2);
  stroke(#F0F0F0,30);
  line (150+placeX2, 300+placeY2, 790+placeX2, 300+placeY2);
  line (150+placeX2, 200+placeY2, 790+placeX2, 200+placeY2);
  noStroke();
  
  for (int i=0;i<50;i++){
    fill(#323232);
    rect(160+i*15+placeX2,200+placeY2,10,150);
  }
  
  fill(#292929,120);
  if (mx<=270+placeX2 &&mx>170+placeX2&& my<=400+placeY2&&my>=200+placeY2){
    rect(170+placeX2,200+placeY2,100,200);
  }if (mx<=370+placeX2 &&mx>270+placeX2&&my<=400+placeY2&&my>=200+placeY2){ 
    rect(270+placeX2,200+placeY2,100,200);
  }if (mx<=470+placeX2 &&mx>370+placeX2&& my<=400+placeY2&&my>=200+placeY2){ 
    rect(370+placeX2,200+placeY2,100,200);
  }if (mx<=570+placeX2 &&mx>470+placeX2 && my<=400+placeY2&&my>=200+placeY2){
    rect(470+placeX2,200+placeY2,100,200);
  }if (mx<=670+placeX2 &&mx>570+placeX2&& my<=400+placeY2&&my>=200+placeY2){ 
    rect(570+placeX2,200+placeY2,100,200);
  }if (mx<=770+placeX2 &&mx>670+placeX2&& my<=400+placeY2&&my>=200+placeY2){
    rect(670+placeX2,200+placeY2,100,200);
  }
  
  fill(#F0F0F0);
  textSize(12);
  textAlign(LEFT);
  text("Case Fatality Rate",50+placeX2,195+placeY2,50,80);
  textAlign(CENTER);
  text("Mar",220+placeX2,420+placeY2);
  text("Apr",320+placeX2,420+placeY2);
  text("May",420+placeX2,420+placeY2);
  text("Jun",520+placeX2,420+placeY2);
  text("Jul",620+placeX2,420+placeY2);
  text("Aug",720+placeX2,420+placeY2);
  textSize(9);
  fill(#F0F0F0,100);
  textAlign(RIGHT);
  text("0%",145+placeX2,405+placeY2);
  text("50%",145+placeX2,305+placeY2);
  text("100%",145+placeX2,205+placeY2);
  
  fill(#2f2f2f);
  stroke(#606060);
  rect(830+placeX2,200+placeY2,280,200);
  
  for(int l=0;l<6;l++){
    stroke(#F0F0F0,50);
    strokeWeight(1);
    line(860+placeX2+l*40,300+placeY2,860+placeX2+l*40,360+placeY2);
  }
  
  for (int b=0;b<8;b++){
    noStroke();
    fill(#2f2f2f);
    rect(850+placeX2,300+placeY2+b*10,260,5);
  }
  
  fill(#fddb7a,200);
  ellipse(860+placeX2, 300+placeY2,2 , 2);
  ellipse(900+placeX2, 300+placeY2,4 , 4);
  ellipse(940+placeX2, 300+placeY2,8 , 8);
  ellipse(980+placeX2, 300+placeY2,16 , 16);
  ellipse(1020+placeX2, 300+placeY2,32 , 32);
  ellipse(1060+placeX2, 300+placeY2,64 , 64);
  fill(#F0F0F0,150);
  textSize(11.5);
  textAlign(LEFT);
  text("Number of Ebola Cases in Africa",850+placeX2,220+placeY2,100,60);
  textSize(11);
  text("100",850+placeX2,380+placeY2);
  text("200",890+placeX2,380+placeY2);
  text("400",930+placeX2,380+placeY2);
  text("800",970+placeX2,380+placeY2);
  text("1600",1005+placeX2,380+placeY2);
  text("3200",1045+placeX2,380+placeY2);
  
  
  for (TableRow row : data.rows ()) {
    int i =0;
    int No = row.getInt("No");
    
    float GuineaCases = row.getFloat("GuineaCases");
    float GuineaDeaths = row.getFloat("GuineaDeaths"); 
    
    float SierraCases = row.getFloat("SierraCases");
    float SierraDeaths = row.getFloat("SierraDeaths"); 
    
    float LiberiaCases = row.getFloat("LiberiaCases");
    float LiberiaDeaths = row.getFloat("LiberiaDeaths");
    
    float NigeriaCases = row.getFloat("NigeriaCases");
    float NigeriaDeaths = row.getFloat("NigeriaDeaths");
    
    float gc = map(GuineaCases,0,1500,0,750);
    float gd = map(GuineaDeaths,0,1500,0,750);
     
    float lc = map(LiberiaCases,0,1500,0,750);
    float ld = map(LiberiaDeaths,0,1500,0,750);
     
    float sc = map(SierraCases,0,1500,0,750);
    float sd = map(SierraDeaths,0,1500,0,750);
     
    float nc = map(NigeriaCases,0,1500,0,750);
    float nd = map(NigeriaDeaths,0,1500,0,750); 
    ellipseMode(CENTER);
    float tc=gc+lc+sc+nc;
    float td=gd+ld+sd+nd;
    float size = map(tc,0,5000,0,200);
    float cfr=td/tc;
    fill(#fddb7a,200);
    ellipse(120+No*100+placeX2, 400-cfr*200+placeY2, size, size);
  }
}

void Text(){
  String c ="Ebola virus disease is a disease of humans and other primates caused by an ebola virus. Symptoms start two days to three weeks after contracting the virus, with a fever, sore throat, muscle pain and headaches. Typically, vomiting, diarrhea and rash follow, along with decreased functioning of the liver and kidneys. Around this time, affected people may begin to bleed both within the body and externally.The Ebola Virus outbreak in this time began in Guinea in December 2013, but was not detected until March 2014, after which it spread to Liberia, Sierra Leone, Nigeria and Senegal. The outbreak is caused by the Zaire ebolavirus, known simply as the Ebola virus . It is the most severe outbreak of Ebola in terms of the number of human cases and deaths since the discovery of the virus in 1976, with the number of cases from the current outbreak now outnumbering the combined cases from all known previous outbreaks. ";
  textSize(14);
  fill(#F0F0F0,100);
  text(c,200+placeX,240,600,600);
  textSize(10);
  text("Number of Cases",1520,914);
  text("0",1520,950);
  text("1500",1580,950);
  fill(#F0F0F0,100);
  textSize(11);
  text("* suspected case and death counts from WHO",150,1060);
  textFont(CL);
  textAlign(LEFT);
  textSize(26);
  fill(#F0F0F0);
  text("Fatality Rate And Cases Number in Africa",200+placeX,placeY2+180);
  text("Cases and Deaths Number in Each Countries",200+placeX,placeY-20);
  textFont(CB);
  textSize(48);
  text("2014 West Africa",200+placeX,130);
  text("Ebola virus outbreak",200+placeX,180);
}


