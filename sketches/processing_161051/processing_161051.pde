
size(500,500);
background(20, 180, 150);

int x = 100;
int y = 55;

if (y < 5) {
  line(0, 150, width, height);
}

if ((x > 55) && (y >= 55)) {
stroke(150, 250, 180);
strokeWeight(6);
line(30,0, 55, height);
} 


if ((x > 155) && (y >= 55)) {
stroke(100, 250, 10);
strokeWeight(6);
line(130,10, 155, height);
}

boolean z = false;

if (z != true) { 
  fill(50, 250, 180);
  line(230,0,230,height);
  ellipse(350,350,150,150);
}

if (z != true) { 
  fill(50, 250, 180);
  ellipse(350,200,80,80);
}

if (z != true) { 
  fill(50, 250, 180);
  ellipse(350,100,40,40); 
} else {
  ellipse(350,100,40,40);
}

if (z != true) { 
  fill(50, 250, 180);
  ellipse(350,50,10,10);
}


