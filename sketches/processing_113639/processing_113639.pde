
int diameter = 200;
int positionX = 200;
int Switch = 0;
int a;
int b;

void setup(){    
  size(600,600);
    background(#000000);
    fill(#FFFEFC);
    stroke(#FFFEFC);
  line(275,50,275,100);
  line(325,50,325,100);
  triangle(325,45,335,60,315,60);
    triangle(275,105,285,90,265,90);

a= color(#AFAEAD);
b = color(#AFAEAD);

 
}

void draw(){  
  
fill(#B2B1AE);
   if(keyPressed) {
 if (key == '8' || key == '8'){

   a = color(#F7A239);
   b = color(#AFAEAD);

  
  if(positionX >= 20){
  positionX--; //positionX=positionX+1;
  }
  
   
 }else if(key == '2' || key == '2'){
   
   a=color(#AFAEAD);
   b=color(#F7A239);
   
 if(positionX <= 200){
  positionX++; //positionX=positionX+1;
  }
 }
   }
stroke(#000000);

 rectMode(CENTER);
 rect(300,300,positionX+100,300);
 
  
 fill(#080808);

  rectMode(CENTER);
  rect(300,410,25,80);
  
    rectMode(CENTER);
  rect(300,330,70,80);
  
  ellipseMode(CENTER);
  ellipse(300,255,40,40);
 
  
    fill(a);
     triangle(325,500,325,550,345,525);
  triangle(370,500,370,550,350,525);

fill(b);
triangle(215,500,215,550,195,525);
 triangle(225,500,225,550,245,525);

  

}


