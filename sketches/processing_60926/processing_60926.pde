


void setup() {
  size(500, 500);
  smooth();
}

void draw()
{
  background(255);

 fill(73,78,82);
  stroke(0);
  strokeWeight(0.5);
  ellipse(width/2 ,height/2,30,30);
  noFill();
  ellipse(width/2, height/2, 400, 400);
  ellipse(width/2, height/2, 160, 160);

  noStroke();
  fill(73,78,82);
  translate(width/2, height/2);



  rotate(millis() * 0.0001 * TWO_PI / 2);
  fill(73,78,82);
  ellipse(0, 200, 30, 30);

  

    rotate(millis() * -0.0001* TWO_PI );
    fill(73,78,82);
    ellipse(80, 0, 60, 60);
  
  

    translate(30, 0);
    rotate(millis() * -0.0002 * PI*1);
    fill(0, 218, 255);
    ellipse(40, 40, 10, 10);

    
}



