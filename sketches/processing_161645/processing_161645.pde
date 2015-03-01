
//week 3 assignment 2a

size(200,200);
background(255);
    float w = 200;
    while (w > 10) {
        stroke(0);
        fill(w);
        ellipse(100,100,w,w);
        w = w - 20;
    }
