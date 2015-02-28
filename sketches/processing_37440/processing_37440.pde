
size(400, 400);
background(0,0,0);
noFill();
smooth();
strokeWeight(1.5);
for (int x=0;x<400;x+=100) { 
  for (int y=0;y<400;y+=100) {
    for (int i=0;i<400;i+=50) { // 50pixel increments so as to create the tangents to each circle generated
      ellipse(200, 200, x, y); //creates a series regular circles as well as an equal amount of "tall" and "wide" elipses which have inversed widths' and heights'
      line(x, i, x+400, i); //generates the horizontal lines for the conforming grid
      line(i, y, i, y+400); //generates the vertical lines for the conforming grid
      stroke(x,y,i);
     
    }
  }
}


