
size(500, 500);

fill(25,   25,  112 );
stroke(139,    28,  98);
strokeWeight(1);
for(int i = 0; i < 101; i++)
{
  for(int j = 0; j < 101; j++){
     
    ellipse(20*i, 10*j, 30, 30);
  }
}

//fill (139,    28,  98, 50);
//noStroke();
//triangle (500,0,250,250,500,500);

fill (139,    28,  98, 50);
noStroke();
triangle (0,0,250,250,0,500);
triangle (0,0,250,400,0,500);
triangle (0,0,250,100,0,500);

fill(25,   25,  112 );
stroke(139,    28,  98);
//rect1
pushMatrix();
translate(50,50);
rotate (radians(30));
rect(0,0,50,50);
popMatrix();
//rect2
pushMatrix();
translate(70,70);
rotate (radians(60));
rect(200,100,70,70);
popMatrix();
//rect3
pushMatrix();
translate(100,100);
rotate (radians(20));
rect(30,10,100,100);
popMatrix();
