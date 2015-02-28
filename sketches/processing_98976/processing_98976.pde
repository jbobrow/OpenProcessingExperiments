
//separation of code into tabs makes it easier to handle
//each tab has its own separate file


void draw(){
  background(204);
  randomSeed(0);{x1+=0.5;
x2+=0.5;
x3+=0.5;
x4+=0.5;
x5+=0.5;
for(int i =0; i<x.length;i++){
    x[i]+=0.5;
    float y=i*0.4;
    arc(x[i],y,12,120,5,5.76);}

arc(x1,300,20,20,0.52,5.76);
arc(x2,900,20,20,0.52,5.76);
arc(x3,600,20,20,0.52,5.76);
arc(x4,500,20,20,0.52,5.76);
arc(x5,560,20,20,0.52,5.76);

}
  
  owl(410,410,12,13);
 
  owl(400,500,234,23);
  for(int i=70;i<width+140;i+=140){
    int gray=int (random(0,102));
    float scalar=random(0.25,1.0);
    owl(i,100,gray,scalar);
    float q=offset+cos(angle)*scalar;
  float w=offset+sin(angle)*scalar;
  owl(40,40,60,q);
  angle+=speed;
  
}
owl(100,300,10,400);
owl(200,301,135,40);
owl(114,310,10,400);
owl(142,500,10,460);
owl(240,31,600,640);
owl(123,340,101,405);
}


