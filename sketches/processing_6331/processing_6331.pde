
  float data[][]={{6.7, 0.9, 1.5, 4.6, 0.4, 0.6, 7.2, 1, 5.9, 20.6, 49.3},  
                  {8.4, 1, 1.6, 5, 0.6, 0.4, 6.9, 1.3, 5.8, 17.2, 48.3},  
                  {7.3, 1, 1.6, 3.4, 0.5, 0.9, 7.3, 0.9, 7.2, 9.2, 39.2},  
                  {4.9, 1.2, 2.2, 7, 1.2, 1.2, 7.2, 1.3, 4.9, 12.7, 43.8},  
                  {6, 1.6, 1, 3.5, 0.5, 0.5, 7, 1.6, 7.7, 21.8, 51.2},  
                  {6.5, 1.5, 1.5, 4.5, 0.3, 0.3, 6.8, 1.1, 5.8, 20.4, 48.9},  
                  {6.9, 1.8, 1.3, 2.9, 0.8, 1.9, 7.2, 1.5, 6, 22.3, 52.7},  
                  {6, 1.1, 1.6, 3.3, 0.5, 0.9, 6.2, 0.6, 4, 21.2, 45.4},  
                  {8.2, 2.3, 1.1, 4.5, 0.6, 0.4, 4.7, 0.3, 2.3, 18, 42.4}, 
                  {9.6, 1.4, 2.2, 6.3, 0.7, 1.1, 5.5, 1.7, 5.8, 17.7, 51.8}, 
                  {4.8, 0.1, 1.4, 5.9, 0.7, 0.6, 8.1, 3.6, 8.3, 8.1, 41.7},  
                  {3.5, 0.5, 1.4, 4.5, 0.6, 1.3, 7.7, 0.6, 4.1, 9.6, 33.7}, 
                  {8.7, 1.4, 1.9, 5.9, 0.8, 0.7, 7, 0.8, 4.5, 18.2, 49.9},  
                  {5, 0.9, 1.4, 3.6, 1.2, 0.6, 7.1, 0.2, 3.8, 12.2, 36.1}, 
                  {4, 2.8, 1.4, 6.4, 1, 1.2, 4.1, 0.9, 4.7, 3.7, 30.2}, 
                  {4, 0.2, 0.9, 4.5, 1, 0.6, 4.6, 1.7, 4.5, 16.4, 38.6},
                  {7.3, 1.5, 1.7, 4.7, 0.8, 1, 5.9, 1.4, 5.1, 16.4, 45.6},  
                  {5.3, 1, 1.9, 4.2, 1.3, 0.7, 6.6, 1.1, 7.4, 10.3, 39.9},  
                  {3.9, 1.5, 1, 3.7, 0.6, 0.6, 7.2, 1.1, 5.8, 16.2, 41.7}, 
                  {5.9, 1.2, 1.8, 4.4, 0.6, 1.2, 4.7, 1.1, 6, 16.9, 43.8}, 
                  {6.9, 1.3, 1.9, 3.8, 0.5, 0.6, 7.2, 1, 7.1, 16, 46.3},
                  {5.1, 1.8, 2.2, 4.2, 0.7, 0.9, 5.4, 0.9, 4.2, 12.4, 37.7},  
                  {4.6, 1.1, 1.8, 5, 0.9, 0.9, 5.6, 1.5, 4.3, 12.8, 38.5},  
                  {7.7, 1.7, 1.3, 4.8, 0.4, 0.7, 6.8, 1.1, 7.1, 22.7, 54.3},  
                  {4.9, 2.5, 2.6, 2.8, 1, 0.9, 7.1, 0.9, 5.8, 15.9, 44.3}, 
                  {4.8, 4.3, 2.1, 3.7, 0, 0.6, 7.7, 0.3, 6.2, 7, 36.7}};
              
  String countries[]={"Austria", "Belgium", "Canada", "Czech Republic", "Denmark", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Japan", "Korea", "Luxembourg", "Netherlands", "New Zealand", "Norway", "Poland", "Portugal", "Slovak Republic", "Spain", "Sweden", "United Kingdom", "United States"};
  int wChart[] = {3,3,3,3,3,3,3,3,3,6};
  int order[][] = {{1, 10, 23, 15, 10, 24, 21, 8, 16, 10, 5, 6}, {2, 3, 20, 12, 7, 16, 24, 14, 9, 12, 10, 8}, {3, 6, 21, 14, 23, 20, 10, 4, 19, 4, 23, 19}, {4, 18, 15, 3, 1, 3, 4, 7, 8, 17, 18, 13}, {5, 13, 8, 25, 22, 21, 23, 12, 4, 2, 3, 4}, {6, 11, 10, 16, 11, 25, 26, 15, 11, 11, 6, 7}, {7, 8, 5, 22, 25, 8, 1, 5, 5, 9, 2, 2}, {8, 12, 18, 13, 24, 22, 9, 18, 22, 24, 4, 11}, {9, 4, 4, 23, 14, 15, 25, 23, 24, 26, 8, 15}, {10, 1, 12, 4, 3, 12, 6, 21, 3, 13, 9, 3}, {11, 21, 26, 17, 4, 13, 16, 1, 1, 1, 24, 17}, {12, 26, 24, 20, 13, 18, 2, 2, 23, 23, 22, 25}, {13, 2, 13, 7, 5, 10, 13, 13, 21, 20, 7, 5}, {14, 17, 22, 19, 21, 2, 18, 11, 26, 25, 20, 24}, {15, 24, 2, 18, 2, 5, 5, 26, 20, 18, 26, 26}, {16, 23, 25, 26, 12, 6, 17, 25, 2, 19, 12, 20}, {17, 7, 11, 11, 9, 9, 7, 19, 7, 16, 13, 10}, {18, 15, 19, 6, 16, 1, 15, 17, 12, 3, 21, 18}, {19, 25, 9, 24, 19, 17, 19, 6, 13, 14, 14, 16}, {20, 14, 16, 10, 15, 14, 3, 24, 10, 8, 11, 14}, {21, 9, 14, 8, 18, 19, 22, 9, 15, 5, 15, 9}, {22, 16, 6, 2, 17, 11, 12, 22, 17, 22, 19, 22}, {23, 22, 17, 9, 6, 7, 11, 20, 6, 21, 17, 21}, {24, 5, 7, 21, 8, 23, 14, 16, 14, 6, 1, 1}, {25, 19, 3, 1, 26, 4, 8, 10, 18, 15, 16, 12}, {26, 20, 1, 5, 20, 26, 20, 3, 25, 7, 25, 23}}; 
  int sortKey = 0;
  int zoneKey = 0;
  int zoneCountry = 0;
  boolean cSelected[]={false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false}; 
  String labels[]={"General", "Defence", "Law & order", "Economy", "Environment", "Housing", "Health", "Culture", "Education", "Social protection", "Total"};
  PFont titleFont;
  PFont plotFont;
  
void setup(){
 size(645,470);
  plotFont = createFont("Arial Narrow", 12, true);
  titleFont = createFont("Gill Sans MT", 18, true);
}
void draw(){
  int myMouseX = mouseX;
  int myMouseY = mouseY;
  background(250);
  textFont(titleFont);
  textAlign(CENTER);
  fill(0);
  text("Government expenditure by function as percentage of GDP",width/2,20);
  textAlign(CENTER);
  textFont(plotFont);
  for (int i=0,x=80;i<10;i++){
    if(sortKey==i+1){fill(#ff7f0e);} else {fill(0);}
    text(labels[i],x+7.5*wChart[i],40);
    x+=wChart[i]*15+7;
  }
  rectMode(CORNERS);
  float a = textAscent()+textDescent();
  textAlign(LEFT,TOP);
  for (int i=0;i<26;i++){
   if (myMouseY>50+(order[i][sortKey]-1)*a&&myMouseY<50+(order[i][sortKey])*a){
     zoneCountry=i;
   }
   if (cSelected[i]){
     fill(#ff7f0e);
   } else {
   fill(0);
   }
   text(countries[i],5,50+(order[i][sortKey]-1)*a);
  }


  textAlign(LEFT,BASELINE);
  for (int i=0,x=80;i<10;i++){
    fill(240);
    if(myMouseX>x&&myMouseX<x+wChart[i]*15){
      zoneKey=i+1;
    }
    if (i==(sortKey-1)) {
      stroke(#ff7f0e);strokeWeight(2);
    } else {
      stroke(0);strokeWeight(1);
    }
    rect(x-1,49,x+wChart[i]*15+1,51+26*a);
    noStroke();
    fill(255);
    for (int j=0;j<wChart[i]*15;j+=30){
      rect(x+j,50,min(x+j+15,x+wChart[i]*15),50+26*a);
    }
    for (int j=0;j<26;j++){
      if (cSelected[j]) {
        fill(#ff7f0e);
      } else {
        fill(#1f77b4);
      }
      rect(x,50+(order[j][sortKey]-.9)*a, x+(data[j][i]*3),50+(order[j][sortKey]-.1)*a);
      if (cSelected[j]||((zoneKey==i+1)&&(zoneCountry==j))){
        fill(128);text(nf(data[j][i],0,1),x+(data[j][i]*3)+3,50+(order[j][sortKey]-.2)*a);
      }
    } 
    x+=wChart[i]*15+7;
  }
  fill(0);text("Click on a country name to highlight it or on a category to sort the display. Right click to reset.",5,460);
  textAlign(RIGHT);  
  text("Source: Government at a Glance, OECD, 2009", width-5,460);}



void mousePressed(){
  if (mouseButton == RIGHT) {
    sortKey=0;
    for(int i=0;i<26;i++){cSelected[i]=false;}
  } else
  if (mouseX>85) {
    sortKey=zoneKey; 
  } else
  {cSelected[zoneCountry]=(!cSelected[zoneCountry]);}
  
  
}

