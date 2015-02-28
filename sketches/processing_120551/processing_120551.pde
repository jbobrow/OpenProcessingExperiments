
size(400,565);//gamenokisa
 
int COLMAX = 256;
int N = 30;
int R = 30;

 

 background(242, 202, 170 );//haikei
noStroke();
ellipseMode(CENTER);
int co = COLMAX / N;
int angle = 360 * 2 / N;
int move = width / (2 * N);
int dr = R / N;
 
 
for(int x = 0; x <= width; x += 20){//kurotosironomoyou
  
  if(x == width/2){ 
    fill(255);
  }
  else{   
    fill(0); 
  }
  ellipse(x, height/2, 200, 200);
  println("x=" + x);
}
 
 
translate(width / 2, height / 2);//mizutamamoyou
for(int i = 0; i < N; i++)
{
  pushMatrix();
  rotate(radians(i * angle));
  translate(i * move, 0);
  fill(i * co, COLMAX, COLMAX);
  ellipse(0, 0, dr * i, dr * i);
  popMatrix();
}
 
fill(204,0,0);//chusinakamaru
ellipse(0,0,120,120);
 

stroke(0);//sen    
strokeWeight(2);
line(0, 300, 0, 100);


