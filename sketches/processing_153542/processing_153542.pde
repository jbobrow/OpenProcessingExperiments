
//Jeff Conway, jconway@andrew.cmu.edu
//Copyright 2014

size(400, 400);
rectMode(CENTER);

float target_center_x = 200;
float target_center_y = 200;
float target_width = 200;
float target_height = 200;

fill(0, 0, 0);
rect(target_center_x, target_center_y, target_width+20, target_height+20);

fill(255, 0, 0);
ellipse(target_center_x, target_center_y, target_width, target_height);

fill(250, 162, 27);
ellipse(target_center_x, target_center_y, 0.75*target_width, 0.75*target_height);

fill(250, 247, 27);
ellipse(target_center_x, target_center_y, 0.5*target_width, 0.5*target_height);

fill(0, 0, 0);
ellipse(target_center_x, target_center_y, 0.25*target_width, 0.25*target_height);

fill(0, 255, 0);
triangle(target_center_x-target_width*0.05, target_center_y-target_height*0.01, target_center_x + target_width*0.05, target_center_y-target_height*0.01, target_center_x,target_center_y-target_height*0.06);

fill(0, 255, 0);
triangle(target_center_x-target_width*0.05, target_center_y+target_height*0.01, target_center_x + target_width*0.05, target_center_y+target_height*0.01, target_center_x,target_center_y+target_height*0.06);



