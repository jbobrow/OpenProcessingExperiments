


void draw(){


PImage img;
img = loadImage("images.jpeg");
img.resize(600,600);
image(img, 0, 0);
fill(152,88,5);
rect(-1, 520, 900, 55, 7);
fill(57,24,4);
rect(250, 120, 45, 399, 7);
fill(25,255,5);
ellipse(259, 146, 255, 155);
fill(255,3,32);
ellipse(170,Y1++, 55, 55);
fill(255,3,32);
ellipse(270, Y2++, 55, 55);
fill(255,3,32);
ellipse(310, Y3++, 55, 55);
fill(255,235,3);
ellipse(56, 46, 55, 55);
fill(255,235,3);
line(70, 80, 35, 35);
fill(255,235,3);
line(90, 80, 35, 35);
fill(255,235,3);
line(160, 80, 35, 35);
fill(255,55,0);
textSize(25);
text("click the apples before they hit the ground",75,55);
  if (keyPressed){
    if(key==CODED){
      if(keyCode==40){
        //if(Y>500){
         // Y=200;
  
          //ellipse(X,Y++,100,100);
     // }

    }
  }
}
if(mousePressed){
  println(mouseX+" "+mouseY+ "X: "+X+" Y: "+Y);
if(mouseX>145&&mouseX<200&&mouseY>Y1-50&&mouseY<Y1+50){
Y1=900;
println("in");
}
if(mouseX>235&&mouseX<305&&mouseY>Y2-50&&mouseY<Y2+50){
Y2=900;
println("in");
}
if(mouseX>310&&mouseX<315&&mouseY>Y3-50&&mouseY<Y3+50){
Y3=900;
println("in");
}





  }
}
int Y1=200;
int Y2=200;
int Y3=200;
int  X=70;
void setup(){


  size(600,600);
 

  }



