
size(300,300);//width és 300 i height és 200
background(27,158,222);
//SORRA
stroke(222,128,27);
fill(222,128,27);
rectMode(CORNERS);
rect(0,250,width,height);

//COS
rectMode(CENTER);
stroke(255,255,0);
fill(255,255,0);
rect(width/2,height/2,98,150);


//ULLS I NAS
stroke(0);
fill(255);
ellipseMode(CENTER);
ellipse(width/2-15,height/2-35,25,25);
ellipse(width/2+15,height/2-35,25,25);

stroke(0);
fill(0,0,200);
ellipseMode(CENTER);
ellipse(width/2-12,height/2-30,10,15);
ellipse(width/2+12,height/2-30,10,15);
stroke(0);
fill(0,0,0,100);
ellipseMode(CENTER);
ellipse(width/2-12,height/2-28,5,5);
ellipse(width/2+12,height/2-28,5,5);

stroke(0);
fill(255,0,0,100);
ellipse(width/2,height/2-15,10,15);

//BRAÇOS I CAMES
stroke(255,255,0);
fill(255,255,0);
beginShape();
vertex(width/2-40,height/2-15);
vertex(width/2-40,height/2-25);
vertex(45, 50);
vertex(30, 50);
endShape(CLOSE);
beginShape();
vertex(width/2+40,height/2-15);
vertex(width/2+40,height/2-25);
vertex(255, 50);
vertex(270, 50);
endShape(CLOSE);
beginShape();
vertex(width/2-30,height/2+40);
vertex(width/2-25,height/2+40);
vertex(width/2-30, 280);
vertex(width/2-45, 280);
endShape(CLOSE);
beginShape();
vertex(width/2+30,height/2+40);
vertex(width/2+25,height/2+40);
vertex(width/2+30, 280);
vertex(width/2+45, 280);
endShape(CLOSE);

//PANTAKAS
stroke(0);
fill(198,109,20);
rectMode(CENTER);
rect(width/2,height/2+75,100,40);

//CAMISA
stroke(0);
fill(255);
rectMode(CENTER);
rect(width/2,height/2+60,100,15);

//BOCA
noFill();
stroke(0); 
curve(0, 140, 140, 160, 160, 160,300,140); 

//CORBATA
stroke(255,0,0,150);
fill(255,0,0);
beginShape(TRIANGLE_STRIP);
vertex(width/2-10,height/2+52.5);
vertex(width/2+10,height/2+52.5);
vertex(width/2-6,height/2+67.5);
vertex(width/2+6,height/2+67.5);
endShape( );

//peus
stroke(100);
fill(0);
ellipseMode(CENTER);
ellipse(width/2-50,height/2+130,50,25);
ellipse(width/2+50,height/2+130,50,25);
stroke(222,128,27);
fill(222,128,27);
rectMode(CORNERS);
rect(0,285,width,height);





