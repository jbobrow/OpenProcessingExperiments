
size(800, 800); 
background(100);
 

for (int y = 400; y> 0; y-= 10) {
  for (int x = 400; x> 0; x-= 5) {
    if (x<400)
    {
      stroke(200);
      line(x*2, y*2, x, y);
    }
    else{
      rect(x,y,x*2,y*2);
    }
  }
}

 
 
smooth();
for (int x = 150; x < 600; x+= 10) {
  noFill();
  stroke(255);
  ellipse(50, 50, x, x);
} 

 
 
for (int x = 150; x < 800; x+= 30) {
  noFill();
  stroke(255);
  ellipse(400, 400, x, x);
} 

 
 
for (int y = 20; y <= 500; y += 3) {
  for (int x = 20; x <= 500; x += 10) {
    stroke(4);
    strokeWeight(4);
    ellipse(400, 400, x-100, x-100);
  }
}

 
 
noStroke();
for (int y = 0; y < 300; y += 20) {
  for (int x = 0; x < 400; x += 10) {
    fill(x * 0.6);
    rect(x+380, y+100, 12*x, 12);
  }
}

 
 
fill(0, 76);
smooth();
noFill();
stroke(255, 20);
strokeWeight(1);
for (int y = -10; y <= 800; y += 20) {
  for (int x = -10; x <= 800; x += 20) {
    ellipse(random(width), random(height), random(width), random(height));
  }
}

 
 
for (int x=0; x <= width; x += 100)
  for (int y=0; y <= height; y += 100)
  {
    if (x<400) {
      stroke(10);
      strokeWeight(x/150);
      line(1100-x, 800-y, width/2, height/2);
    }
  }

 

for (int y = 100; y < 200; y += 10) {
  for (int x =100; x < 200; x += 10) {
    if (x<300) {  
      noStroke();
      fill(5);
      rect(x*4, y*4, 5, 5);
    }
  }
}

 

for (int x = 100; x < 800; x+= 10) {
  noFill();
  stroke(20);
  strokeWeight(3);
  ellipse(560, 560, x*0.3, x*0.3);
} 



 

for (int y = 0; y < 300; y += 10) {
  for (int x = 0; x < 400; x += 10) {
    if (x<300) {  
      stroke(10);
      noStroke();
      fill(x * 0.2);
      rect(x+100, 700-y, 10, 5);
    }
  }
}
