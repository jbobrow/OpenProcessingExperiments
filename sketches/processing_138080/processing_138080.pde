
//**<<palomilla enmascarada>>**//

//global variables
PImage miImagen;
PImage  mascara;
PImage alfa;
int cantidad;
//setup
void setup(){
size(1200,800);
colorMode(HSB,100);
miImagen = loadImage("mariposa.JPG");
miImagen.resize(1200,800);

}
//draw
void draw(){
mascaraNest();
//image(miImagen,0,0,1200,900);
creatingMask();
}

//this function will modify the mask , while the mouse is changing  the position and it is pressed the Quantity of circles will increase
void creatingMask(){
  cantidad=int(map(mouseX,0,width,10,300));
if(mousePressed==true){
//this function will create a new mask image everytime the mouse is clicked
  for(int i=0; i<=cantidad;i++){
    int x,y,rad;
    x=int(random(0,width));
    y=int(random(0,height));
    rad=int(random(10,20));
    noStroke();
    fill(20,66,random(20,30),random(0,105));
    ellipse(x,y,rad,rad);
  
  }
  image(alfa,0,0);
save("data/mariposa.JPG");
}
}
//this function will apply the mask over the image taht we are using
//also it will apply some filters
void mascaraNest(){
 if(mousePressed){
alfa=loadImage("alfa.png");   
mascara= loadImage("data/mascara.JPG");
mascara.filter(GRAY);
mascara.filter(INVERT);

image(miImagen,0,0);
//this image will appear always in the original way
alfa.resize(1200,800);
//mascara.mask(alfa);
miImagen.mask(mascara);
image(miImagen,0,0);

 }
 }

/*At summary I tried with this project to generate a destructive inteeractive composition, wich while the user interacts with it it deforms the basic image, it is also a methaphore of how the society  has made a  print over the ecosystem and how that print
is irreversible , but however the mother nature is bigger than the  society , we are part of her, and in that way she will always keeps the beaty over the destruction*/


