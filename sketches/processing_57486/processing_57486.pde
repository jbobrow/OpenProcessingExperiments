
Square s;
Square [] sList;
int finalIntMax;


void setup(){
 size (400, 400);
textSize(24);
finalIntMax= 10;
textAlign (CENTER);
println(s);
sList=new Square [finalIntMax];
s=new Square();
s.setup(10, 10, 30, 13, 4, color (250, 0, 0));
initSquares();
}

void initSquares(){
  for (int i=0; i<sList.length; i++){
sList[i]=new Square ();
sList[i].setup(random(100, width/2), random(100, width/2),random(10,50), random(2, 10), random(2, 10), color( random (0, 255),random (0, 255),random (0, 255)));
}
}

void draw (){
  fill (255, 25);
 rect (0, 0, width, height);
 for (int i = 0; i<sList.length; i++){
  sList[i].bounce (); 
 }
 
}



