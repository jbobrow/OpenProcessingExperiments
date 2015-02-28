
PImage img;

void setup(){
  background(240,230,180);
size (600, 600);
 // noLoop();
smooth();
colorMode (RGB, 600);
 img = loadImage ("201420066 KIMSunMin.jpg");
}

void draw(){
println(mouseX + " : " + mouseY);

strokeWeight(1);
fill(mouseX,206,277,202);
ellipse(243,360,277,280);

point(211,21);
strokeWeight(1);
line(250,0,600,555);
line(0,27,222,32);
line(0,434,190,430);
line(0,208,160,211);
line(311,0,340,50);
line(420,471,500,470);
line(420,486,500,486);
strokeWeight(5);
line(0,91,230,333);


stroke(0);
noFill();

noStroke();
fill(600,600,0);
quad(220,35,285,311,42,236,220,35);

stroke(0);
strokeWeight(5);
fill(mouseY,589,23,12);
rect(361,433,100,90);

}


