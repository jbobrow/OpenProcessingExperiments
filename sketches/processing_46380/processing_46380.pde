
PImage table;
PImage img0;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;

void setup() {
  size(628,500);
  table =loadImage("table.jpg"); //since it's the only image that doesn't need to be drawn
}

void draw() {

/*the following section determines the area in which the cursor need 
to be to select an image and make it grow*/
 if (mouseX>10 && mouseX<80 && mouseY>270 && mouseY<480){
   img0 = loadImage("feutre2.png");
 } 
 else{
  img0 = loadImage("feutre.png");
 }
  if (mouseX>90 && mouseX<150 && mouseY>180 && mouseY<480){
   img1 = loadImage("pencils2.png");
 } 
 else{
   img1 = loadImage("pencils.png");
 }
   if (mouseX>20 && mouseX<100 && mouseY>200 && mouseY<300){
   img2 = loadImage("craies2.png");
 } 
 else{
   img2 = loadImage("craies.png");
 }
    if (mouseX>170 && mouseX<210 && mouseY>280 && mouseY<440){
   img3 = loadImage("cutter2.png");
 } 
 else{
   img3 = loadImage("cutter.png");
 }
    if (mouseX>240 && mouseX<320 && mouseY>180 && mouseY<480){
   img4 = loadImage("spatula2.png");
 } 
 else{
   img4 = loadImage("spatula.png");
 }
    if (mouseX>310 && mouseX<350 && mouseY>180 && mouseY<480){
   img5 = loadImage("wood2.png");
 } 
 else{
   img5 = loadImage("wood.png");
 }
    if (mouseX>360 && mouseX<400 && mouseY>200 && mouseY<480){
   img6 = loadImage("argile2.png");
 } 
 else{
   img6 = loadImage("argile.png");
 }
    if (mouseX>390 && mouseX<470 && mouseY>230 && mouseY<480){
   img7 = loadImage("feutres2.png");
 } 
 else{
   img7 = loadImage("feutres.png");
 }
     if (mouseX>460 && mouseX<520 && mouseY>180 && mouseY<480){
   img8 = loadImage("brush2.png");
 } 
 else{
   img8 = loadImage("brush.png");
 }
      if (mouseX>480 && mouseX<600 && mouseY>180 && mouseY<480){
   img9 = loadImage("colour2.png");
 } 
 else{
   img9 = loadImage("colour.png");
 }
  
  
  
  
  image(table,0,0);
  image(img1,80,180);
  image(img0,-30,210);
  image(img2,20,100);
  image(img3,150,190);
  image(img4,220,170);
  image(img5,280,150);
  image(img6,330,170);
  image(img7,360,190);
  image(img8,400,170);
  image(img9,440,150);
  
    

  
  
  
  
}



