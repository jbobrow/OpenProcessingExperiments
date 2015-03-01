


//purple sin m

size (700,300);
background(#35FAEB);
stroke(#3578FA);


fill(180,53,250,60);
smooth ();
float offset = 50.0;
float scaleVal = 35.0;
float angleInc =PI/28.0;
float angle = 0.0;
for (int x = 0; x <= width; x += 5) {
float y = offset + (sin(angle) * scaleVal);
//rect(x,y,2,4);
triangle (x,y, x,y*10, x+20,Y*.8);
angle +=angleInc;
}




