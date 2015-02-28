

int numberOfTriangles = 5;

int[] x = new int[numberOfTriangles];
int[] y = new int[numberOfTriangles];
//int[] x = {200, 400, 350};
//int[] y = {350, 400, 75};

//int diameter;
color triangleColor = color(135,35,125);

void setup(){
  size (400,400);
  for (int i = 0 ; i < numberOfTriangles; i++){
    x[i]=100+80*i;
  }

  for (int i = 0 ; i < numberOfTriangles; i++){
    y[i]=80+0*i;
  }

//  diameter = 70;
}

void draw(){
  background(0);
  fill(triangleColor);
  for (int i = 0 ; i < numberOfTriangles; i=i+1){
    triangle(x[i],y[i],x[i]+10,y[i]+10,x[i]+20,y[i]+20);

  }

  // rect(0,0,width/3,height/3);
}



