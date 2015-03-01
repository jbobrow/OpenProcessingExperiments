
//Default by Year



PFont titleFont, labelFont, keyFont;

String[] schoolTypes = {"Non-Profit Private", "Public", "Proprietary", "Total"}; //types of higher education
int[] elevenDefault = {7, 13, 19, 14}; //% of total borrowers who defaulted in 2011
int[] nineDefault = {8, 11, 23, 13}; //% of total borrowers who defaulted in 2011

int[] avgDebt = {32300, 25500, 00000, 29400}; //average debt for institution, 2012

void setup() {
  size(650,650);
  // Uncomment the following two lines to see the available fonts 
  //String[] fontList = PFont.list();
  //println(fontList);
  titleFont = createFont("Helvetica", 18);
  labelFont = createFont("Helvetica", 12);
  keyFont = createFont("Helvetica", 9);
  smooth();
  rectMode(CENTER);

}

void draw () {
  background(#666666);
  fill(#CCCCCC);
  textAlign(CENTER);
  textFont(titleFont);
  text("3-Year Student Loan Default Rates", width/2, 95);
  text("2009 and 2011 Cohorts", width/2, 118);
  
  textFont(keyFont);
  text("Default Data: US Dept of Education, 9.24.2014", 110, 15);
  text("Avg. Debt Data: TICAS, Student Debt and the Class of 2012", 135, 30);
  text("Avg. debt data not clear for proprietary schools", 110, 45);
  
  noStroke();
  
  int bb = 40; //bottom border
  int lb = 75; //top border

 
 //key
//  noStroke();
//  fill(#CCCCCC);
//  rect(650, 100, 20, 20);
//  textFont(labelFont);
//  text("2009 Cohort", 700, 105);
  
//  fill(#999999);
//  rect(650, 125, 20, 20);
//  fill(#CCCCCC);
//  textFont(labelFont);
//  text("2011 Cohort", 700, 130);
  


 //y axis 
  stroke(#CCCCCC);
  textFont(labelFont);
  textAlign(RIGHT, CENTER);
  for (int i = 0; i < 26; i++){
    int y = height - bb - i * 20;
    line(lb - 5, y, lb - 8, y);
    text(i, lb - 15, y);
  }
  

   //lines
    stroke(204, 204, 204, 50);
    line(250, 125, 230, 380);
    line(230, 380, 237, 370);
    line(230, 380, 225, 370);
    line(320, 125, 285, 340);
    line(285, 340, 293, 330);
    line(285, 340, 280, 330);
    strokeWeight(2);


//2011 default rates
  for(int i = 0; i < schoolTypes.length; i++) {
    int w = 50; //width of bars
    int s = 80; //space between bars
    int[] e = new int[schoolTypes.length]; //tall for bars
    e[i] = elevenDefault[i] * 20;
    int[] x = new int[schoolTypes.length]; //x axis
    x[i] = int(lb + (i + .6) * (w + s)); 
    int[] y = new int[schoolTypes.length]; //y axis
    y[i] = height - bb - e[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
        (mouseY > (y[i] - e[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(#ABDB25);
       textFont(labelFont);
       textAlign(CENTER);
       text(elevenDefault[i] + "%", x[i], y[i] - e[i]/2 - 10); //info on rollover

  } else {
    fill(#999999);
  }
   rect(x[i], y[i], w, e[i]);
 
 }

//2009 default rates
    for(int i = 0; i < schoolTypes.length; i++) {
    int w = 50; //width of bars
    int s = 80; //space between bars
    int[] n = new int[schoolTypes.length]; //tall for bars
    n[i] = nineDefault[i] * 20;
    int[] x = new int[schoolTypes.length]; //x axis
    x[i] = int(lb + (i + .2) * (w + s)); 
    int[] y = new int[schoolTypes.length]; //y axis
    y[i] = height - bb - n[i]/2;
    
    if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
        (mouseY > (y[i] - n[i]/2)) && (mouseY < (y[i] + w/2))) {
       fill(#ABDB25);
       textFont(labelFont);
       textAlign(CENTER);
       text(nineDefault[i] + "%", x[i], y[i] - n[i]/2 - 10); //info on rollover
  
   
  } else {
    fill(#CCCCCC);
  }
  rect(x[i], y[i], w, n[i]);
}
 //labels - type of school 
 for(int i = 0; i < schoolTypes.length; i++) {
    int w = 50; //width of bars
    int s = 80; //space between bars
    int[] x = new int[schoolTypes.length]; //x axis
    x[i] = int(lb + (i + .4) * (w + s)); 
    int[] y = new int[schoolTypes.length]; //y axis
    y[i] = height - bb/2;
    
  textAlign(CENTER);
  textFont(labelFont);
  fill(#CCCCCC);
  text(schoolTypes[i], x[i], y[i]); //text below bars, half way btw bottom border
  
   if((mouseX > (x[i] - w/2)) && (mouseX < (x[i] + w/2)) &&
   (mouseY > (y[i] - w/2)) && (mouseY < (y[i] + w/2))){
       
       fill(#ABDB25);
       
       rect(x[i], (height - bb) - 5, 103, 20);
       fill(0);
       textFont(labelFont);
       textAlign(CENTER);
       text("Avg Debt" + "=" + "$" + avgDebt[i], x[i], height - bb); //info on rollover
  
   }
  
 
 
 }
}



