

void setup ()
{
  size (800,600); //size of my screen
  background (123,181,232);

}

void draw ()
{
  //Main House structure
 
  fill (255,200,125);
  rect (150,275,350,200); //house
    
    //roof
 
 fill (100,125,100);
 triangle(150, 275, 325, 100, 500, 275);
 
    //house windows
  
  fill (0); //window colors
  rect (175,300,50,50); // window 1
  rect (175,400,50,50); // window 2
  rect (425,300,50,50); //window 3
  rect (425,400,50,50); //window 4
  
  //house doors
  
  fill (100,20,10); //door color
  rect (300,415,50,60); //door
  
   //walk way
  fill (100,100,100);
  rect (300,475,50,175);
  
  
 

 // ----------------------------------------------------------------------------------
 
  //garage
  
  fill (255,220,125);
  rect (500,275,200,200); //garage 
  //garage door
  
  fill (100,100,100); //garage color gray 
  rect (560,415,80,60); //garage 
 
 
  
 //drive way 
 fill (0);
 rect (500,475,200,175);
//-------------------------------------------------------------
 
 //The Sun
 fill (255,238,0);
 ellipse (0,0,200,200);
 
 //____________________________________________________
 
 

  
  
  
  
  
}


