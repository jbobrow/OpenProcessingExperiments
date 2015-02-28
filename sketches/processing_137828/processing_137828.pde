
//Both sides of our world.
// ALL we are all responsible. It is our choice which photos will pass away.
// used mouse and key s(screenshot)
String[]imageNames={"0.jpg","1.jpg","2.jpg","3.jpg","4.png","5.jpg","6.jpg","7.jpg",
"8.jpg","9.jpg","10.jpg","11.jpg","12.jpg","13.jpg","14.jpg","15.jpg","16.jpg",
"17.jpg","18.jpg","19.jpg"};
 PImage[]images= new PImage[imageNames.length];
 void setup(){
  size (1000,1000);
 for(int i=0; i<= imageNames.length; i++ ){
   String imageName=imageNames[i];
  images[i]=loadImage(imageName);
}  
}

void draw() {
   background(#C0C2FA);

   if(mousePressed){
     textAlign(CENTER);
  fill(#AA0C21);
  textSize(42);
    text("It is our responsibility and choice",width/2,45);
  pushMatrix();
   float  x1 = map(mouseX+50, width,0, 600, width/2);
    float x2 = map(mouseX+50, width,0, 400,width/2+40 );
   float y1=map(mouseY+50,height,0, 0,height/4);
   float y2=map(mouseY+50,height,0, 500,height/4-30);
    float y3=map(mouseY+50,height,0,500,3*height/4);
   float y4=map(mouseY+50,height,0, 900,3*height/4);
   
 float r= random (0,imageNames.length);
// float r1= random (0,2);
 int ir=int(r);
 beginShape();
 
 PImage img19=images[19];
 image(img19,x1,50);
 PImage img18=images[18];
  image(img18,x2,50);
  PImage img2=images[2];
 image(img2,x1,200);
 PImage img3=images[3];
 image(img3,x2,200);
  PImage img4=images[4];
 image(img4,x1,370);
 PImage img5=images[5];
 image(img5,x2,370);
  PImage img6=images[6];
 image(img6,x1,550);
  PImage img7=images[7];
 image(img7,x2,550);
  PImage img12=images[12];
 image(img12,x1,750);
  PImage img13=images[13];
 image(img13,x2,750);
  PImage img16=images[16];
 image(img16,50,y1);
  PImage img17=images[17];
 image(img17,50,y2);
  PImage img8=images[8];
 image(img8,220,y1);
  PImage img9=images[9];
 image(img9,220,y2);
 PImage img14=images[14];
 image(img14,850,y1);
  PImage img15=images[15];
 image(img15,850,y2);
 PImage img10=images[10];
 image(img10,850,y3);
  PImage img11=images[11];
 image(img11,850,y4);
  PImage img0=images[0];
 image(img0,130,y4);
 PImage img1=images[1];
 image(img1,130,y3);
  endShape();
  popMatrix();
 
 
  }
}
void keyReleased (){
  if (key=='s' || key=='S') saveFrame ("screenshot.png");

}
void mouseDragged(){ 
  int z=50;
  int z= mouseX+200;
  int c=50;
  int c= mouseX+200;
  textAlign(CENTER);
  fill(#53A549);
  textSize(32);
    text("It is our responsibility and choice",z,c);}



