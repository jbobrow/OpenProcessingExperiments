
    size (200,200);
    background(0);
    noFill();
    stroke (#ffffff);
    ellipse(width/2,height/2, width, height);
    beginShape();
    vertex(width/2,0);
    vertex(196,70);
    vertex (170,170);
    vertex(30,170); 
    vertex (4,70);
    endShape(CLOSE);
    beginShape();
    vertex(width/2,0);
    vertex(30,170);
    vertex(197,70);
    vertex (3,70);
    vertex (170,170);
    endShape(CLOSE);
    line (width/2,0, width/2, height-30);              
