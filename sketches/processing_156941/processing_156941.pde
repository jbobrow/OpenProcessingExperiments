


int a=width;
int[] array= {100,50,79,6,7,60,50,30,44};



void setup() {
 size(600,600); 
 background(0);
}

void draw()

 for(int x=0; x<8; x++){
   array[x]=array[x]*2;
  ellipse(array[x], 50+mouseY, array[x],array[x]);
  
}
}
