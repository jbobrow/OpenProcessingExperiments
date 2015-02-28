

String[] rawData;
String[] rawData2;
String[][] data;
String[][] data2;

PImage img;
PImage img2;
PFont myFont; 

boolean menu;


void setup() {
  size(800, 800);
  myFont = loadFont("SquareFont-32.vlw"); 
  img = loadImage("map.jpg");
  img2=loadImage("cursor.png");
  background(img);
  rawData = loadStrings("japanp3.csv");
  rawData2 = loadStrings("japanp4.csv");
  splitData();
  mouseClicked();
  menu = true;
     
}
void draw() {
  background(img);
   noStroke();
   smooth();
 img2=loadImage("cursor.png");
  cursor(img2);
  cursor(img2, 10, 10);
  cursor(); 
  
  if (menu==true) {

  fill(10, 40,255);
  
  //173,96,99
  //185,111,114
  //198,118,121
  
    for (int i = 0; i < 1; i++) {
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 63, 63);
    }}
    
     for (int i = 0; i < 4 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 50, 50);
    }}
    
       for (int i = 0; i < 8 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 40, 40);
    }}
    
          for (int i = 0; i < 14 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 30, 30);
    }}
    
         for (int i = 0; i < 17 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 20, 20);
    }}
    
        for (int i = 0; i < 20 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 15, 15);
    }}   
    
    
        for (int i = 0; i < 29 ; i++) {    
    if (dist(mouseX, mouseY, int(data[i][5]), int(data[i][6])) < 15) {
      println(mouseX + " " + mouseY + " " + int(data[i][5]) + " " + int(data[i][6]));
      fill(198,118,121);
      textFont(myFont);    
      text(data[i][0] + ", Intensity: " + data[i][3] + ", Death Toll: " + data[i][1], 30, 80+i*10);  
      fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 10, 10);
    }}   
  
  } 
  if (menu==true && mouseX >563 && mouseX < 785 && mouseY >700 && mouseY <741 ){
background(img);

for (int i = 0; i < 1; i++) {
fill(255, 0, 0, 40);
      ellipse(int(data[i][5]), int(data[i][6]), 63, 63);
    }

  for (int i = 0; i < 4 ; i++) {
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 50, 50);
    }

for (int i = 0; i < 8 ; i++) {  
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 40, 40);
    }

  for (int i = 0; i < 14 ; i++) {
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 30, 30);
    }

for (int i = 0; i < 17 ; i++) {  
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 20, 20);
    }

for (int i = 0; i < 20 ; i++) {    
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 15, 15);
    }

for (int i = 0; i < 29 ; i++) {
fill(255, 0, 0, 50);
      ellipse(int(data[i][5]), int(data[i][6]), 10, 10);
    }

for (int i = 0; i < 29 ; i++) {
fill(255, 0, 0, 30);
      ellipse(int(data[i][5]), int(data[i][6]), 6, 6);
    }

  
}

////
if (menu==true && mouseY >700 && mouseY < 741 && mouseX >399 && mouseX <549 ) {
    background(img);

  for (int i = 0; i <1; i++) {
   fill(125, 38, 144, 60);
    ellipse(int(data2[i][2])+30, int(data2[i][3])+10, 90, 90);
    }

  for (int i = 0; i <3; i++) {
     fill(125, 38, 144, 40);
    ellipse(int(data2[i][2])+30, int(data2[i][3])+10, 80, 80);
   }

   for (int i = 0; i <5; i++) {
     fill(125, 38, 144, 40);
      ellipse(int(data2[i][2])+30, int(data2[i][3])+10, 70, 70);
    }

    for (int i = 0; i <7; i++) {
      fill(125, 38, 144, 40);
      ellipse(int(data2[i][2])+30, int(data2[i][3])+10, 60, 60);
    }
    
    for (int i = 0; i <7; i++) {
      fill(125, 38, 144, 40);
      ellipse(int(data2[i][2])+30, int(data2[i][3])+10, 45, 45);
    }



////
}
  
  else if(menu==false) {
    background(img);  
   
    
}
println(mouseX + ", " + mouseY);
}

//println(mouseX + ", " + mouseY);


void mouseClicked() {
  if (menu==true && mouseX >600 && mouseX < 800   && mouseY > 600 && mouseY < 800) {
    menu = !menu;
    println(menu);
  }

  if (menu==false && mouseX<600 && mouseX>0 && mouseY<600 && mouseY >0){
    menu = !menu;
    println(menu);

}

}
void splitData() {
  // create a function to store and organize the data into arrays
  // data = new String[# of rows][# of columns] 
  data = new String[rawData.length][7];
  for (int i = 0; i <rawData.length; i++) {
    //pieces has three columns seperated by columns  
    String[] pieces = split(rawData[i], ",");
    for (int j = 0; j < 7; j++) {
      data[i][j] = pieces[j];
      //println(data[i][j]);
    }
  }
  
   data2 = new String[rawData2.length][4];
  for (int i = 0; i <rawData2.length; i++) {
    String[] pieces = split(rawData2[i], ",");
    for (int j = 0; j < 4; j++) {
      data2[i][j] = pieces[j];
    }}
  
  
}


