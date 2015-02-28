
size (300, 300);
background(140);
smooth();

translate(width/2, height/2); //change origin to center of sketch
for (int x = height; x>=10; x-=15) { //spacing of the spiral arm
  for (int y =5; y <=width; y+=20) { //spacing between power buttons in arm
    rotate(radians(10)); //this makes power button rotate around centerpoint like a swirl
    strokeWeight(1.5);
    stroke(260-y); // change color of outline by row
    fill(40+y, 120+y, 240); //change color of fill by row
    //draw the "power" button
    ellipse(x, y, 50, 50);
    ellipse(x, y, 20, 20);
    noStroke();
    fill(40+y, 120+y, 240);
    rect(x-6, y-15, 12, 10);
    stroke(260-y);
    line(x, y, x, y-10);
  }
}

