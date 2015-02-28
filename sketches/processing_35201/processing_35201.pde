
size (720,480);
smooth();
strokeWeight (2);
background (219,159,174);
ellipseMode (RADIUS);

//Neck
stroke(102);             //set stroke to gray
line (266,257,266,162);  //left
line (276,257,276,162);  //middle
line (286,257,286,162);  //right

//Antennae
line (276,155,246,112);  //Small
line (276,155,306,56);   //Tall
line (276,155,342,170);  //Medium

//Body
noStroke ();             //Disable stroke
fill (102);              //Set fill to gray
ellipse (264,377,33,33); //Antigravity orb
fill (0);                //Set fill to black
rect (219,257,90,120);   //Main body
fill(102);               //Set fill to gray
rect (219,274,90,6);     //Gray stripe


//Head
fill(0);                 //Set fill to black
ellipse (276,155,45,45); //Head
fill(255);               //Set fill to white
ellipse (288,150,14,14); //Large eye
fill(0);                 //Set fill to black
ellipse (288,150,3,3);   //Pupil
fill (153);              //Set fill to light gray
ellipse (263,148,5,5);   //small eye 1
ellipse (296,130,4,4);   //small ete 2
ellipse (305,162,3,3);   //samll eye 3

strokeWeight(0);
ellipse (273,110,98,34);
fill(224,68,107);
ellipse (274,95,34,24);
fill(153);
rect (246,179,23,9);
rect (279,179,23,9);          
