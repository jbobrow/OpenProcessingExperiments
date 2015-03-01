
size(630,540);
background(205,150,205);

noStroke();

//Background Gradients
fill(142,229,238,4);
for(int i=0; i<=width/4; i+=2) {
  rect(i*2,0,width-i*4,height);
} //Loop starts at i=0; "i" goes up by increments of 2 until reaching width/4; loop ends
//This is a BLUE GRADIENT with near-transparent layers overlapping each other as the rectangle's width gets smaller and smaller

fill(255,5);
for(int j=width/8; j<=width/4; j+=2) {
  rect(j*2,0,width-j*4,height);
} //Loop starts at j=width/8; "j" goes up by increments of 2 until reaching width/4; loop ends
//This is a WHITE GRADIENT with near-transparent layers overlapping each other as the rectangle's width gets smaller and smaller


//PINK CATS
for(int x=5; x<width; x+=70) { //Placement of shapes on X-Axis
//The width of each cat is 60px. "x" goes up by increments of 70px to provide space for each cat, as well as a 10px cushion to the right of the cat (70-60).

  for(int y=5; y<height; y+=120) { //Placement of shapes on Y-Axis
  //The height of each individual cat is 50px. Adding another 10px cushion below each cat gives us 60px; however, I wanted the cats to appear on every other "row", thus why y+=120 (60*2).
    
    strokeWeight(.1);
    stroke(0);
    
    //Ears
    fill(205,150,205);
    triangle(x,y,x+20,y+10,x,y+30);
    triangle(x+60,y,x+40,y+10,x+60,y+30);

    //Head
    fill(255,187,255);
    beginShape();
    vertex(x+10,y+10);
    vertex(x+50,y+10);
    vertex(x+60,y+30);
    vertex(x+50,y+50);
    vertex(x+10,y+50);
    vertex(x,y+30);
    vertex(x+10,y+10);
    endShape();
    
    //Eyes
    stroke(0);
    strokeWeight(.5);
    fill(0,100);
    ellipse(x+15,y+30,5,5);
    ellipse(x+45,y+30,5,5);
    
    //Mouth
    noFill();
    strokeWeight(.5);
    stroke(0);
    arc(x+30-5,y+35,10,20,0,radians(100));
    arc(x+30+5,y+35,10,20,radians(80),radians(180));
    
    //Nose
    noStroke();
    fill(186,85,211);
    ellipse(x+30,y+35,4,4);
    
    //Whiskers
    strokeWeight(.75);
    stroke(0);
    line(x+45,y+40,x+60,y+40);
    line(x,y+40,x+15,y+40);
    line(x+45,y+40,x+60,y+45);
    line(x,y+45,x+15,y+40);
  }
} //Every other "row" will have a line of pink cats generated. The extra space between rows on the y-axis is left blank to leave room for blue cats. See below for details.

//BLUE CATS
for(int x=-30; x<width; x+=70) { //Placement of shapes on X-Axis
//Sets value so blue cats appear directly centered between endpoints of pink cats (Loop begins at x=-30 as compared to pink cats at x=5 (70/2 = 35; 5-35 = -30)).
  
  for(int y=65; y<height; y+=120) { //Placement of shapes on Y-Axis
  //Sets value so blue cats appear on rows not occupied by pink cats (Loop begins at y=65 as compared to pink cats at y=5 (120/2 =60; 5+60 = 65)).
    
    strokeWeight(.1);
    stroke(0);
    
    //Ears
    fill(51,161,201);
    triangle(x,y,x+20,y+10,x,y+30);
    triangle(x+60,y,x+40,y+10,x+60,y+30);

    //Head
    fill(142,229,238);
    beginShape();
    vertex(x+10,y+10);
    vertex(x+50,y+10);
    vertex(x+60,y+30);
    vertex(x+50,y+50);
    vertex(x+10,y+50);
    vertex(x,y+30);
    vertex(x+10,y+10);
    endShape();
    
    //Eyes
    stroke(0);
    strokeWeight(.5);
    fill(0,100);
    ellipse(x+15,y+30,5,5);
    ellipse(x+45,y+30,5,5);
    
    //Mouth
    noFill();
    strokeWeight(.5);
    stroke(0);
    arc(x+30-5,y+35,10,20,0,radians(100));
    arc(x+30+5,y+35,10,20,radians(80),radians(180));
    
    //Nose
    noStroke();
    fill(69,139,0);
    ellipse(x+30,y+35,4,4);
    
    //Whiskers
    strokeWeight(.75);
    stroke(0);
    line(x+45,y+40,x+60,y+40);
    line(x,y+40,x+15,y+40);
    line(x+45,y+40,x+60,y+45);
    line(x,y+45,x+15,y+40);
  }
}


