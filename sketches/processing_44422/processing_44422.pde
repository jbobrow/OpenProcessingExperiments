

int numimages=5;//the number of images I have is 5
PImage[]images; //this is my image array
int iCurrent = 0;

String txt = "Please use a,s,d,f and g to navigate";




void setup() {
  size (900, 600);
  PFont font;
  font= loadFont ("ShoppingList-48.vlw");
  fill(0);
  textFont (font,40);
  text(txt,230,50);



  imageMode(CENTER);

  images=new PImage[numimages];
  for (int i=0; i<numimages; i++) {
    images[i] = loadImage(i + ".jpg");
  }
}

void draw() {
  image(images[iCurrent], width/2, height/2); //start my image in the middle

  if ((keyPressed==true)&&(key=='a')){
    iCurrent=1;
  }
      if ((keyPressed==true)&&(key=='s'))
    iCurrent=2;
   
    if ((keyPressed==true)&&(key=='d'))
    iCurrent=3;
    
    if ((keyPressed==true)&&(key=='f'))
    iCurrent=4;
    
    if ((keyPressed==true)&&(key=='g'))
    iCurrent=0;
   }

   
 






