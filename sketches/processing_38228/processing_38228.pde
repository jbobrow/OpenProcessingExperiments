
size(600, 400);
background(0);
stroke(255);
smooth();

    float triangleTip = random(175,225);

  for (int countA=20; countA<530; countA+=20) {
    for(int countB=20; countB<530; countB+=15){
      strokeWeight(2);
    stroke(255);
    fill(200);
  float  triangleChange = random (-30,30);
  triangleTip += triangleChange;
    triangle(countA,height/2,countA+=5, triangleTip, countA+5,height/2);

    }}


