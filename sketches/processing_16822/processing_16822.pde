

int card = 0; 
PImage img,img1,img2,img3,img5,img4,img6,img7,img8,img9,img10,img11,img12,img13,img14,img15,img16;
PFont font; 

void setup() {
  size(500,600);
  smooth();
  img = loadImage("hand3.png");
  img1= loadImage("b.png");
  img2 = loadImage("hammer1.png");
  img3 = loadImage("zzx.png");
  img4 = loadImage("d3.png");
  img5 = loadImage("hammer2.png");
  img6 = loadImage("desk.png");
  img7 = loadImage("star.png");
  img8 = loadImage("f.png");
  img9 = loadImage("d2.png");
  img10 = loadImage("bu2.png");
  img11 = loadImage("bu.png");
  img12 = loadImage("y1.png");
  img13 = loadImage("y2.png");
  img14 = loadImage("y3.png");
  img15 = loadImage("y4.png");
  img16 = loadImage("y5.png");
  
  font = loadFont("Consolas-48.vlw");
  textFont(font);
}

void draw() { 
  background(255);
  if (card == 0) {
    fill(0);
    textSize(50);
    text("Start",200,200);
    text("Radio person",120,300);
  }  
  else if (card == 1) { 

    image(img6,1,410,500,250);
    image(img10,60,150,50,50);
    image(img10,193,150,50,50);
    fill(0,150,170);
   textSize(30); 
    text("push the button",150,100);
    radio(5,60);
  } 
  else if (card  == 2) {  
    image(img6,1,410,500,250);
    radio(5,60);
    strokeWeight(2);
    fill(0,140,160);
    quad(185,410,185,320,325,320,325,400);
    fill(0);
    quad(185,460,185,370,325,370,325,460);
    fill(250,200,0);
    quad(205,460,205,410,305,410,305,460);
  }
  else if (card  == 3) { 
    image(img6,1,410,500,250);
    radio(5,60);
    strokeWeight(2);
    fill(0,140,160);
    quad(185,410,185,320,325,320,325,400);
    image(img1,205,320,100,90);
    fill(0);
    quad(185,460,185,370,325,370,325,460);
    fill(250,200,0);
    quad(205,460,205,410,305,410,305,460);
  }
  else if (card  == 4) {  

    image(img6,1,410,500,250);
    radio(5,60);
    strokeWeight(2);
    fill(0,140,160);
    quad(185,410,185,320,325,320,325,400);
    image(img9,205,320,100,90);
    fill(0);
    quad(185,460,185,370,325,370,325,460);
    fill(250,200,0);
    quad(205,460,205,410,305,410,305,460);
    image(img2,250,0,250,200);
  } 
  else if (card  == 5) {  

    image(img6,1,410,500,250);
    radio(5,60);
    image(img5,215,44,250,170);
    image(img8,207,212,100,100);
    image(img7,100,160,20,20);
    image(img7,100,90,60,60);
    image(img7,150,160,30,30);
    image(img7,150,10,80,80);
    strokeWeight(8);
    stroke(225,0,0);
    line(190,110,230,200);
    line(180,150,230,200);
  } 

  else if (card  == 6) {  
    image(img6,1,410,500,250);
    image(img3,40,140,400,350);
  }

  else if (card == 7) {  
    image(img4,335, int(random(235,260)),90,100);
    image(img3,40,140,400,350);
    image(img6,1,410,500,250);
    image(img7,200,30,100,100);
  }
  
   else if (card  == 8) {  
    image(img6,1,410,500,250);
    radio(5,60);
    fill(0);
    ellipse(125,280,95,95);
    ellipse(385,280,95,95);
    image(img12,93,225,70,90);
    image(img12,353,225,70,90);
    
  }
  
   else if (card  == 9) {  
   image(img6,1,410,500,250);
    radio(5,60);
    image(img2,250,0,250,200);
    fill(0);
    ellipse(125,280,95,95);
    ellipse(385,280,95,95);
    image(img13,93,225,70,90);
    image(img13,353,225,70,90);
  }
  
   else if (card  == 10) {
    image(img6,1,410,500,250);
    radio(5,60);
    image(img2,150,int(random(-50,-20)),250,200);
    image(img14,90,int(random(70,100)),140,190);
    image(img15,310,int(random(70,100)),120,190);
    
  }
  
   else if (card  == 11) {  
    image(img6,1,410,500,250);
    radio(5,60);
    image(img16,180,int(random(100,110)),70,90);
    image(img16,250,int(random(100,110)),70,90);
    fill(0);
    textSize(40);
    text("We win!!!",170,70);
  }
  
  else if (card  == 12) {  
    image(img6,1,410,500,250);
    radio(5,60);
    image(img,7,int(random(-50,-40)),155,240);
  }
  
  else if (card  == 13) {  
    image(img6,1,410,500,250);
    radio(5,60);
    image(img,92,int(random(-50,-40)),155,240);   
  }
}
  
 void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) { 
   if ((mouseX>60)&&(mouseX<110)&&(mouseY>150)&&(mouseY<200)) 
   { card = 12;
   }
   else if ((mouseX>193)&&(mouseX<243)&&(mouseY>150)&&(mouseY<200))
   { card = 13;
   }
   else card = 1;
  }
  
  else if (card == 12){ 
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
    if ((mouseX>200)&&(mouseX<300)&&(mouseY>30)&&(mouseY<130))
    {card = 1;
    }
    else card = 7;
  }
  
   else if (card == 1) { 
   if ((mouseX>60)&&(mouseX<110)&&(mouseY>150)&&(mouseY<200)) 
   { card = 12;
   }
   else if ((mouseX>193)&&(mouseX<243)&&(mouseY>150)&&(mouseY<200))
   { card = 13;
   }
   else card = 1;
  }
  
   else if (card == 13) {
    card = 8;
   }
 
  
   else if (card == 8) {
    card = 9;
  }
  
   else if (card == 9) {
    card = 10;
   }   
     else if (card == 10) {
    card = 11;
  }
  
  else if (card == 11) {
    card = 1;
  }  
}

