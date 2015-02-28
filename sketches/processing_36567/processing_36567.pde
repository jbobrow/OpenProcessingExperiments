
//size (1280,720); // 16:9 = 1.77777778
size (400,400); // set up window size
background (0);  // define background color
smooth(); // define the render to be smooth (anti-alias)


  
fill(255,0,0,50); // fill the shape with a color
strokeWeight(4); // change the stroke size
noStroke(); // stroke color

ellipse(width/2+20, height/2,   100,100);
ellipse(width/2,    height/2+20,100,100);   
ellipse(width/2-20, height/2,   100,100);   
ellipse(width/2,    height/2-20,100,100);



ellipse(width/2+20, height/2,   200,200);
ellipse(width/2,    height/2+20,200,200);   
ellipse(width/2-20, height/2,   200,200);   
ellipse(width/2,    height/2-20,200,200);



