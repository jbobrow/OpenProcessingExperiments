
//Tang Sui Yan 53091644
//Processing Assignment3
PImage bg,tree;
int num=200;//define variable value
int[] x=new int[num];//set x value 
int[] y=new int[num];//set y value

void setup() {
  bg= loadImage("cm3saddad.jpg");//set background to the inserted image
  //http://2048x.org/background-wallpapers/22/backgrounds-hd-multi-color-pop-art-effect-skulls-wallpaper-for-ipad-4.html
  size(bg.width,bg.height);//address image's size
  imageMode(CENTER);//set image' position 
  tree=loadImage("theGreatTree_theGreatTree_2.png");
  //http://kineme.net/Discussion/DevelopingCompositions/PNGalphachanneldoesntworkSnowLeopard
  tree.resize(1000,1000);//reset the image size to 1000x1000  
  noStroke();
  smooth();
  fill(230,100);
}

void draw(){
  background(bg);
  image(tree,mouseX,mouseY);//movavble image according to mouse
  for(int i= num-1;i>0;i--){
    x[i]=x[i-1];
    y[i]=y[i-1];
  }
  x[0]=mouseX;
  y[0]=mouseY;
  for(int i=0;i<num;i++){
    ellipse(x[i],y[i],i/2.0,i/2.0);//size the ellipse value of size
  }
}
  


