
String [] schoolNames = {"Nisley Elementary School", "Edison Elementary School",
"MC Meen Elementary School", "West Denver Prep: Harvey Park Campus",
"Whittier K-8 School","Lincoln Elementary School",
"Montview Math & Health Sciences Elem. School", 
"West Denver Prep: Highland Campus", "West Denver Prep: Federal Campus", 
"Kipp Sunshine Peak Academy", "Kipp Sunshine Peak Academy", "Centennial High School",
"Green Valley Elementary School", "Turman Elementary School",
"Sunset Ridge Elementary School", "Community Leadership Academy",
"Mesa Elementary School", "Venture Prep", "West Denver Prep: Lake Campus", 
"Doull Elementary School", "Place Bridge Academy", "Cole Arts & Science Academy",
"Newlon Elementary School", "McGlone Elementary School", "Knapp Elementary School",
"Carmel Middle School", "Community Leadership Academy", "Adventure Elementary",
"Global Leadership Academy", "Kipp Denver Collegiate High School", 
"Trevista ECE-8 at Horace Mann"};
String [] district = {"Mesa County Valley 51","Colorado Springs 11","Denver County 1",
"Denver County 1","Denver County 1","Colorado Springs 11","Adams-Arapahoe 28J",
"Denver County 1","Denver County 1","Denver County 1","Denver County 1",
"Centennial R-1","Denver County 1","Harrison 2","Westminster 50",
"Charter School Institute","Westminster 50","Denver County 1","Denver County 1",
"Denver County 1","Denver County 1","Denver County 1","Denver County 1",
"Denver County 1","Denver County 1","Harrison 2","Charter School Institute",
"Mapleton 1","Mapleton 1","Denver County 1","Denver County 1"};
String [] type = {"E","E","E","M","M","E","E","M","M","E","M","H","E","E","E","E","E",
"H","M","E","E","M","E","E","E","M","M","E","H","H","M"};
String [] currGrade = {"B","A-","B+","A","B","A-","A-","A-","A","B-","A","C+","B+",
"B+","B+","A","B","C","B+","C+","C+","C","B+","C+","C","B","B","B","C-","C+","C"};
String [] growthGrade = {"A+","A+","A+","A+","A+","A+","A+","A+","A+","A+","A+",
"A","A","A","A","A","A","A","A","A","A","A","A","A","A","A-","A-","A-","A-","A-","A-"};
int [] xVals = {896,936,1058,1098,1118,1139,1139,1139,1160,1260,1260,916,916,936,
958,997,1018,1057,1179,1199,1199,1219,1219,1239,1299,977,997,1057,1098,1178,1239};
int [] yVals = {143,143,143,143,143,143,132,122,143,143,132,349,339,349,349,349,349,
349,349,349,339,349,339,349,349,555,555,555,555,555,555};
PImage graphic;
PFont font;
int boxHeight;

void setup() {
  smooth();
  colorMode(HSB, 360);
  size(1410,704);
  font=createFont("Helvetica-Bold",48);
  textFont(font);
  //graphic = loadImage("CO schools 3.png");
  graphic = loadImage("http://i48.tinypic.com/119qt0x.png");
}

void draw() {
  background(210,227,300);
  noStroke();
  fill(210,227,120);
  textSize(39);
  text("IDENTIFYING LOW INCOME SCHOOLS WITH HIGH ACADEMIC GROWTH", 30,60);
  //fill(26,94,125);
  rect(130,105,436,467);
  rect(880,105,436,467);
  rect(643,241,69,330);
  image(graphic,0,0);
  textSize(12);
  for (int i=0; i<xVals.length; i++) {
    if (dist(xVals[i],yVals[i],mouseX,mouseY)<8) {
      if (mouseY<300) {
        boxHeight = 166;
      }
      else if (mouseY>500){
        boxHeight = 458;
      }
      else {
        boxHeight = 372;
      }
      noStroke();
      fill(210,227,200);
      rect(908,boxHeight,380,74);
      fill(0);
      text(schoolNames[i].toUpperCase(),920,boxHeight+20);
      if (type[i]=="E") {
        text("Elementary School",920,boxHeight+40);
      }
      else if (type[i]=="M") {
        text("Middle School",920,boxHeight+40);
      }
      else if (type[i]=="H") {
        text("High School",920,boxHeight+40);
      }
      text("District:  "+district[i],1090,boxHeight+40);
      text("2012 School Grade:  "+currGrade[i],920,boxHeight+60);
      text("2012 Growth Grade:  "+growthGrade[i],1090,boxHeight+60);
    }
  }
}
