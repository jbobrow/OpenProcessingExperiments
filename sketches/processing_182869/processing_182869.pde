
size(900,450);
noStroke();
background(111,211,217,100);
for(int i=0; i<=900; i=i+15){//bridge lines
  //for(int j=50; i<300; i=i+15){
    fill(232,102,85);
    rectMode(CORNER);
    rect(i,50,3,230);
  //}
}
fill(111,211,217);//arc part of bridge (color of sky)
stroke(232,102,85);
strokeWeight(3);
arc(450,50,600,440,0,PI,OPEN);
strokeWeight(5);
arc(450,290,1100,50,PI,PI+PI,OPEN);
triangle(-5,50,-5,220,149,50);
triangle(905,50,905,220,750,50);
stroke(111,211,217);
line(0,50,150,50);
line(750,50,900,50);
fill(232,102,85);//pillars
noStroke();
quad(135,48,155,48,165,900,125,900);
quad(745,48,765,48,775,900,735,900);
rectMode(CENTER);//water
fill(99,154,166);
rect(450,400,900,100);
for(int i=0; i<900; i=i+10){//waves
float r=random(350,360);
float s=random(10,30);
ellipse(i,r,s,s);
}

