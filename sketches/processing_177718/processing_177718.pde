
//Working with Images in Processing

//Declare a PImage variable type
PImage prag;
PImage nyct;
PImage beso;
PImage begr;
PImage pro1;
int flag = 0;
int colora0 = #FFEA00;
int colora1 = #FFEA00;
int colora2 = #FFEA00;
int colorb0 = #00FF01;
int colorb1 = #00FF01;
int colorb2 = #00FF01;
int flagca = 0;
int flagcb = 0;

//Load an image file from HDD
/*Don't forget to add the file
to your sketch 'data' folder */
void setup() {
  size (800, 600);
  colorMode(HSB, 360, 100, 100, 100);
  noFill();
  background(360);
  prag = loadImage("source-image-3.png");
  nyct = loadImage("source-image-1.png");
  beso = loadImage("source-image-2.png");
  begr = loadImage("source-image-4.png");
  pro1 = loadImage("project-1.png");
  textSize(32);
  fill(#0200AD);
  text("Introduction to Computational Arts", 10, 50); 
  text("Project 3:", 10, 100);
  text("Bringing It All Together", 10, 150);
  textSize(42);
  fill(#FF0044);
  text("Press any key to continue", 10, 350);
  textSize(18);
  fill(#000000);
  text("by Skinwalker, 2014", 550, 550);
  textSize(14);
  text("under CreativeCommons 3.0 license", 550, 570);
      
}  

void keyReleased(){
  if(flag == 0){
    flag = 1;
    noFill();
    background(360);
    textSize(32);
    fill(#000000);
    text("Click at any point", 10, 30); 
    fill(#FF0044);
    text("- L-click & release  or  L-click & drag", 10, 100);
    fill(#000000);
    text("or", 10, 190);
    fill(#FF0044);
    text("- R-click", 10, 260);
        
  }
  switch(key){
    case '1':
      colora1 = #8FFF00;
      flagca = 1;
      break;
    case '2':
      colora2 = #0092FF;
      flagca = 2;
      break;
    case '3':
      colorb1 = #FEFF00;
      flagcb = 1;
      break;
    case '4':
      colorb2 = #FF7300;
      flagcb = 2;
      break;  
   }
}


//Draw the image to the screen at (0,0)
void draw()  {
if(flag == 1){
      if(mousePressed && (mouseButton == LEFT)){
      image(begr, 0, 0, mouseX, mouseY);
      image(beso, mouseX, 0, width-mouseX, mouseY);
      image(nyct, 0, mouseY, mouseX, height-mouseY);
      image(prag, mouseX, mouseY, width-mouseX, height-mouseY);
      fill(#000000);
      textSize(40);
      text("When you want, stop L-click and R-click", 16, 280);
      if(flagca == 0){
      textSize(28);
      fill(#000000);
      text("Change text colour pressing '1' or '2'", 13, 400);
      fill(#FFFFFF);
      text("Change text colour pressing '1' or '2'", 10, 400);
      fill(colora0);
       }else if(flagca == 1){
         textSize(28);
         fill(#000000);
         text("Change text colour pressing '2'", 13, 400);
         fill(#FFFFFF);
         text("Change text colour pressing '2'", 10, 400);
         fill(colora1);
       }else if(flagca == 2){
         textSize(28);
         fill(#000000);
         text("Change text colour pressing '1'", 13, 400);
         fill(#FFFFFF);
         text("Change text colour pressing '1'", 10, 400);
         fill(colora2);
       }
      textSize(40);
      text("When you want, stop L-click and R-click", 10, 280);
         
   } else if(mousePressed && (mouseButton == RIGHT)){
     image(pro1, 0, 0, width, height);
     fill(#000000);
     textSize(52);
     text("When you want, L-click", 16, 150);
     text("or L-click and drag", 16, 210);
     if(flagcb == 0){
       textSize(28);
       fill(#000000);
       text("Change text colour pressing '3' or '4' + R-click", 13, 400);
       fill(#FFFFFF);
       text("Change text colour pressing '3' or '4' + R-click", 10, 400);
       fill(colorb0);
      }else if(flagcb == 1){
        textSize(28);
        fill(#000000);
        text("Change text colour pressing '4' + R-click", 13, 400);
        fill(#FFFFFF);
        text("Change text colour pressing '4' + R-click", 10, 400);
        fill(colorb1);
      }else if(flagcb == 2){
        textSize(28);
        fill(#000000);
        text("Change text colour pressing '3' + R-click", 13, 400);
        fill(#FFFFFF);
        text("Change text colour pressing '3' + R-click", 10, 400);
        fill(colorb2);
      }
     textSize(52);
     text("When you want, L-click", 10, 150);
     text("or L-click and drag", 10, 210);
  }  
}
}  
  


