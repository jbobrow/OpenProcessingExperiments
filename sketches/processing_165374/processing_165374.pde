
//Ana Molés Barrero

void setup(){
  size(800,800);
  smooth();
  noCursor(); 
  
}

void draw(){
  
background(240,198,216);
stroke(0);

 //cames i peus
  noFill();
  strokeWeight(6);
  line(mouseX-70,mouseY+150,mouseX-70,mouseY+280);
  line(mouseX+70,mouseY+150,mouseX+70,mouseY+280);
  line(mouseX+70,mouseY+280,mouseX+90,mouseY+280);
  line(mouseX-70,mouseY+280,mouseX-90,mouseY+280);
  
//cos mora
  
 
  fill(172,19,81);
  strokeWeight(1);

  
  ellipse(mouseX-80,mouseY+70,220,210);
  ellipse(mouseX+80,mouseY+70,220,210);
  ellipse(mouseX-180,mouseY-30,220,210); 
  ellipse(mouseX+180,mouseY-30,220,210);
  ellipse(mouseX-190,mouseY-170,220,210);
  ellipse(mouseX+190,mouseY-179,220,210);
  ellipse(mouseX-80,mouseY-250,220,210);
  ellipse(mouseX+80,mouseY-250,220,210);
  ellipse(mouseX-145,mouseY-174,220,210);
  
  ellipse(mouseX+145,mouseY-180,220,210);
  ellipse(mouseX,mouseY-230,220,210);
  ellipse(mouseX-160,mouseY-90,220,210);
  ellipse(mouseX+160,mouseY-90,220,210);
  ellipse(mouseX-110,mouseY,220,210);
  
  ellipse(mouseX+110,mouseY,220,210);
  ellipse(mouseX,mouseY+40,220,210);
  
  
  
//cara mora
  
  noStroke();
  fill(254,144,152);
  ellipse(mouseX,mouseY,1,1);
  ellipse(mouseX-85,mouseY-100,220,200);
  ellipse(mouseX+85,mouseY-100,220,200);
  rect(mouseX-85, mouseY-100,170, 100);

//cara
  ellipse(mouseX-80,mouseY-100,220,200);
  ellipse(mouseX+80,mouseY-100,220,200);
  rect(mouseX-80,mouseY-115, 170, 115);
 
  stroke(1);
 
  fill(0,0,0);
  ellipse(mouseX-45,mouseY-110,15,22);
  ellipse(mouseX+45,mouseY-110,15,22);
 
  noFill();
  strokeWeight(3);
  ellipse(mouseX,mouseY-80,15,17);
 
  noStroke();
  fill(254,144,152);
  triangle(mouseX-20,mouseY-80,mouseX,mouseY-100,mouseX+20,mouseY-80);
 
  fill(172,19,81);
  ellipse(mouseX-75,mouseY-70,30,30);
  ellipse(mouseX+75,mouseY-70,30,30);

//braços i mans
  noFill();
  stroke(4);  
  arc(mouseX-160,mouseY+130,400,400,radians(215), radians(250));
  arc(mouseX+160,mouseY+130,400,400,radians(290), radians(325));

  
}

