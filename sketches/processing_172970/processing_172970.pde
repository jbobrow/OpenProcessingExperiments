
//p119
//purple sin m test values
//ch.14 trigonometry sketch playing with PI
size (700,300);
background(#35FAEB);
stroke(#3578FA);


smooth ();
float offset =160.0;
float scaleVal = 100.0;
float angleInc =10;
float angle = 90;

for (int x = 0; x <= width; x += 5) {
float y = offset + (sin(angle) * scaleVal);
fill(180,53,250,60);
stroke(#C907E8);
ellipse(x,y,x/16,x/16);
fill(#C7FF74,20);
stroke(#E89D07);
triangle (x,y, x,y/PI, width*PI,x*PI);
angle +=angleInc;
}



