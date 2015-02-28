
//HW2-48257 A
// Bumyeol Kim, copyright 2012

size (400, 400);
background(#A2C2FF);
smooth ( );

float x, y, wd, ht;
x = 200;
y = 200;
wd = 200;
ht = 200;

strokeWeight(15);
stroke(#FF4400);
fill(#4B4B4B);
ellipse(x, y, 2*wd-15, 2*ht-15);


strokeWeight(10);
stroke(#BF8D28);
line(x-(wd/2)-30, y-(ht/2)-30, x-(wd/2)-30, y+(ht/2)+30);
line(x-(wd/2)-30, y+(ht/2)+30, x+(wd/2)+30, y+(ht/2)+30);
line(x+(wd/2)+30, y-(ht/2)-30, x+(wd/2)+30, y+(ht/2)+30);
line(x-(wd/2)-30, y-(ht/2)-30, x+(wd/2)+30, y-(ht/2)-30);

// first
beginShape( );
strokeWeight(15);
stroke(#FFA112);
vertex(x-(wd/2), y-(ht/2));
vertex(x-(wd/2), y+(ht/2));
vertex(x+(wd/4), y+(ht/2));
vertex(x-(wd/2)+5, y);
vertex(x+(wd/4), (y-(ht/2)));
vertex(x-(wd/2), y-(ht/2));
endShape( );

// second
strokeWeight(15);
stroke(#1FFF7A);
line((x-(wd/2)) + 20, (y-(ht/2)), (x-(wd/2)) + 20, (y-(ht/2)) + ht);
line((x-(wd/2)) + 25, (y-(ht/2)) + (ht/2), x+(wd/4) + 20, (y-(ht/2)));

// third
strokeWeight(15);
stroke(#4A92F5);
line((x-(wd/2)) + 40, (y-(ht/2)), (x-(wd/2)) + 40, (y-(ht/2)) + ht);
line((x-(wd/2)) + 45, (y-(ht/2)) + (ht/2), x+(wd/4) + 40, (y-(ht/2)));
line((x-(wd/2)) + 45, (y-(ht/2)) + (ht/2), x+(wd/4) + 40, (y-(ht/2)) + ht);


//saveFrame("HW2.jpg");
                
