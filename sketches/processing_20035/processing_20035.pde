
 

void setup() {
size (700,600);
background(0);
smooth();
}

void draw() {
  


//bezier feather wing 2
for(int i=350; i<540;i=i+10){
for(int j=130; j>90;j=j-5){  
 stroke(145,25,0,0); 
 fill(0);
  strokeWeight(random(.8,2.1));
rect(0,0,700,600);
    }
  }

for(int i=350; i<540;i=i+10){
for(int j=130; j>90;j=j-5){  
 stroke(145,25,0,0); 
 fill(245,105,0,170);
  strokeWeight(random(.8,2.1));
bezier(random(i+i*.1,i+i*.3), random(j+110.8,j+60),
random(i+i*.1,i),random(j,j+110.8),random(i+i*.1,i),random(j,j+110.8),i,j);
    }
  }  
  
for(int i=280; i<560;i=i+10){
for(int j=130; j>90;j=j-5){ 
 stroke(245,105,0,200);  
 fill(245,155,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i+i*.1,i+i*.3), random(j+100.8,j+60),
random(i+i*.1,i),random(j,j+100.8),random(i+i*.1,i),random(j,j+100.8),i,j);
    }
  }  
  
for(int i=300; i<590;i=i+10){
for(int j=130; j>90;j=j-5){ 
 stroke(245,155,0,200);   
 fill(255,245,100,100);
  strokeWeight(random(.8,2.1));
bezier(random(i+i*.1,i+i*.3), random(j+90.8,j+60),
random(i+i*.1,i),random(j,j+90.8),random(i+i*.1,i),random(j,j+90.8),i,j);
    }
  }  
  
for(int i=320; i<600;i=i+10){
for(int j=130; j>90;j=j-5){
 stroke(255,245,100,100);   
 fill(255,255,250,80);
  strokeWeight(random(.8,2.1));
bezier(random(i+i*.1,i+i*.3), random(j+70.8,j+50),
random(i+i*.1,i),random(j,j+70.8),random(i+i*.1,i),random(j,j+70.8),i,j);
    }
  } 
 color c0 = color(0,0,0);
  color c1 = color(255,255,250);
   
  size(700,600);
   
  noStroke();
   
  int numSteps = width;
   
  for(int i = 0 ; i < numSteps; i++)
  {
    float a = i / (numSteps - 1.0);
     
    colorMode(RGB);
    fill(lerpColor(c0,c1,a));
    ellipse(i+650,i+650,700,700);
}  
  
fill(245,155,0);
stroke(245,155,0);
triangle(420,260,427,310,408,290); 
ellipse(410,280,15,15);
ellipse(409,275,15,15);
stroke(255,245,100);
strokeWeight(2.5);
line(427,313,426,308);
bezier(406,287,408,292,410,295,415,297);
strokeWeight(1);
line(427,313,427,315);
fill(145,25,0);
stroke(145,25,0);
triangle(420,287,423,293,418,289);
triangle(426,300,427,310,415,297); 
strokeWeight(2);
noFill();
bezier(420,266,420,260,425,255,429,260);
bezier(420,266,420,250,425,245,429,250);
bezier(420,266,410,255,415,250,419,255);
line(420,264,423,280);
line(420,264,420,280);
line(420,264,417,274);




 //bezier feather first joint
for(int i=280; i<320;i=i+5){
for(int j=220; j>110;j=j-5){ 
 stroke(145,25,0,0);  
 fill(245,105,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i-90,i-80), random(j*.9,j*1.3),
random(i-90,i),random(j,j*1.3),random(i-90,i),random(j,j*1.3),i,j);
    }
  }  
  
for(int i=280; i<320;i=i+5){
for(int j=220; j>110;j=j-5){ 
 stroke(245,105,0,200);  
 fill(245,155,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i-75,i-60), random(j*.9,j*1.3),
random(i-75,i),random(j,j*1.3),random(i-75,i),random(j,j*1.3),i,j);
    }
  }  
  
 for(int i=280; i<320;i=i+5){
for(int j=230; j>110;j=j-5){  
 stroke(245,155,0,200);   
 fill(245,235,90,100);
  strokeWeight(random(.8,2.1));
bezier(random(i-65,i-50), random(j*.9,j*1.3),
random(i-65,i),random(j,j*1.3),random(i-65,i),random(j,j*1.3),i,j);
    }
  }  
  
for(int i=280; i<320;i=i+5){
for(int j=220; j>110;j=j-5){ 
 stroke(255,245,100,100);   
 fill(255,255,250,70);
  strokeWeight(random(.8,2.1));
bezier(random(i-55,i-40), random(j*.9,j*1.3),
random(i-55,i),random(j,j*1.3),random(i-55,i),random(j,j*1.3),i,j);
    }
  }  
 
   
  
