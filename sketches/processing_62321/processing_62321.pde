
size(300, 300);
background(255);
strokeWeight(3);


float space = width/10;



for (float x = space; x <= width-space; x = x + space) {

  for (float y = space; y <= height-space; y = y + space) 

    point(x, y);

}


