


 float[] xx = new float[0];
 float[] yy = new float[0];
 
 
 void mousePressed ()        // empty the arrays
 {
     xx = new float[0];
     yy = new float[0];
 }
 
 void mouseDragged ()        // add current mouse x,y values
 {
     xx = append(xx, pmouseX);   
     yy = append(yy, pmouseY);  
 }

void setup() {
  size (600,600);
  smooth();
  frameRate (32);

}
void draw () {
  background(230);
  
  stroke(0);
     for ( int i = 1; i < xx.length; i++ )
     {
         line( xx[i-1], yy[i-1], xx[i], yy[i] );   
     }

if ( !mousePressed )
{
//arm 1
    PShape al;
    al = loadShape( "al.svg" ); 
    shape(al, -85, 130);
//arm 2
    PShape ar;
    ar = loadShape( "ar.svg" ); 
    shape(ar, 215, 130);
}

//feet left

  PShape feetl;
  feetl = loadShape( "feetl.svg" ); 
  shape(feetl, 80, 355);

//feet right

  PShape feetr;
  feetr = loadShape( "feetr.svg" ); 
  shape(feetr, 218, 355);



// head_top / part_left

  fill(0);
  ellipse(250,200,100,140);

// head_top / part_right

  fill(0);
  ellipse(350,200,100,140);

//head_top / mid

  fill(0);
  rect(240,130.4,120,150);

//head_top/ down

  fill(0);
  rect(200,200,200,200);

//ear left

  fill(0);
  ellipse(230,120,40,55);

//ear right
  fill(0);
  ellipse(370,120,40,55);

//mund mid
  noStroke ();
  fill(255);
  rect(248,255,100,50);

// mouth left
  noStroke ();
  fill(255);
  ellipse(250,280,40,50);

// mouth right
  noStroke ();
  fill(255);
  ellipse(350,280,40,50);

// mouth in mid
  noStroke ();
  fill(05);
  rect(259,265,80,31);

// mouth in left
  noStroke ();
  fill(0);
  ellipse(260,280,20,30);

// mouth in right
  noStroke ();
  fill(0);
  ellipse(340,280,20,30);

// tooth 1

  noStroke ();
  fill (255);
  ellipse(267,288,25,18);

// tooth 2

  noStroke ();
  fill (255);
  ellipse(333,288,25,18);

// leg left

  noStroke ();
  fill (0);
  rect(200,380,75,80);

// leg right

  noStroke ();
  fill (0);
  rect(326,380,75,80);

// eyes 

  pushMatrix();
  fill(255);  
  ellipse ( 300, 200, 60, 60);
  popMatrix();

// drawing

if ( mousePressed ) 

{
    
    //look angry
    
    fill( 0 );
    rect(265,140,70,40);
    rect(265,220,70,20);
    
    stroke( 0 );
    strokeWeight( 5 );
    line(pmouseX,pmouseY,mouseX,mouseY);
    noStroke();
    
    PShape alup;
    alup = loadShape( "alup.svg" ); 
    shape(alup, -85, 0);
  
    PShape arup;
    arup = loadShape( "arup.svg" ); 
    shape(arup, 215,0);
    
    //rect (20,30,90,90);

}
  else 
  {
  }

  // follow mouse


  fill (0);
  ellipse (map(mouseX,0,width,286,311), map(mouseY,0,height,184,219), 18,18);
}


 









