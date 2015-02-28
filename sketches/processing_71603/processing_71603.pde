
int x = 20;  //center of head
int y = 20;  //center of head
float i = radians(75);  //head termination angle
float a = 5;  //half width of head
float b = 8;  //half height of head
int l = 50;  //lenth of body
float h = b;  //tail height
float w = a;  //tail width
int R = 40; //spoon color
int G = 100;  //spoon color
int B = 150;  //spoon color
int O = 0;  //outline color

size(640, 360);
background(100);
smooth();
strokeJoin(BEVEL);

//strokeWeight(2);


for (y = y; y <= height; y += l+50) {
  for (x = x; x <= width/2; x += a+22) {
    fill(R, G, B);
    stroke(O);
    
    //head
    ellipse(x, y, 2*a, 2*b);

    //body
    stroke(R, G, B);
    rect(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y, 2*a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));

    stroke(O);
    strokeCap(ROUND);
    line(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    line(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));

    //tail
    beginShape();
    vertex(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x+w/2+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+h/2+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+h+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+h+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-w/2-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+h/2+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    endShape();
    a += 0.5;
    w=a;
    B+=20;
  }

  for (x = x; x <= width-20; x += a+22) {
    fill(R, G, B);
    stroke(O);
    
    //head
    ellipse(x, y, 2*a, 2*b);

    //body
    stroke(R, G, B);
    rect(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y, 2*a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));

    stroke(O);
    strokeCap(ROUND);
    line(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    line(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));

    //tail
    beginShape();
    vertex(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x+w/2+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+h/2+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x+a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+h+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+h+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-w/2-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+h/2+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    vertex(x-a*b*cos(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))), y+l+a*b*sin(i)/sqrt(sq(b*cos(i))+sq(a*sin(i))));
    endShape();
    b += 0.5;
    h=b;
    G-=10;
  }
  B=245;
  G=151;
  x=20;
  a=5;
  w=a;
  b=8;
  h=b;
  l-=10;
  R+=30;
}
