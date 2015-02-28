
size(400, 400);
background(0);
smooth();
stroke(255);

for (int x = 0; x <=width; x+=10) {                    //The first two loops draw the vertical lines.
  line(x, 0, x, height/4);
}

for (int x = 0; x <=width; x+=10) {
  line(x, height*.75, x, height);
}

for (int x = 0; x <= width; x+=10) {                   //The next two loops draw the diagonal lines.
  line(x, height*.75, width, height/2);
}

for (int x = 0; x <= width; x+=10) {                   
  line(x, height*.25, width, height/2);
}

for (int x = 0; x <= width; x+=10) {                   //This loop draws the triangle.
  triangle(width, height/2, 0, height*.25, 0, height*.75);
}


