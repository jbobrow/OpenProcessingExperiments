
size(250,250);
background(#5AF519,50);
smooth();
 
for (int apple = 00; apple > 0; apple = apple - 15) {
    noFill();
    stroke (apple + 10, apple + 30, apple * 3);
    strokeWeight (2);
    rect (-15, -15, 275, apple);
}
for (int apple = 800; apple > 0; apple = apple - 25) {
    noFill();
    stroke (apple + 10, apple + 30, apple * 3);
    strokeWeight (2);
    ellipse (125, 125, 275, apple);
}
 
save("continuous_dynamic");
