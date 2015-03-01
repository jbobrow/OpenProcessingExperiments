

background(230);
size(200, 200);
noFill();
strokeWeight(10);

stroke(75); //shadow of heart offset 5 pct
fill(75); // semi-transparent fill for heart shadow
strokeJoin(ROUND);  //joining of curves to form heart
strokeWeight(1);
beginShape();  //begin heart shape
bezier(105, 79, 11, 31, 11, 105, 105, 162);  //left curve
bezier(105, 79, 200, 31, 200, 105, 105, 162); //right curve
endShape(); //end heart shape

stroke(0); // bottom portion of arrow
strokeWeight(4);
line(132, 130, 180, 155);



strokeWeight(10);
fill(255, 102, 0, 140); // semi-transparent fill for heart
strokeJoin(ROUND);  //joining of curves to form heart
beginShape();  //begin heart shape
stroke(255, 102, 0);  //setting color left side heart
bezier(100, 75, 10, 30, 10, 100, 100, 150);  //left curve
stroke(0, 102, 255); //setting color right side heart
bezier(100, 75, 190, 30, 190, 100, 100, 150); //right curve
endShape(); //end heart shape

stroke(0); // top portions of arrow
strokeWeight(4);
line(70, 90, 19, 60);



strokeJoin(MITER);  //joining lines to form arrowhead
beginShape();
noFill();
vertex(30, 55);
vertex(13, 55);
vertex(20, 75);
endShape();



