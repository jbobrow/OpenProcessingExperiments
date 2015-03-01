
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
    text("2013 Revenue", 450, height - 800);
   
    textFont(labelFont);
    text("Teach for America", 250, height - 80);
    text("DonorsChoose.org", 405, height - 80);
    text("Room to Read", 540, height - 80);
    text("Pencils of Promise", 702, height - 80);
 
    //key text revenue
    fill(#FFC541);
    text("Donations", 800, height - 665);
    fill(#EF5D59);
    text("Grants", 790, height - 645);
    fill(#FF0000);
    text("Investments", 805, height - 625);
    fill(#FFF5C1);
    text("Other", 790, height - 605); 
}



void draw() {
  noStroke();
  
  //key - Revenue
  fill(#FFC541);
  rect(760, height - 670, 10, 10);
  fill(#EF5D59);
  rect(760, height - 650, 10, 10);
  fill(#FF0000);
  rect(760, height - 630, 10, 10);
  fill(#FFF5C1);
  rect(760, height - 610, 10, 10);

  //key - Expenses
  
  int bb = 100; //bottom border
  int lb = 175; //left border
  
//REVENUE
//tfa  
  fill(#FFC541, 60);
  ellipse(250, height-bb-250, 600, 600);
  fill(#EF5D59);
  ellipse(250, height-bb-470, 172, 172);
  fill(#FF0000);
  ellipse(250, height-bb-530, 56, 56);
  fill(#FFF5C1);
  ellipse(250, height-bb-550, 10, 10);
  
  textFont(labelFont);
  textAlign(CENTER);
  
  fill(#FFFFFF);
  text("$150 Million", 250, height-bb-250);
  text("$43 Million", 250, height-bb-455);
  text("$14 Million", 250, height-bb-520);
  text("$2.5 Million", 300, height-bb-560);
  
  stroke(#FFF5C1);
  strokeWeight(3);
  line(250, height-bb-550, 265, height-bb-560);
  noStroke();
  
  
//dc
  fill(#FFC541, 70);
  ellipse(405, height-bb - 100, 212, 212);
  fill(#FF0000);
  ellipse(405, height-bb-200, 2, 2);
  
  fill(#FFFFFF);
  text("$53 Million", 400, height-bb-100);
  text("$80,000", 435, height-bb-195);
 
  stroke(#FF0000);
  strokeWeight(3);
  line(405, height-bb-200, 410, height-bb-200);
  noStroke();
  
//r2r
  fill(#FFC541, 90);
  ellipse(540, height-bb-100, 184, 184);
  fill(#EF5D59);
  ellipse(540, height-bb-180, 4, 4);
  fill(#FF0000);
  ellipse(540, height-bb-185, 2, 2);
  fill(#FFF5C1);
  ellipse(540, height-bb-190, 4, 4);
  
  textAlign(LEFT);
  
  fill(#FFFFFF);
  text("$46 Million", 530, height-bb-100);
  text("$570,000", 555, height-bb-165);
  text("$44,000", 555, height-bb-180);
  text("$760 Million", 555, height-bb-203);
 
  stroke(#EF5D59);
  strokeWeight(3);
  line(540, height-bb-180, 550, height-bb-175);
    stroke(#FF0000);
  strokeWeight(3);
  line(540, height-bb-185, 550, height-bb-185);
    stroke(#FFF5C1);
  strokeWeight(3);
  line(540, height-bb-190, 550, height-bb-205);
  noStroke();
  
//pop

  fill(#FFC541);
  ellipse(700, height-bb-100, 20, 20);
    //if((mouseX > 680) && (mouseX < 720) &&
    //(mouseY > height-bb-80) && (mouseY < height-bb-120)) {
      //textFont(labelFont);
      //text("$5 Million", 790, height-bb-100);
    //}
  
  fill(#FFF5C1);
  ellipse(700, height-bb-105, 2, 2);
  
    
  textAlign(LEFT);
  
  fill(#FFFFFF);
  text("$5 Million", 725, height-bb-95);
  text("$51,000", 725, height-bb-115);
 
  stroke(#FFC541);
  strokeWeight(3);
  line(700, height-bb-100, 720, height-bb-100);
    stroke(#FFF5C1);
  strokeWeight(3);
  line(700, height-bb-105, 720, height-bb-118);
  
  
  noLoop();
  
  
 
}
