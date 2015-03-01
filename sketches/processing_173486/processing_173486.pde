

size(600,600);

background (199,100,25);

for (int i=0; i<height; i+=2*2){
  smooth(10);
 noStroke ();
  fill(random(156),random(30),random(190),50);
  rect(0,i, width, 10);
  rect (i,0,10,height);
}

