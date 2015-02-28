
PFont font1;
PFont font2;
PImage img0, img1, img2, img3, img4, img5, img6, img7;

String p1 ="Stray Bird";
String p2 ="Stray birds of summer come to my window to sing and fly away.And yellow leaves of autumn, which have no songs, flutter and fall there with a sign.";
String p3 ="O Troupe of little vagrants of the world, leave your footprints in my words.";
String p4 ="The world puts off its mask of vastness to its lover.It becomes small as one song, as one kiss of the eternal.";
String p5 ="It is the tears of the earth that keep here smiles in bloom.";
String p6 ="The mighty desert is burning for the love of  a bladeof grass who shakes her head and laughs and flies away.";
String p7 ="If you shed tears when you miss the sun, you also miss the stars.";
String p8 ="The sands in your way beg for your song and your movement, dancing water. Will you carry the burden of their lameness?";

String p9 ="... ...end";

int page =0;


void setup(){
  size(800,600);
  
  font1= loadFont("Helvetica-200.vlw");
  font2= loadFont("Helvetica-48.vlw");
  
  img0 = loadImage("0.jpeg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("6.jpeg");
  img6 = loadImage("7.jpeg");
  
}


void draw (){
  textAlign(CENTER, CENTER);

   if(page==0){   
     image(img0, 0, 0);
     fill(104,73,180);
     textFont(font1,50);
     text(p1, width/2,300);
   
 }else if(page==1){
    
  image(img1, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p2, 450,140);

 }else if(page==2){

  image(img2, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p3, width/2,260);
  
}else if(page==3){
  
  image(img3, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p4, width/2,260);
  
}else if(page==4){

  image(img4, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p5, width/2,260);
  
}else if(page==5){
  
  image(img5, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p6, 280,200);
  
}else if(page==6){
  
  image(img6, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p7, 550,240);
  
}else if(page==7){
  
  image(img2, 0, 0);
  fill(241,49,89);
  textFont(font2,10);
  text(p8, width/2,260);
  
}else if(page==8){
  
  image(img4, 0, 0);
  fill(241,49,89);
  textFont(font2,20);
  text(p9, width/2,280);
  
}
 }
void mousePressed(){
  
 if(page==0){
   page=1;
  
  
  
 } 
 else if(page==1){
   
   page=2;
 }
 else if(page==2){
   
   page=3;
 }
 else if(page==3){
   page=4;
  
 }else if(page==4){
   
   page=5;
 }else if(page==5){
   
   page=6;
 }else if(page==6){
   
   page=7;
 }else if(page==7){
   
   page=8;
 }else if(page==8){
   
   page=9;
 }
}


