

size(400,400);
background(34,133,152); 
translate(200,200);
rectMode(CENTER);

rotate(PI/6);

for (int i=0;i<6;i++){
  fill(255);
  ellipse(20,20,8,8);
  ellipse(100,0,180,10);
  ellipse(170,20,12,12);
  rect(100,15,10,10);
  scale(1,-1);
  fill(255,0,0);
  ellipse(60,60,10,10);
  rect(100,15,10,10);
  scale(1,-1);
  line(50,20,130,60);
  line(120,50,140,90);
  line(140,90,140,10);
  rotate(PI/3);
  
}  }
}
