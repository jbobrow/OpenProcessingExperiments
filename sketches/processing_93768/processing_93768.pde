
//Ana Vlajnic

PFont font = createFont("Arial", 14, true);

void setup() {
  size(630, 600);
  textFont(font);
}
 
void draw() {
  background(255);
  String str = "Populations of States";
  String str_2 = "According to 2012 Census Data";
  fill(0);
  text(str, 270, 40);
  
  fill(100);
  text(str_2, 240, 55);
   
  //BACKGROUND  
  fill(255);
  noStroke();
  rectMode(CORNERS);
  rect(20, 100, width - 20, height - 100);
   
  // BAR 1
  rectMode(CORNER);
  if ((mouseX > 60) && (mouseX <= 60 + 100) && (mouseY > height - 100 - (height - 550)) && (mouseY <= height - 100)) {
   fill(10, 240, 255);
  }
  else {
    fill(255, 5, 5);
  }
  rect(60, height - 100, 100, -(height - 550));
  String state_1 = "Delaware";
  fill(0);
  text(state_1, 72, height - 80);
  
  String population_1 = "917,092";
  if ((mouseX > 60) && (mouseX <= 60 + 100) && (mouseY > height - 100 - (height - 550)) && (mouseY <= height - 100)) {
    //if mouse pressed, display stat
    if (mousePressed == true){
     fill(0);
    }
    else {
      fill(255);
    }
    text(population_1, 82, 445);
  }
    
  
  //BAR 2 
  if ((mouseX > 162) && (mouseX <= 162 + 100) && (mouseY > height - 100 - (height - 530)) && (mouseY <= height - 100)) {
    fill(10, 180, 255);
  }
   else {
    fill(255, 5, 60);
  }
  rect(162, height - 100, 100, - (height - 530));
  String state_2 = "Rhode Island";
  fill(0);
  text(state_2, 170, height - 80);
  
    String population_2 = "1,050,292";
    if ((mouseX > 162) && (mouseX <= 162 + 100) && (mouseY > height - 100 - (height - 530)) && (mouseY <= height - 100)) {
    //if mouse pressed, display stat
    if (mousePressed == true){
     fill(0);
    }
    else {
      fill(255);
    }
    text(population_2, 177, 425);
  }
   
  //BAR 3 
  if ((mouseX > 275) && (mouseX <= 275 + 100) && (mouseY > height - 100 - (height - 450)) && (mouseY <= height - 100)) {
     fill(10, 120, 255);
  } 
  else {
    fill(255, 5, 100);
  }
  rect(264, height - 100, 100, - (height - 450));
   String state_3 = "Connecticut";
  fill(0);
  text(state_3, 275, height - 80);
   
     String population_3 = "3,590,347";
    if ((mouseX > 275) && (mouseX <= 275 + 100) && (mouseY > height - 100 - (height - 450)) && (mouseY <= height - 100)) {
    //if mouse pressed, display stat
    if (mousePressed == true){
     fill(0);
    }
    else {
      fill(255);
    }
    text(population_3, 280, 345);
  }
   
      
 //BAR 4  
  if ((mouseX > 366) && (mouseX <= 366 + 100) && (mouseY > height - 100 - (height - 350)) && (mouseY <= height - 100)) {
      fill(10, 60, 255);
  } 
  else {
    fill(255, 5, 160);
  }
  rect(366, height - 100, 100, - (height - 350));
  String state_4 = "Maryland";
  fill(0);
  text(state_4, 385, height - 80);
   
     String population_4 = "5,884,563";
    if ((mouseX > 366) && (mouseX <= 366 + 100) && (mouseY > height - 100 - (height - 350)) && (mouseY <= height - 100)) {
    //if mouse pressed, display stat
    if (mousePressed == true){
     fill(0);
    }
    else {
      fill(255);
    }
    text(population_4, 385, 245);
  }
   
    
//BAR 5   
  if ((mouseX > 468) && (mouseX <= 468 + 100) && (mouseY > height - 100 - (height - 200)) && (mouseY <= height - 100)) {
      fill(5, 5, 255);
  }
  else {
    fill(255, 5, 250);
  }
  rect(468, height - 100, 100, - (height - 200));
  String state_5 = "Virginia";
  fill(0);
  text(state_5, 488, height - 80);

    String population_5 = "8,185,867";
     if ((mouseX > 468) && (mouseX <= 468 + 100) && (mouseY > height - 100 - (height - 200)) && (mouseY <= height - 100)) {
    //if mouse pressed, display stat
    if (mousePressed == true){
     fill(0);
    }
    else {
      fill(255);
    }
    text(population_5, 487, 95);
  }
}



