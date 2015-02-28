
//Rachel Toups Homework #5 - Frieze Patterns
//I think I may have gotten confused about what some of the patterns are 
//supposed to do (like what half a horizontal mirror is
//supposed to mirror), but i think the errors are at least consistent. 
//Hopefully. 

PImage tri;
PImage untitled;
int col;
int chcol;

void setup(){
  size(800,600);
  colorMode(HSB,360,100,100,100);
  background(75,2,100);
  tri=loadImage("celestite.gif");
  untitled=loadImage("Untitled.gif");
  col=0;
  chcol=1;
}

void draw(){
  noStroke();
  col+=chcol;
  for(int j=0;j<500;j+=151){
    for(int k=0;k<300;k+=201){
    pushMatrix();
      translate(100,50);
       if(mousePressed && mouseX>525 && mouseX<575 && mouseY>75 && mouseY<125){
           image(tri,k-50,j);} //p111  
       else if(mousePressed && mouseX>600 && mouseX<650 && mouseY>75 && mouseY<125){
           imageFlip(tri,k-50,j,"h2");}  //p1m1
       else if(mousePressed && mouseX>675 && mouseX<725 && mouseY>75 && mouseY<125){
           imageFlip(tri,k-50,j,"v2");} //pm11        
       else if(mousePressed && mouseX>525 && mouseX<575 && mouseY>150 && mouseY<200){
        pushMatrix();  //pmg2  
              if(k%2==0){ 
              translate(115,575);
              rotate(radians(180));}
            imageFlip(tri,k-50,j,"v2");
            popMatrix();}
        else if(mousePressed && mouseX>600 && mouseX<650 && mouseY>150 && mouseY<200){
          pushMatrix();  //p112  
              if(j%1==0){ 
                if(k%2==0){
              translate(115,485);
              rotate(radians(180));}}
              image(tri,k-50,j);
            popMatrix();}
        else if(mousePressed && mouseX>675 && mouseX<725 && mouseY>150 && mouseY<200){
          pushMatrix();    
            if(k%2==0){ 
              translate(115,575);
              rotate(radians(180));}
            imageFlip(tri,k-50,j,"h2");
            popMatrix();}
            else if(mousePressed && mouseX>600 && mouseX<650 && mouseY>225 && mouseY<275){
        pushMatrix();  //pmm2  
              if(k%2==0){ 
              translate(115,500);
              rotate(radians(180));}
            imageFlip(untitled,k-50,j,"v2");
            popMatrix();}
        else{
        fill(75,2,100);
        rect(-200,0,width,height);}
        popMatrix();}
        
  }
        
  fill(0,100,100);//red square
    stroke(0,100,80);
      rect(525,75,50,50);
        if(mouseX>525 && mouseX<575 && mouseY>75 && mouseY<125){
        fill(0,100,col);
          rect(525,75,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;} 
        }
    fill(0,0,100);
    text("P111",535,105);
  stroke(40,60,80);//orange square
    fill(40,60,100);
      rect(600,75,50,50);
        if(mouseX>600 && mouseX<650 && mouseY>75 && mouseY<125){
          fill(40,60,col);
          rect(600,75,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("P1M1",610,105);
  stroke(60,60,80);//yellow square
    fill(60,60,100);
      rect(675,75,50,50);
         if(mouseX>675 && mouseX<725 && mouseY>75 && mouseY<125){
          fill(60,60,col);
          rect(675,75,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("PM11",685,105);
  stroke(120,60,65);//green square
    fill(120,60,65);
      rect(525,150,50,50);
       if(mouseX>525 && mouseX<575 && mouseY>150 && mouseY<200){
          fill(120,60,col);
          rect(525,150,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("PMG2",533,180);
  stroke(172,60,40);//turquoise square
    fill(172,60,61);
      rect(600,150,50,50);
       if(mouseX>600 && mouseX<650 && mouseY>150 && mouseY<200){
          fill(170,60,col);
          rect(600,150,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("P112",610,180);
  stroke(240,60,40);//blue square
    fill(240,60,60);
      rect(675,150,50,50);
       if(mouseX>675 && mouseX<725 && mouseY>150 && mouseY<200){
          fill(240,60,col);
          rect(675,150,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("P1G1",685,180);
  stroke(260,60,40);//purple square
    fill(260,60,60);
      rect(600,225,50,50);
       if(mouseX>600 && mouseX<650 && mouseY>225 && mouseY<275){
          fill(260,60,col);
          rect(600,225,50,50);
            if(col>100){
              chcol=-1;}
            if(col<50){
              chcol=1;}
      }
      fill(0,0,100);
      text("PMM2",608,255);
  for(int i=0; i<800;i+=10){
    pushMatrix();
    translate(width/2,height/2);
    image(tri,125,50);
    popMatrix();
    //rotate(radians(mouseX));
    
    
    
  }
  noStroke();
  fill(70,2,100);
  rect(0,0,400,70);
  rect(0,515,600,600);
  stroke(70,2,75);
  noFill();
  rect(50,70,415,445);
  rect(47,67,421,451);
  
}











//imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){

 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();

 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }

   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);

 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }

 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}



