
float mida;
float marge;

void setup(){
  background(150);
  size(400,400);
  mida=width/4;
  marge=mida/4;
}

void draw(){
 stroke(0);
fill(255);
rect(marge,marge,mida,mida);
rect((marge*2)+mida,marge,mida,mida);
rect((marge*3)+(mida*2),marge,mida,mida);
rect(marge,(marge*2)+mida,mida,mida);
rect((marge*2)+mida,(marge*2)+mida,mida,mida);
rect((marge*3)+(mida*2),(marge*2)+mida,mida,mida);
rect(marge,(marge*3)+(mida*2),mida,mida);
rect((marge*2)+mida,(marge*3)+(mida*2),mida,mida);
rect((marge*3)+(mida*2),(marge*3)+(mida*2),mida,mida);
}

