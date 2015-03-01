
int eSize = 10;

size(400, 400);
colorMode(RGB, 400);
background(0);
noStroke();

for (int y = 0; y <=400; y +=20) {
  for (int x=0; x<=400; x+=30) {
    noStroke();
    if (x == 400 || x == 400) {
      fill(0);
    } 
    else {
      fill(0);
    }

    fill(130, x, 400, 400);



    rectMode(CENTER);
    rect(x, y, eSize, eSize);

    fill(x, 150, 100, 20);
    ellipse(200, 400-x, x, 90);

    fill(180, 200+x, 151, 5);
    triangle(400, 0, 200, 400, 400, 400);

    fill(180, 200+x, 151, 5);
    triangle(0, 0, 200, 400, 0, 400);

    fill(266, 200, 10);
    ellipse(x, y, 10, 10);
  }
}




for (int y = 0; y <= height; y += 20) {
  for (int x = 0; x <= width; x +=20) {

    if (x > 100 && x < 300 && y > 100 && y < 300) { 
      fill(255);
    } 
    else {
      fill(255, 255, 255, 0);
    }
  }
}


for (int y = 0; y <=400; y +=30) {
  for (int x=0; x<=400; x+=20) {
    noStroke();
    if (x <= 100) {
    fill(#384d98, 300); 
    }
    else if(x> 100 && x <= 400){
    fill(#ffa400,300);
    }
    else if(x >300){
    fill(#ea9198,300);    
    }
    
    else{ 
      fill(#855896, 20); 
     }
     ellipse(x, y, eSize, eSize);
    }
}





