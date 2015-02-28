
smooth();
noFill();
beginShape();
vertex(15, 40);// v1
bezierVertex(5, 10, 100, 0, 70, 55);// c1, c2, v2
vertex(30, 65);//v3
vertex(25, 95);//v4
bezierVertex(50, 70, 75, 90, 90, 90); //c3, c4, v5
endShape();

//bezierVertex( cx1, cy1, cx2, cy2, x, y)
