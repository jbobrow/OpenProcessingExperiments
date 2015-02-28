
size(500,600);
int i = 0;
while (i < 200) {
  stroke(random(10,100));
  fill(random(50,150));
   strokeWeight(random(0,1));
   rect((random(0,440)),(random(0,535)),(random(0,70)),(random(0,100)));
   line((random(0,500)),(random(0,600)),(random(0,500)),(random(0,600)));
   i = i+1;
}

