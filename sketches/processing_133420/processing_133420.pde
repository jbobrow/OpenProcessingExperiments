
size(400, 400);
background(0);
//adding alpha value to fill to set transparency
fill(0, 0, 255, 50);
noStroke();
//circles increase in size at same position to give a color fade effect
for ( int a = 50; a <= 400; a += 20){
 //dividing width and height in half starts circle at the center
ellipse(width/2, height/2, a, a);

}
//used color selector tool to find the color I wanted
//same use of gradual increase to height and width of circles to give a color fade effect
fill(96, 227, 32, 10);
noStroke();
for ( int s = 30; s <= 400; s += 20){
  ellipse(width, height, s, s);
  ellipse(50, 50, s, s);
}


