
void setup(){
  size (550,300);
  background (110,178,232);
  noFill();
}

void draw(){
  
stroke(255);
bezier (0,150,20,150,50,100,80,120);
bezier(80,120,100,120,110,110,120,150);
bezier(120,150,200,110,210,140,240,150);
bezier(240,150,250,155,230,155,310,120);
bezier (310,120,350,150,380,200,460,100);
bezier(460,100,470,70,460,70,550,150);


}

