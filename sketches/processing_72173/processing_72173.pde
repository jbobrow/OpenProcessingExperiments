
//Data for this program can be found at http://studentaid.ed.gov/about/data-center/student/title-iv

void setup(){
  size(800,800);
  smooth();
}

void draw(){
  background(255);
  fill(193,6,6);
  textSize(10);
  text("Subsidized v. Unsubsidized: Total Amt",100,45);
  ellipse(190,100,100,100);
  fill(5,95,14);
  arc(190,100,100,100,radians(0),radians(186));
  fill(255);
  textSize(10);
  text("Sub=$6,098,239",150,76);
  fill(255,255,255);
  text("Unsub=$6,591,040",143,119);
  fill(17,82,170);
  textSize(10);
  text("Subsidized: # Originated v. # Disbursed",300,45);
  ellipse(400,100,100,100);
  fill(198,96,18);
  arc(400,100,100,100,radians(0),radians(220));
  fill(255);
  text("Orig:1300",380,76);
  fill(255);
  text("Disb:2180",370,119);
  fill(0,3,0);
  textSize(10);
  text("Unsubsidized: # Originated v. # Disbursed",510,45);
  fill(242,232,29);
  ellipse(610,100,100,100);
  fill(84,6,188);
  arc(610,100,100,100,radians(0),radians(215));
  fill(1,0,3);
  text("Orig:1326",595,76);
  fill(255);
  text("Disb:2193",595,119);
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
  rect(260,450,10,10); //$8,717,452
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
}

