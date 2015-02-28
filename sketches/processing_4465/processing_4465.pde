
float a=0;void setup(){size(200,200);rectMode(CENTER);}void draw(){background(255);if(mousePressed){a=a+0.01;}translate(99,99);noStroke();for(int i=0;i<200;i=i+9){fill(0,25);rotate(a);rect(0,0,i,i);}}

