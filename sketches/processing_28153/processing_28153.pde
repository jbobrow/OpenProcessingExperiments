
int[] numbers = new int[4];
int rannum , ranchoice;
PFont font;

void setup() 
{
  size(200,230);
  
  rectMode(CORNERS);
  for(int i = 0; i < 4 ; i++){
    numbers[i] = 80;
  }
  font = loadFont("AgencyFB-Reg-17.vlw"); 
  textFont(font, 17);
  textAlign(LEFT);
}

void draw() 
{
  background(255);
 // setting values to the boxes 
 // later this will come from the ardunio

 for(int i = 0; i < 4 ; i++){
   rannum = (int) random(10);
   ranchoice = (int) random(2);
 
   if ( ranchoice == 1) {
     rannum = rannum * -1;
   }
   
   if ((numbers[i] + rannum) > 140 || (numbers[i] + rannum) < 1){
     rannum = rannum * -1;
   }
 
    numbers[i] = numbers[i] + rannum;
  }
  
  // box 1 | Temp
  noFill();
  stroke(1);
  rect(9 +10 , 20 , 50+10 , 180);
  fill(111);
  noStroke();
  rect(10 +10, 20 + numbers[0] , 50+10 , 180);  
  text("Temp C" + (160 -  numbers[0]), 9+10, 200); 
  
  // box 2 | Light
  noFill();
  stroke(1);
  rect(69+10 , 20 , 110 +10, 180);
  fill(111);
  noStroke();
  rect(70 +10, 20 + numbers[1] , 110+10 , 180);  
  text("Light " + (160 -  numbers[1]), 70+10, 200); 
  
  // box 3 | humidity
  noFill();
  stroke(1);
  rect(129 +10, 20 , 170 +10, 180);
  fill(111);
  noStroke();
  rect(130 +10, 20 + numbers[2] , 170 +10, 180);  
  text("Humidity " + (160 -  numbers[2]), 130+7, 200); 
  
  
  
  // Delay
  delay(100);
}



