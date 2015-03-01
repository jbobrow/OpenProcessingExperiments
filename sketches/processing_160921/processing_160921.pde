
 size(600,600);
  background(#FAF0C7);
  smooth();
  

noStroke();
fill(#AEE5CA);
triangle(0,200,0,700,650,-80);

stroke(0);  
strokeWeight(2); 
fill(#EA4E00,200);
triangle(280,-60,460,610,750,450);


noStroke();
fill(#46185F,220);
triangle(105,50,565,410,440,455);
triangle(440,455,285,512,505,533);


stroke(#2E1409); 
strokeWeight(16);
fill(#F25F25);
ellipse(365,405,117,117);
noStroke();
fill(255);
ellipse(365,405,87,87);

ellipse(502,332,27,27);
fill(#5F7C16,130);
ellipse(530,70,100,100);
fill(#FFB2B3,120);
ellipse(68,470,400,400);


fill(#143C8B);
triangle(150,480,72,511,95,398);
fill(#385822);
triangle(128,492,175,476,166,590);


stroke(0);
strokeWeight(2);
line(266,0,426,600);
strokeWeight(4);
line(600,150,100,0);


stroke(#90110D);
strokeWeight(8);
line(600,335,0,533);
strokeWeight(3);
line(380,432,104,524);
line(369,457,108,566);
line(334,503,220,599);




stroke(#091343);
for (int y =120; y<=300; y+=40) {
  for (int x =45; x<=230; x+=40) {
  fill(#091343);
rect(x,y,20,20);
  }
}
for (int y =140; y<=290; y+=40) {
  for (int x =65; x<=210; x+=40) {
  fill(#091343);
rect(x,y,20,20);
  }
}

rect(145,320,20,20);
rect(185,340,20,20);
rect(297,263,20,20);

noStroke();
fill(#F2A811);
ellipse(405,345,70,70);

