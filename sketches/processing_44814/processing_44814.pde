
PImage backgroundImage;

final int MaxAmount=100; //max. amount of topping pieces

int topping;
int numTopping;
int toppingx[];
int toppingy[];
PImage toppingType[];

void setup(){
size (900, 675);
backgroundImage=loadImage("images/sundae.gif");
numTopping=0;
topping=1;
toppingx=new int [MaxAmount];
toppingy=new int [MaxAmount];
toppingType=new PImage [MaxAmount];
}
void draw(){
  image(backgroundImage, 0, 0);
  if (numTopping>0){
    for (int count=0; count<numTopping; count=count+1){
      image (toppingType[count], toppingx[count], toppingy[count]);
    }
  }
}

void mousePressed (){
  if (topping==1){
    toppingType[numTopping]=loadImage("images/sprinkle_coconut.gif");
  }
  if (topping==2){
    toppingType[numTopping]=loadImage("images/sprinkle_choco_chips.gif");
  }
  if (topping==3){
    toppingType[numTopping]=loadImage("images/sprinkle_caramel_chips.gif");
  }
  toppingx[numTopping]=mouseX-140;//140 is so the cursor is in middle of image, not top=left
  toppingy[numTopping]=mouseY-140;
  numTopping++;//increase topping by one
}

void keyPressed() {
  if(keyCode=='1'){
    topping=1;
  }
  if(keyCode=='2'){
    topping=2;
  }
  if(keyCode=='3'){
    topping=3;
  }
  if(key=='r'){
    numTopping=0;
  }
}

