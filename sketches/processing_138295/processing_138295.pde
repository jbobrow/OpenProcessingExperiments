
color[] linecolor = {#FF6138, #FFFF9D, #BEEB9F, #79BD8F, #00A388};
color[] palette = linecolor;
int counter = 0;
PImage img;
PImage imgMask;
int line = 0;

//setup()  
void setup(){
  size(960, 600);
  colorMode(RGB);
  background(#FFFFFF);
  img = loadImage("Space.jpg");  
  image(img, 0, 0); 
  imgMask = loadImage("Space.jpg"); 
  img.mask(imgMask);
  imageMode(CENTER);
}

//draw()
void draw (){ 
   if (mousePressed){     
     counter++;
     if(mousePressed== true){
       strokeWeight(random(1,5));
       pushMatrix();
       stroke(palette[int(random(0,4))]);
       float r = mouseX*sin(mouseY);
       if(line==0){
         noFill();
         ellipse(mouseX, mouseY, r, r);
       }
       if(line==1){
         noFill();
         line(mouseX-r*cos(radians(counter)), mouseY-r*sin(radians(counter)), mouseX+r*cos(radians(counter)), mouseY+r*sin(radians(counter)));
       }
       if(line==2){
         noFill();
         line(mouseX-r*cos(90), mouseY-r*sin(90), mouseX+r*cos(90), mouseY+r*sin(90));
         line(mouseX+r*sin(90), mouseY+r*cos(90), mouseX-r*sin(90), mouseY-r*cos(90));
       }
       if(line==3){
         noFill();
         triangle(mouseX, mouseY-r, mouseX-r, mouseY+r/2, mouseX+r, mouseY+r/2); 
       }
       if(line==4){
         noFill();
         rect(mouseX, mouseY, r, r, random(1,3));
       }
       if(counter==mouseY){
         counter=0;
       }
       popMatrix();
       image(img, width/2, height/2);
     }
   }
 }

//keyPressed()
void keyPressed(){  
  if(key==DELETE || key==BACKSPACE){
   img = loadImage("Space.jpg");
   image(img, 0, 0);
  }
  if(key=='s' || key=='S'){
   saveFrame("screenshot.png");
  } 
  switch(key){  
    case '1':   
      line = 1;
    break; 
    case '2':  
      line = 2;
    break;    
    case '3':                            
      line = 3;
    break;
    case '4':  
      line = 4;
    break;
  }
}