stroke(0,250); 
strokeWeight(33);
line(309,230,309,190);
line(314,190,317,150);  
stroke(255,255,250,250); 
strokeWeight(10);
line(290,220,294,190);
line(294,190,302,150);
line(302,150,305,140);
line(305,140,310,130);
line(310,130,315,120);
line(305,130,310,120);


 
 //bezier feather 
  for(int i=280; i>30;i=i-10){
for(int j=110; j>70;j=j-10){ 
 stroke(145,25,0,0); 
 fill(245,105,0,170);
  strokeWeight(random(.8,2.1));
bezier(random(i-i*1.1,i-i*.2), random(j+90.8,j+70),
random(i-i*.4,i),random(j,j+70.8),random(i-i*.4,i),random(j,j+80.8),i,j);
    }
  }  
  
for(int i=280; i>30;i=i-10){
for(int j=110; j>70;j=j-10){ 
 stroke(245,105,0,200);  
 fill(245,155,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i-i*1.1,i-i*.2), random(j+80,j+50.4),
random(i-i*.1,i),random(j,j+80),random(i-i*.1,i),random(j,j+80),i,j);
    }
  }  
  
for(int i=280; i>30;i=i-10){
for(int j=110; j>70;j=j-10){ 
 stroke(245,155,0,200);   
 fill(255,245,100,100);
  strokeWeight(random(.8,2.1));
bezier(random(i-i*1.1,i-i*.1), random(j+70.8,j+40),
random(i-i*.1,i),random(j,j+70.8),random(i-i*.1,i),random(j,j+70.8),i,j);
    }
  }  
  
 for(int i=320; i>30;i=i-10){
for(int j=110; j>70;j=j-10){ 
 stroke(245,235,9,100);   
 fill(255,255,250,80);
  strokeWeight(random(.8,2.1));
bezier(random(i-i*1.1,i-i*.1), random(j+50.8,j+30),
random(i-i*.1,i),random(j,j+40.8),random(i-i*.1,i),random(j,j+40.8),i,j);
    }
  } 
   
   
   
  stroke(0);
  strokeWeight(25);
  line(345,125,240,80);
  line(240,80,220,77);
  line(220,77,210,77);
  line(210,77,190,84);
  line(190,84,110,110);
  line(110,110,0,150);
  line(0,125,150,80);
  line(0,98,140,75);
  line(340,100,240,60);
  line(330,130,500,100);
  line(370,140,320,200);
  line(320,150,500,120);
  line(500,120,700,150);
  line(340,170,350,140);
  line(520,125,700,150);
  line(540,128,700,157);
  line(600,140,700,165);
  strokeWeight(30);
  line(360,120,330,70);
  line(500,95,700,125);
  line(500,80,300,105);
 
  stroke(255,255,250);
  strokeWeight(10);
  line(314,122,240,90);
  line(240,90,220,87);
  line(220,87,210,87);
  line(210,87,190,94);
  line(190,94,110,130);
  line(321,240,374,160);
  line(374,160,480,140);
  line(480,140,526,142);
  line(320,230,374,160);
  
  line(288,244,320,230);
  line(325,230,300,270);
  
  
   line(298,240,294,200);
  line(294,200,290,242);
   
   color orange=color(245,155,0);
   color white=color(255,255,250);
   
   
   fill(245,155,0);
   stroke(245,155,0);
beginShape();//chest
vertex(360,250);
bezierVertex(360,270,360,285,286,315);
endShape();
fill(145,25,0);
   stroke(145,25,0);
beginShape();//back
vertex(315,232);
bezierVertex(260,310,260,310,280,370);
endShape();
fill(245,155,0,200);
   stroke(245,155,0);
   strokeWeight(12);
 beginShape();
 vertex(350,230);//neck
 bezierVertex(380,240,380,240,410,280);
endShape();
noFill();
 beginShape();//neck
 vertex(350,250);
 bezierVertex(380,245,380,245,410,285);
endShape();
fill(255,255,250);
ellipse(340,250,40,40);
ellipse(305,290,25,25);
ellipse(315,270,25,25);



  strokeWeight(10);
   stroke(145,25,0);
  line(278,350,272,340);
  line(278,350,277,330);
  strokeWeight(5);
  line(276,350,289,372);
  
  
  
