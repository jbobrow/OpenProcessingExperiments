
//Homework #2 :: 51-257 Sec A :: Michael Loffredo :: mlloffre 
//copyright michael loffredo 2012 

/////////////////////////////////////////////////////////////

//Setup
    size (400, 400); 
    background (180, 40, 40);
    smooth (); 

//Parameters 
    float x, y, d; 
      x = 200;
      y = 200;
      d = 300; 

//Bounding Circle 

  //most outer circle 
    noStroke (); 
    fill (242, 221, 164); 
    ellipse (x, y, d*.85, d*.85); 

  //red outline circle
    noStroke (); 
    fill (180, 40, 40);
    ellipse (x, y, d*.80, d*.80);

  //most inner circle 
    fill (242, 221, 164); 
    strokeWeight (.025*d);
    stroke (242, 221, 164);
    ellipse (x, y, d*.75, d*.75); 

  //mini-circles 
    fill (180, 40, 40); 
    noStroke (); 
    ellipse (x + .33*d, y, d*.05, d*.05); 
  
    fill (180, 40, 40); 
    noStroke (); 
    ellipse (x - .33*d, y, d*.05, d*.05); 


/////////////////////////////////////////////////////////////


//First Initial :: M

//First Bar
    fill (242, 221, 164);
    strokeWeight (.0375*d);
    stroke (48, 198, 179);
    beginShape ();
       vertex (x - .23*d, y + .12*d);
       vertex (x - .23*d, y - .215*d); 
    endShape ();

//Serifs
    triangle (x - .13*d, y + .14*d, x - .14*d, y + .19*d, x - .12*d, y + .19*d); 
    triangle (x - .03*d, y + .14*d, x - .04*d, y + .19*d, x - .02*d, y + .19*d);

    beginShape ();
      strokeWeight (.0375*d);
      curveVertex (x - .23*d, y - .35*d);
      curveVertex (x - .23*d, y + .13*d);
      curveVertex (x - .26*d, y + .16*d);
      curveVertex (x - .29*d, y - .14*d);
    endShape (); 

//Second Bar
    beginShape (); 
      vertex (x - .13*d, y + .16*d);
      vertex (x - .13*d, y - .16*d);
    endShape (); 

//Curves
    beginShape ();
      curveVertex (x - .23*d, d - 2); 
      curveVertex (x - .23*d, y - .10*d);
      curveVertex (x - .17*d, y - .20*d); 
      curveVertex (x - .13*d, y - .10*d); 
      curveVertex (x - .16*d, d - 2);
    endShape ();  

line (x - .23*d, y - .215*d, x - .29*d, y - .175*d); 

    beginShape ();
      curveVertex (x - .13*d, d - 2); 
      curveVertex (x - .13*d, y - .10*d);
      curveVertex (x - .07*d, y - .20*d); 
      curveVertex (x - .03*d, y - .10*d);
      curveVertex (x - .08*d, d - 2);
    endShape (); 

//Third Bar
    beginShape (); 
      vertex (x - .03*d, y + .16*d); 
      vertex (x - .03*d, y - .09*d); 
    endShape (); 




///////////////////////////////////////////////////////////// 


//Second Initial :: L 
    strokeWeight (.0375*d); 
    stroke (48, 198, 179);
    beginShape (); 
      vertex (x + .1*d, y + .13*d); 
      vertex (x + .1*d, y - .19*d);
    endShape (); 

//Serifs
triangle (x + .1*d, y + .14*d, x + .09*d, y + .19*d, x + .11*d, y + .19*d);
line (x + .1*d, y - .19*d, x + .04*d, y - .15*d); 


/////////////////////////////////////////////////////////////


//Third Initial :: L 
    strokeWeight (.0375*d); 
    stroke (48, 198, 179); 
    beginShape (); 
      vertex (x + .25*d, y + .13*d); 
      vertex (x + .25*d, y - .19*d); 
    endShape (); 
    
//Serifs
    line (x + .25*d, y - .19*d, x + .19*d, y - .15*d); 
    beginShape ();
      strokeWeight (.0375*d);
      curveVertex (x + .25*d, y - .35*d);
      curveVertex (x + .25*d, y + .13*d);
      curveVertex (x + .28*d, y + .16*d);
      curveVertex (x + .31*d, y - .14*d);
     endShape ();  
     

/////////////////////////////////////////////////////////////
                                
