
//James LeVasseur
//January 22nd 2014
//My "haunted" house for nmd 295.



//declaration variables
float midx, midy; //used for mid screen
boolean point = false;//used for plotting
int number = 0; //used for plotting

void setup(){
  size(1200,750); //size of screen
  //initialization of mid screen variables
  midx=width/2;
  midy=height/2;
  
  
}

void draw(){
  background(0,0,100); //background
  smooth(); //used to smooth out lines and objects
  
  noStroke(); //used for base house rooms

  rectMode(CENTER); //used for all rectangles

  
  fill(140,121,160);
  rect(midx,midy+180,220,240);//center room
  rect(midx,midy-50,200,220);//center higher room
  
  fill(150);
  rect(midx+73,midy+290,73.3333,20);//front foundation right
  rect(midx-73,midy+290,73.3333,20);//front foundation left
  
  fill(175);
  rect(midx,midy+290,100,20); //front foundation middle

  fill(130,111,150);
  rect(midx+210,midy+190,200,220);//right room
  rect(midx-210,midy+190,200,220);//left room
  
  fill(125);
  rect(midx+210,midy+290,200,20); //right foundation
  rect(midx-210,midy+290,200,20); //left foundation
  
  fill(140,121,160);
  rect(midx+410,midy+175,220,250);//far right room
  rect(midx-410,midy+40,220,520);//far left room
  
  rect(midx+445,midy-50,150,200);//far right top room
  
  fill(150);
  rect(midx+410,midy+290,220,20);//far right foundation
  rect(midx-410,midy+290,220,20);//far left foundation
  
  stroke(0);
  
  //left room
  line(midx-300,midy+90,midx-110,midy+90);
  line(midx-300,midy+100,midx-110,midy+100);
  line(midx-300,midy+110,midx-110,midy+110);
  line(midx-300,midy+120,midx-110,midy+120);
  line(midx-300,midy+130,midx-110,midy+130);
  line(midx-300,midy+140,midx-110,midy+140);
  line(midx-300,midy+150,midx-110,midy+150);
  line(midx-300,midy+160,midx-110,midy+160);
  line(midx-300,midy+170,midx-110,midy+170);
  line(midx-300,midy+180,midx-110,midy+180);
  line(midx-300,midy+190,midx-110,midy+190);
  line(midx-300,midy+200,midx-110,midy+200);
  line(midx-300,midy+210,midx-110,midy+210);
  line(midx-300,midy+220,midx-110,midy+220);
  line(midx-300,midy+230,midx-110,midy+230);
  line(midx-300,midy+240,midx-110,midy+240);
  line(midx-300,midy+250,midx-110,midy+250);
  line(midx-300,midy+260,midx-110,midy+260);
  line(midx-300,midy+270,midx-110,midy+270);
  line(midx-300,midy+280,midx-110,midy+280);
  
  //right room
  line(midx+300,midy+90,midx+110,midy+90);
  line(midx+300,midy+100,midx+110,midy+100);
  line(midx+300,midy+110,midx+110,midy+110);
  line(midx+300,midy+120,midx+110,midy+120);
  line(midx+300,midy+130,midx+110,midy+130);
  line(midx+300,midy+140,midx+110,midy+140);
  line(midx+300,midy+150,midx+110,midy+150);
  line(midx+300,midy+160,midx+110,midy+160);
  line(midx+300,midy+170,midx+110,midy+170);
  line(midx+300,midy+180,midx+110,midy+180);
  line(midx+300,midy+190,midx+110,midy+190);
  line(midx+300,midy+200,midx+110,midy+200);
  line(midx+300,midy+210,midx+110,midy+210);
  line(midx+300,midy+220,midx+110,midy+220);
  line(midx+300,midy+230,midx+110,midy+230);
  line(midx+300,midy+240,midx+110,midy+240);
  line(midx+300,midy+250,midx+110,midy+250);
  line(midx+300,midy+260,midx+110,midy+260);
  line(midx+300,midy+270,midx+110,midy+270);
  line(midx+300,midy+280,midx+110,midy+280);
  
  //center top
  line(midx-100,midy+50,midx+100,midy+50);
  line(midx-100,midy+40,midx+100,midy+40);
  line(midx-100,midy+30,midx+100,midy+30);
  line(midx-100,midy+20,midx+100,midy+20);
  line(midx-100,midy+10,midx+100,midy+10);
  line(midx-100,midy+0,midx+100,midy+0);
  line(midx-100,midy-10,midx+100,midy-10);
  line(midx-100,midy-20,midx+100,midy-20);
  line(midx-100,midy-30,midx+100,midy-30);
  line(midx-100,midy-40,midx+100,midy-40);
  line(midx-100,midy-50,midx+100,midy-50);
  line(midx-100,midy-60,midx+100,midy-60);
  line(midx-100,midy-70,midx+100,midy-70);
  line(midx-100,midy-80,midx+100,midy-80);
  line(midx-100,midy-90,midx+100,midy-90);
  line(midx-100,midy-100,midx+100,midy-100);
  line(midx-100,midy-110,midx+100,midy-110);
  line(midx-100,midy-120,midx+100,midy-120);
  line(midx-100,midy-130,midx+100,midy-130);
  line(midx-100,midy-140,midx+100,midy-140);
  line(midx-100,midy-150,midx+100,midy-150);
  
  //far right room
  line(midx+300,midy+60,midx+520,midy+60);
  line(midx+300,midy+70,midx+520,midy+70);
  line(midx+300,midy+80,midx+520,midy+80);
  line(midx+300,midy+90,midx+520,midy+90);
  line(midx+300,midy+100,midx+520,midy+100);
  line(midx+300,midy+110,midx+520,midy+110);
  line(midx+300,midy+120,midx+520,midy+120);
  line(midx+300,midy+130,midx+520,midy+130);
  line(midx+300,midy+140,midx+520,midy+140);
  line(midx+300,midy+150,midx+520,midy+150);
  line(midx+300,midy+160,midx+520,midy+160);
  line(midx+300,midy+170,midx+520,midy+170);
  line(midx+300,midy+180,midx+520,midy+180);
  line(midx+300,midy+190,midx+520,midy+190);
  line(midx+300,midy+200,midx+520,midy+200);
  line(midx+300,midy+210,midx+520,midy+210);
  line(midx+300,midy+220,midx+520,midy+220);
  line(midx+300,midy+230,midx+520,midy+230);
  line(midx+300,midy+240,midx+520,midy+240);
  line(midx+300,midy+250,midx+520,midy+250);
  line(midx+300,midy+260,midx+520,midy+260);
  line(midx+300,midy+270,midx+520,midy+270);
  line(midx+300,midy+280,midx+520,midy+280);
  
  
  //top far right
  
  line(midx+370,midy+50,midx+520,midy+50);
  line(midx+370,midy+40,midx+520,midy+40);
  line(midx+370,midy+30,midx+520,midy+30);
  line(midx+370,midy+20,midx+520,midy+20);
  line(midx+370,midy+10,midx+520,midy+10);
  line(midx+370,midy+0,midx+520,midy+0);
  line(midx+370,midy-10,midx+520,midy-10);
  line(midx+370,midy-20,midx+520,midy-20);
  line(midx+370,midy-30,midx+520,midy-30);
  line(midx+370,midy-40,midx+520,midy-40);
  line(midx+370,midy-50,midx+520,midy-50);
  line(midx+370,midy-60,midx+520,midy-60);
  line(midx+370,midy-70,midx+520,midy-70);
  line(midx+370,midy-80,midx+520,midy-80);
  line(midx+370,midy-90,midx+520,midy-90);
  line(midx+370,midy-100,midx+520,midy-100);
  line(midx+370,midy-110,midx+520,midy-110);
  line(midx+370,midy-120,midx+520,midy-120);
  line(midx+370,midy-130,midx+520,midy-130);
  line(midx+370,midy-140,midx+520,midy-140);
  
  //clock tower
  
  line(midx-300,midy+50,midx-520,midy+50);
  line(midx-300,midy+40,midx-520,midy+40);
  line(midx-300,midy+30,midx-520,midy+30);
  line(midx-300,midy+20,midx-520,midy+20);
  line(midx-300,midy+10,midx-520,midy+10);
  line(midx-300,midy+0,midx-520,midy+0);
  line(midx-300,midy-10,midx-520,midy-10);
  line(midx-300,midy-20,midx-520,midy-20);
  line(midx-300,midy-30,midx-520,midy-30);
  line(midx-300,midy-40,midx-520,midy-40);
  line(midx-300,midy-50,midx-520,midy-50);
  line(midx-300,midy-60,midx-520,midy-60);
  line(midx-300,midy-70,midx-520,midy-70);
  line(midx-300,midy-80,midx-520,midy-80);
  line(midx-300,midy-90,midx-520,midy-90);
  line(midx-300,midy-100,midx-520,midy-100);
  line(midx-300,midy-110,midx-520,midy-110);
  line(midx-300,midy-120,midx-520,midy-120);
  line(midx-300,midy-130,midx-520,midy-130);
  line(midx-300,midy-140,midx-520,midy-140);
  line(midx-300,midy-150,midx-520,midy-150);
  line(midx-300,midy-160,midx-520,midy-160);
  line(midx-300,midy-170,midx-520,midy-170);
  line(midx-300,midy-180,midx-520,midy-180);
  line(midx-300,midy-190,midx-520,midy-190);
  line(midx-300,midy-200,midx-520,midy-200);
  line(midx-300,midy-210,midx-520,midy-210);
  line(midx-300,midy+60,midx-520,midy+60);
  line(midx-300,midy+70,midx-520,midy+70);
  line(midx-300,midy+80,midx-520,midy+80);
  line(midx-300,midy+90,midx-520,midy+90);
  line(midx-300,midy+100,midx-520,midy+100);
  line(midx-300,midy+110,midx-520,midy+110);
  line(midx-300,midy+120,midx-520,midy+120);
  line(midx-300,midy+130,midx-520,midy+130);
  line(midx-300,midy+140,midx-520,midy+140);
  line(midx-300,midy+150,midx-520,midy+150);
  line(midx-300,midy+160,midx-520,midy+160);
  line(midx-300,midy+170,midx-520,midy+170);
  line(midx-300,midy+180,midx-520,midy+180);
  line(midx-300,midy+190,midx-520,midy+190);
  line(midx-300,midy+200,midx-520,midy+200);
  line(midx-300,midy+210,midx-520,midy+210);
  line(midx-300,midy+220,midx-520,midy+220);
  line(midx-300,midy+230,midx-520,midy+230);
  line(midx-300,midy+240,midx-520,midy+240);
  line(midx-300,midy+250,midx-520,midy+250);
  line(midx-300,midy+260,midx-520,midy+260);
  line(midx-300,midy+270,midx-520,midy+270);
  line(midx-300,midy+280,midx-520,midy+280);
  
  //center room
  
  line(midx-110,midy+270,midx+110,midy+270);
  line(midx-110,midy+260,midx+110,midy+260);
  line(midx-110,midy+250,midx+110,midy+250);
  line(midx-110,midy+240,midx+110,midy+240);
  line(midx-110,midy+230,midx+110,midy+230);
  line(midx-110,midy+220,midx+110,midy+220);
  line(midx-110,midy+210,midx+110,midy+210);
  line(midx-110,midy+200,midx+110,midy+200);
  line(midx-110,midy+190,midx+110,midy+190);
  line(midx-110,midy+180,midx+110,midy+180);
  line(midx-110,midy+170,midx+110,midy+170);
  line(midx-110,midy+160,midx+110,midy+160);
  line(midx-110,midy+150,midx+110,midy+150);
  line(midx-110,midy+140,midx+110,midy+140);
  line(midx-110,midy+130,midx+110,midy+130);
  line(midx-110,midy+120,midx+110,midy+120);
  line(midx-110,midy+110,midx+110,midy+110);
  line(midx-110,midy+100,midx+110,midy+100);
  line(midx-110,midy+90,midx+110,midy+90);
  line(midx-110,midy+80,midx+110,midy+80);
  line(midx-110,midy+70,midx+110,midy+70);
  line(midx-110,midy+60,midx+110,midy+60);





  noStroke();
  fill(75,119,91);
  triangle(midx-520,midy-220,midx-410,midy-320,midx-300,midy-220);//clock tower roof
  triangle(500,215,600,130,700,215); //center roof
  triangle(970,225,1045,150,1120,225); //right roof
  
  fill(219,202,143);
  ellipse(midx-415,midy-120,150,150); //clock face
  stroke(130,111,150);
  line(midx+300,midy+80,midx+300,midy+280); //line on right side of house used to break up siding
  line(midx-300,midy+80,midx-300,midy+280); //line on left side of house used to break up siding
  
 /* code to be used in later versions
  stroke(255,0,0);
  noFill();
  strokeWeight(3);
  beginShape();
  vertex(500,215);
  bezierVertex(560,200,580,170,575,150);
  endShape();
  
  beginShape();
  vertex(midx-100,midy-160);
  bezierVertex(midx-40,midy-175,midx-20,midy-200,midx-25,midy-225);

  endShape();*/
  
  fill(102,76,51);
  noStroke();
  rect(midx,midy+235,70,90);//front door
  arc(midx,midy+195,70,70,PI, TWO_PI); //front door top
  
  stroke(0);
  fill(0);
  ellipse(575,610,5,5); //door knobs
  ellipse(980,600,5,5);
 
 
  strokeWeight(2);//for clock lines
  
  stroke(0);
  //lines on the clock
  line(185,190,185,210);
  line(230,255,250,255);
  line(120,255,140,255);
  line(185,320,185,300);
  
  strokeWeight(1);
  
  noStroke();
  fill(0,100,0);
  rect(midx,midy+350,width,100); //grass
  
  fill(175);
  rect(midx-40,midy+205,20,150);//front pillars
  rect(midx+40,midy+205,20,150);
  
  fill(150);
  rect(midx+100,midy+205,15,150);//side pillars
  rect(midx-100,midy+205,15,150);
  
  rect(midx-73,midy+120,73.3333,20); //top blocks
  rect(midx+73,midy+120,73.3333,20);
  fill(175);
  rect(midx,midy+120,100,20); //middle block
  
  fill(0);
  rect(midx-410,midy+225,90,110); //door for clock tower
  arc(midx-410,midy+170,90,75,PI, TWO_PI); //clock tower door top
  
  fill(102,76,51);
  rect(midx+410,midy+237,70,90); //far right door
  arc(midx+410,midy+195,70,70,PI, TWO_PI); //far right door top

  //window center left
  noStroke(); 
  fill(104,146,150);
  rect(midx-50,midy-75,40,60); //rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx-50,midy-75,40,60); //frame
  line(midx-70,midy-75,midx-30,midy-75);//frame
  line(midx-50,midy-105,midx-50,midy-45);//frame
  
  //window center right
  noStroke();
  fill(104,146,150);
  rect(midx+50,midy-75,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+50,midy-75,40,60);//frame
  line(midx+70,midy-75,midx+30,midy-75);//frame
  line(midx+50,midy-105,midx+50,midy-45);//frame
  
  //window right room left
  noStroke();
  fill(104,146,150);
  rect(midx+155,midy+185,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+155,midy+185,40,60);//frame
  line(midx+135,midy+185,midx+175,midy+185);//frame
  line(midx+155,midy+215,midx+155,midy+155);//frame
  
  //window right room right
  noStroke();
  fill(104,146,150);
  rect(midx+240,midy+185,40,60);//rect with blue tint- glass
  stroke(0);
  noFill();
  strokeWeight(2);
  rect(midx+240,midy+185,40,60);//frame
  line(midx+220,midy+185,midx+260,midy+185);//frame
  line(midx+240,midy+215,midx+240,midy+155);//frame
  
  //circle window, left room
  noStroke();
  fill(104,146,150);
  ellipse(midx-205,midy+120,50,50);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx-205,midy+120,50,50); //first frame
  ellipse(midx-205,midy+120,20,20);//smaller frame
  line(midx-205,midy+145,midx-205,midy+95); //line frame
  //circle window, right room
  noStroke();
  fill(104,146,150);
  ellipse(midx+195,midy+120,50,50);//ellipse with blue tint- glass
  stroke(0);
  noFill();
  ellipse(midx+195,midy+120,50,50); //first frame
  ellipse(midx+195,midy+120,20,20); //smaller frame
  line(midx+195,midy+145,midx+195,midy+95); //line frame
  //right poarch window
  fill(104,146,150);
  noStroke();
  rect(midx+445,midy+15,50,70); //glass
  arc(midx+445,midy-20,50,42,PI, TWO_PI); //glass
  stroke(0);
  noFill();
  rect(midx+445,midy+15,50,70); //frame
  arc(midx+445,midy-20,50,42,PI, TWO_PI);  //frame
  line(midx+445,midy+50,midx+445,midy-20); //frame
  line(midx+420,midy-20,midx+470,midy-20); //frame
  //left poarch window
  fill(104,146,150);
  noStroke();
  rect(midx-415,midy+15,50,70); //glass
  arc(midx-415,midy-20,50,42,PI, TWO_PI);//glass 
  stroke(0);
  noFill();
  rect(midx-415,midy+15,50,70); //frame
  arc(midx-415,midy-20,50,42,PI, TWO_PI); //frame 
  line(midx-415,midy+50,midx-415,midy-20); //frame
  line(midx-395,midy-20,midx-425,midy-20); //frame

  
  
  strokeWeight(1);
  fill(255);
  Plotter();
}


///////////Plotter///////////
  void Plotter(){
   if ( point == true)
 {
   println("point number" + "[" + number + "]" + "(" + mouseX + "," + mouseY + ")");
      ellipse(mouseX, mouseY, 5, 5);
      noLoop();
      number = number + 1;
 } 
  }
  
  void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == ALT)
    {
      point = true;
      loop();
}
  }
}




