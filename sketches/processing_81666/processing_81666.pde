
//This is a representation of every presidential election over the last 100 years. 
//Initially it is a bar graph representing the electoral vote for each presidential 
//election year. Hit any key, however, and the bar graph will change to depict the popular 
//vote for each election year. The frame rate is really slow so there is still problems with 
//hitting keys. 


int a = 25;
int y = 1912;
int n=0;
int Q=1;

void setup (){
  size(1100,500);
  frameRate(2);
  }
  
 void draw () {
   background(#000000);
   Graphtype();
   names();
   electionyear();
   timescale();
}


void Graphtype(){
  if (keyPressed == true){
    Q=-Q;
   }
  if (Q > 0){
    EVstuff();
   }
  if (Q < 0){
    PVstuff();
   }
}

void EVstuff(){
   graphEV();
   labelEV();
   scaleEV();
 }
 
void PVstuff(){
  graphPV();
  labelPV();
  scalePV();
}
 
void scaleEV(){
  textSize(20);
  //left side
  text(100, width/2-100, height/2);
  text(200, width/2-200, height/2);
  text(300, width/2-300, height/2);
  text(400, width/2-400, height/2);
  text(500, width/2-500, height/2); 
  //right side
   text(100, width/2+100, height/2);
  text(200, width/2+200, height/2);
  text(300, width/2+300, height/2);
  text(400, width/2+400, height/2);
  text(500, width/2+500, height/2); 
 }
 
 void scalePV(){
  textSize(20);
  //left side
  text(10, width/2-500/7, height/2);
  text(20, width/2-500*2/7, height/2);
  text(30, width/2-500*3/7, height/2);
  text(40, width/2-500*4/7, height/2);
  text(50, width/2-500*5/7, height/2); 
  text(60, width/2-500*6/7, height/2);
  text(70, width/2-500, height/2);  
  //right side
  text(10, width/2+500/7, height/2);
  text(20, width/2+500*2/7, height/2);
  text(30, width/2+500*3/7, height/2);
  text(40, width/2+500*4/7, height/2);
  text(50, width/2+500*5/7, height/2); 
  text(60, width/2+500*6/7, height/2);
  text(70, width/2+500, height/2);  
 }
 
void labelEV(){
  fill(255,255,255);
  textSize(60);
  String L = "Electoral Votes";
  text(L, width/2, height*4/5);
 }
 
 void labelPV(){
  fill(255,255,255);
  textSize(60);
  String L = "Popular vote";
  text(L, width/2, height*4/5);
  textSize(20);
  String M = "(in millions)";
  text(M, width/2, height*4/5+50);
 }
   
void timescale(){
     if (n>24){
     n=-1;
  }
   if (n < 25) {
     n++;
   }
 }
 
void graphEV (){
   //Democratic
   demdataEV();
   //Republican
   repdataEV();
 }
 
 void graphPV (){
    //Democratic
   demdataPV();
   //Republican
   repdataPV();
 } 
 
 
void demdataEV(){
 int[] DEV =new int [26];
  DEV[0] = 435;
  DEV[1] = 277;
  DEV[2] = 127;
  DEV[3] = 136;
  DEV[4] = 87;
  DEV[5] = 472;
  DEV[6] = 523;
  DEV[7] = 449;
  DEV[8] = 432;
  DEV[9] = 303;
  DEV[10] = 89;
  DEV[11] = 73;
  DEV[12] = 303;
  DEV[13] = 486;
  DEV[14] = 191;
  DEV[15] = 17;
  DEV[16] = 297;
  DEV[17] = 49;
  DEV[18] = 13;
  DEV[19] = 111;
  DEV[20] = 370;
  DEV[21] = 379;
  DEV[22] = 266;
  DEV[23] = 251;
  DEV[24] = 365;
  DEV[25] = 303;
 fill(0,0,255);
 rect(width/2, height/2, DEV[n], a);
 textSize(10);
 fill (255,255,255);
 text(DEV[n], width/2+a, height/2+a/1.5);
}

void demdataPV(){
 int[] DPV =new int [26];
  DPV[0] = 6286214;
  DPV[1] = 9129606;
  DPV[2] = 8385586;
  DPV[3] = 8385586;
  DPV[4] = 15761841;
  DPV[5] = 22821857;
  DPV[6] = 27751597;
  DPV[7] = 27244160;
  DPV[8] = 25602504;
  DPV[9] = 24179345;
  DPV[10] = 27314992;
  DPV[11] = 26022752;
  DPV[12]= 34226731;
  DPV[13] = 43129484;
  DPV[14] = 31275166;
  DPV[15] = 29170383;
  DPV[16] = 40830763;
  DPV[17] = 36481435;
  DPV[18] = 37577185;
  DPV[19] = 41809074;
  DPV[20] = 44909889;
  DPV[21] = 47402357;
  DPV[22] = 50999897;
  DPV[23] = 59028109;
  DPV[24] = 66862039;
  DPV[25] = 60336456;
 fill(0,0,255);
 
 //conversion
 int p = DPV[n]/1000000*500/70;
 
 fill(0,0,255);
 rect(width/2, height/2, p, a);
 textSize(10);
 fill (255,255,255);
 text(DPV[n]/1000000, width/2+a, height/2+a/1.5);
}

void repdataEV(){
 int[] REV =new int [26];
  REV[0] = 8;
  REV[1] = 254;
  REV[2] = 404;
  REV[3] = 382;
  REV[4] = 444;
  REV[5] = 59;
  REV[6] = 8;
  REV[7] = 82;
  REV[8] = 99;
  REV[9] = 189;
  REV[10] = 442;
  REV[11] = 457;
  REV[12] = 219;
  REV[13] = 52;
  REV[14] = 301;
  REV[15] = 520;
  REV[16] = 240;
  REV[17] = 489;
  REV[18] = 525;
  REV[19] = 426;
  REV[20] = 168;
  REV[21] = 159;
  REV[22] = 271;
  REV[23] = 286;
  REV[24] = 173;
  REV[25] = 206;
 fill(255,0,0);
 rect(width/2- REV[n], height/2, REV[n], a);
 textSize(10);
 fill (255,255,255);
 text(REV[n], width/2-2*a, height/2+a/1.5);
}
 
 void repdataPV(){
  int[] RPV =new int [26];
   RPV[0] = 3483922;
   RPV[1] = 8538221;
   RPV[2] = 16152200;
   RPV[3] = 15725016;
   RPV[4] = 21392190;
   RPV[5] = 15761841;
   RPV[6] = 16679583;
   RPV[7] = 22305198;
   RPV[8] = 22006285;
   RPV[9] = 21991291;
   RPV[10] = 33936234;
   RPV[11] = 35590472;
   RPV[12] = 34108157;
   RPV[13] = 27178188;
   RPV[14] = 34108157;
   RPV[15] = 47169911;
   RPV[16] = 39147973;
   RPV[17] = 54455075;
   RPV[18] = 54455075;
   RPV[19] = 48886097;
   RPV[20] = 39104545;
   RPV[21] = 39198755;
   RPV[22] = 50456002;
   RPV[23] = 62028285;
   RPV[24] = 58319442;
   RPV[25] = 57572116;
   
 //conversion
 int q = RPV[n]/1000000*500/70;  
 
 fill(255,0,0);
 rect(width/2- q, height/2, q, a);
  textSize(10);
 fill (255,255,255);
 text(RPV[n]/1000000, width/2-2*a, height/2+a/1.5);
}
 
 
void names (){
   RepName();
   DemName(); 
 }
 
void RepName(){
  String[] RN =new String [26];
    RN[0] = "William H. Taft";
    RN[1] = "Chrles E. Hughes";
    RN[2] = "Warren G. Garding";
    RN[3] = "Calvin Coolidge";
    RN[4] = "Herbert Hoover";
    RN[5] = "Hervert Hoover";
    RN[6] = "Alfred M. Landon";
    RN[7] = "Wendell L. Willkie";
    RN[8] = "Thomas E. Dewey";
    RN[9] = "Thomas E. Dewey";
    RN[10] = "Dwight D. Eisenhower";
    RN[11] = "Dwight D. Eisenhower";
    RN[12] = "Richard M. Nixon";
    RN[13] = "Barry M. Goldwater";
    RN[14] = "Richard M. Nixon";
    RN[15] = "Richard M. Nixon";
    RN[16] = "Gerald R. Ford";
    RN[17] = "Ronald Regan";
    RN[18] = "Ronald Regan";
    RN[19] = "George H. Bush";
    RN[20] = "George H. Bush";
    RN[21] = "Robert J. Dole";
    RN[22] = "George W. Bush";
    RN[23] = "George W. Bush";
    RN[24] = "John McCain";
    RN[25] = "Mitt Roomney";
  fill(255,255,255);
  textSize(40);
  text(RN[n], width/2- 457, height/3);
}
 
void DemName(){
   String[] DN =new String [26];
    DN[0] = "Woodrow Wilson";
    DN[1] = "Woodrow Wilson";
    DN[2] = "James M. Cox";
    DN[3] = "John W. Davis";
    DN[4] = "Alfred E. Smith";
    DN[5] = "Franklin D. Roosevelt";
    DN[6] = "Franklin D. Roosevelt";
    DN[7] = "Franklin D. Roosevelt";
    DN[8] = "Franklin D. Roosevelt";
    DN[9] = "Hary S. Truman";
    DN[10] = "Adlai E. Stevenson";
    DN[11] = "Adai E. Stevenson";
    DN[12] = "John F. Kennedy";
    DN[13] = "Lyndon B. Johnson";
    DN[14] = "Hubert H. Humpfrey";
    DN[15] = "George McGovern";
    DN[16] = "Jimmy Carter";
    DN[17] = "Jimmy Carter";
    DN[18] = "Walter F. Mondale";
    DN[19] = "Michael S. Dukakis";
    DN[20] = "William J. Clinton";
    DN[21] = "William J. Clinton";
    DN[22] = "Albert A. Gore";
    DN[23] = "John F. Kerry";
    DN[24] = "Brarack Obama";
    DN[25] = "Brarack Obama";
  fill(255,255,255);
  textSize(40);
  text(DN[n], width/2, height/3);
 }
 
void electionyear(){
   y=(478+n)*4; 
   fill(255,255,255);
   textSize(60);
   text(y, 200, height*4/5);
 }

