
int numBlocks= 40;
block[] blocks = new block[numBlocks];


//Gravity Variables--------------------------------
   float gravity = 0.05;
   float speed = 0;
   float localY = 500;
   float localX;
   
//dropPlace Variables  
   float[] ypos= new float[numBlocks];
   float[] xpos= new float[numBlocks];

//---------------------------------------------------SETUP

void setup() {
  size( 400, 600 );  

    //Randomly place blocks
   for (int i=0; i < xpos.length; i++) {
    xpos[i] = random(  50,  width-50 );
    ypos[i] = random( -3000, -200 );
    }

    //Imputting position values for block
    for (int i=0; i < blocks.length; i++) {
    blocks[i] = new block(xpos[i], ypos[i]);
    }
 
} // end setup---------------------------------------

//---------------------------------------------------MAIN DRAW

void draw() {
  background (255);

 //Draws blocks and activates dropRate function
 for (int i=0; i < blocks.length; i++) {
    blocks[i].draw();
    blocks[i].dropRate( 1.5 ); 
    //Intersect Function
    for (int j=i; j < blocks.length; j++) {  
      if ( intersect(blocks[i], blocks[j]) == true )  
         {blocks[i].checkForCollision(blocks[j]);
      }//end if  
     } //end for j
  }//end for i

} // end draw



//----------------------------FUNCTION-----------------

boolean intersect(block a, block b) {

 //Checks if 2 rectangles intersect 
 if ((a.xpos+ 50) > (b.xpos) && (a.xpos) < (b.xpos  + 50)
    && (a.ypos+ 50) > (b.ypos) && (a.ypos) < (b.ypos + 50)) 
   {
    return true;    
  }  
  else {
    return false;
  }
}

//----------------------------------------------------- BLOCK CLASS

class block {
  
  //dropRate Variables  
  float ypos;
  float xpos; 
  boolean dropMove = true;
  
  //Constructor-----------------------------------------CONSTRUCTOR
  block (float xpos, float ypos){
    this.xpos = xpos;
    this.ypos = ypos;
    this.dropMove= dropMove;
  }
  
  //----------------------------------------------------DRAW BLOCK
  
  void draw () {
    rectMode(CORNERS);
    smooth();
    noStroke();
    fill (0);
    rect( xpos, ypos, xpos+50, ypos+50 );
  }//end draw
  
  //------------------------------------------------- DROP RATE & PLACEMENT
  
  void dropRate (float speed){
        if ( ypos >= height-50 || dropMove==false ) {
          ypos = ypos;
         } // end if
         else {
          dropMove=true;
          ypos = ypos + speed;
         } // end else
     
        
  } // end dropRate
  
  //------------------------------------------------- CHECK FOR COLLISSION
  void checkForCollision(block other) {

    if (intersect(this, other) == false) {
      return; // no collision, exit from function 
    }
   
    // same for the Y axis 
    if (this.ypos < other.ypos) {
      this.dropMove= false;
    }
    else {
      this.dropMove= true;
    }
  }


}//end class block------------------------------------------------- END CLASS

//----------------------------------------------------- PLAYER CLASS
/*
class player {
  
  //dropRate Variables  
  float localX;
  float localY; 
  boolean dropMove = true;
  
  //Constructor-----------------------------------------CONSTRUCTOR
  block (float xpos, float ypos){
    this.xpos = xpos;
    this.ypos = ypos;
    this.dropMove= dropMove;
  }
  
  //----------------------------------------------------DRAW BLOCK
  
  void draw () {
    rectMode(CORNERS);
    smooth();
    noStroke();
    fill (0);
    rect( xpos, ypos, xpos+50, ypos+50 );
  }//end draw
  
  //------------------------------------------------- DROP RATE & PLACEMENT
  
  void dropRate (float speed){
        if ( ypos >= height-50 || dropMove==false ) {
          ypos = ypos;
         } // end if
         else {
          dropMove=true;
          ypos = ypos + speed;
         } // end else
     
        
  } // end dropRate
  
  //------------------------------------------------- CHECK FOR COLLISSION
  void checkForCollision(block other) {

    if (intersect(this, other) == false) {
      return; // no collision, exit from function 
    }
   
    // same for the Y axis 
    if (this.ypos < other.ypos) {
      this.dropMove= false;
    }
    else {
      this.dropMove= true;
    }
  }


}//end class block------------------------------------------------- END CLASS
*/
