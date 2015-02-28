
void setup (){
size(200,200);
background(0);
}
 
int x;
int y;
int z;
 
 void draw (){ 
  stroke (255);
for (int x=40; x<161; x=x+30){
    for (int y=40; y<190; y=y+30)
      ellipse (x, y, 9,9);
      
      for (int z=30; z<160; z+= 30){
              for (int j= 50; j<165; j=j+30)
        rect (z+10, j, 1, 10);
      line (x+20, z+10,x+10,z+10);
                  
      }
}
 }
