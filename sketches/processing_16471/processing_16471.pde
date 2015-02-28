
int card = 0; 
int x = 550;
int y = 250;
int w = 100;
int h = 50;
PImage img1;

void setup() {
  size(500,600);  
  background(255);  
  smooth();
   img1 = loadImage("1.jpg"); 
 
}

void draw() {
  if(card == 0) {
image(img1, 0,0); 

    // leg
    strokeWeight(3);
    stroke(0);
    line(200,390,170,430);
    line(300,390,330,430);
    line(170,430,160,410);
    line(330,430,340,410);

    fill(255,247,0);
    ellipse(215,375,60,60);
    ellipse(285,375,60,60);



    //arm
    smooth();
    fill(255,247,0);
    stroke(10);
    ellipse(190,270,120,120);
    ellipse(310,270,120,120);

    // body
    smooth();
    fill(255,247,0);
    stroke(10);
    ellipse (250,250,165,300) ;
    //face
    smooth();
    fill(255);
    stroke(10);
    ellipse(210,150,80,80);
    ellipse(290,150,80,80);
    fill(0);
    ellipse(210,150,50,50);

    fill(255);
    ellipse(200,140,20,20);

    fill(0);
    ellipse(290,150,50,50);
    fill(255);
    ellipse(280,140,20,20);
    //mouth
    fill(255,142,3);
    ellipse(250,210,120,50);
    line(190,210,310,210);
    //egg
    noStroke();
    fill(191,129,48);
    ellipse(250,500,100,150);
  }
  else if (card == 1) { 
    image(img1, 0,0);
 

    // leg
    strokeWeight(3);
    line(200,390,170,430);
    line(300,390,330,430);
    line(170,430,160,410);
    line(330,430,340,410);

    fill(255,247,0);
    ellipse(215,375,60,60);
    ellipse(285,375,60,60);



    //arm
    smooth();
    fill(255,247,0);
    stroke(10);
    ellipse(190,270,120,120);
    ellipse(310,270,120,120);

    // body
    smooth();
    fill(255,247,0);
    stroke(10);
    ellipse (250,250,165,300) ;
    //face
    smooth();
    fill(255);
    stroke(10);
    ellipse(210,150,80,70);
    ellipse(290,150,80,70);
    fill(0);
    ellipse(210,150,50,40);
    fill(255);
    ellipse(220,140,20,10);
    fill(0);
    ellipse(290,150,50,40);
    fill(255);
    ellipse(280,140,20,10);

    //mouth
    fill(255,142,3);
    ellipse(250,210,120,50);
    fill(255);
    ellipse(250,210,120,10);
    //line(190,210,310,210);
    //egg
    stroke(255);
    fill(191,129,48);
    ellipse(250,500,100,150);
    line(290,460,250,500);
    strokeWeight(7);
    stroke(0);
    line(230,115,190,95);
    line(265,115,310,105);
  }
else if (card  == 2)
{  image(img1, 0,0); 
 
  // leg
  strokeWeight(3);
  line(200,390,170,430);
  line(300,390,330,430);
  line(170,430,160,410);
  line(330,430,340,410);

  fill(255,247,0);
  ellipse(215,375,60,60);
  ellipse(285,375,60,60);



  //arm
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse(190,270,120,120);
  ellipse(310,270,120,120);

  // body
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse (250,250,165,300) ;
  //face
  smooth();
  fill(255);
  stroke(10);
  ellipse(210,150,80,70);
  ellipse(290,150,80,70);
  fill(0);
  ellipse(210,150,50,40);
  fill(255);
  ellipse(220,150,30,30);
  fill(0);
  ellipse(290,150,50,40);
  fill(255);
  ellipse(280,150,30,30);

  //mouth
  fill(255,142,3);
  ellipse(250,210,120,50);
  fill(255);
  ellipse(250,210,120,20);

  //egg
  stroke(255);
  fill(191,129,48);
  ellipse(250,500,100,150);
  line(290,460,250,500);
  line(250,500,210,460);
  stroke(0);
  strokeWeight(7);
  line(230,115,190,80);
  line(265,115,310,80);
}

else if (card  == 3) { 
 image(img1, 0,0); 
   


  // leg
  strokeWeight(3);
  line(200,390,170,430);
  line(300,390,330,430);
  line(170,430,160,410);
  line(330,430,340,410);

  fill(255,247,0);
  ellipse(215,375,60,60);
  ellipse(285,375,60,60);



  //arm
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse(190,270,120,120);
  ellipse(310,270,120,120);

  // body
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse (250,250,165,300) ;
  //face
  smooth();
  fill(255);
  stroke(10);
  ellipse(210,150,80,80);
  ellipse(290,150,80,80);
  fill(0);
  ellipse(210,150,50,50);

  fill(255);
  ellipse(200,140,20,20);

  fill(0);
  ellipse(290,150,50,50);
  fill(255);
  ellipse(280,140,20,20);
  fill(255);
  ellipse(205,155,10,10);
  ellipse(220,150,15,15);
  fill(255);
  ellipse(290,155,10,10);
  ellipse(305,150,15,15);

  //mouth
  fill(255,142,3);
  ellipse(250,210,120,50);
  line(190,210,310,210);

  noStroke();
  fill(191,129,48);
  arc(400,600,105,155,3.60,5.80);
  //egg

  ellipse(250,500,100,150);
  noStroke();
  fill(255);
  arc(250,500,105,155,3.60,5.80);
  stroke(0);
  fill(255,88,88);
  ellipse(180,195,30,30);
  ellipse(320,195,30,30);
}

else if (card  == 4) { 
 image(img1, 0,0); 


  // leg
  strokeWeight(3);
  stroke(0);
  line(200,390,170,430);
  line(300,390,330,430);
  line(170,430,160,410);
  line(330,430,340,410);

  fill(255,247,0);
  ellipse(215,375,60,60);
  ellipse(285,375,60,60);



  //arm
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse(190,270,120,120);
  ellipse(310,270,120,120);

  // body
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse (250,250,165,300) ;
  //face
  smooth();
  fill(255);
  stroke(10);
  ellipse(210,150,80,80);
  ellipse(290,150,80,80);
  fill(0);
  ellipse(210,180,10,10);


  fill(0);
  ellipse(290,180,10,10);



  //mouth
  fill(255,142,3);
  ellipse(250,210,120,50);
  fill(255);
  ellipse(250,210,120,10);

  noStroke();
  fill(191,129,48);
  arc(400,600,105,155,3.60,5.80);
  //egg

  ellipse(250,500,100,150);
  noStroke();
  fill(255);
  arc(250,500,105,155,3.60,5.80);
}


else if (card  == 5) {  
 image(img1, 0,0); 
 

  // leg
  strokeWeight(3);
  stroke(0);
  line(200,390,170,430);
  line(300,390,330,430);
  line(170,430,160,410);
  line(330,430,340,410);

  fill(255,247,0);
  ellipse(215,375,60,60);
  ellipse(285,375,60,60);



  //arm
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse(180,270,120,50);
  ellipse(320,270,120,50);

  // body
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse (250,250,165,300) ;
  //face
  smooth();
  fill(255);
  stroke(10);
  ellipse(210,150,80,80);
  ellipse(290,150,80,80);
  fill(0);
  ellipse(200,170,10,10);


  fill(0);
  ellipse(310,140,10,10);



  //mouth
  fill(255,142,3);
  ellipse(250,240,40,120);
  fill(255,0,0);
  ellipse(250,230,40,60);


  noStroke();
  fill(191,129,48);
  arc(400,600,105,155,3.60,5.80);
  //egg

  ellipse(250,500,100,150);
  noStroke();
  fill(255);
  arc(250,500,105,155,3.60,5.80);
  //snake
  strokeWeight(5);
  stroke(255,0,0);
  line(200,510,250,510);
  line(230,510,240,490);
  noStroke();
  fill(48,103,50);
  ellipse(170,520,100,80);
  stroke(48,103,50);
  strokeWeight(50);
  line(145,520,160,600);
  noStroke();
  fill(255);
  ellipse(180,500,30,30);
  fill(0);
  ellipse(185,492,5,15);
}

else if (card  == 6) {
 image(img1, 0,0); 
  // eye
  smooth();
  fill(255);
  stroke(10);
  ellipse(390,90,50,50);
  ellipse(310,90,50,50);

  // leg
  strokeWeight(3);
  line(315,240,285,285);
  line(385,240,400,290);
  line(400,290,410,275);
  line(285,285,260,265);
  line(260,265,252,280);

  fill(255,247,0);
  ellipse(315,240,45,45);
  ellipse(380,240,45,45);



  //arm
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse(280,150,80,45);
  ellipse(415,150,80,45);

  // body
  smooth();
  fill(255,247,0);
  stroke(10);
  ellipse (350,150,130,220) ;


  //egg
  noStroke();
  fill(191,129,48);
  ellipse(250,500,100,150);
  arc(400,600,105,155,3.60,5.80);
  noStroke();
  fill(255);
  arc(250,500,105,155,3.60,5.80);
  //snake
  strokeWeight(5);
  stroke(255,0,0);
  line(200,510,250,510);
  line(230,510,240,490);
  noStroke();
  fill(48,103,50);
  ellipse(170,520,100,80);
  stroke(48,103,50);
  strokeWeight(50);
  line(145,520,160,600);
  noStroke();
  fill(255);
  ellipse(180,500,40,40);
  fill(0);
  ellipse(185,492,5,5);

  stroke(0);
  strokeWeight(3);
  line(330,200,320,200);
  line(320,200,340,220);
}
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}

