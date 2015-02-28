
size(200,200);
int resolucion = 10;

for(int i = 0;i < width; i = i + resolucion){          
  line(0,i,width,i);
  line(i,0,i,height);
}

