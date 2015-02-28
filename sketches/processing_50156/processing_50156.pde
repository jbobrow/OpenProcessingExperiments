
String[] dataPoints;
float [] data;

PFont f;

//points calculator
float p(float a) {
  float b = -10.51282*a + 607.692;
  return b;
}

//goal diff calculator
float gd(float c) {
  float d = 13.2353*c + 394.1176;
  return d;
}

//spending calculator
float n(float e) {
  float f = .0084394*e - 4.003690815;
  return f;
}

//SOT calculator
float s(float g) {
  float h = -63.75*g + 420.75;
  return h;
}

void setup() {
  size(1000, 600);
  background(255);
  smooth();
  noStroke();
  f = createFont("Helvetica", 50, true);
    
  
  textFont(f, 40);
  
  
  dataPoints = loadStrings("visualization.csv");
  for(int i=0; i<dataPoints.length; i++) {
    data = float(split(dataPoints[i],","));
  }
  

  
  
  


 
}

void draw() {
  background(255);
  smooth();
  stroke(0);
  strokeWeight(2);
  
  

  
  
  //City
  textFont(f, 20);
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[2]), p(data[0])) < n(data[1])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Manchester City", 200, 30);
    text(int(data[0]), 200, 60);
    text("$"+int(data[80]), 200, 90);
    text(int(data[2]), 200, 120);
    text(data[3], 195, 150);
  }
  fill(s(data[3]));
  ellipse(gd(data[2]), p(data[0]), n(data[1]), n(data[1]));
  
  //United
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[6]), p(data[4])) < n(data[5])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Manchester United", 200, 30);
    text(int(data[4]), 200, 60);
    text("$"+int(data[81]), 200, 90);
    text(int(data[6]), 200, 120);
    text(data[7], 195, 150);
  }
  fill(s(data[7]));
  ellipse(gd(data[6]), p(data[4]), n(data[5]), n(data[5]));
  //Tottenham
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[10]), p(data[8])) < n(data[9])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Tottenham", 200, 30);
    text(int(data[8]), 200, 60);
    text("$"+int(data[82]), 200, 90);
    text(int(data[10]), 200, 120);
    text(data[11], 195, 150);
  }
  fill(s(data[11]));
  ellipse(gd(data[10]), p(data[8]), n(data[9]), n(data[9]));
  //Chelsea
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[14]), p(data[12])) < n(data[13])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Chelsea", 200, 30);
    text(int(data[12]), 200, 60);
    text("$"+int(data[83]), 200, 90);
    text(int(data[14]), 200, 120);
    text(data[15], 195, 150);
  }
  fill(s(data[15]));
  ellipse(gd(data[14]), p(data[12]), n(data[13]), n(data[13]));
  //Newcastle
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[18]), p(data[16])) < n(data[17])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Newcastle", 200, 30);
    text(int(data[16]), 200, 60);
    text("$"+int(data[84]), 200, 90);
    text(int(data[18]), 200, 120);
    text(data[19], 195, 150);
  }
  fill(s(data[19]));
  ellipse(gd(data[18]), p(data[16]), n(data[17]), n(data[17]));
  //Arsenal
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[22]), p(data[20])) < n(data[21])/2)  {
    stroke(0, 0, 255);fill(0);
    text("Arsenal", 200, 30);
    text(int(data[20]), 200, 60);
    text("$"+int(data[85]), 200, 90);
    text(int(data[22]), 200, 120);
    text(data[23], 195, 150);
  }
  fill(s(data[23]));
  ellipse(gd(data[22]), p(data[20]), n(data[21]), n(data[21]));
  //Liverpool
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[26]), p(data[24])) < n(data[25])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Liverpool", 200, 30);
    text(int(data[24]), 200, 60);
    text("$"+int(data[86]), 200, 90);
    text(int(data[26]), 200, 120);
    text(data[27], 195, 150);
  }
  fill(s(data[27]));
  ellipse(gd(data[26]), p(data[24]), n(data[25]), n(data[25]));
  //Stoke
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[30]), p(data[28])) < n(data[29])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Stoke City", 200, 30);
    text(int(data[28]), 200, 60);
    text("$"+int(data[87]), 200, 90);
    text(int(data[30]), 200, 120);
    text(data[31], 195, 150);
  }
  fill(s(data[31]));
  ellipse(gd(data[30]), p(data[28]), n(data[29]), n(data[29]));
  //Norwich
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[34]), p(data[32])) < n(data[33])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Norwich City", 200, 30);
    text(int(data[32]), 200, 60);
    text("$"+int(data[88]), 200, 90);
    text(int(data[34]), 200, 120);
    text(data[35], 195, 150);
  }
  fill(s(data[35]));
  ellipse(gd(data[34]), p(data[32]), n(data[33]), n(data[33]));
  //Villa
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[38]), p(data[36])) < n(data[37])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Aston Villa", 200, 30);
    text(int(data[36]), 200, 60);
    text("$"+int(data[89]), 200, 90);
    text(int(data[38]), 200, 120);
    text(data[39], 195, 150);
  }
  fill(s(data[39]));
  ellipse(gd(data[38]), p(data[36]), n(data[37]), n(data[37]));
  //Sunderland
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[42]), p(data[40])) < n(data[41])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Sunderland", 200, 30);
    text(int(data[40]), 200, 60);
    text("$"+int(data[90]), 200, 90);
    text(int(data[42]), 200, 120);
    text(data[43], 195, 150);
  }
  fill(s(data[43]));
  ellipse(gd(data[42]), p(data[40]), n(data[41]), n(data[41]));
  //Fulham
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[46]), p(data[44])) < n(data[45])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Fulham", 200, 30);
    text(int(data[44]), 200, 60);
    text("$"+int(data[91]), 200, 90);
    text(int(data[46]), 200, 120);
    text(data[47], 195, 150);
  }
  fill(s(data[47]));
  ellipse(gd(data[46]), p(data[44]), n(data[45]), n(data[45]));
  //Swansea
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[50]), p(data[48])) < n(data[49])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Swansea City", 200, 30);
    text(int(data[48]), 200, 60);
    text("$"+int(data[92]), 200, 90);
    text(int(data[50]), 200, 120);
    text(data[51], 195, 150);
  }
  fill(s(data[51]));
  ellipse(gd(data[50]), p(data[48]), n(data[49]), n(data[49]));
  //Everton
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[54])-20, p(data[52])) < n(data[53])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Everton", 200, 30);
    text(int(data[52]), 200, 60);
    text("$"+int(data[93]), 200, 90);
    text(int(data[54]), 200, 120);
    text(data[55], 195, 150);
  }
  fill(s(data[55]));
  ellipse(gd(data[54])-20, p(data[52]), n(data[53]), n(data[53]));
  //West Brom
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[58]), p(data[56])) < n(data[57])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("West Bromwich", 200, 30);
    text(int(data[56]), 200, 60);
    text("$"+int(data[94]), 200, 90);
    text(int(data[58]), 200, 120);
    text(data[59], 195, 150);
  }
  fill(s(data[59]));
  ellipse(gd(data[58]), p(data[56]), n(data[57]), n(data[57]));
  //QPR
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[62]), p(data[60])) < n(data[61])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("QPR", 200, 30);
    text(int(data[60]), 200, 60);
    text("$"+int(data[95]), 200, 90);
    text(int(data[62]), 200, 120);
    text(data[63], 195, 150);
  }
  fill(s(data[63]));
  ellipse(gd(data[62]), p(data[60]), n(data[61]), n(data[61]));
  //Bolton
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[66]), p(data[64])) < n(data[65])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Bolton Wanderers", 200, 30);
    text(int(data[64]), 200, 60);
    text("$"+int(data[96]), 200, 90);
    text(int(data[66]), 200, 120);
    text(data[67], 195, 150);
  }
  fill(s(data[67]));
  ellipse(gd(data[66]), p(data[64]), n(data[65]), n(data[65]));
  //Wolves
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[70]), p(data[68])) < n(data[69])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Wolves", 200, 30);
    text(int(data[68]), 200, 60);
    text("$"+int(data[97]), 200, 90);
    text(int(data[70]), 200, 120);
    text(data[71], 195, 150);
  }
  fill(s(data[71]));
  ellipse(gd(data[70]), p(data[68]), n(data[69]), n(data[69]));
  //Blackburn
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[74]), p(data[72])) < n(data[73])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Blackburn", 200, 30);
    text(int(data[72]), 200, 60);
    text("$"+int(data[98]), 200, 90);
    text(int(data[74]), 200, 120);
    text(data[75], 195, 150);
  }
  fill(s(data[75]));
  ellipse(gd(data[74]), p(data[72]), n(data[73]), n(data[73]));
  //Wigan
  stroke(0);
  if(dist(mouseX, mouseY, gd(data[78]), p(data[76])) < n(data[77])/2)  {
    stroke(0, 0, 255);
    fill(0);
    text("Wigan Athletic", 200, 30);
    text(int(data[76]), 200, 60);
    text("$"+int(data[99]), 200, 90);
    text(int(data[78]), 200, 120);
    text(data[79], 195, 150);
  }
  fill(s(data[79]));
  ellipse(gd(data[78]), p(data[76]), n(data[77]), n(data[77]));





  //Labels'
  stroke(0);
  line(370, 380, 370, 1000);
  line(370, 380, 900, 380);
  line(900, 380, 900, 290);
  line(900, 290, 1100, 290);
  

  fill(0);
  textFont(f, 20);
  text("Club:", 30, 30);
  text("Points:", 30, 60);
  text("Net Transfers:", 30, 90);
  text("Goal Differential:", 30, 120);
  text("SOT per game:", 30, 150);
 
  
  text("Shots on Target per Game:   -                                     +", 400, 430);
  fill(255);
  ellipse(700, 425, 25, 25);
  fill(165);
  ellipse(750, 425, 25, 25);
  fill(85);
  ellipse(800, 425, 25, 25);
  fill(0);
  ellipse(850, 425, 25, 25);
  
  text("Net Transfers:                      -                                      +", 400, 495);
  fill(165);
  ellipse(700, 490, 10, 10);
  ellipse(740, 490, 20, 20);
  ellipse(790, 490, 30, 30);
  ellipse(850, 490, 50, 50);
  
  fill(0);
  textFont(f, 20);
  text("Goal Differential                    -", 400, 565);
  text("+", 890, 565);
  stroke(0);
  strokeWeight(2);
  line(685, 560, 855, 560);
  triangle(855, 540, 855, 580, 875, 560);
   
  if(mouseX>10 & mouseX<150 & mouseY>503 & mouseY<530) {
   fill(0, 0, 255);
  } 
  text("Ford Bohrmann", 10, 520);
  fill(0);
  if(mouseX>10 & mouseX<255 & mouseY>530 & mouseY<555) {
   fill(0, 0, 255);
  } 
  text("www.soccerstatistically.com", 10, 550);
  fill(0);
  if(mouseX>10 & mouseX<162 & mouseY>563 & mouseY<586) {
   fill(0, 0, 255);
  } 
  text("@SoccerStatistic", 10, 580);
  fill(0); 
  textFont(f, 15);
  text("*Mouse over an ellipse for more info*", 650, 370);
  
  textFont(f, 20);
  rotate(-PI/2);
  text("Points:   -", -580, 958);
  line(-475, 952, -350, 952);
  text("+", -322, 958);
  triangle(-350, 937, -350, 967, -330, 952); 
  
  
  
}

