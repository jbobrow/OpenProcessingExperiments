
void setup(){ 
  //tree and stub
  size(400,600); 
  background(230,30,39); 
  smooth(); 
  textAlign(CENTER); 
  frameRate(5); 
  strokeWeight(5); 
  fill(96,232,52); 
  triangle(100,400,300,400,200,100); 
  frameRate(15); 
  fill(108,54,27); 
  quad(175,425,225,425,225,400,175,400); 

strokeWeight(1);
stroke(255,236,23);

//star
  fill(255, 236, 23);
  triangle(200, 150, 175, 100, 225, 100);
  triangle(175, 125, 225, 125, 200, 75);

 }
  
void draw(){ 
//ornaments
  frameRate(5);
fill(random(255),0,0);
ellipse(200,174,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(180,220,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(223,239,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(199,271,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(164,294,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(230,306,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(153,332,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(248,344,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(196,361,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(266,378,21,21);

frameRate(5);
//fill(random(255),0,0);
ellipse(129,376,21,21);
  
//Words  
  fill(random(255),0,0); 
  textSize(26); 
  text("Merry Christmas!",width/2, 500);

 strokeWeight(1);
 
 stroke(255, 255, 255);
  
{ 
  for (int i = 0; i < 10; i = i+1)
    for (int j=0; j<10; j=j+1)
{      point(random(i*40, (i+1)*40), random(height));
}
 
}
}


