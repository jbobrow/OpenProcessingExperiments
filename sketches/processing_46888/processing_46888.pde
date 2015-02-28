
import netscape.javascript.*; 

 PImage img1,img2;
void setup(){
 background(0);
 size(500,500,P2D);
 img1=loadImage("pin.png");
 
  
 //texto
  
 // PFont fonte1,fonte2;
//fonte1=loadFont("BookmanOldStyle-BoldItalic-48.vlw");
//fonte2=loadFont("BookmanOldStyle-BoldItalic-48.vlw");

}

void draw()
{
  
  
 // Fundo de bolinha
  
  noStroke();
  
    for (int x=0; x<600; x=x+10)
    {

      for (int y=0; y<600; y=y+10)
      {
  
        fill(0); 

        ellipse( x,y,9,9);

      }
    }
  
  for (int x=5; x<600; x=x+10)

  {

    for (int y=5; y<600; y=y+10)

    {

      fill(random(255),random(255),random(255)); 

      ellipse( x,y,9,9);

    }
  }


  //fundo OP
  
 // for (int y=0; y<1000; y=y+10)
//  {
    
  //  noFill();
  //  smooth();
   // stroke(random(255),random(255),random(255));
   // strokeWeight(2);
   // ellipse(300,300,y,y);
//     }
  
 
  fill(1,1);
  rect(0,0,width,height);
 
 
 //texto

  stroke(255,255,255);
 
  fill(150,255,0);  
//textFont(loadFont("Bauhaus93-48.vlw"));
  smooth();
  textSize(100);
  text("POP ",207,335);


//mostrar a imagem carregada, x,y.
 
 img2=loadImage("pin2.png");
 image(img2,88,0.1,300,500);



 //  image(img,mouseX,mouseY,90,120);
  
}
//void mouseMoved()
//{
  
//}

void mouseReleased()
{
  loop();
}

void mousePressed()
{
  tint(random(255),random(255),random(255));
  image(img1,mouseX,mouseY,90,120); 
  save("cja.jpg");
}

void mouseDragged()
{
  noLoop();
}




