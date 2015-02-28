
size(400, 400);
smooth();
background(0);

strokeWeight(10);
stroke(230);
line(width/1.2, height, width/2.1, height/2);

strokeWeight(4);
stroke(#00FF66);
fill(40);
ellipse(width-width, height-3, width/1.7, height/1.7); //bottom left
stroke(#00FFCC);
fill(90);
ellipse(width/3, height/1.5, width/2, height/2);//second bottom
stroke(#5DFC0A);
fill(30);
ellipse(width/6, height/3, width/1.5, height/1.5);//big left
stroke(#00FF66);
fill(10);
ellipse(width/2, height/2, width/6, height/6);//little left

stroke(#01C5BB);
fill(40);
ellipse(width/1.2, height/10, width/3, height/3);//big right
stroke(#00FFCC);
fill(10);
ellipse(width/1.2, height/4, width/8, height/8);//littlest
stroke(#5DFC0A);
fill(80);
ellipse(width/1.1, height/3.5, width/5, height/5);//top right
stroke(#00FF66);
fill(30);
ellipse(width/1.5, height-height/1.05, width/7, height/7);//small top

strokeWeight(10);
stroke(220);
line(width/1.4, height, width-width, height-height);


