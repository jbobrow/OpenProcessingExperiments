


int monsterX;
int monsterY;
int counter;
int linksrechts;
boolean test;

void setup () {
  size (200,200);
  
  /* Om een monster een begin plek te geven moet je de int's een start positie geven.
  = stop je het in de doos.
  == is gelijk aan?
  formule werkt alleen als de code juist is
 
  */
  monsterX = 100;
  monsterY = 200;
  
  counter = 0;
  linksrechts = 4;
  test = false;
  
  }

void draw () {
  background(250); 
   

  // the true!!
  
  if(test == false) {
  /*Digglet hoofd*/
  stroke(0);
  fill(161,50,16);
  rect(monsterX, monsterY, 80, 130, 40); /* 56x, 30y */
  }
    
  // the false!!
  
  if(test == true){
  /*Digglet hoofd*/
  stroke(0);
  fill(161,50,16);
  rect(monsterX, monsterY, 80, 130, 40); /* 56x, 30y */
  }
  
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
  
  
  /*Beweging*/
  
if (monsterX>200 || monsterX<0) {
  linksrechts = -linksrechts;
  counter = counter+1;
  println (counter);
  println (test);
}

if (counter==10) {
  test = !test;
  counter = 0;
}

 
}
