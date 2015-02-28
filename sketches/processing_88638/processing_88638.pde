
float d = 0;
size(600, 600);
noStroke();


void draw() {

background(mouseX/3, 356, mouseY/3);

colorMode(HSB, 360, 100, 100);
fill(175, 100, 100);
triangle(0, 600, 300, 0, 600, 600);

colorMode(HSB, 360, 100, 100);
fill(174, 100, 80);
triangle(20, 580, 300, 20, 580, 580);

colorMode(HSB, 360, 100, 100);
fill(174, 100, 72);
triangle(40, 560, 300, 40, 560, 560);

colorMode(HSB, 360, 100, 100);
fill(174, 100, 62);
triangle(60, 540, 300, 60, 540, 540);

colorMode(HSB, 360, 100, 100);
fill(174, 100, 52);
triangle(80, 520, 300, 80, 520, 520);

colorMode(HSB, 360, 100, 100);
fill(174, 100, 42);
triangle(100, 500, 300, 100, 500, 500);

}
