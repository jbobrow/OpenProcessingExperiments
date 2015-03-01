
/*to randomly generate a screen full of squares to fit x by x  dimensions 
the size of the drawing can be changed all sizes work 
cathal lindsay 2014*/

void setup(){
  size(400, 400);
  rectMode (CORNER);
  noStroke();
  randomSeed(hour()+minute()+second()+millis());// random gen number
  frameRate(4);
}

void draw(){
 // if (mousePressed == true){ doesn't want to work for me on this site
    background (180);
    
   
   int numH = 5;// sets number of squares across
   int numV = 5; // sets number of squares down
    int gap  = (int)random(-5, 7) ; //sets number of gaps needed
    
    float cellsizeH = ( width -(numH + 1) * gap) / (float) numH;
    float cellsizeV = (height - (numV + 1) * gap) / (float) numV;
    // print each cell size
   // printIn("cellsizeH = " +cellsizeH, "cellsizeV ="+cellsizeV);
    
    //offset for shadows
    float offsetX = cellsizeH/15.0;
    float offsetY = cellsizeV/15.0;
    
    
    for(int i = 0; i<numH; i++){ // horizontal postion
      for(int j =0; j<numV; j++){ // vertical postion
        //to clean up code Ive called these floats
        float sX = (gap * (i+1) + cellsizeH * i ); // postions point x of the rect
        float sY = (gap * (j+1) + cellsizeV * j ); // postions point y  of the rect
    
    fill(160,0,0,180);
      rect(random (-5,5)+ sX + (offsetX +random(-2,2)), random (-5,5) + sY +(offsetY + random (-2,2)), cellsizeH, cellsizeV);
    int colour = (int)random(0,6);
    if (colour <= 4){
      fill (250,0,21,300);
    }else{
        fill(247,57,57,100);
        rect(random (-5,5) + sX, random (-5,5) + sY, cellsizeH, cellsizeV);
    }//end if  
    }//end j
    }// end i
 // }//end mouse press
  }// end draw
        
   


