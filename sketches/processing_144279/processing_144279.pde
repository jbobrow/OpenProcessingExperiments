
// Konkuk University
 // Department of Dynamic Media
 // SOS iDesign
// Name: CHAE Seo RIn
 // ID: 201420110


void setup(){
size (500, 500);
smooth();
 }

void draw(){

background (308.8, 152.75, 500.95); 
  translate(250, 250); 
  //fill(255,255,255); 
  //ellipse(0,0,200,200); 
  //fill(255,255,255); 

translate(0, 0); 


noStroke(); 
  ellipse(0,0, 20, 20); 
  for (int i=0; i<=360; i+=30) 
  { 
pushMatrix(); 
 rotate ( radians(i) ); 
 translate(0, 150); 
 fill(0); 

 noStroke(); 
 ellipse(0, 0, 15, 15); 
 popMatrix(); 


  } 


    


noFill(); 
stroke(162, 203, 180, 100); 
strokeWeight(7); 
ellipse(0, 0, 330, 330); 
fill(308.8, 152.75, 500.95); 
stroke(162, 203, 180,100); 
ellipse(0, 0, 280, 280); 

  for ( int i=0; i<360; i+=6) 
{
    pushMatrix(); 
    rotate (radians (6*second()-90)); 
    strokeWeight(2); 
    strokeCap(SQUARE); 
    stroke(484.1, 589.85, 472.35); 
    line(0, 0, 100, 0); 
    popMatrix(); 
    pushMatrix(); 
    rotate (radians (6*minute()-90)); 
    strokeWeight(5); 
    strokeCap(SQUARE); 
    stroke(150, 100, 60); 
    line(0, 0, 150, 0); 
    popMatrix(); 


       


    pushMatrix(); 
    rotate (radians (30*(hour()+minute()/60.0)-90)); 
    strokeWeight(2); 
    strokeCap(SQUARE); 
    stroke(0); 
    line(0, 0, 70, 0); 
    popMatrix();  


  } 
}

    

