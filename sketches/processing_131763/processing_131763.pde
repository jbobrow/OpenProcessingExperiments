

/*
processing would not let me upload my program so I had to copy and paste my program in and now it is not running the way it should, but my basic pisture of a smilely face is still there but the block should be filling in after it moves
*/

void setup() {
  background(1231231,30,200);size (800,500);
}

void draw() {
  size (1000,1000);

stroke(30);
fill(200,80,40) ;
rectMode(CENTER);
rect(mouseX,mouseY,50,50);

/*
stroke(30);
fill(200,80,40) ;
ellipse(100,70,60,60);
rect(mouseX,mouseY,80,70);
*/

/*
I created a smilely face and I wanted it to
move with the mouse, but I could not figure
how to get it
*/

fill(300,300,0);
ellipse(100,100,100,100);
fill(0);
ellipse(81,80,16,32);
ellipse(119,80,16,32);
fill(0);
arc(100, 115, 50, 30, 0, PI);
/*
tried using this code but it didnt work, thought the 
above code I wrote looks a bite nicer so I kept it in
rectMode(CENTER);
rect(mouseX,mouseY,50,50);
*/
}
