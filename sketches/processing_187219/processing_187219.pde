
int VGAP = 5;
int HGAP = 15;

int NROWS = 13;
int NCOLS = 8;

void setup(){
 background(255);
 size(200,200);
 strokeWeight(5);
 strokeCap(ROUND);
 fill(0);
 smooth();
 ellipseMode(RADIUS);
}


void draw(){
  for(int i = 0; i < NROWS; i++){
    for(int j = 0; j < NCOLS; j++){
     ellipse(3+HGAP+j*(10+HGAP),3+VGAP+i*(10+VGAP),2,2); 
    }
  }
}


