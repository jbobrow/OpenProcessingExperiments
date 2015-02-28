
void setup (){
  size (600,600);
  background(50,50,50);
  noStroke();
  noLoop();
}
void draw (){
//rectangles along left side

  //I wanted to play with transparency and used Processing's tutorial
fill(150,150,150);
rect(0,0,100,600);
stroke(255);
  line(90,0,90,590);
  noStroke();
// I learned that 255 means 100% opacity...
fill(255,0,0,255);
rect(0,0,200,40);

// and continued to multiply x% by 255 for desired results. This is 90%
fill(255,0,0,229);
rect(0,50,200,40);

// 80%
fill(255,0,0,204);
rect(0,100,200,40);

// 70%
fill(255,0,0,179);
rect(0,150,200,40);

// 60%
fill(255,0,0,153);
rect(0,200,200,40);  
  
// 50%
fill(255,0,0,128);
rect(0,250,200,40);  
  
// 40%
fill(255,0,0,102);
rect(0,300,200,40);

// 30%
fill(255,0,0,77);
rect(0,350,200,40);

// 20%
fill(255,0,0,51);
rect(0,400,200,40);

// 10%
fill(255,0,0,26);
rect(0,450,200,40);

//5%
fill(255,0,0,13);
rect(0,500,200,40);

//2%
fill(255,0,0,7);
rect(0,550,200,40);

//1%
fill(255,0,0,3);
rect(0,600,200,40);



//diagonal circles
//row 1 (grey)
  fill(200,200,200,100); 
  ellipse (0,-10,15,15); 
  ellipse (20,10,15,15);
  ellipse (40,30,15,15); 
  ellipse (60,50,15,15);
  ellipse (80,70,15,15);
  ellipse (100,90,15,15);
  ellipse (120,110,15,15);
  ellipse (140,130,15,15);
  ellipse (160,150,15,15);
  ellipse (180,170,15,15);
  ellipse (200,190,15,15);
  ellipse (220,210,15,15);
  ellipse (240,230,15,15);
  ellipse (260,250,15,15);
  ellipse (280,270,15,15);
  ellipse (300,290,15,15);
  ellipse (320,310,15,15);
  ellipse (340,330,15,15);
  ellipse (360,350,15,15);
  ellipse (380,370,15,15);
  ellipse (400,390,15,15);
  ellipse (420,410,15,15);
  ellipse (440,430,15,15);
  ellipse (460,450,15,15);
  ellipse (480,470,15,15);
  ellipse (500,490,15,15);
  //crossed out in red
  ellipse (520,510,15,15);
  ellipse (540,530,15,15);
  ellipse (560,550,15,15);
  ellipse (580,570,15,15);
  ellipse (600,590,15,15);
  
//new color for the second row of circles
//row 2 (black)
  fill(0,0,0,204);
  ellipse (0,40,15,15);
  ellipse (20,60,15,15);
  ellipse (40,80,15,15);
  ellipse (60,100,15,15);
  ellipse (80,120,15,15);
  ellipse (100,140,15,15);
  ellipse (120,160,15,15);
  ellipse (140,180,15,15);
  //crossed out in white
  ellipse (160,200,15,15);
  ellipse (180,220,15,15);
  //
  ellipse (200,240,15,15);
  ellipse (220,260,15,15);
  ellipse (240,280,15,15);
  ellipse (260,300,15,15);
  ellipse (280,320,15,15);
  ellipse (300,340,15,15);
  //
  ellipse (320,360,15,15);
  ellipse (340,380,15,15);
  ellipse (360,400,15,15);
  ellipse (380,420,15,15);
  ellipse (400,440,15,15);
  ellipse (420,460,15,15);
  ellipse (440,480,15,15);
  ellipse (460,500,15,15);
  ellipse (480,520,15,15);
  ellipse (500,540,15,15);
  ellipse (520,560,15,15);
  ellipse (540,580,15,15);
  ellipse (560,600,15,15);
  //lines
    fill(0,0,0);
  stroke(255);
  line(170,220,150,175);
  line(180,190,140,205);
  line(90,590,600,590);

    stroke (255,0,0);
  line(500,500,540,520); 
  line(500,530,530,500);
  noStroke();
//triangle 
triangle(250,0,475,220,700,0);
triangle(500,250,600,150,600,350);

//arch row along bottom

fill(100,100,100,55);
arc(50, 600, 50, 50, -PI, 0);  // upper half of circle
fill(100,100,100,155);
arc(125, 600, 75, 75, -PI, 0);
fill(100,100,100,205);
arc(225, 600, 100, 100, -PI, 0);
arc(350, 600, 125, 125, -PI, 0);
fill(100,100,100,220);
arc(525, 600, 200, 200, -PI, 0);
}

//still need quad,triangles,20 lines
//inspired by Kazimir Malevich's Suprematism series
  
