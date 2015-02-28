
size (100,100);
background(255,255,255);

//orange triangle body
stroke(214,81,4);
strokeWeight(2);
fill(255,148,13);
triangle (35,70,50,5,65,70);

//carrot pants
stroke(9,102,0);
strokeWeight(2);
fill(102,212,0);
quad(35, 70, 30, 80, 50, 80, 50, 70);
quad(50, 70, 65, 70, 70, 80, 50, 80);

//face
stroke(1);
noFill();
ellipse(44,52,2,2); //eyel
ellipse(56,52,2,2); //eyer
arc(50,63,5,5, 0, PI); //smile

//legs+feet
//stroke(0,0,0);
//line(40,50,);
//line();

//arms
