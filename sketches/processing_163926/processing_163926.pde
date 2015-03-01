
void setup(){
    //dimensions of the composition
  size(500,500);
  //color of the background in RGB
  background(255);
}

void draw(){




smooth();


  if (key == 'q' || key == 'Q'){
  similarity();
  }
  else if (key == 'w' || key == 'W'){
    closure();
  }
  else if (key == 'e' || key == 'E'){
    proximity();
  }
}

void similarity(){
  background(255);
    //identifies the stroke as white
  noStroke();
  //identifies the fill as white
  fill(215,255,254);
  //series of smaller circles lower on Y axis and closer on X axis
  ellipse(200,200,50,50);
  ellipse(100,210,50,50);
  ellipse(50,250,50,50);
  ellipse(320,360,50,50);
  
  //identifies the fill in RGB
  fill(215,255,236);
  //series of larger circles higher on Y axis and farther on X axis
  ellipse(400,30,80,80);
  ellipse(450,60,80,80);
  ellipse(340,70,80,80);
  ellipse(500,200,80,80);
  ellipse(290,100,80,80);
  ellipse(160,20,80,80);
  

//the end cap of void draw
}

void closure(){
  background(255);
   //gets rid of the stoke
  noStroke();
  // horizonal row of squares highest on Y axis
  rect(110,110,10,10);
  rect(130,110,10,10);
  rect(150,110,10,10);
  rect(170,110,10,10);
  rect(190,110,10,10);
  rect(210,110,10,10);
  rect(230,110,10,10);
  rect(250,110,10,10);
  rect(270,110,10,10);
  rect(290,110,10,10);
  
  
  //vertical row of squares closest on X axis
  rect(110,130,10,10);
  rect(110,150,10,10);
  rect(110,170,10,10);
  rect(110,190,10,10);
  rect(110,210,10,10);
  rect(110,230,10,10);
  rect(110,250,10,10);
  rect(110,270,10,10);
  rect(110,290,10,10);
  
  //horizontal row of squares lowest on Y axis
  rect(130,290,10,10);
  rect(150,290,10,10);
  rect(170,290,10,10);
  rect(190,290,10,10);
  rect(210,290,10,10);
  rect(230,290,10,10);
  rect(250,290,10,10);
  rect(270,290,10,10);
  rect(290,290,10,10);
  
  //vertical row of squares farthest on X axis
  rect(290,130,10,10);
  rect(290,150,10,10);
  rect(290,170,10,10);
  rect(290,190,10,10);
  rect(290,210,10,10);
  rect(290,230,10,10);
  rect(290,250,10,10);
  rect(290,270,10,10);
  rect(290,290,10,10);
  
  
//the end cap of void draw
}

void proximity(){
  background(255);
    //gets rid of the stoke
  noStroke();
  fill(215,255,254);
  //first horizontal row of squares
  rect(50, 50, 20, 20);
  rect(90, 50, 20, 20);
  rect(130, 50, 20, 20);
  rect(170, 50, 20, 20);

  //first horizontal row of squares
  rect(50, 110, 20, 20);
  rect(90, 110, 20, 20);
  rect(130, 110, 20, 20);
  rect(170, 110, 20, 20);

  //first horizontal row of squares
  rect(50, 170, 20, 20);
  rect(90, 170, 20, 20);
  rect(130, 170, 20, 20);
  rect(170, 170, 20, 20);

  //first horizontal row of squares
  rect(50, 230, 20, 20);
  rect(90, 230, 20, 20);
  rect(130, 230, 20, 20);
  rect(170, 230, 20, 20);

//shows feedback  in the que
print();

//the end cap of void draw
}

