
    size(200, 200);
    smooth();

    background(195);
    stroke(159);
    line(width-10, 10, width/3, 10);
    line(10, height-10, width*(2/3), height-10);
    fill(127);
    ellipse(width/3, 10, 5, 5);
    ellipse(width*(2/3), height-10, 5, 5);
    noFill();
    stroke(0);
    bezier(width-10, 10, width/3, 10, width*(2/3), height-10, 10, height-10);

