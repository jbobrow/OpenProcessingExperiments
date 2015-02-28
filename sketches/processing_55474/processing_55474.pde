
//code by Saarah Saghir, YSDN 1006

size(250,250);
smooth();

//sky
fill(#BCE1E6);
noStroke();
    rect(0,0,252,252);
        
//grass
fill(#C7D296);
noStroke();
    rect(0,136,250,250);

//tail
    fill(#E6E7E8);
    noStroke();
        beginShape();
            vertex(126, 142);
            vertex(132, 137);
            vertex(241, 175);
            vertex(180, 164);
            vertex(180, 164);
            vertex(183, 167);
            vertex(152, 156);
            vertex(154, 160);
        endShape(CLOSE);
        
//body
    ellipse(102, 131, 60, 60);
    
//wing dark
fill(#BCBEC0);
noStroke();
    ellipse(105, 133, 44, 44);
        
//wing light
fill(#E6E7E8);
noStroke();
    ellipse(109, 118, 30, 30);
        
//beak
fill(#FABDB3);
noStroke();
    triangle(62,97,58,112,47,101);

//mouth
fill(#D27C6F);
    line(47,101,58,104);

//head
fill(#F1F2F2);
    ellipse(78, 108, 40, 40);

//eye
fill(#803F39);
    ellipse(71, 113, 10, 10);
 
//clouds
fill(#FFFFFF);
    ellipse(23, 21, 77, 77);
    ellipse(80, 12, 55, 55);
    ellipse(113, 27, 36, 36);
