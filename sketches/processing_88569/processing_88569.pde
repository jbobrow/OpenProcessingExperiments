
float x;
float y;
float d;
color[] oscar = {#003056, #04518C, #00A1D9, #47D9BF, #99F2C9};
color[] dirt = {#5A3615, #9A5C23, #D98232, #E68935, #C0722C};
color[] ute = {#5A0B06, #9A130B, #D91B0F, #E61D10, #C0180D};

size(400, 400);
smooth();
background(255);

for (float i=.5; i<6; i++){
  noStroke();
  fill(oscar[int(random(5))]);
  x=i*(width/5);
  y=i*(height/5);
  d=50;
  d*=10;
  rect(x, y, d, d);
}

for (float i=.4; i<6; i++){
  noFill();
  strokeWeight(10);
  stroke(dirt[int(random(5))]);
  x=i*(width/5);
  y=i*(height/5);
  d=50;
  rectMode(CENTER);
  rect(x, y, d, d);
}

for (float i=.4; i<6; i++){
  noStroke();
  fill(ute[int(random(5))]);
  x=i*(width/5);
  y=i*(height/5);
  d=30;
  ellipseMode(CENTER);
  ellipse(x, y, d, d);
}
