
int s = 50;
int i=0;
int x;
int y;
int aW=30; //arc width
int aH=30; //arc height
int aS=20;


void setup() {
  size(500, 500);
  smooth();
}


void draw() {
  background(0);
smooth();   
   for (int j =0;j<330;j+=30){
     for(int y=0;y<330;y+=30){
 
       fill(255);
        arrrc(75+j,75+y,i+j/2+y/2);
     }
   }
   

  fill(255);
  arc(75, 75, 25, 25, radians(i), radians(i+180));

  i+=40;
  if (i==360) {
    i=0;
  }
}

void arrrc(int x, int y, int i){
  arc(x, y, 25, 25, radians(i),radians(i+180));
}


                
                
