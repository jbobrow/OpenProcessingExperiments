
size(720, 480);
smooth();
strokeWeight(2);
background(204);

//Head and body
line(120,100, 80,300);
ellipse(120,100, 60,60);

//left arm
noFill();
strokeJoin(BEVEL);
beginShape();
  vertex(105,170);
  vertex(50,180);
  vertex(25,120);
endShape();

//right arm
line(105,170, 200,170);

//lightsaber blade
strokeWeight(4);
stroke(5,255,150);
line(204,157, 255,40);

//sword hilt
strokeWeight(1);
stroke(0,0,0);
fill(255, 255, 255);
strokeJoin(BEVEL);
beginShape();
  vertex(198,160);
  vertex(180,180);
  vertex(185,190);
  vertex(205,160);
  vertex(215,163);
  vertex(214,160);
  vertex(207,157);
  vertex(198, 150);
  vertex(198,160);
endShape();

//treads - really lame ones at the moment
fill(255,255,255);
triangle(75,280, 20,400, 120, 400);
translate(13,-5);
triangle(75,280, 20,400, 120, 400);    
