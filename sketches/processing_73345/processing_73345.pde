
//Sleeping hours Per Day
float SundayBar;
float MondayBar;
float TuesdayBar;
float WednesdayBar;
float ThursdayBar;
float FridayBar;
float SaturdayBar;
 
 
void setup() {
  size(1300, 750);
  smooth();
}
 void draw() {
    background(#212C55);
    
    fill(255);
    textSize(22);
    text("My Hours of Sleep per Day",550,0,1300,100);
    textSize(85);
    text("(-_-)...zZz",500,250,1300,100);
    
    fill(#98FFFC);
    textSize(30);
    text("Sunday",10,50,1300,100);
    text("Monday",10,150,1300,100);
    text("Tuesday",10,250,1300,100);
    text("Wednesday",10,350,1300,100);
    text("Thursday",10,450,1300,100);
    text("Friday",10,550,1300,100);
    text("Saturday",10,650,1300,100);
    
stroke(255);
line(100,725,100,700);//1Hr
line(150,725,150,700);//1.5Hrs
line(200,725,200,700);//2Hrs
line(250,725,250,700);//2.5Hrs
line(300,725,300,700);//3Hrs
line(350,725,350,700);//3.5Hrs
line(400,725,400,700);//4Hrs
line(450,725,450,700);//4.5Hrs
line(500,725,500,700);//5Hrs
line(550,725,550,700);//5.5Hrs
line(600,725,600,700);//6Hrs
line(650,725,650,700);//6.5Hrs
line(700,725,700,700);//7Hrs
line(750,725,750,700);//7.5Hrs
line(800,725,800,700);//8Hrs
line(850,725,850,700);//8.5Hrs
line(900,725,900,700);//9Hrs
line(950,725,950,700);//9.5Hrs
line(1000,725,1000,700);//10Hrs
line(1050,725,1050,700);//10.5Hrs
line(1100,725,1100,700);//11Hrs
line(1150,725,1150,700);//11.5Hrs
line(1200,725,1200,700);//12Hrs
line(1250,725,1250,700);//12.5Hrs

textSize(12);
 fill(#F7FA81);
text("1",96,730,1250,700);
text("1.5",140,730,1250,700);
text("2",197,730,1250,700);
text("2.5",240,730,1250,700);
text("3",297,730,1250,700);
text("3.5",339,730,1250,700);
text("4",395,730,1250,700);
text("4.5",439,730,1250,700);
text("5",497,730,1250,700);
text("5.5",540,730,1250,700);
text("6",597,730,1250,700);
text("6.5",640,730,1250,700);
text("7",695,730,1250,700);
text("7.5",740,730,1250,700);
text("8",797,730,1250,700);
text("8.5",843,730,1250,700);
text("9",897,730,1250,700);
text("9.5",939,730,1250,700);
text("10",989,730,1250,700);
text("10.5",1035,730,1250,700);
text("11",1092,730,1250,700);
text("11.5",1135,730,1250,700);
text("12",1193,730,1250,700);
text("12.5",1235,730,1250,700);
    
    
    
  fill(255);
  rect(100, 50, SundayBar,10 );
  noStroke();
  SundayBar+=.50;
  if ( SundayBar > 897) {
    SundayBar=0;
    
  }
   
  fill(255);
  noStroke();
  rect(100, 150, MondayBar, 10);
  MondayBar+=.50;
  if (MondayBar>540) {
    MondayBar=0;
  }
  fill(255);
  noStroke();
  rect(100,250 , TuesdayBar, 10);
  TuesdayBar+=.50;
  if (TuesdayBar>843) {
    TuesdayBar=0;
  }
  fill(255);
  noStroke();
  rect(100,350 , WednesdayBar, 10);
  WednesdayBar+=.50;
  if (WednesdayBar>740) {
    WednesdayBar=0;
  }
   
   
  fill(255);
  rect(100, 450, ThursdayBar, 10);
  ThursdayBar+=.50;
  if (ThursdayBar>540) {
    ThursdayBar=0;
  }
   
  fill(255);
  noStroke();
  rect(100, 550, FridayBar, 10);
  FridayBar+=.50;
  if (FridayBar>989) {
    FridayBar=0;
  }
   
  fill(255);
  noStroke();
  rect(100, 650, SaturdayBar, 10);
  SaturdayBar+=.50;
  if (SaturdayBar>843) {
    SaturdayBar=0;
  }
}
