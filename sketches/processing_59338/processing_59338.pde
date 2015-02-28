

size(220,500);
background(255);

smooth();
strokeWeight(5);
stroke(#40D3BE);
line(0,height*.35,width,height*.35);
line(0,height*.55,width,height*.55);
line(0,height*.35,width,height*.55);
line(width,height*.35,0,height*.55);
line(0,0,width,height*.35);
line(0,height*.55,width,height);
line(width*.09,0,width,height*.32);
line(width*.09,0,width,0);
line(width,0,width,height*.32);

strokeJoin(ROUND);
triangle(width*.04,height*.62,width*.04,height*.98,width*.85,height*.98);




