
int monsterX = 100;
int monsterY = 50;
int counter = 0;
int linksrechts = 4;
boolean test = false;
float i = 40;
void setup () {
  size (200,200);
   }
void draw () {
  background(250); 
   
/*Beweging*/
  
  monsterX = monsterX + linksrechts;
  
 if (monsterX>130 || monsterX<0) {
 linksrechts = -linksrechts;
 counter = counter+1;
 println (counter);
}
 if (counter == 10) {
  counter = 0;
  test = !test;
}
 
  
  if(test == true) {
  /*Digglet hoofd*/
  fill(152,50,16);
  }
  
  stroke(0); 
  rect(monsterX, monsterY, 80, 130, 40); /* 56x, 30y */
   
 
  
   /*Digglet hoofd  - Pupil links*/
  stroke(0);
  fill(255);
  rect(monsterX+24, monsterY+18, 7, 10, 40);
  
  /*Digglet hoofd  - Oog rechts*/
  stroke(0);
  fill(0);
  rect(monsterX+49, monsterY+18, 8, 24, 40);
  
   /*Digglet hoofd  - Pupil rechts*/
  stroke(0);
  fill(255);
  rect(monsterX+49, monsterY+18, 8, 10, 40);
  
  /*Digglet hoofd  - Neus*/
  stroke(0);
  fill(219,138,172);
  rect(monsterX+22, monsterY+50, 35, 19, 80);
  
    
  // the false!!
  if(test == false){
  /*Digglet hoofd*/
  fill(151,50,16);
  
  }
  
  
    stroke(0);
   rect(monsterX, monsterY, 80, 130, 40); /* 56x, 30y */
   
   /*Digglet hoofd  - Oog links*/
  stroke(0);
  fill(0);
  rect(monsterX+24, monsterY+18, 8, 24, 40);
  
   /*Digglet hoofd  - Pupil links*/
  stroke(0);
  fill(255);
  rect(monsterX+24, monsterY+18, 7, 10, 40);
  
  /*Digglet hoofd  - Oog rechts*/
  stroke(0);
  fill(0);
  rect(monsterX+49, monsterY+18, 8, 24, 40);
  
   /*Digglet hoofd  - Pupil rechts*/
  stroke(0);
  fill(255);
  rect(monsterX+49, monsterY+18, 8, 10, 40);
  
  /*Digglet hoofd  - Neus*/
  stroke(0);
  fill(219,138,172);
  rect(monsterX+22, monsterY+50, 35, 19, 80);
  
  
/* While naar for 
while (yi < height) {
  stroke(0);
  line(0,yi,width,yi);
  yi = yi +10;
}
for (int i = 0; i < height; i = 1 + 10){
  stroke(0);
  line(0,i,width,i);}
Gaat niet samen met een boolean (test , counter etc).
 While naar for */
 
}
