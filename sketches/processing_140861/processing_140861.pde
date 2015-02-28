
void setup() {
 size(590,700);
 background(255,255,255);
 noStroke();
 setColor("g");
 
  //D
  rect(55,50,55,20);
  rect(80,110,55,20);
  rect(55,75,20,55);
  rect(115,50,20,55);
  
  //E
  rect(145,50,70,20);
  rect(145,75,20,55);
  rect(170,110,45,20);
  setColor("b");
  rect(170,80,22,22);
  
  //S
  rect(271,79,22,22);
  setColor("g");
  rect(245,50,20,50);
  rect(270,50,45,20);
  rect(245,110,50,20);
  rect(300,80,20,50);
  
  //T
  rect(325,50,55,20);
  rect(342.5,75,20,55);
  
  //Y
  rect(390,50,20,47);
  rect(390,110,50,20);
  rect(445,50,20,80);
  setColor("b");
  rect(416,76,22,22);
  
  //L
  setColor("g");
  rect(475,50,20,55);
  rect(475,110,65,20);
  rect(520,50,20,20);
  
  //Black Blocks
  setColor("b");
  rect(55,160,55,265);
  rect(55,432,75,110);
  rect(205,575,335,60);
  rect(320,160,220,45);
  rect(475,315,65,253);
  
  //Grey Blocks
  setColor("g");
  rect(117.5,160,100,110);
  rect(117.5,277.5,65,100);
  rect(224,160,90,80);
  
  rect(345,475,120,93);
  rect(235,498,100,70);
  rect(405,341,60,125);
  
  rect(55,554,135,15);
  rect(55,576,135,15);
  rect(55,598,135,15);
  rect(55,620,135,15);
  
  rect(458,210,15,100);
  rect(480,210,15,100);
  rect(502,210,15,100);
  rect(525,210,15,100);
  
  //Yellow Blocks
  setColor("y");
  rect(240,245,65,20);
  rect(245,472,65,20);
  
  //Blue Blocks
  setColor("bl");
  rect(203,322.5,25,55);
  rect(365,341,25,55);
  
  //Red Block
  setColor("r");
  rect(273,341,40,40);
  
  //Signature
  textSize(8);
  setColor("b");
  text("COMP.1916 V.HUSZAR", 490, 680);
  
  goShopping();
  
}

void setColor(String selection) {
  if(selection == "g") fill(170,190,200);
  else if(selection == "b") fill(0,0,0);
  else if(selection == "bl") fill(65,128,180);
  else if(selection == "y") fill(255,210,80);
  else if(selection == "r") fill(190,10,10);
}
















































void goShopping() {
   boolean storeHasEggs = true;
   if(storeHasEggs) {
     for(int i=0; i<10; i++) buyMilk();
   } else buyMilk();
}

void buyMilk() {
  println("Bought milk.");
}
