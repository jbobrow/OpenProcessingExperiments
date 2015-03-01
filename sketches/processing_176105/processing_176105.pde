
void setup()

{

  size(400,400);

  background(255);

  int e=0;

}

void draw()

{

 for (int e = 5; e < 400;  e = e+5) { 

 line (e,height,e,0);
 line(0,e,width,e);

}

}