//BODY test
for(int i=320; i<370;i=i+10){
for(int j=270; j>220;j=j-10){ 
 stroke(145,25,0);  
 fill(245,105,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i-60,i-40), random(j*1.2,j*1.5),
random(i-60,i-40),random(j*1.2,j*1.3),random(i-80,i-60),random(j*1.4,j*1.3),275,340);
    }
  }  
 
for(int i=320; i<370;i=i+10){
for(int j=270; j>220;j=j-10){
 stroke(245,105,0,200);  
 fill(245,155,0,200);
  strokeWeight(random(.8,2.1));
bezier(random(i-55,i-40), random(j*1.1,j*1.3),
random(i-50,i-40),random(j,j*1.2),random(i-50,i-40),random(j,j*1.1),i,j);
    }
  }  
  
for(int i=310; i<370;i=i+10){
for(int j=270; j>220;j=j-10){ 
 stroke(245,155,0,200);   
 fill(245,235,90,100);
  strokeWeight(random(.8,2.1));
bezier(random(i-45,i-30), random(j*1.1,j*1.3),
random(i-45,i-30),random(j,j*1.2),random(i-45,i-30),random(j,j*1.1),i,j);
    }
  }  
 
for(int i=310; i<370;i=i+10){
for(int j=270; j>227;j=j-10){ 
 stroke(255,245,100,200);   
 fill(255,255,250,150);
  strokeWeight(random(.8,2.1));
bezier(random(i-25,i-20), random(j*1.1,j*.8),
random(i-15,i),random(j,j*.8),random(i-15,i),j,i,j);
    }
  } 

stroke(0);
strokeWeight(20);
line(315,330,300,350);
line(310,340,340,310);
line(300,350,270,380);
line(300,350,300,380);
line(310,350,310,380);
line(320,330,320,360);
/*
fill(0);
triangle(340,310,280,380,350,350);  
 */ 
  //tail  
noFill();
   for (int i=50; i<100; i=i+5){
    for(int j=100; j<110; j =j+5){
     stroke(145,25,0);
   strokeWeight(random(5.8,8.2));  
   // c1=325;
   // c2=j+400;
    //c3=385;
    //c4=j+450;
    beginShape();
    vertex(275,340);
    bezierVertex( 325,j+400,385,j+450,random(j*.8,j*.3),random(10*i,11*i));
   endShape();
    }
  }
  for (int i=50; i<110; i =i+5){
    for(int j=100; j<110; j =j+5){
     stroke(245,105,0,200);
   strokeWeight(random(5.8,9.2));  
   // c1=320;
    //c2=j+400;
    //c3=380;
    //c4=j+450;
    beginShape();
    vertex(280,350);
    bezierVertex( 320,j+400,380,j+450,random(j,j*.8),random(10*i,11*i));
   endShape();
    }
  }
  
   for (int i=50; i<100; i =i+5){
    for(int j=100; j<110; j =j+5){
     stroke(245,155,0,200);
   strokeWeight(random(.8,5.2));  
    //c1=330;
    //c2=j+400;
    //c3=340;
    //c4=j+450;
    beginShape();
    vertex(285,350);
    bezierVertex( 330,j+400,340,j+450,random(j*.5,j),random(10*i,11*i));
   endShape();
    }
  }
   for (int i=50; i<100; i =i+5){
    for(int j=100; j<110; j =j+5){
     stroke(255,245,100,150);
   strokeWeight(random(.8,4.2));  
   // c1=330;
    //c2=j+400;
    //c3=337;
    //c4=j+450;
    beginShape();
    vertex(282,350);
    bezierVertex( 330,j+400,337,j+450,random(j*.8,j*.3),random(10*i,11*i));
   endShape();
    }
  }
  
    for (int i=50; i<100; i =i+5){
    for(int j=100; j<110; j =j+5){
     stroke(255,255,250,200);
   strokeWeight(random(.8,2.2));  
    //c1=340;
    //c2=j+400;
    //c3=337;
    //c4=j+450;
    beginShape();
    vertex(288,360);
    bezierVertex( 340,j+400,337,j+450,random(j*.8,j*.3),random(10*i,11*i));
   endShape();
    }
  }
  
  
  //small sparkling dots
fill(245,145,0, 200);
noStroke();
for(int c=300; c<=width; c+=10) {
  ellipse (random(c), random(c),random(1,3), random(1,4));
}
//small sparkling dots
fill(145,25,0, 200);
noStroke();
for(int c=300; c<=700; c+=10) {
  ellipse (random(c), random(c), random(2,3), random(2,5));
}

//small sparkling dots
fill(255,245,100, 150);
noStroke();
for(int c=300; c<=700; c+=10) {
  rect (random(c), random(c), random(2,3), random(2,5));
}
  
}

