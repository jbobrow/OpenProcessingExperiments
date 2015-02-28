
float i;void draw(){if(i<1)translate(400,400);strokeWeight(9-i);line(0,0,0,-70);if(i>8)return;pushMatrix();translate(0,-70);scale(random(1));rotate(1/++i);draw();rotate(-2/i);draw();i--;popMatrix();}

