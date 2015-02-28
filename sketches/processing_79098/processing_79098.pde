
PImage bild;


void setup(){
size(640,480);
frameRate(30);
smooth();

bild=loadImage("UI.jpg");//bild laden
//image(bild,0,0);//bild darstellen name, position,position,größeX,größeY
}



void draw(){
  noStroke();

  float cs =6+mouseX;
 int x=int(random(width));
 int y=int (random(height));

  
  
  for (int j=0;j<height/cs+1;j++){
    for (int i=0; i<width/cs+1;i++){
       fill(bild.get(int(i*cs),int(j*cs)));
        rect(i*cs,j*cs,cs,cs);
    }
  }

}


