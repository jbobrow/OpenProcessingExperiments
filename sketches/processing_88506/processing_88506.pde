
color[] backstage = {#292929, #2BBFBD, #F2B33D, #F29B30, #F22E2E};
color[] palette = backstage;

size(600, 200);
smooth();
noStroke();

background(palette[0]);
fill(palette[1]);
ellipse(100, height/2, 75, 75);
fill(palette[2]);
ellipse(200, height/3, 80, 80);
fill(palette[3]);
ellipse(250, height/1, 60, 60);
fill(palette[4]);
ellipse(300, height/4, 70, 70);
