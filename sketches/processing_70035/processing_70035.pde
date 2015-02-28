
//////Sketch by Brian Oldiges 9/10/2012
//////Architecture Major in the UK college of Design
//////A-S 348 Circuits and Bits 2012
//////


////// Use the mouse to float over and click to change colors of triangles


int triDa = 60; //distances that the triangle is away from the center of the square
int triDb = 10;

int x=0;  //loop in x direction
int y=0;  //loop in y direction
int a=0;  //used as modulo to get the colors to "travel"across the page



void GeoPat (float x_coord,float y_coord){  ////function used to draw the shape
  
  
//rectMode(CENTER);
// fill(0,0,255);
//rect(x_coord,y_coord,80,80);
// fill(0);
//ellipse(x_coord,y_coord,60,60);



////Red    fill (255,0,0);
////Orange fill (255,128,0);
////Yellow fill (255,255,0);


stroke(255);
//noStroke();



////////////***************////////////
////////////This section defines all the colors
////////////essentiallly I am defining the color of each shape in a 3x3 block and then telling that block to move across the page
///////////1st column: (1st row, 2nd row, 3rd row) , 2nd column: (1st row, 2nd row, 3rd row) , 3rd column: (1st row, 2nd row, 3rd row)
///////////you could choose 9 different colors in the block to travel across but I stuck with red, orange, and yellow
/////////// remainder of a is equal to 0

if(a%3==0){
  if(y%3==0){
    fill (255,0,0);
    if(x%3==0){
      fill (255,0,0);
    }
    else if(x%3==1){
      fill (255,128,0);
    }
    else if(x%3==2){
      fill (255,255,0);
    }
  }



  else if(y%3==1){
    fill (255,128,0);
    if(x%3==0){
      fill (255,255,0);
    }
    else if(x%3==1){
      fill (255,0,0);
    }
    else if(x%3==2){
      fill (255,128,0);
    }
  }


  else if(y%3==2){
    fill (255,255,0);
    if(x%3==0){
      fill (255,128,0);
    }
    else if(x%3==1){
      fill (255,255,0);
    }
    else if(x%3==2){
      fill (255,0,0);
    }
  }
}


//////////// remainder of a is equal to 1
if(a%3==1){
  if(y%3==2){
    fill (255,0,0);
    if(x%3==0){
      fill (255,0,0);
    }
    else if(x%3==1){
      fill (255,128,0);
    }
    else if(x%3==2){
      fill (255,255,0);
    }
  }



  else if(y%3==0){
    fill (255,128,0);
    if(x%3==0){
      fill (255,255,0);
    }
    else if(x%3==1){
      fill (255,0,0);
    }
    else if(x%3==2){
      fill (255,128,0);
    }
  }


  else if(y%3==1){
    fill (255,255,0);
    if(x%3==0){
      fill (255,128,0);
    }
    else if(x%3==1){
      fill (255,255,0);
    }
    else if(x%3==2){
      fill (255,0,0);
    }
  }
}

//////////// remainder of a is equal to 2
if(a%3==2){
  if(y%3==1){
    fill (255,0,0);
    if(x%3==0){
      fill (255,0,0);
    }
    else if(x%3==1){
      fill (255,128,0);
    }
    else if(x%3==2){
      fill (255,255,0);
    }
  }



  else if(y%3==2){
    fill (255,128,0);
    if(x%3==0){
      fill (255,255,0);
    }
    else if(x%3==1){
      fill (255,0,0);
    }
    else if(x%3==2){
      fill (255,128,0);
    }
  }


  else if(y%3==0){
    fill (255,255,0);
    if(x%3==0){
      fill (255,128,0);
    }
    else if(x%3==1){
      fill (255,255,0);
    }
    else if(x%3==2){
      fill (255,0,0);
    }
  }

}

rectMode(CENTER);
// fill(0,0,255);
rect(x_coord,y_coord,80,80);



if ((mouseX<(x_coord/2+50))&&(mouseX>(x_coord/2-50))){   /////////////if the mouse is within 100 pixels of the center of a square
  if ((mouseY<(y_coord/2+50))&&(mouseY>(y_coord/2-50))){  ////////////the triangles around said square become blue ( i divided by 2 only because I will scale the shape by 1/2 later)
  fill(0,0,255);
}}
if(mousePressed){   ///if the mouse is clicked the triangles will become blue
  fill(0,0,255);
}

////////////
////////////
////////////
////////////***************////////////

 triangle(x_coord+triDa,y_coord+triDb,x_coord+triDb,y_coord+triDa,x_coord+triDa,y_coord+triDa);
 triangle(x_coord+triDa,y_coord-triDb,x_coord+triDb,y_coord-triDa,x_coord+triDa,y_coord-triDa);
 triangle(x_coord-triDa,y_coord-triDb,x_coord-triDb,y_coord-triDa,x_coord-triDa,y_coord-triDa);
 triangle(x_coord-triDa,y_coord+triDb,x_coord-triDb,y_coord+triDa,x_coord-triDa,y_coord+triDa); 
  
   fill(0,255,0);
ellipse(x_coord,y_coord,60,60);
  
}






void setup(){
  
 size(600,600);  /////600 pixel by 600 pixel screen size, P2D renderer by default
background(0);

frameRate(5); //// increase the speed at which the sketch operates
   
  
}



void draw(){
  
scale(.5);   /// scales the size of image by 1/2
 println(a);
  
  ///////////// loop: (variable=starting value, variable<number of times the loop runs, add 1 to variable each cycle)
   for(y=0;y<11;y++)  ////defines the columns in the loop  
   {
     for(x=0;x<11;x++)   /////defines the rows of the loop
     {
 
  
 GeoPat (x*120,y*120); ///// call the function defined in the start of the scetch
  
 
     }}
      a++;  ////add 1 to a each cycle
}