void cardOne() {
size(500,600);  
background(255);  
smooth();  
 

// leg
strokeWeight(3);
line(200,390,170,430);
line(300,390,330,430);
line(170,430,160,410);
line(330,430,340,410);
 
fill(255,247,0);
ellipse(215,375,60,60);
ellipse(285,375,60,60);
 
 

//arm
smooth();
fill(255,247,0);
stroke(10);
ellipse(190,270,120,120);
ellipse(310,270,120,120);
 
// body
smooth();
fill(255,247,0);
stroke(10);
ellipse (250,250,165,300) ;
//face
smooth();
fill(255);
stroke(10);
ellipse(210,150,80,80);
ellipse(290,150,80,80);
fill(0);
ellipse(210,150,50,50);

fill(255);
ellipse(200,140,20,20);

fill(0);
ellipse(290,150,50,50);
fill(255);
ellipse(280,140,20,20);
//mouth
fill(255,142,3);
ellipse(250,210,120,50);
line(190,210,310,210);
//egg
noStroke();
fill(191,129,48);
ellipse(250,500,100,150);

}

void cardTwo() {
  size(500,600);  
background(255);  
smooth();  
 
// leg
strokeWeight(3);
line(200,390,170,430);
line(300,390,330,430);
line(170,430,160,410);
line(330,430,340,410);
 
fill(255,247,0);
ellipse(215,375,60,60);
ellipse(285,375,60,60);
 
 

//arm
smooth();
fill(255,247,0);
stroke(10);
ellipse(190,270,120,120);
ellipse(310,270,120,120);
 
// body
smooth();
fill(255,247,0);
stroke(10);
ellipse (250,250,165,300) ;
//face
smooth();
fill(255);
stroke(10);
ellipse(210,150,80,70);
ellipse(290,150,80,70);
fill(0);
ellipse(210,150,50,40);
fill(255);
ellipse(220,140,20,10);
fill(0);
ellipse(290,150,50,40);
fill(255);
ellipse(280,140,20,10);
 
//mouth
fill(255,142,3);
ellipse(250,210,120,50);
fill(255);
ellipse(250,210,120,10);
//line(190,210,310,210);
//egg
stroke(255);
fill(191,129,48);
ellipse(250,500,100,150);
line(290,460,250,500);
strokeWeight(7);
stroke(0);
line(230,115,190,95);
line(265,115,310,105);
}



