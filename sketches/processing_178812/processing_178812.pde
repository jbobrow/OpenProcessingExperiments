
size(1000,500);
background(0);
noStroke();

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(0,0,15,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(25,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(35,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(45,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(55,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(65,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(75,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(85,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(95,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(105,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(115,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(125,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(135,0,2,500);

// 255 means 100% opacity.
fill(130,0,130,0255);
rect(145,0,2,500);

// 100% opacity.
fill(130,0,130,0255);
rect(0,230,1000,10);

// 100% opacity.
fill(130,0,130,0255);
rect(0,230,1000,75);

// 100% opacity.
fill(255,0,0,0255);
rect(0,280,1000,30);

// 255 means 100% opacity.
fill(130,0,130,0255);
ellipse(240,30,30,30);

// 255 means 100% opacity.
fill(130,0,130,0255);
ellipse(200,30,30,30);

// 100% opacity.
fill(130,0,130,0255);
ellipse(220,50,50,50);

// 255 means 100% opacity.
fill(255,0,0,0255);
ellipse(300,30,30,30);

// 255 means 100% opacity.
fill(255,0,0,0255);
ellipse(340,30,30,30);

// 100% opacity.
fill(255,0,0,0255);
ellipse(320,50,50,50);

// 255 means 100% opacity.
fill(0,0,255,0255);
ellipse(400,30,30,30);

// 255 means 100% opacity.
fill(0,0,255,0255);
ellipse(440,30,30,30);

// 100% opacity.
fill(0,0,255,0255);
ellipse(420,50,50,50);

// 255 means 100% opacity.
fill(255,0,0,0255);
ellipse(500,30,30,30);

// 255 means 100% opacity.
fill(255,0,0,0255);
ellipse(540,30,30,30);

// 100% opacity.
fill(255,0,0,0255);
ellipse(520,50,50,50);

// 255 means 100% opacity.
fill(0,0,255,0255);
ellipse(600,30,30,30);

// 255 means 100% opacity.
fill(0,0,255,0255);
ellipse(640,30,30,30);

// 100% opacity.
fill(0,0,255,0255);
ellipse(620,50,50,50);

// 255 means 100% opacity.
fill(130,0,130,0255);
ellipse(700,30,30,30);

// 255 means 100% opacity.
fill(130,0,130,0255);
ellipse(740,30,30,30);

// 100% opacity.
fill(130,0,130,0255);
ellipse(720,50,50,50);

// 255 means 100% opacity.
fill(201,182,1,0255);
ellipse(800,30,30,30);

// 255 means 100% opacity.
fill(201,182,1,0255);
ellipse(840,30,30,30);

// 100% opacity.
fill(201,182,1,0255);
ellipse(820,50,50,50);

// 255 means 100% opacity.
fill(201,182,1,0255);
ellipse(460,360,60,60);

// 255 means 100% opacity.
fill(201,182,1,0255);
ellipse(540,360,60,60);

// 100% opacity.
fill(201,182,1,0255);
ellipse(500,400,100,100);

for(int i = 10; i < width; i += 10) {
  // If 'i' divides by 20 with no remainder draw the first line
  // else draw the second line
  if(i%20 == 0) {
    stroke(201,182,1,0255);
    line(820, 80, i, height/2); 
     
    stroke(130,0,130,0255);
    line(220, 80, i, height/2); 
    
    stroke(201,182,1,0255);
    line(i, 500, 800, height/2);
    
    stroke(255,0,0,0255);
    line(320, 80, i, height/2);
    
    stroke(0,0,255,0255);
    line(420, 80, i, height/2);
    
    stroke(255,0,0,0255);
    line(520, 80, i, height/2);
    
    stroke(0,0,255,0255);
    line(620, 80, i, height/2);
    
    stroke(130,0,130,0255);
    line(720, 80, i, height/2);
    save("Mickey_Magic.png");
  }
}


