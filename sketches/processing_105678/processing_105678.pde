
PFont font;
PImage bg1;
PImage bg;
PImage bg2;
PImage picknose;
PImage butt;
PImage button;
int whichPicture=0;
float x;
float y;




void setup() {

  size(500, 520);
 

 
  font = loadFont("Mission-Script-48.vlw");
  bg = loadImage("butt12.png");
   bg2 = loadImage("bg2.png");
  picknose=loadImage("donepick.jpg");
  butt=loadImage ("butt.jpg");
  button=loadImage("BUTTON.jpg");
   background(255);
    image(bg2, 50, 160);
    image(bg, 200, 160);

textFont(font, 32);
fill(0);
text("pick something!", 170, 420); 
}




void draw() {

    image(button, 400, 0);
    if (mousePressed==true) {
      if (mouseX >400 && mouseX<470 && mouseY>0 && mouseY<60)
       background(255);
    image(bg2, 50, 160);
    image(bg, 200, 160);
    textFont(font, 32);
fill(0);
text("pick something!", 170, 420); 
     
{ noStroke(); for (float x= 1; x < width; x++)
{ for (float y= 1; y < width; y++){ fill(200, 240, 99, x);
rect(x*20,y*20, 10, 10); } }}
  

    }
  




  if (mousePressed==true) {

    //if (whichPicture==1)
    // { 
    // background(picknose);

    //}



    if (mouseX >70 && mouseX<220 && mouseY>180 && mouseY<300)

    {
      background(picknose);
      if (mousePressed==true) {
        background(picknose);
         {
  textFont(font, 50);
fill(0);
text("nose picked!", 240, 450); 
} 
      }

      image(button, 400, 0);



      //whichPicture=1;
      //if (mouseX >250 && mouseX<450 && mouseY>200 && mouseY<300){
      //         background(picknose);
    }



    //         }


    if (mouseX >250 && mouseX<450 && mouseY>200 && mouseY<300)

    {
      background(butt);
      
             
  textFont(font, 50);
fill(0);
text("wedgie picked!", 240, 450); 
    }


 
    } 
    //  }
    
    
  
     

   
  }










