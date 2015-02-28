
//Matthew Quesada, Computer Programming Mods 4-5
//Hundred Random Shapes

void setup()
{
  size(1100,1100,P3D);
  frameRate(5);

}

void draw()
{
  background(0);
  int num=1;
  while (num<101)
  {
   int transx=int (random(0,1000));
   int transy=int (random(0,1000));
   int rotx=int (random(0,2));
   int roty=int (random(0,2));
  translate(transx, transy, 0);
  noStroke();
  fill(random(255),random(255),random(255),100);



  
  rotateX(rotx);
  rotateY(roty);
  
  

  box(random(50,100));
  rotateY(-roty);
  rotateX(-rotx);
  translate(-transx,-transy,0);
  num=num+1;
  }
}
