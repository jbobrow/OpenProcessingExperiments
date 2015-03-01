
size (400,200);
background(7,73,110);

//Character1
  noStroke();
  
  fill(255,255,0);
  ellipse(100,80,160,160);
  
  
  fill(255,255,255);
  ellipse(100,500,50,50);
  
  fill(0,0,0);
  rect(20,50,150,50);
  
  //eyes
  fill(255,255,255);
  stroke(0,0,0);
  strokeWeight(10);
  ellipse(80,80,80,80);
  ellipse(160,80,80,80);
  
  //pupils
  ellipse(80,80,30,30);
  ellipse(160,80,30,30);
  
  //mouth
  fill(255,0,0);
  ellipse(120,130,30,30);
  


//graph


  //linear   
  stroke(255,0,0);
  strokeWeight(2);
  line(300,100,380,20);
  
  
  //x,y axis 

  stroke(1);
  strokeWeight(4);
  strokeJoin(ROUND);
  strokeCap(ROUND);
  line(300,20,300,100);
  line(300,100,380,100);


  
  //bg color   
  fill(255,255,255,80);
  noStroke();
  rect(290,10,100,100,4);

