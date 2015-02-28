
/* Exercise 2 */


/* FUNCTIONS */
void drawCross(int posX, int posY){
  strokeWeight(10);
  stroke(#0000ff);
  line(posX+0, posY+0, posX+50, posY+50);
  line(posX+50, posY+0, posX+0, posY+50);
}
/* END FUNCTIONS */

void setup(){
  smooth();
  size(400,400); 
  background(255,254,186);
}


/* Start main */
void draw(){
   
  /*** DRAW BOARD ***/
  strokeWeight(4);
  /* stroke 1 */  
  stroke(0);
  line(50,150,350,150);
  /* stroke 2 */
  stroke(0);
  line(50,250,350,250);
  /* stroke 3 */
  stroke(0);
  line(150,50,150,350);
  /* stroke 4 */
  stroke(0);
  line(250,50,250,350);
  /*** END BOARD ***/
  
  
  /*** SQUARES ***/
  noStroke();
  fill(#ff0000);
  rect(75,75,50,50);
  rect(275,75,50,50);
  rect(175,175,50,50);
  rect(75,275,50,50);
  /*** END SQUARES ***/
  
  
  /*** CROSSES ***/
 drawCross(175, 75);
 drawCross(275,275);
 drawCross(275,175);
  /*** END CROSSES ***/
  
  /*** WINNING STROKE ***/
  strokeWeight(2);
  stroke(#00ff00);
  line(25,375,375,25);
  /*** END WINNING STROKE ***/
  

}

