
size(600,600);
background(#0066CC);

noStroke();
fill(#FFFF66); //yellow
  
rect(155,200,240,250,400,200,100,100); //body


fill(#FE0000); //red
rect(195,230,50,120,50,70,40,50);
rect(290,230,50,120,50,70,40,50);
rect(185,300,180,140,20,20,40,50); //top
rect(150,325,250,140,200,220,400,200); //bottom


fill(#FFFF66); //yellow
ellipse(210, 315, 20, 20);
ellipse(305, 315, 20, 20);




fill(#FFE9D6);
ellipse(250, 180, 400, 180);//Head
fill(#000000);
arc(220, 240, 75, 20, -1, PI+QUARTER_PI, OPEN);//mouth

fill(#FFD496);
beginShape(TRIANGLES);
vertex(220, 215);
vertex(220, 190);
vertex(190, 205);
endShape();




color c = color(255, 204, 0);
fill(#F8FFF0 ); 
ellipse(135, 180, 80, 80);// lefteye
ellipse(300, 180, 80, 80); // righteye

fill(#000000); 
ellipse(135, 180, 10, 10);// Left Pupil
ellipse(300, 180, 10, 10); // Right Pupil

fill(#66FFFF); //light blue
rect(165,490,80,90,110,10,40,40);
rect(295,490,80,90,110,10,40,40);


fill(#FE0000); //red
rect(165,430,80,90,400,200,10,10); //right leg
rect(295,430,80,90,400,200,10,10); //left leg



fill(#FFFF66); //yellow
rotate(PI/-3);
rect(-75,440,50,150,400,200,100,100); // left arm
rotate(PI/-4);
rect(-345,-40,50,150,410,200,100,100); // right arm
fill(#FFE9D6); //Peach
ellipse(60, 320, 70, 80);

translate(width/89, height/2);
rotate(PI/2.6);
fill(#FFE9D6); //Peach
ellipse(-405,195, 70, 80); //right hand
ellipse(-100,440,70, 80); //left hand






