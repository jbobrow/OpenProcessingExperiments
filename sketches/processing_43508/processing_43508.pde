
rainDrop[] myDrop;

int num=20;
void setup(){
  size(300, 300);
  //say how lon the array is
  myDrop=new rainDrop[num];
  
  //for each array p[osition make a drop
  
  for (int i=0; i<num; i++){
  //setip each raindrop slightly differently
  myDrop[i] = new rainDrop(i*(width/num),100,int(random(2,6)));
  }
}

void draw(){
  background(0);
 for(int i=0; i<num;i++){
   
 
  myDrop[i].move();
  myDrop[i].showDrop();
 }

}


