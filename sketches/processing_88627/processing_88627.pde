
color[] flamingo = {#F6B1C3, #F0788C, #DE234C, #BC0D35, #A20D1E};

size(600, 600);
smooth();
noStroke();
background(flamingo[0]);

fill(flamingo[1]);
triangle(150, 50, 200, 150, 100, 150);

pushMatrix();
pushStyle();

translate(200, 50);
scale(2);
rotate(radians(45));
strokeWeight(5);
stroke(flamingo[4]);
fill(flamingo[2]);
triangle(150, 50, 200, 150, 100, 150);

popMatrix();
triangle(400, 50, 350, 150, 450, 150);

popStyle();
rotate(radians(-15));
triangle(270, 200, 220, 300, 320, 300);
