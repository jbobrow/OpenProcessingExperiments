
//SETUP
colorMode(RGB);
size(842,595); 
background(255, 255, 224);
smooth();
//DECLARE
color[] c = {
  color(230, 100, 100), color( 95, 200, 42), 
  color(104, 208, 187), color(163, 225, 211), 
  color(255, 189, 200), color(249, 149, 48), 
  color(181, 224, 23)
};
float x, y;
float r = 13, R = 20;
float tx = 3 * R, ty = sqrt(3)*R / 2;
boolean offset = false;
//DRAW LINE ELLIPSE
stroke(248, 227, 132);
noFill();
strokeWeight(1);
for (int i = 0; i < 300; i++) {
  line(random(-width, width*2), random(-height, height*2), 
  random(-width, width*2), random(-height, height*2));
  ellipse(random(-width, width*2), random(-width, width*2), 50, 50);
  ;
}
//ROTATION
rotate(PI/10);
//DRAW HEXAGON
for (x = -100; x < 1000; x += tx) {
  for (y = -300; y < 700; y += ty) {
    if (!offset) {
      fill(c[int(random(0, 7))]);
      noStroke();
      beginShape();
      for (int i = 0; i < 6; i++) {
        vertex(x+cos(radians(60*i))*r, y+sin(radians(60*i))*r);
      }
      endShape(CLOSE);

      noFill();
      stroke(246, 226, 191);
      strokeWeight(3);      
      beginShape();
      for (int i = 0;i < 6; i++) {
        vertex(x+cos(radians(60*i))*R, y+sin(radians(60*i))*R);
      }
      endShape(CLOSE);
    }
    else 
    {
      fill(c[int(random(0, 7))]);
      noStroke();
      beginShape();
      for (int i = 0; i < 6; i++) {
        vertex(x+R+R/2+cos(radians(60*i))*r, y+sin(radians(60*i))*r);
      }
      endShape(CLOSE);

      noFill();
      stroke(246, 226, 191);
      strokeWeight(3);    
      beginShape();
      for (int i = 0;i < 6; i++) {
        vertex(x+R+R/2+cos(radians(60*i))*R, y+sin(radians(60*i))*R);
      }
      endShape(CLOSE);
    }
    offset = !offset;
  }
}
//RE ROTATION
rotate(-PI/10); 
//DRAW NAME
fill(0, 0, 0);   
PFont font = createFont("ACaslonPro-SemiboldItalic", 20);
textFont(font, 20);
textAlign(RIGHT);
text("wrapping paper by shinrobo", width-10, height-10);                                                
