

void setup(){
  size(800, 500);
  background(8,249,255); //blue
}

void draw(){
noStroke();

//Background Area:
  
  //Ground
  fill(180, 98, 20); //brown
  rect(0,400,800,100); //dirt
  
  //Grass
  fill(11,211,18); //green
  rect(0,400,800,30); //grass
  
  //Monster Flower
  fill(11,211,18); //green
  rect(140,350,5,50); //flower stem
  fill(255,57,3); //red
  ellipse(140,350,40,40); //monster flower
  
  //triangle
  fill(8,249,255);
  noStroke();
  triangle(140,350, 50, 350, 200, 200);
  
  //fangs
  fill(255);
  triangle(130,350, 120, 350, 125, 340); //triangle 1
  ellipse(150,350, 10, 10);



//Pick stick:

  //Group1
  fill(160, 82, 8); //brown
  rect(300, 380, 20, 20); //Block group1
  
  //Group2
  fill(0); //black
  rect(280, 380, 20, 20); //Block1 Group2
  fill(0); //black
  rect(300, 360, 20, 20); //Block2 Group2
  fill(160, 82, 8); //brown
  rect(280, 360, 20, 20); //Block3 Group2
  
  //Group3
  fill(0); //black
  rect(260, 360, 20, 20); //Block1 Group3
  fill(0); //black
  rect(280, 340, 20, 20); //Block2 Group3
  fill(160, 82, 8); //brown
  rect(260, 340, 20, 20); //Block3 Group3
  
  //Group4
  fill(0); //black
  rect(240, 340, 20, 20); //Block1 Group4
  fill(0); //black
  rect(260, 320, 20, 20); //Block2 Group4
  fill(160, 82, 8); //brown
  rect(240, 320, 20, 20); //Block3 Group4
  
  //Group5
  fill(0); //black
  rect(220, 320, 20, 20); //Block1 Group5
  fill(0); //black
  rect(240, 300, 20, 20); //Block2 Group5
  fill(160, 82, 8); //brown
  rect(220, 300, 20, 20); //Block3 Group5
  
  //Group6
  fill(0); //black
  rect(200, 300, 20, 20); //Block1 Group6
  fill(0); //black
  rect(220, 280, 20, 20); //Block2 Group6
  fill(160, 82, 8); //brown
  rect(200, 280, 20, 20); //Block3 Group6
  
  //Group7
  fill(0); //black
  rect(180, 280, 20, 20); //Block1 Group7
  fill(0); //black
  rect(200, 260, 20, 20); //Block2 Group7
  fill(160, 82, 8); //brown
  rect(180, 260, 20, 20); //Block3 Group7
  
  //Group8
  fill(0); //black
  rect(160, 260, 20, 20); //Block1 Group8
  fill(0); //black
  rect(180, 240, 20, 20); //Block2 Group8
  fill(160, 82, 8); //brown
  rect(160, 240, 20, 20); //Block3 Group8
  
  //Group9
  fill(0); //black
  rect(140, 240, 20, 20); //Block1 Group9
  fill(0); //black
  rect(160, 220, 20, 20); //Block2 Group9
  fill(160, 82, 8); //brown
  rect(140, 220, 20, 20); //Block3 Group9
  
  //Group10
  fill(0);
  rect(120, 220, 20, 20); //Block1 Group10
  rect(140, 200, 20, 20); //Block2 Group10

//Metal pick:

  //Base:
  fill(237); //silver
  rect(100, 220, 20, 20); //Block1 Group1
  rect(100, 200, 20, 20); //Block2 Group1
  rect(120, 200, 20, 20); //Block3 Group1
  rect(120, 180, 20, 20); //Block4 Group1
  rect(140, 180, 20, 20); //Block5 Group1
  
  //Right side silver:
  rect(140, 160, 20, 20); //Block6 Group1
  rect(160, 160, 20, 20); //Block7 Group1
  rect(180, 160, 20, 20); //Block8 Group1
  rect(200, 160, 20, 20); //Block9 Group1
  rect(220, 160, 20, 20); //Block10 Group1
  
  //Left side silver:
  rect(80, 220, 20, 20); //Block11 Group1
  rect(80, 240, 20, 20); //Block12 Group1
  rect(80, 260, 20, 20); //Block13 Group1
  rect(80, 280, 20, 20); //Block14 Group1
  rect(80, 300, 20, 20); //Block15 Group1
  
  //Right dark silver:
  fill(93); //dark silver
  rect(80, 200, 20, 20);  //Cube T, Right Side
  rect(140, 140, 100, 20);//I Right
  rect(240, 160, 20, 20); //Cube B, Right Side
  rect(160, 180, 80, 20);
  
  //Left dark silver:
  fill(93); //dark silver
  rect(120, 160, 20, 20); //Cube T, Left Side
  rect(60, 220, 20, 100); //I left
  rect(80, 320, 20, 20);  //Cube B, Left Side
  rect(100, 240, 20, 80); //I Right

//Middle Black & Brown Block:
  
  fill(0); //black
  rect(80, 180, 20, 20); //Block1 Group10
  rect(100, 160, 20, 20); //Block2 Group10
  
  fill(160, 82, 8); //brown
  rect(100, 180, 20, 20); //Block1 Group10
  rect(80, 160, 20, 20); //Block2 Group10

//Minecraft Logo:

  //M: I bar 1
  fill(239, 255, 21); //yellow
  rect(280, 280, 20, 20); //Block1
  rect(280, 260, 20, 20); //Block2
  rect(280, 240, 20, 20); //Block3
  rect(280, 220, 20, 20); //Block4
  rect(280, 200, 20, 20); //Block5
  rect(280, 180, 20, 20); //Block6
  rect(280, 160, 20, 20); //Block7
  rect(280, 140, 20, 20); //Block8
  
  //M: V bar
  rect(300, 160, 20, 20); //Block1
  rect(320, 180, 20, 20); //Block2
  rect(340, 160, 20, 20); //Block3
  
  //M: I bar 2
  rect(360, 280, 20, 20); //Block1
  rect(360, 260, 20, 20); //Block2
  rect(360, 240, 20, 20); //Block3
  rect(360, 220, 20, 20); //Block4
  rect(360, 200, 20, 20); //Block5
  rect(360, 180, 20, 20); //Block6
  rect(360, 160, 20, 20); //Block7
  rect(360, 140, 20, 20); //Block8
  
  //I: I bar 
  rect(400, 280, 20, 20); //Block1
  rect(400, 260, 20, 20); //Block2
  rect(400, 240, 20, 20); //Block3
  rect(400, 220, 20, 20); //Block4
  rect(400, 200, 20, 20); //Block5
  rect(400, 180, 20, 20); //Block6
  rect(400, 160, 20, 20); //Block7
  rect(400, 140, 20, 20); //Block8
  
  //N: I bar 1 
  rect(440, 280, 20, 20); //Block1
  rect(440, 260, 20, 20); //Block2
  rect(440, 240, 20, 20); //Block3
  rect(440, 220, 20, 20); //Block4
  rect(440, 200, 20, 20); //Block5
  rect(440, 180, 20, 20); //Block6
  rect(440, 160, 20, 20); //Block7
  rect(440, 140, 20, 20); //Block8
  
  //N: slant bar 
  rect(460, 200, 20, 20); //Block1
  rect(480, 220, 20, 20); //Block2
  rect(500, 240, 20, 20); //Block3
   
  //N: I bar 2 
  rect(520, 280, 20, 20); //Block1
  rect(520, 260, 20, 20); //Block2
  rect(520, 240, 20, 20); //Block3
  rect(520, 220, 20, 20); //Block4
  rect(520, 200, 20, 20); //Block5
  rect(520, 180, 20, 20); //Block6
  rect(520, 160, 20, 20); //Block7
  rect(520, 140, 20, 20); //Block8
  
  //E: I bar  
  rect(560, 280, 20, 20); //Block1
  rect(560, 260, 20, 20); //Block2
  rect(560, 240, 20, 20); //Block3
  rect(560, 220, 20, 20); //Block4
  rect(560, 200, 20, 20); //Block5
  rect(560, 180, 20, 20); //Block6
  rect(560, 160, 20, 20); //Block7
  rect(560, 140, 20, 20); //Block8
  
  //E: leg blocks
  rect(580, 140, 20, 20); //Block1
  rect(600, 140, 20, 20); //Block2
  rect(580, 210, 20, 20); //Block3
  rect(580, 280, 20, 20); //Block4
  rect(600, 280, 20, 20); //Block5
  
  //C: I bar
  rect(340, 310, 10, 70); // bar
  
  //C: leg blocks
  rect(350, 310, 30, 10); //Block 1
  rect(350, 370, 30, 10); //Block 2
  
  //R: I bar
  rect(390, 370, 10, 10); //Block1
  rect(390, 360, 10, 10); //Block2
  rect(390, 350, 10, 10); //Block3
  rect(390, 340, 10, 10); //Block4
  rect(390, 330, 10, 10); //Block5
  rect(390, 320, 10, 10); //Block6
  rect(390, 310, 10, 10); //Block7
  
  //R: leg blocks
  rect(400, 310, 10, 10); //Block 1
  rect(410, 310, 10, 10); //Block 2
  rect(420, 310, 10, 10); //Block 3
  rect(420, 320, 10, 10); //Block 4
  rect(420, 330, 10, 10); //Block 5
  rect(410, 340, 10, 10); //Block 6
  rect(400, 340, 10, 10); //Block 7
  rect(415, 350, 10, 10); //Block 8
  rect(420, 360, 10, 10); //Block 9
  rect(425, 370, 10, 10); //Block 10

  //A: I bar 1
  rect(440, 310, 10, 70); //bar 1
  
  //A: leg blocks
  rect(440, 310, 40, 10); //block1
  rect(440, 340, 40, 10); //block2
  
  //A: I bar 2
  rect(470, 310, 10, 70); //bar 2
  
  //F: I bar
  rect(490, 310, 10, 70); //bar 

  //F: leg blocks
  rect(490, 310, 30, 10); //block1
  rect(490, 340, 25, 10); //block2

  //T: I bar
  rect(540, 310, 10, 70); //bar 

  //T: leg block
  rect(525, 310, 40, 10); //block

//Minecraft Head:

  //head:
  fill(206, 144, 96); //light brown
  rect(650, 200, 120, 120); //face
  
  //hair:
  fill(85, 51, 25); //dark brown
  rect(650, 200, 120, 30); //top part
  rect(650, 230, 10, 10);  //left side block
  rect(760, 230, 10, 10);  //right side block
  
  //eyes:
  fill(255); //white
  rect(660, 250, 30, 15);  //left side block
  rect(730, 250, 30, 15);  //right side block
  fill(73, 108, 211);      //blue 
  rect(675, 250, 15, 15);  //pupil 1 left
  rect(725, 250, 15, 15);  //pupil 1 left
  
  //nose:
  fill(137, 77, 14);       //dark/light brown
  rect(690, 265, 35, 15);  //nose
  
  //Mouth
  fill(188, 57, 57);       //dark/light brown
  rect(690, 280, 35, 15);  //mouth
 
  //beard:
  fill(85, 51, 25);        //dark brown
  rect(675, 280, 15, 40);  //beard block 1
  rect(725, 280, 15, 40);  //beard block 2
  rect(690, 295, 35, 25);  //center beard block
}



