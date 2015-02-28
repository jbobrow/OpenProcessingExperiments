
int nobars = 3;
Bar[] bars = new Bar[nobars];
String [] directions = new String[8];
String []dirTemp;
PFont font;
PFont heading;
PFont nut;
PImage bike;
String recipeTitle;
String ing1;
String ing2;
String ing3;
String ing4;
String ing5;
Float calories;
String fat;
String chol;
String url = "http://www.veryicon.com/icon/png/Object/Points%20Of%20Interest/Bicycle%20Green%202.png";
///////////////////////////////////////////

void setup(){
  smooth();
 size(900,900);
 for (int i = 0; i<nobars;i++) {
    bars[i] = new Bar();
  }
 String[] mainpage = loadStrings("http://allrecipes.com/Recipes/World-Cuisine/Europe/UK-and-Ireland/Daily.aspx");
 String[] linkbit1 = mainpage[807].split("=");
 String[] linkbit2 = linkbit1[2].split(">");
 String[] linkbit3 = linkbit2[0].split("/");
 String recipeName = "creme-brulee";
// println(recipeName);
 String[] page = loadStrings("http://allrecipes.com/recipe/" + recipeName + "/detail.aspx");
 //for (int i = 0; i< page.length; i++){
 // println(i + ". " + page[i]); 
 //}
 String [] recipeTitleBit = page[52].split(" Recipe");
// for (int i = 0; i< recipeTitleBit.length; i++){
//  println(i + ". " + recipeTitleBit[i]); 
// }
 recipeTitle = recipeTitleBit[0];
//println(recipeTitle);
 ing1 = "6 egg yolks";
 ing2 = "75 g white sugar, divided";
 ing3 = "3 ml vanilla extract";
 ing4 = "590 ml heavy cream";
 ing5 = "25 g brown sugar";
int pageNo = 1263;
for(int i = 0; i< directions.length; i++){
  directions[i] = page[pageNo];
  pageNo += 4;
}
String [] dir2 = directions[2].split(".");
String[] caloriesbit = page[1329].split(">");
//println(caloriesbit[1]);
String[]caloriesbit2 = caloriesbit[1].split("<");
 calories = new Float(caloriesbit2[0]);
//println(calories);

String[] fatbits = page[1332].split(">");
    fatbits = fatbits[1].split("</");
     fat = fatbits[0];
      String[]fatnumbits=fat.split("g");
      Float fatnum = new Float(fatnumbits[0]);

    String[] cholbits = page[1336].split(">");
    cholbits = cholbits[1].split("</");
     chol = cholbits[0];
     String[]cholnumbits=chol.split("mg");
      Float cholnum = new Float(cholnumbits[0]);

bars[0].barMax = (int)(calories/20);
bars[1].barMax = (int)(fatnum*1);
bars[2].barMax = (int)(cholnum*1);

bars[0].barRec = 2605/20;
bars[1].barRec = 140;
bars[2].barRec = 200;

println(bars[0].barMax + " " + bars[0].barRec);

int barYs =280;
  for (int g = 0;g<nobars;g++) {
    bars[g].barY =  barYs;
    barYs+=50;
  }

font = loadFont("MaiandraGD-DemiBold-48.vlw");
heading = loadFont("Algerian-48.vlw");
nut = loadFont("Impact-48.vlw");
bike = loadImage("http://www.veryicon.com/icon/png/Object/Points%20Of%20Interest/Bicycle%20Green%202.png");
}


//////////////////////////////////////////////////////////////////


void draw(){
 background(255);
 noStroke();
 fill(0);
 textFont(heading, 50);
 text("Today's Recipe is: " + recipeTitle,30, 50);
 textFont(heading, 30);
 text("Ingredients:", 43, 100);
 textFont(font, 20);
 text(ing1, 43, 130);
 text(ing2, 43, 160);
 text(ing3, 43, 190);
 text(ing4, 43, 210);
 text(ing5, 43, 240);
 textFont(heading, 30);
 text("Directions:", 43, 310);
 textFont(font, 10);
 int fontH = 330;
 for(int y = 0; y<directions.length;y++){
   textLeading(15);
   text(y+1 +"."+directions[y], 40, fontH, width/2,height);
  fontH += 50;
 }
 
 fill(255,242,98);
 rect((width/2)+50,80,100000,1000000);
 fill(124,6,14);
 textFont(nut, 60);
 text("HEALTH WATCH", (width/2)+60, 140);
 textFont(font, 20);
 text("This recipe contains:", (width/2)+60, 170);
 text("Calories: " + calories, (width/2)+60, 200);
 text("Fat: " + fat, (width/2)+60, 220);
 text("Cholesterol: " + chol, (width/2)+60, 240);
 textFont(nut, 20);
 text("To burn off these calories, you would have to cycle for...", (width/2)+60, 450, width-500, height);
 image(bike, (width/2)+45, 500);
 float hrs;
 float divd = calories/270.0;
 hrs = divd*0.5;
 int hours = round(hrs);
 textFont(font, 40);
 text(hours + " hours!", 600, 510);
 textFont(nut, 20);
 text("calories -", (width/2)+ 70,295);
 text("fat-", (width/2)+110, 345);
 text("cholesterol -", (width/2)+50,395);
 
 for(int i=0; i<bars.length;i++){
 bars[i].display();
 bars[i].update();
 }
 
 }
 
 
 
 ///////////////////////////////////////////////////
 
 class Bar {
  int barX;
  int barY;
  int barNo;
  int barMax;
  int barSize;
  int barRec;
  int barSize2;
  int barMaxed;

  Bar() {
    barX = (width/2)+160;
    barY = 280;
    barSize = 0;
    barSize2 = 0;
    barMaxed = 0;
  }

  void display() {
    noStroke();

    fill(255, 0, 0);
    rect(barX, barY, barSize, 20);
  }

  void update() {
    if (barSize < barMax){
     barSize++; 
    }
    
    if (barSize >= barMax){
     fill(0,0,255);
      rect(barX, barY, barSize2, 20);
      fill(255, 0, 0);
      rect(barX, barY, barSize, 20);
      if (barSize2 <=barRec){
      barSize2++ ;
     }
     barMaxed = barSize;
    }
    
    if (barSize2 >= barRec){
     fill(0);
     //float perc = (barSize/barSize2)*100;
     //int percINT = round(perc);
     
     float w = ((float)barMaxed/(float)barRec)*100.0;
     int z = round(w);
    
     text(z + "% of Daily Allowance", barX, barY+40); 
    
  }
    
  }
  
}