void radio(int x, int y) {

  pushMatrix();
  translate(x,y);
  strokeWeight(2);
  stroke(0);
  fill(225,0,0);
  quad(50,150,450,150,450,350,50,350);
  fill(0);
  quad(180,350,180,260,320,260,320,350);
  fill(255);
  quad(435,150,435,30,450,30,450,150);
  quad(440,30,440,20,445,20,445,30);
  fill(250,200,0);
  quad(200,350,200,300,300,300,300,350);



  fill(250,200,0);
  ellipse(120,220,100,100);
  fill(0);
  ellipse(120,220,90,90);
  fill(255);
  ellipse(120,220,45,45);
  fill(0);
  ellipse(120,220,35,35);

  fill(250,200,0);
  ellipse(380,220,100,100);
  fill(0);
  ellipse(380,220,90,90);
  fill(255);
  ellipse(380,220,45,45);
  fill(0);
  ellipse(380,220,35,35);



  fill(250,200,0);
  ellipse(120,315,60,60);
  fill(0);
  ellipse(120,315,50,50);
  fill(255);
  ellipse(120,315,25,25);
  fill(0);
  ellipse(120,315,15,15);


  fill(250,280,0);
  ellipse(380,315,60,60);
  fill(0);
  ellipse(380,315,50,50);
  fill(255);
  ellipse(380,315,25,25);
  fill(0);
  ellipse(380,315,15,15);





  fill(255);
  quad(190,220,310,220,310,200,190,200);

  for(int i = 195; i <300 ; i += 5) {
    stroke(0);
    line(i+5, 220, i+ 5, 210);
  }

  strokeWeight(4);
  line(285,210,285,202);

  strokeWeight(2);
  fill(255);
  quad(65,135,90,135,90,150,65,150);
  quad(150,140,175,140,175,150,150,150);
  fill(225,0,0);
  quad(65,140,75,140,75,150,65,150);
  fill(255);
  quad(195,140,235,140,235,150,195,150);
  quad(265,140,295,140,295,150,265,150);
  quad(245,140,255,140,255,150,245,150);
  quad(305,140,325,140,325,150,305,150);

  strokeWeight(15);
  line(125,140,125,90);
  line(125,90,390,90);
  line(390,90,390,140);

  popMatrix();
}


