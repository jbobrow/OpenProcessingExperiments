
  Beary scary[];
 
 int NUM_BEARS= 4;



void setup() {
  
   size(  800,800 );
   
color shirt[];

shirt = new color[NUM_BEARS];
 
  
  for ( int i=0; i<NUM_BEARS; i++ ) {
int r = i*mouseX*10;
int g = i*56;
int b = 15 - i*50;

shirt[i] = color(r,g,b);
}

scary = new Beary[NUM_BEARS];
for ( int i=0; i<NUM_BEARS;i++){
  int x = 150+ i*100;
  int y = 350 + i*50;
  
  scary[i] = new Beary ("scary"+i,x,y, shirt[i]);
}
}

void draw() {
  
background(255);

smooth();

 if ( mousePressed && ( mouseButton == LEFT)) {
     for (int i=0; i<NUM_BEARS; i++){
       scary[i].reposition(mouseX,mouseY);
     }
}
 
 for (int i=0; i<NUM_BEARS; i++){
 scary[i].display ();
 }
}

void mousePressed() {
  for (int i=0; i<NUM_BEARS; i++){
    scary[i].select(mouseX,mouseY);
    }
}
void mouseReleased() {
  for ( int i=0; i<NUM_BEARS; i++ ) {   
    scary[i].deselect();                   
  }
  }

