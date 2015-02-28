
PImage bild;

int mode = 0;
int modem = 0;
int c = 0;

void setup(){
  size (640,800);
  smooth();
  frameRate(25);
  bild = loadImage("bild.jpg");
  
}

void draw(){
  
  noStroke();
  background(0);
  
 c = mouseX+5;
  
  if(mode == 0){
  
   for ( int i = 0; i<width/c;i++){
    for ( int j = 0; j<height/c;j++){
      int i1 = i*c;
      int j1 = j*c;
      fill(bild.get(i1,j1) );
       triangle(i*c,j*c,i*c-(2/c),j*c-c,i*c+c,j*c);
//        fill(random(255),0,random(255));
         triangle(i*c,j*c,i*c+(2/c),j*c+c,i*c-c,j*c);
    }
    }
  }
  
  if (mode == 1){

   for ( int i = 0; i<width/c;i++){
    for ( int j = 0; j<height/c;j++){
      int i1 = i*c;
      int j1 = j*c;
      color f = bild.get(i1,j1);
      
      float cs = brightness(f)/10;

      fill(f);
      ellipse(i*c,j*c,cs,cs);
    }
   }
  }
    
}

void keyPressed(){
  
  if(key == '1'){
    mode=1;
  }
  
  if(key == '2'){
    mode = 0;
  }
}
      


