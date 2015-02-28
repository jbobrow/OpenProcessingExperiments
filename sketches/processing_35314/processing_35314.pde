
size(300,300);

float M=27.0;
//date of birth in May, hence the M letter//

fill(255,0,0);
ellipseMode(RADIUS);
ellipse(width/2,height/2,3*M,3*M);

fill(255,255,0);
ellipseMode(CENTER);
ellipse(width/2+100,height/2,60,60);

fill(0,255,0);
rectMode(CENTER);
rect(width/M,height/2,80,80);

stroke(255,128,0);
strokeWeight(2);
line(width*2/3,height/2-3*M,width*2/3,height/2+3*M);

strokeWeight(0);
stroke(0);
fill(0,0,255);
triangle(width/3,(height/2)-2*M,(width/3)-M*2,(height/2)+2*M,(width/3)+M*2,(height/2)+2*M);
//J'ai Fini//

