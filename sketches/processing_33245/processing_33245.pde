
/* 

  Liz Rutledge
  August 8, 2011
  For Loops

*/

float xPos;
float yPos;
int numBalls;
int numWords;

PFont font;

void setup() {
    size(300,500);
    background(80);
    smooth();
    xPos = width/2;
    yPos = 20;
    numBalls = 8;
    numWords = 10;
    
    //just making a font so we can display text
  font = createFont("Arial", 32);
  textFont(font, 32);
  textAlign(CENTER);
}


void draw() {
    
    background (80);    
    /* for (define counter and set to zero; condition under which the code is         executed; how to increment the count) {} */
    
    for(int i = 0; i < numBalls; i++){
        ellipse(xPos + 20*i, yPos, 10, 10);
    }

    for(int i = 0; i < numWords; i++) {
//        text("hi " + (i+1), width/2, 40 + 40*i);    
    }
    

    for(int i = 0; i < numBalls; i++){
        ellipse(xPos + i*(pow(-1, i)), yPos+100+20*i, 10, 10);
        line(xPos + i*(pow(-1, i)), yPos+100+20*i, xPos + (i+1)*(pow(-1, (i+1))), yPos+100+20*(i+1));
    }

    // (pow(-1, i) is equivalent to -1 to the power of i
    // for all even values of i, the expression will evaluate to 1
    // for all odd values of i, it will evaluate to -1

 //   xPos ++;
  //  yPos ++;


//for loop takes the place of these extra circles!
 /*   
    ellipse(40, 20, 10, 10);
    ellipse(60, 20, 10, 10);
*/
    
}




/* What the computer sees!
 ellipse(20 + 0, 20, 10, 10);
 ellipse(20 + 20, 20, 10, 10);
 ellipse(20 + 40, 20, 10, 10);
 ellipse(20 + 60, 20, 10, 10);
 ellipse(20 + 80, 20, 10, 10);
*/


