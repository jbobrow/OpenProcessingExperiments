
size(400,400);
background(255,204,0);
for (int i=0; i<400; i=i+1) 
  {
        float o = random(20);
        float m = random(255);
        float n = random(255);
        float k = random(255);
        stroke(m,n,k); strokeWeight(o); noFill();
    float r = random(400);
    rect(i,r,10,10);

    }
