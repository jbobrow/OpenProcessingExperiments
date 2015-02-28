
//JiYoung Lee
//HW 12
//Copyrights @ JIYOUNG LEE


int [] a= {22,17,43,32};

boolean drawBar;


void setup(){
 
  noStroke();
  smooth();
  size(400,400);
  drawBar=false;
  PImage b;
  b = loadImage("map.jpg");
  background(b);
 
}

void draw()
{
   
   alcohol();
   smoking();
   title();
   overlapmouse(mouseX,mouseY);
}


    void title()
    {
      textSize(32);
      fill(255,121,44);
      text ("U.S. DRUG GENDER RATIO",width*.005,height*.15);
    }
    
       void smoking()
    {
      fill(255,173,179);
      rect(width*.01,height*.2,width*.45,height*.1);
      fill(0);
      textSize(25);
      text("Smoking ratio",width*.025,height*.275);
    }
    
    
    void alcohol()
    {
      fill(255,173,179);
      rect(width*.54,height*.2,width*.45,height*.1);
      fill(0);
      textSize(25);
      text("Alcohol ratio",width*.57,height*.275);
    }
    
 
    void overlapmouse(int x, int y)
    {
      
      if ( mouseY > height*.2 && mouseY < height*.3 && 
      mouseX< width*.46 && mouseX>width*.01)
      
 {noStroke();
      fill(93,196,250);
      ellipse(width*.62,height*.70,height*.12,height*.12);
      fill(30,131,250);
      textSize(28);
      text(a[0],width*.57,height*.73);
      text("%",width*.66,height*.73);
     
      noStroke();
      fill(250,177,229);
      ellipse(width*.30,height*.70,height*.1,height*.1);
      fill(242,29,182);
      textSize(28);
      text(a[1],width*.25,height*.73);
      text("%",width*.34,height*.73);
 }
 
 else
       if ( mouseX > width*.54 && mouseX < width*.99 &&
 mouseY>height*.2 && mouseY<height*.3)
 {noStroke();
      fill(93,196,250);
      ellipse(width*.62,height*.70,height*.17,height*.17);
      fill(30,131,250);
      textSize(30);
      text(a[2],width*.57,height*.73);
      text("%",width*.66,height*.73);
     
      noStroke();
      fill(250,177,229);
      ellipse(width*.30,height*.70,height*.15,height*.15);
      fill(242,29,182);
      textSize(30);
      text(a[3],width*.25,height*.73); 
    text("%",width*.34,height*.73);}
     
     else {
       fill(211,211,211);
       ellipse (width*.62,height*.70,height*.23,height*.23);
       ellipse(width*.30,height*.70,height*.23,height*.23);}
       
       
    }



