
int eSize = 10;

size(400,565);
background(255);
smooth();

for(int y=0; y<=height; y+=50){
  for(int x=0; x<=width; x+=50){
    
    if(x > 100 && x <300){
      fill(255,0,0);
    }
    else{
      fill(0);
    }
    ellipse(x,y,eSize,eSize);
    println("x=" + x + ", y=" + y);
  }
}
//haikeino maru no renzoku

rectMode(CENTER);
stroke(0);
strokeWeight(3);
fill(255,0,0);
rect(200,300,50,500);
noStroke();
fill(0);
quad(165, 45, 174, 50, 174, 560, 165, 560); 
quad(165, 45, 220, 45, 227, 50, 174, 50); 
quad(0,0,400,0,300,40,32,40);
//tyuuou no akai sikakuno tatemono

rectMode(CENTER);
stroke(0);
strokeWeight(3);
fill(255,255,0);
rect(50,300,50,240);
fill(0);
quad(10,175,25,180,25,400,10,400);
quad(18,175,65,175,80,180,28,180);
//hidarito migino kiiroitatemono to sono kage

for(int i=0; i<300; i+=30){
stroke(0);
strokeWeight(2);
line(300,206+i,0,273+i);
}
//mannakano renzokusuru yokosen

for(int i=0; i<200; i+=130) {
rectMode(CENTER);
stroke(0);
fill(255,0,0);
triangle(100+i, 200+i, 0+i, 20+i, 150+i, 200+i);
noStroke();
fill(0);
rectMode(CENTER);
rect(125+i,216+i,50,30);
triangle(0+i,20+i,100+i,200+i,100+i,230+i);
}
//akai sankakukei to sono kage no kurikaesi

stroke(0);
rectMode(CENTER);
fill(255,255,0);
rect(350,380,100,350);
//tenzyou

noStroke();
fill(0);
triangle(0,565,300,500,400,555);
triangle(300,206,400,265,400,206);
//zimenno kage

fill(0,0,0);
ellipse(0,420,280,280);
//kuroi en







