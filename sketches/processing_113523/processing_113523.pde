
int eSize=10;

size(800,800);
background(20,20,0);

for(int x=0; x<=width; x+=2){
  if(x==100|| x==200|| x==300){
  }
  else{
    stroke(x,x,0);
  }
  line(x,0,x,height);
  
  if(x <=500){
    stroke(150,50,0);
  println("x="+x);
}
}

rectMode(CENTER);
stroke(100,250,0);
strokeWeight(5);
fill(0,100,200,127);
rect(500,600,400,600);

rectMode(CENTER);
stroke(50,100,0);
strokeWeight(5);
fill(255,253,107,127);
rect(450,90,700,350);

rectMode(CENTER);
stroke(0,252,243);
strokeWeight(5);
fill(251,187,255,127);
rect(100,500,350,350);


rectMode(CENTER);
stroke(0,250,100);
strokeWeight(5);
fill(200,0,100,127);
rect(150,300,100,50);

rectMode(CENTER);
stroke(50,50,50);
strokeWeight(5);
fill(140,70,190,127);
rect(90,100,500,150);

rectMode(CENTER);
stroke(0,100,150);
strokeWeight(5);
fill(140,70,190,127);
rect(190,200,100,50);

rectMode(CENTER);
stroke(0,250,250);
strokeWeight(5);
fill(40,170,110,127);
rect(350,300,100,150);

stroke(255,255,0,127);
noFill();
ellipse(300, 200, 300, 300);

stroke(255,255,0,127);
noFill();
ellipse(350, 100, 200, 200);

stroke(255,255,0,127);
noFill();
ellipse(400, 50, 100, 100);

for(int i=0; i<200; i+=1) {
  ellipse(i, i, eSize, eSize);
  fill(180,251,10,127);
}

noStroke();
fill(255,255,255);
ellipse(200,700,200,200);

noStroke();
fill(255,255,255);
ellipse(600,700,100,100);

noStroke();
fill(255,255,255);
ellipse(600,500,50,50);

stroke(255,255,0,127);
noFill();
ellipse(600, 700, 300, 300);

stroke(255,255,0,127);
noFill();
ellipse(650, 700, 200, 200);

stroke(255,255,0,127);
noFill();
ellipse(700, 700, 100, 100);


