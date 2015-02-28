
float r=2,d=2;void draw(){stroke(0,0);fill(r*3,r*1.5,r*2,1);rect(0,0,width,width);translate(70,70);rotate(r+=.04*((r>75||r<1)?d=-d:d));fill(r*2.5,r*1.7+150,r+150,2);ellipse(1,-9,-99,r);rect(-9,0,r,75);}

