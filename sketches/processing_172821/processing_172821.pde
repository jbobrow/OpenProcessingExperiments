
size(100,150);


float x = 0;

void draw() {
    x = x + 1; 
    background(random(x), random(x), random(x));
    
    fill(random(255),random(255),0);
    ellipse(50,125,50,100)
        fill(random(255),random(255),random(x));
    ellipse(23,50,7,15);
        fill(random(255),random(255),random(x));
    ellipse(77,50,7,15);
        fill(random(255),random(255),random(x));
    ellipse(50,50,50,70);    //head
        fill(random(255),random(255),random(x));
    ellipse(40,40,10,10);    //leftEye
    ellipse(60,40,10,10);    //rightEye
        fill(random(255),random(255),random(x));
    ellipse(50,65,20,3);    //mouth
    arc(40,32,7,3,0,PI);
    arc(60,32,7,3,0,PI);
    fill(200,100,0);
        fill(random(255),random(255),random(x));
    text("SJHS",33,110);
        fill(random(255),random(255),random(x));
    text(x,40,130);
    
    
    if (x > 255) {
        x = 0;
    }
}

loop();
