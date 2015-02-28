

float d = 40;
float a = 1;



  size(500, 500);
  smooth();




  fill(0);
   rect(0,0,width,height);

  for (float f=d; f<300; f++) {
    for (float h=a/2; h<height; h+=10) {
      stroke(200, random(h, f), random(0, 200), 10);
      strokeWeight(random(1, 5));
      line(0, height, width, random(h, 100));
    }
  }


  for (float f=d; f<300; f++) {
    for (float h=a/2; h<height; h+=10) {
      stroke(random(0, 255), random(h, f), random(h, 200), 10);
      strokeWeight(random(1, 5));
      line(width, 0, 0, random(h, 100));
    }
  }


  for (float i=1; i<width; i+=20) {
    noStroke();
    fill(random(0, 255), random(i, 30), 0, 60);
    ellipse(i, random(0, height), i, i);
  }





