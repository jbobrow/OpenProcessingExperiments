
int numshape= 100;
int move=1;

int [] posx= new int [numshape];
int [] posy= new int[numshape];
int [] size= new int [numshape];

void setup() {
  size(600, 600);
  for (int i=0; i< numshape; i++) {
    for (int j=0; j< numshape; j++) {

      posx[i]=i*size[i];
      posy[j]=j*size[j]+size[j]/2;
      size[i]=i;
    }
  }
}

void draw() {
  background(255);
  for (int i=0; i <numshape; i++) {
    for (int j=0; j<numshape; j++) {
      fill(0);
      stroke(0,90,0);
      rect(posx[i], posy[j], size[i], size[i]);
    }
  }
   if(posy[3]>height||posy[3]<0){
     move*=-1;
   
   }
 
  posy[3]+=move;
}



