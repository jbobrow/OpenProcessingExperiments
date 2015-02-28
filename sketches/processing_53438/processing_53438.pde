
float x = 100;
float y = 100;
float xspeed = .3;
float yspeed = .8;


void setup(){
smooth();

size(500,500);
background(255);

}
void draw() {
smooth();
translate(-50,-10);
stroke(255,0,0);
line(398,324,398,226);
noStroke();

x = x + xspeed;
  y = y + yspeed;
  
  if ((x > width/2) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height/3) || (y < 0)) {
    yspeed = yspeed * -1;
  }

stroke(x);
beginShape();
smooth();
fill(x);
vertex(110,223);
vertex(195,327);
vertex(111,328);
endShape(CLOSE);

beginShape();
smooth();
vertex(251,226);
vertex(293,327);
vertex(207,327);
endShape(CLOSE);

fill(y);
beginShape();
vertex(313,225);
vertex(398,324);
vertex(314,326);
endShape();

stroke(y);

beginShape();
vertex(418,226);
vertex(494,264);
vertex(501,325);
vertex(417,324);
endShape();



}


