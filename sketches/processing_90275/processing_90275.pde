
color[] rainbow = {#25303D, #4D6078, #6A819E, #7B96B8, #8BA5C4};
size(600,300);
background(rainbow[0]);
smooth();

strokeWeight(25);
stroke(rainbow[3]);
strokeCap(ROUND);
line(200, height*.20,550,height*.20);

stroke(rainbow[4]);
strokeCap(SQUARE);
line(200, height/2,550,height/2);

stroke(rainbow[1]);
strokeCap(PROJECT);
line(50, height*.80,550,height*.80);

stroke(rainbow[2]);
noFill();
strokeJoin(ROUND);
rect(50, 50, 100, 100);
