

PFont titleFont, labelFont, keyFont;



String[] Revenue = {"Donations", "Grants", "Investments", "Other"};
int[] TFA = {300, 86, 28, 5};


String[] Expenses = {"TFA", "DC", "R2R", "POP"};



void setup() {
  size(900, 900);
  background(#1A1541);
  titleFont = createFont("Avenir", 24);
  labelFont = createFont("Avenir", 12);
  keyFont = createFont("Avenir", 10);
  smooth();
  rectMode(CENTER);
  
  int bb = 100; //bottom border
  int lb = 175; //left border

  
  //text
   noStroke();
   
    textFont(titleFont);
    textAlign(CENTER);
    fill(#FFFFFF);
    text("2013 Expenses", 450, height - 800);
   
    textFont(labelFont);
    text("Teach for America", 250, height - 80);
    text("DonorsChoose.org", 405, height - 80);
    text("Room to Read", 540, height - 80);
    text("Pencils of Promise", 702, height - 80);
 

    //key text expenses
    fill(#92278F);
    text("Program", 795, height - 665);
    fill(#0D64EF);
    text("General", 795, height - 645);
    fill(#00A79D);
    text("Fundraising", 805, height - 625);
}



void draw() {
  noStroke();
  

  //key-expenses
  fill(#92278F);
  rect(760, height - 670, 10, 10);
  fill(#0D64EF);
  rect(760, height - 650, 10, 10);
  fill(#00A79D);
  rect(760, height - 630, 10, 10);
  
  
  int bb = 100; //bottom border
  int lb = 175; //left border
  

  //EXPENSES

  //tfa  
  fill(#92278F, 60);
  ellipse(250, height-bb-250, 560, 600);
  fill(#0D64EF);
  ellipse(250, height-bb-480, 104, 104);
  fill(#00A79D);
  ellipse(250, height-bb-510, 84, 84);
  
  textFont(labelFont);
  textAlign(CENTER);
  
  fill(#FFFFFF);
  text("$140 Million", 250, height-bb-250);
  text("$26 Million", 250, height-bb-455);
  text("$21 Million", 250, height-bb-510);
  
//dc
  fill(#92278F, 70);
  ellipse(405, height-bb - 100, 156, 156);
  fill(#0D64EF);
  ellipse(405, height-bb-170, 4, 4);
  fill(#00A79D);
  ellipse(405, height-bb-175, 4, 4);
  
  textFont(labelFont);
  textAlign(LEFT);
  
  fill(#FFFFFF);
  text("$39 Million", 390, height-bb-100);
  text("$1 Million", 420, height-bb-150);
  text("$1 Million", 420, height-bb-170);
  
  stroke(#0D64EF);
  strokeWeight(3);
  line(405, height-bb-170, 415, height-bb-160);
  stroke(#00A79D);
  line(405, height-bb-175, 415, height-bb-175);
  noStroke();
  
//r2r
  fill(#92278F, 90);
  ellipse(540, height-bb-100, 152, 152);
  fill(#0D64EF);
  ellipse(540, height-bb-150, 10, 10);
  fill(#00A79D);
  ellipse(540, height-bb-165, 20, 20);
  
  fill(#FFFFFF);
  text("$38 Million", 520, height-bb-100);
  text("$2.5 Million", 565, height-bb-145);
  text("$5 Million", 560, height-bb-170);
  
  stroke(#0D64EF);
  strokeWeight(3);
  line(540, height-bb-150, 560, height-bb-150);
  stroke(#00A79D);
  line(540, height-bb-170, 555, height-bb-175);
  noStroke();

//pop
  fill(#92278F);
  ellipse(700, height-bb-105, 16, 16);
  fill(#0D64EF);
  ellipse(700, height-bb-110, 2, 2);
  fill(#00A79D);
  ellipse(700, height-bb-113, 2, 2);
  
  fill(#FFFFFF);
  text("$4 Million", 720, height-bb-95);
  text("$330,000", 720, height-bb-113);
  text("$630,000", 720, height-bb-130);
  
  stroke(#92278F);
  strokeWeight(3);
  line(700, height-bb-105, 715, height-bb-100);
  stroke(#0D64EF);
  line(700, height-bb-110, 715, height-bb-115);
  stroke(#00A79D);
  line(700, height-bb-113, 715, height-bb-130);
  noStroke();
  

  
  noLoop();
}
