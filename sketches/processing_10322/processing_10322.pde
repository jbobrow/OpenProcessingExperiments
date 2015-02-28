
PFont font;
float circleX, circleY;
float circleRadius = 20;
float circleX2, circleY2;
float circleRadius2 = 15;

float circleX3, circleY3;


float circleX4, circleY4;


float circleX5, circleY5;


float circleX6, circleY6;


float angle=0.0;
float speed=.1;
float radius= 40;
int score=0;
int level=0;






int b=87;
int b1=87;
int b2=87;
int b3=87;
int b4=87;
int b5=87;
int b6=87;
int b7=87;
int b8=87;
int b9=87;
int b10=87;
int b11=87;
int b12=87;
int b13=87;
int b14=87;
int b15=87;
int b16=87;
int b17=87;
int b18=87;
int b19=87;
int b20=87;
int b21=87;
int b22=87;
int b23=87;
int b24=87;
int b25=87;
int b26=87;
int b27=87;
int b28=87;
int b29=87;
int b30=87;
int b31=87;
int b32=87;
int b33=87;
int b34=87;
int b35=87;
int b36=87;
int b37=87;
int b38=87;
int b39=87;
int b40=87;
int b41=87;

 
 float rectX = random(0, 460);
 float rectY = random(0, 300);
 float rectWidth = 20;
 float rectHeight = 20;
 
 float rectX1 = random(0, 460);
 float rectY1 = random(0, 300);
 
 float rectX2 = random(0, 460);
 float rectY2 = random(0, 300);
 
 float rectX3 = random(0, 460);
 float rectY3 = random(0, 300);
 
 float rectX4 = random(0, 460);
 float rectY4 = random(0, 300);
 
 float rectX5 = random(0, 460);
 float rectY5 = random(0, 300);
 
 float rectX6 = random(0, 460);
 float rectY6 = random(0, 300);
 
 float rectX7 = random(0, 460);
 float rectY7 = random(0, 300);
 
 float rectX8 = random(0, 460);
 float rectY8 = random(0, 300);
 
 float rectX9 = random(0, 460);
 float rectY9 = random(0, 300);
 
 float rectX10 = random(0, 460);
 float rectY10 = random(0, 300);
 
 float rectX11 = random(0, 460);
 float rectY11= random(0, 300);
 
 float rectX12 = random(0, 460);
 float rectY12 = random(0, 300);
 
 float rectX13 = random(0,460 );
 float rectY13 = random(0, 300);

 float rectX14 = random(0, 460);
 float rectY14 = random(0, 300);
 
 float rectX15 = random(0, 460);
 float rectY15 = random(0, 300);
 
 float rectX16 = random(0, 460);
 float rectY16 = random(0, 300);
 
 float rectX17 = random(0, 460);
 float rectY17 = random(0, 300);
 
 float rectX18 = random(0, 460);
 float rectY18 = random(0, 300);
 
 float rectX19 = random(0, 460);
 float rectY19 = random(0, 300);
 
 float rectX20 = random(0, 460);
 float rectY20 = random(0, 300);
 
 float rectX21 = random(0, 460);
 float rectY21 = random(0, 300);

 float rectX22 = random(0, 460);
 float rectY22 = random(0, 300);
 
 float rectX23 = random(0, 460);
 float rectY23 = random(0, 300);
 
 float rectX24 = random(0, 460);
 float rectY24 = random(0, 300);
 
 float rectX25 = random(0, 460);
 float rectY25= random(0, 300);
 
 float rectX26 = random(0, 460);
 float rectY26 = random(0, 300);
 float rectX27 = random(0, 460);
 float rectY27 = random(0, 300);
 
 float rectX28= random(0, 460);
 float rectY28 = random(0, 300);
 
 float rectX29 = random(0, 460);
 float rectY29 = random(0, 300);
 
 float rectX30 = random(0, 460);
 float rectY30 = random(0, 300);
 
 float rectX31 = random(0, 460);
 float rectY31 = random(0, 300);
 
 float rectX32 = random(0, 460);
 float rectY32 = random(0, 300);
 
 float rectX33 = random(0, 460);
 float rectY33 = random(0, 300);
 
 float rectX34 = random(0, 460);
 float rectY34 = random(0, 300);
 
 float rectX35 = random(0, 460);
 float rectY35 = random(0, 300);
 
 float rectX36 = random(0, 460);
 float rectY36 = random(0, 400);
 
 float rectX37 = random(0, 460);
 float rectY37 = random(0, 300);
 
 float rectX38 = random(0, 460);
 float rectY38 = random(0, 300);
 
 float rectX39 = random(0, 460);
 float rectY39= random(0, 300);
 
 float rectX40 = random(0, 460);
 float rectY40 = random(0, 300);
 
 void setup() {
  size(480, 320);
  ellipseMode(RADIUS);
  smooth();
  colorMode (HSB, 350, 100, 100, 100);
  noStroke();
  font= loadFont ("SynchroLET-36.vlw");
  textFont(font);
  noCursor();
  
}



 
void draw() {
  noCursor();
  fill(0, 35);
  rect(0,0, width, height);
  fill(313, 100, 100, 75);
  if (level==0) {text("COLLECT THE", 50, height/2);
 ellipse(mouseX, mouseY, 20, 20);
 fill(36, 95, b5, 75);
  text ("SQUARES", 300, height/2);
  text ("BEGIN", 150, 200);
score=0;  
if (mousePressed) {level=1;}
  
  
  }


  
  
  if ((level==1)||(level==2)||(level==3)||(level==4)||(level==5)||(level==6)){
  
  fill(0, 35);
rect (0,0,width, height);

  
//  angle= angle+speed;
  

 
  circleX = mouseX;
  circleY = mouseY;
  angle+=speed;
  float sinval = sin (angle);
  float yoffset = sinval*radius;

 

  
     
  

  
println(score);
if ((b<=8)&&(b>=6)){(score)+=1;}
if ((b1<=8)&&(b1>=6)){(score)+=1;}
if ((b2<=8)&&(b2>=6)){(score)+=1;}
if ((b3<=8)&&(b3>=6)){(score)+=1;}
if ((b4<=8)&&(b4>=6)){(score)+=1;}
if ((b5<=8)&&(b5>=6)){(score)+=1;}
if ((b6<=8)&&(b6>=6)){(score)+=1;}
if ((b7<=8)&&(b7>=6)){(score)+=1;}
if ((b8<=8)&&(b8>=6)){(score)+=1;}
if ((b9<=8)&&(b9>=6)){(score)+=1;}
if ((b10<=8)&&(b10>=6)){(score)+=1;}
if ((b11<=8)&&(b11>=6)){(score)+=1;}
if ((b12<=8)&&(b12>=6)){(score)+=1;}
if ((b13<=8)&&(b13>=6)){(score)+=1;}
if ((b14<=8)&&(b14>=6)){(score)+=1;}
if ((b15<=8)&&(b15>=6)){(score)+=1;}
if ((b16<=8)&&(b16>=6)){(score)+=1;}
if ((b17<=8)&&(b17>=6)){(score)+=1;}
if ((b18<=8)&&(b18>=6)){(score)+=1;}
if ((b19<=8)&&(b19>=6)){(score)+=1;}
if ((b20<=8)&&(b20>=6)){(score)+=1;}
if ((b21<=8)&&(b21>=6)){(score)+=1;}
if ((b22<=8)&&(b22>=6)){(score)+=1;}
if ((b23<=8)&&(b23>=6)){(score)+=1;}
if ((b24<=8)&&(b24>=6)){(score)+=1;}
if ((b25<=8)&&(b25>=6)){(score)+=1;}
if ((b26<=8)&&(b26>=6)){(score)+=1;}
if ((b27<=8)&&(b27>=6)){(score)+=1;}
if ((b28<=8)&&(b28>=6)){(score)+=1;}
if ((b29<=8)&&(b29>=6)){(score)+=1;}
if ((b30<=8)&&(b30>=6)){(score)+=1;}
if ((b31<=8)&&(b31>=6)){(score)+=1;}
if ((b32<=8)&&(b32>=6)){(score)+=1;}
if ((b33<=8)&&(b33>=6)){(score)+=1;}
if ((b34<=8)&&(b34>=6)){(score)+=1;}
if ((b35<=8)&&(b35>=6)){(score)+=1;}
if ((b36<=8)&&(b36>=6)){(score)+=1;}
if ((b37<=8)&&(b37>=6)){(score)+=1;}
if ((b38<=8)&&(b38>=6)){(score)+=1;}
if ((b39<=8)&&(b39>=6)){(score)+=1;}


    b=constrain(b, 0, 87);
  if (rectCircleIntersect(rectX, rectY, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b-=10;} 
   
 


  
    if (rectCircleIntersect(rectX1, rectY1, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b1-=10;
  }
  
    b1=constrain(b1, 0, 87);
 
      if (rectCircleIntersect(rectX2, rectY2, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b2-=10;
  }
 
    b2=constrain(b2, 0, 87);
  
  
      if (rectCircleIntersect(rectX3, rectY3, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b3-=13;
  }
 
    b3=constrain(b3, 0, 87);

  
  
      if (rectCircleIntersect(rectX4, rectY4, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b4-=10;
  }
 
    b4=constrain(b4, 0, 87);
 
  
        if (rectCircleIntersect(rectX5, rectY5, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b5-=10;}
  

    b5=constrain(b5, 0, 87);
   

      if (rectCircleIntersect(rectX6, rectY6, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b6-=10;}
 
    b6=constrain(b6, 0, 87);


      if (rectCircleIntersect(rectX7, rectY7, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b7-=10;
  }
  
    b7=constrain(b7, 0, 87);
    
  

      if (rectCircleIntersect(rectX8, rectY8, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b8-=10;
  }
    b8=constrain(b8, 0, 87);
  

      if (rectCircleIntersect(rectX9, rectY9, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b9-=13;
  }
    b9=constrain(b9, 0, 87);
  

      if (rectCircleIntersect(rectX10, rectY10, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b10-=10;
  }
    b10=constrain(b10, 0, 87);
    

      if (rectCircleIntersect(rectX11, rectY11, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b11-=10;
  }
 
    b11=constrain(b11, 0, 87);
    
  

      if (rectCircleIntersect(rectX12, rectY12, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b12-=10;
  }
 
    b12=constrain(b12, 0, 87);
 
      if (rectCircleIntersect(rectX13, rectY13, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b13-=13;
  }
    b13=constrain(b13, 0, 87);
 

      if (rectCircleIntersect(rectX14, rectY14, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b14-=13;
  }
  
    b14=constrain(b14, 0, 87);
    
      if (rectCircleIntersect(rectX15, rectY15, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b15-=10;
  }
  
    b15=constrain(b15, 0, 87);
   
      if (rectCircleIntersect(rectX16, rectY16, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b16-=10;
  }
  
    b16=constrain(b16, 0, 87);
 

      if (rectCircleIntersect(rectX17, rectY17, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b17-=10;
  }
  
    b17=constrain(b17, 0, 87);
  

      if (rectCircleIntersect(rectX18, rectY18, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b18-=10;
  }
 
    b18=constrain(b18, 0, 87);
  
      if (rectCircleIntersect(rectX19, rectY19, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b19-=10;
  }
  
    b19=constrain(b19, 0, 87);
 

      if (rectCircleIntersect(rectX20, rectY20, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b20-=10;
  }
  
    b20=constrain(b20, 0, 87);
    
      if (rectCircleIntersect(rectX21, rectY21, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b21-=10;
  }
 
    b21=constrain(b21, 0, 87);
 

      if (rectCircleIntersect(rectX22, rectY22, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b22-=10;
  }
 
    b22=constrain(b22, 0, 87);
   

      if (rectCircleIntersect(rectX23, rectY23, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b23-=10;
  }
  
    b23=constrain(b23, 0, 87);
  
      if (rectCircleIntersect(rectX24, rectY24, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b24-=10;
  }
  
    b24=constrain(b24, 0, 87);
    
  
      if (rectCircleIntersect(rectX25, rectY25, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b25-=10;
  }
 
    b25=constrain(b25, 0, 87);
  

      if (rectCircleIntersect(rectX26, rectY26, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b26-=10;
  }

    b26=constrain(b26, 0, 87);
   
      if (rectCircleIntersect(rectX27, rectY27, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b27-=10;
  }
  else 
    b27=constrain(b27, 0, 87);

  

      if (rectCircleIntersect(rectX28, rectY28, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b28-=10;
  }
  else 
    b28=constrain(b28, 0, 87);


      if (rectCircleIntersect(rectX29, rectY29, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b29-=10;
  }
  
    b29=constrain(b29, 0, 87);
   
      if (rectCircleIntersect(rectX30, rectY30, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b30-=10;
  }
  else 
    b30=constrain(b30, 0, 87);
    

      if (rectCircleIntersect(rectX31, rectY31, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b31-=10;
  }
 
    b31=constrain(b31, 0, 87);
 

      if (rectCircleIntersect(rectX32, rectY32, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b32-=10;
  }
  
    b32=constrain(b32, 0, 87);
  

      if (rectCircleIntersect(rectX33, rectY33, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b33-=10;
  }
 
    b33=constrain(b33, 0, 87);
   

      if (rectCircleIntersect(rectX34, rectY34, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b34-=10;
  }
  
    b34=constrain(b34, 0, 87);
    
      if (rectCircleIntersect(rectX35, rectY35, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b35-=10;
  }
  
    b35=constrain(b35, 0, 87);
    
      if (rectCircleIntersect(rectX36, rectY36, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b36-=10;
  }
 
    b36=constrain(b36, 0, 87);
    

      if (rectCircleIntersect(rectX37, rectY37, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b37-=10;
  }
    b37=constrain(b37, 0, 87);
    
       if (rectCircleIntersect(rectX38, rectY38, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b38-=10;
  }
    b38=constrain(b38, 0, 87);
       
       
       b39=constrain(b39, 0, 87);
       if (rectCircleIntersect(rectX39, rectY39, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b39-=10;
  }
    
       
       b40=constrain(b40, 0, 87);
       if (rectCircleIntersect(rectX40, rectY40, rectWidth, rectHeight, circleX, circleY, circleRadius) == true) {
    b40-=10;
  }
    
   
   if (((b<=5) && (b1<=5) && (b2<=5)&&(b3<=5)&&(b4<=5)&&(b5<=5)&&(b6<=5)&&(b7<=5)&&(b8<=5)&&(b9<=5)&&(b10<=5)&&(b11<=5)&&(b12<=5)&&(b13<=5)&&(b14<=5)&&(b15<=5)&&(b16<=5)&&(b17<=5)&&(b18<=5)&&(b19<=5)&&(b20<=5)
    &&(b21<=5)&&(b22<=5)&&(b23<=5)&&(b24<=5)&&(b25<=5)&&(b26<=5)&&(b27<=5)&&(b28<=5)&&(b29<=5)&&(b30<=5)&&(b31<=5)&&(b32<=5)&&(b33<=5)&&(b34<=5)&&(b35<=5)&&(b36<=5)&&(b37<=5)
    &&(b38<=5)&&(b39<=5))) {b=87;b1=87;b2=87;b3=87;b4=87;b5=87;b6=87;b7=87;b8=87;b9=87;b10=87;b11=87;b12=87;b13=87;b14=87;b15=87;b16=87;b17=87;b18=87;b19=87;b20=87;b21=87;b22=87;b23=87;b24=87;
    b25=87;b26=87;b27=87;b28=87;b29=87;b30=87;b31=87;b32=87;b33=87;b34=87;b35=87;b36=87;b37=87;b38=87;b39=87;b40=87;}

  
  fill(36, 95, b, 75);
  rect(rectX, rectY, rectWidth, rectHeight);
 
 fill(36, 95, b1, 75);
  rect(rectX1, rectY1, rectWidth, rectHeight);
 
 fill(36, 95, b2, 75);
  rect(rectX2, rectY2, rectWidth, rectHeight);
 
  fill(36, 95, b3, 75);
  rect(rectX3, rectY3, rectWidth, rectHeight); 
 
 fill(36, 95, b4, 75);
  rect(rectX4, rectY4, rectWidth, rectHeight); 
  
  fill(36, 95, b5, 75);
  rect(rectX5, rectY5, rectWidth, rectHeight); 
 
  fill(36, 95, b6, 75);
  rect(rectX6, rectY6, rectWidth, rectHeight); 
  
   fill(36, 95, b7, 75);
  rect(rectX7, rectY7, rectWidth, rectHeight); 
  
   fill(36, 95, b8, 75);
  rect(rectX8, rectY8, rectWidth, rectHeight); 
  
   fill(36, 95, b9, 75);
  rect(rectX9, rectY9, rectWidth, rectHeight); 
  
   fill(36, 95, b10, 75);
  rect(rectX10, rectY10, rectWidth, rectHeight); 
  
   fill(36, 95, b11, 75);
  rect(rectX11, rectY11, rectWidth, rectHeight); 
 
  fill(36, 95, b12, 75);
  rect(rectX12, rectY12, rectWidth, rectHeight); 
 
  fill(36, 95, b13, 75);
  rect(rectX13, rectY13, rectWidth, rectHeight); 
  
   fill(36, 95, b14, 75);
  rect(rectX14, rectY14, rectWidth, rectHeight); 
  
   fill(36, 95, b15, 75);
  rect(rectX15, rectY15, rectWidth, rectHeight); 
  
   fill(36, 95, b16, 75);
  rect(rectX16, rectY16, rectWidth, rectHeight); 
  
   fill(36, 95, b17, 75);
  rect(rectX17, rectY17, rectWidth, rectHeight); 
 
  fill(36, 95, b18, 75);
  rect(rectX18, rectY18, rectWidth, rectHeight); 
 
  fill(36, 95, b19, 75);
  rect(rectX19, rectY19, rectWidth, rectHeight); 
  
   fill(36, 95, b20, 75);
  rect(rectX20, rectY20, rectWidth, rectHeight); 
  
   fill(36, 95, b21, 75);
  rect(rectX21, rectY21, rectWidth, rectHeight); 
  
   fill(36, 95, b22, 75);
  rect(rectX22, rectY22, rectWidth, rectHeight); 
  
   fill(36, 95, b23, 75);
  rect(rectX23, rectY23, rectWidth, rectHeight); 
 
  fill(36, 95, b24, 75);
  rect(rectX24, rectY24, rectWidth, rectHeight);   
 
  fill(36, 95, b25, 75);
  rect(rectX25, rectY25, rectWidth, rectHeight); 
 
  fill(36, 95, b26, 75);
  rect(rectX26, rectY26, rectWidth, rectHeight); 
  
   fill(36, 95, b27, 75);
  rect(rectX27, rectY27, rectWidth, rectHeight); 
 
  fill(36, 95, b28, 75);
  rect(rectX28, rectY28, rectWidth, rectHeight); 
 
  fill(36, 95, b29, 75);
  rect(rectX29, rectY29, rectWidth, rectHeight); 
 
  fill(36, 95, b30, 75);
  rect(rectX30, rectY30, rectWidth, rectHeight); 
 
  fill(36, 95, b31, 75);
  rect(rectX31, rectY31, rectWidth, rectHeight); 
  
   fill(36, 95, b32, 75);
  rect(rectX32, rectY32, rectWidth, rectHeight); 
 
  fill(36, 95, b33, 75);
  rect(rectX33, rectY33, rectWidth, rectHeight); 
 
  fill(36, 95, b34, 75);
  rect(rectX34, rectY34, rectWidth, rectHeight); 
 
  fill(36, 95, b35, 75);
  rect(rectX35, rectY35, rectWidth, rectHeight);   

fill(36, 95, b36, 75);
  rect(rectX36, rectY36, rectWidth, rectHeight);   

fill(36, 95, b37, 75);
  rect(rectX37, rectY37, rectWidth, rectHeight);   

fill(36, 95, b38, 75);
  rect(rectX38, rectY38, rectWidth, rectHeight);   

fill(36, 95, b39, 75);
  rect(rectX39, rectY39, rectWidth, rectHeight);   
  
  fill(36, 95, b40, 75);
  rect(rectX40, rectY40, rectWidth, rectHeight);  
  fill(313, 100, 100);
text( score , 360, 320);

 if (circleCircleIntersect(circleX, circleY, circleRadius, circleX2, circleY2, circleRadius2) == true) {
    fill(0,100, 100,75);
    score-=2;
  } else {
    fill(313, 100, 100, 75);}
    
    if (circleCircleIntersect(circleX, circleY, circleRadius, circleX3, circleY3, circleRadius2) == true) {
    fill(0,100, 100,75);
    score-=2;
  } else {
    fill(313, 100, 100, 75);}
    
    if (circleCircleIntersect(circleX, circleY, circleRadius, circleX4, circleY4, circleRadius2) == true) {
    fill(0,100, 100,75);
    score-=2;
  } else {
    fill(313, 100, 100, 75);}
    
    if (circleCircleIntersect(circleX, circleY, circleRadius, circleX5, circleY5, circleRadius2) == true) {
    fill(0, 100, 100,75 );
    score-=2;
  } else {
    fill(313, 100, 100, 75);}
    
    if (circleCircleIntersect(circleX, circleY, circleRadius, circleX5, circleY5, circleRadius2) == true) {
    fill(0,100, 100,75);
    score-=2;
  } else {
    fill(313, 100, 100, 75);}
  
  ellipse(circleX, circleY, circleRadius, circleRadius);
  ellipse(pmouseX, pmouseY, 20, 20);
  if (score>=60) {
   ellipse (circleX2,circleY2, circleRadius2, circleRadius2);
 circleX2 = (50);
  circleY2 = (50+yoffset);
}
   
   if (score>=100) {
   ellipse (circleX3,circleY3, circleRadius2, circleRadius2);
   
  circleX3 = (460);
  circleY3 = (460+yoffset);
  level=2
 ;}
   
   if (score>=150) {
   ellipse (circleX4,circleY4, circleRadius2, circleRadius2);
  circleX4 = (250);
  circleY4 = (170+yoffset);
  level=3;
 }
   
   if (score>=300) {
   ellipse (circleX5,circleY5, circleRadius2, circleRadius2);
  circleX5 = (50);
  circleY5 = (300+yoffset);
  level=4;
  
  }
   
   if (score>=500) {
   ellipse (circleX6,circleY6, circleRadius2, circleRadius2);
 circleX6 = (460);
  circleY6 = (10+yoffset);
level=5;}
   
   
//   println("score");
   println("level");
fill(313, 100, 100, 75);
 text ("SCORE:", 240, 320);
 text( "LEVEL:", 10, 320);
text (level, 120, 320);

if (score>=5000) {score=5000; ; text ("GAME OVER DUDE...REPLAY?", 20, height/2); if (mousePressed){level=0;}

     
   




  
}
 
}
}
boolean rectCircleIntersect(float rx, float ry, float rw, float rh, float cx, float cy, float cr) {
 
  float circleDistanceX = abs(cx - rx - rw/2);
  float circleDistanceY = abs(cy - ry - rh/2);
 
  if (circleDistanceX > (rw/2 + cr)) { return false; }
  if (circleDistanceY > (rh/2 + cr)) { return false; }
  if (circleDistanceX <= rw/2) { return true; }
  if (circleDistanceY <= rh/2) { return true; }
 
  float cornerDistance = pow(circleDistanceX - rw/2, 2) + pow(circleDistanceY - rh/2, 2);
  return cornerDistance <= pow(cr, 2);
}




 
boolean circleCircleIntersect(float cx, float cy, float cr, float cx2, float cy2, float cr2) {
  if (dist(cx, cy, cx2, cy2) < cr + cr2) {
    return true;
  } else {
    return false;
  }
  }
  
  


