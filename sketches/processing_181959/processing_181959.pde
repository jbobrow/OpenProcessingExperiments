

void setup() {
  size(600,600);
  background(#CCFFE5);
}

void  draw() {
  //background
  fill(#66FFFF);
  noStroke();
  rectMode(CENTER);
  rect(300,180,600,120);
  fill(#0080FF);
  noStroke();
  rect(300,300,600,120);
  fill(#0000FF);
  noStroke();
  rect(300,420,600,120);
  fill(#000066);
  noStroke();
  rect(300,540,600,120);
  
  //ground
  fill(225,225,225,220);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300,630,770,250);
  
  //trunk
  fill(225,225,225,220);
  noStroke();
  triangle(280,520,300,180,320,520);
  triangle(300,360,450,300,310,380);
  triangle(435,302,435,307,515,300);
  triangle(380,330,380,340,505,345);
  triangle(295,400,285,420,180,305);
  triangle(226,360,225,345,140,315);
  triangle(300,300,290,315,200,240);
  triangle(250,278,260,283,270,230);
  triangle(300,240,305,250,360,230);
  
  //blossom
  fill(231,122,253);
  ellipseMode(CENTER);
  ellipse(295,400,10,10);
    ellipse(300,360,10,10);
    ellipse(320,280,20,20);
      ellipse(370,330,10,10);
      ellipse(380,340,20,20);
        ellipse(300,240,10,10);
        ellipse(360,330,15,15);
        ellipse(150,320,20,20);
        ellipse(155,330,10,10);
        ellipse(180,310,15,15);
        ellipse(170,310,10,10);
        ellipse(130,320,10,10);
        ellipse(230,350,20,20);
        ellipse(210,370,20,20);
        ellipse(180,360,15,15);
        ellipse(280,240,15,15);
        ellipse(250,260,10,10);
          ellipse(200,280,15,15);
            ellipse(230,250,20,20);
            ellipse(220,255,15,15);
            ellipse(220,270,20,20);
            ellipse(275,275,20,20);
            ellipse(250,300,20,20);
            ellipse(450,300,20,20);
            ellipse(420,340,10,10);
            ellipse(440,310,10,10);
            ellipse(420,310,15,15);
            ellipse(425,315,15,15);
            ellipse(425,290,15,15);
            ellipse(390,280,15,15);
            ellipse(435,380,15,15);
            ellipse(440,420,10,10);
            ellipse(220,470,10,10);
            ellipse(425,465,15,15);
            ellipse(200,455,15,15);
            ellipse(130,400,15,15);
            ellipse(310,260,10,10);
        
        //dark
        fill(#99004C);
        ellipse(390,350,10,10);
        ellipse(370,355,10,10);
         ellipse(135,325,10,10);
         ellipse(140,340,10,10);
         ellipse(228,358,10,10);
         ellipse(210,390,10,10);
         ellipse(200,400,15,15);
         ellipse(230,260,10,10);
         ellipse(230,280,15,15);
         ellipse(430,315,10,10);
         ellipse(320,250,15,15);
        
        //medium
        fill(#CC00CC);
        ellipse(395,340,15,15);
        ellipse(400,360,10,10);
        ellipse(155,330,15,15);
        ellipse(250,400,15,15);
        ellipse(210,350,10,10);
        ellipse(190,250,10,10);
        ellipse(435,325,15,15);
        ellipse(435,360,15,15);
        ellipse(250,330,15,15);
        ellipse(350,300,15,15);
        
        //girl
        fill(#FFFFFF);
        triangle(140,560,135,533,145,533);
        fill(#FF0000);
        triangle(150,480,105,530,160,540);
        fill(#FFFFFF);
        ellipse(150,480,30,30);
        fill(#FF0000);
        triangle(160,466,110,450,136,490);
    
       
        
        
        
}


