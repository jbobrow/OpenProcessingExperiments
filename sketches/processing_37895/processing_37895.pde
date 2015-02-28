
void setup(){
size (800, 800);
background (255);
strokeWeight (3);
smooth();
}

void draw (){ 
background (255);
int lineHNumb = height ;
int linewNumb = width ;
int space = 50 ;


 
for (int i = 1; i < linewNumb; i++) {
  for (int h = 1; h < lineHNumb; h++) {
     
  float pos = map (i, width, mouseX, 1, 10);
   
  stroke (0);
  strokeJoin(ROUND);
  line (0, i*space, width, i*space);
  line (i*space, 0,  i*space, height);
  line (0, i*space+pos, width-i*space+pos, height);
  line (width, i*space+pos, i*space+pos, height);
  line (width-i*space+pos, 0, 0, height-i*space+pos);
  line (i*space+pos, 0, width, height-i*space+pos);
    }
  }
}
   

                
                
