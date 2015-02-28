
//Data for this program can be found at http://studentaid.ed.gov/about/data-center/student/title-iv

int dirq1x; //establishing variables
int dirq1y;
int dirq2x;
int dirq2y;
int dirq3x;
int dirq3y;
int q1x;
int q1y;
int q2x;
int q2y;
int q3x;
int q3y;

void setup(){
  size(800,800);
  smooth();
  q1x=270;
  q1y=460;
  q2x=390;
  q2y=610;
  q3x=520;
  q3y=310;
  dirq1x=4;
  dirq1y=5;
  dirq2x=3;
  dirq2y=-7;
  dirq3x=3;
  dirq3y=9;
  
}

void draw(){
  println("x: "+mouseX+"y: "+mouseY);
  background(255);
  for(int i=0;i<800;i=i+5){
    for(int j=0;j<800;j=j+5){
      point(i,j);
    }
  }
  fill(193,6,6);
  textSize(10);
  text("Subsidized v. Unsubsidized: Total Amt",100,45);
  ellipse(190,100,100,100);
  fill(5,95,14);
  arc(190,100,100,100,radians(0),radians(186));
  fill(255);
  textSize(10);
  if(mouseX>142&&mouseX<242&&mouseY>52&&mouseY<103){
    text("Sub=$6,098,239",150,76);
  }
  fill(255,255,255);
  if(mouseX>141&&mouseX<241&&mouseY>104&&mouseY<151){
    text("Unsub=$6,591,040",143,119);
  }
  fill(17,82,170);
  textSize(10);
  text("Subsidized: # Originated v. # Disbursed",300,45);
  ellipse(400,100,100,100);
  fill(198,96,18);
  arc(400,100,100,100,radians(0),radians(220));
  fill(255);
  if(mouseX>367&&mouseX<450&&mouseY>51&&mouseY<84){
    text("Orig:1300",380,76);
  }
  fill(255);
  if(mouseX>351&&mouseX<451&&mouseY>85&&mouseY<152){
    text("Disb:2180",370,119);
  }
  fill(0,3,0);
  textSize(10);
  text("Unsubsidized: # Originated v. # Disbursed",510,45);
  fill(242,232,29);
  ellipse(610,100,100,100);
  fill(84,6,188);
  arc(610,100,100,100,radians(0),radians(215));
  fill(1,0,3);
  if(mouseX>573&&mouseX<658&&mouseY>52&&mouseY<84){
    text("Orig:1326",595,76);
  }
  fill(255);
  if(mouseX>561&&mouseX<661&&mouseY>85&&mouseY<152){
    text("Disb:2193",595,119);
  }
  line(140,700,140,270); //yaxis
  line(140,700,700,700); //xaxis
  line(135,500,145,495); //break
  line(145,495,135,495); //break
  line(135,495,145,490); //break
  line(135,640,143,640); //500k
  fill(97,17,191);
  textSize(9);
  text("$500,000",90,645);
  line(135,590,143,590); //1mil
  text("$1million",90,595);
  line(135,540,143,540); //1.5mil
  text("$1.5million",80,545);
  line(135,480,143,480); //8.5mil
  text("$8.5million",80,485);
  line(135,430,143,430); //9mil
  text("$9million",85,435);
  line(135,380,143,380); //9.5mil
  text("$9.5million",80,385);
  line(135,330,143,330); //10mil
  text("$10million",77,335);
  line(135,280,143,280); //10.5mil
  text("$10.5million",75,285);
  line(265,705,265,695); //Q1
  text("Quarter1",255,715);
  line(390,705,390,695); //Q2
  text("Quarter2",380,715);
  line(515,705,515,695); //Q3
  text("Quarter3",505,715);
  line(640,705,640,695); //Q4
  text("Quarter4",630,715);
  fill(188,27,180);
  rect(265,450,10,10); //$8,717,452
  triangle(385,610,390,615,395,610); //$878,696
  rect(515,300,10,10); //$10,118,931
  triangle(635,675,640,670,645,675); //$382,309
  line(270,460,390,610); //Q1-Q2
  line(390,610,520,310); //Q2-Q3
  line(520,310,640,670); //Q3-Q4
  textSize(16);
  text("CCA Loan Amounts for the Four Quarters of 2011-2012",200,20);
  fill(97,17,191);
  text("Total Amount of All Loans Disbursed 2011-2012",225,200);
  fill(191,6,6,100);
  ellipse(q1x += dirq1x,q1y +=dirq1y,5,5);
  if(q1x>389){
    q1x=270;
    q1y=460;
  }
  ellipse(q2x += dirq2x,q2y += dirq2y,5,5);
  if(q2x>518){
    q2x=390;
    q2y=610;
  }
  ellipse(q3x += dirq3x,q3y += dirq3y,5,5);
  if(q3x>639){
    q3x=520;
    q3y=310;
  }
}

