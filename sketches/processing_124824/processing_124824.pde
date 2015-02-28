
/* 
Artistic comments:
To Kandinsky, the three most basic geometrical shapes (the triangle, square and circle) had intrinsic natures and colors.
To the Bauhaus professor, "a dull shape like a circle deserves a dull color like blue.
A shape with intermediate interest like a square deserves an intermediate color like red.
A dynamic, interesting shape like a triangle deserves an energetic, luminous, psychotic color like yellow."
While I'm no color theorist myself, I really like Kandinsky and his theory, so this program is a tiny homage to him. 
Instructions:
Click, drag and release mouse left to create a circle. Right to create a square.
Their sizes depend on how long is your drag.
Press t or T to create an equilateral triangle centered at the mouse cursor position.
Pressing numbers 1-3 on the keyboard change the palette for the elements you draw:
1 are blues;
2 are yellows;
3 are reds;
As a little easter egg, try pressing 'g' and creating new shapes.
Pressing 0 clears the screen and flips the background from black to white and back.
*/

color blu[] = {#17184b, #0f2350, #1c305c, #192f60, #223a70, #2a4073, #274a78, #165e83, #164a84, #19448e, #507ea4, #1e50a2, #3e62ad, #4c6cb3, #5a79ba, #5383c3, #007bbb, #2792c3, #0094c8, #0095d9, #38a1db, #2ca9e1, #59b9c6, #2a83a2, #00a3af, #008899, #698aab, #84b9cb, #83ccd2, #84a2d4, #89c3eb, #a0d8ef, #abced8, #a2d7dd, #bce2e8, #c1e4e9, #ebf6f7, #e8ecef, #eaedf7, #eaf4fc};
color ylw[] = {#ffd900, #ffea00, #ffec47, #fef263, #fcd575, #fbd26b, #f5e56b, #eec362, #ebd842, #ffdb4f, #fbca4d, #fcc800, #f8b500, #fabf14, #f7c114, #e6b422, #e6b422, #d9a62e, #d3a243, #c89932, #d0af4c, #ffb655, #ffff00, #ffd900, #ffea00, #ffec47, #fef263, #fcd575, #fbd26b, #f5e56b, #eec362, #ebd842, #ffdb4f, #fbca4d, #fcc800, #f8b500, #fabf14, #f7c114, #fff755, #ffd855};
color red[] = {#ab6953, #bb5548, #ca8269, #d0826c, #d57c6b, #df7163, #e0815e, #eb9b6f, #ee836f, #f19072, #f19072, #a22041, #a22041, #9e3d3f, #a73836, #b7282e, #ba2636, #b94047, #d9333f, #ce5242, #d3381c, #c9171e, #d7003a, #e2041b, #e60033, #e83929, #c53d43, #ff0000, #c85554, #b7282e, #ba2636, #b94047, #d9333f, #ce5242, #d3381c, #c9171e, #d7003a, #e2041b, #e60033, #e83929};
color grn[] = {#006e54, #00a381, #38b48b, #00a497, #80aba9, #5c9291, #478384, #43676b, #80989b, #2c4f54, #1f3134, #47585c, #485859, #6c848d, #53727d, #5b7e91, #426579, #4c6473, #455765, #44617b, #393f4c, #393e4f, #203744, #4d4c61, #005243, #00552e, #475950, #3a5b52, #2f5d50, #3b7960, #028760, #7ebeab, #bed3ca, #92b5a9, #007b43, #3eb370, #68be8d, #316745, #47885e, #a6c8b2};
color palettes[][] = new color[][] {blu, ylw, grn, red};
int pal_num = 0;
int x_or;
int bgflag = 0;

void setup() {
 size(1280, 720);
 background(0);
}

void draw() {}

void mousePressed() { //gets the initial position for mouseX
  x_or = mouseX;
}

void mouseReleased() {
  if (x_or < mouseX) { //if the mouse was dragged and released right-ward, it creates a square)
    int side;
    int alpha;
    alpha = int(random(200, 255));
    color colour = palettes[pal_num][int(random(40))];
    strokeWeight(random(3));
    stroke(colour, alpha);
    alpha = int(random(75, 255));
    fill(colour, alpha);
    side = (mouseX - x_or)/2;
    rect(mouseX-side/2, mouseY-side/2, side, side);
  }
  if (x_or > mouseX) { //if the mouse was dragged and released left-ward, it creates a circle)
    int radius;
    int alpha;
    alpha = int(random(200, 255));
    color colour = palettes[pal_num][int(random(40))];
    strokeWeight(random(3));
    stroke(colour, alpha);
    alpha = int(random(75, 255));
    fill(colour, alpha);
    radius = (x_or - mouseX)/2;
    ellipse(mouseX, mouseY, radius, radius);
  }
}

void keyPressed() {
  if (key=='s' || key=='S')
    saveFrame("screenshot-###.png");
    
  //typing t or T creates an equilateral triangle centered at the mouse cursor    
  if (key=='t' || key=='T') {
    int side;
    int alpha;
    alpha = int(random(200, 255));
    color colour = palettes[pal_num][int(random(40))];
    strokeWeight(random(3));
    stroke(colour, alpha);
    alpha = int(random(75, 255));
    fill(colour, alpha);
    side = int(random(width/4));
    triangle(mouseX, mouseY-2*(side*sqrt(3)/2)/3, mouseX-(side/2), mouseY+((side*sqrt(3)/2)/3), mouseX+(side/2), mouseY+((side*sqrt(3)/2)/3) );
  }
    
  switch (key) {
    case '1': //blues
      pal_num = 0;
      break;
    case '2': //yellows
      pal_num = 1;
      break;
    case '3': //reds
      pal_num = 3;
      break;
    case '0':
      if(bgflag == 0) {
        background(#ffffff);
        bgflag = 1;
      }
      else {
        background(#000000);
        bgflag = 0;
      }      
      break;
   }
  if (key=='g' || key=='G')
      pal_num = 2;
}


