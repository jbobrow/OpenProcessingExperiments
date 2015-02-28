
//NESTED FOR LOOPS
//with IF STATEMENTS

void setup () {
size(500, 500);

noStroke();
background(255);

}

void draw() {

for (int x = 30; x< width-20; x+=100)
{
  for (int y = 100; y<height-20; y+=20)
  {
 
    if (x<=width/3) {
      fill(42,187,255,5);
      beginShape();
      vertex (106,y+20);
      vertex (181,x+10);
      vertex (194,130/2);
      vertex (298,y);
      endShape();
    }
    
    else {
      fill(255,222,42,2);
      beginShape();
      vertex (x+10,245);
      vertex (299,338);
      vertex (454,334);
      vertex (298,100);
      vertex (200, x*100);
      endShape();
    }
  }
}
}


