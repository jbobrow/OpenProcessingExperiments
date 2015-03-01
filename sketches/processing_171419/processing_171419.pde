

size(600, 300);
colorMode(RGB,255);
background(255);


fill(0);
rect(0, 0, 300, 300);


for(int x=300;x<=600;x +=5){
 
  
  stroke(#4B4FFF,150);
  line(600,200,x,-400);
  stroke(#4BFAFF,150);
  line(400,0,600,400-x);
  stroke(#3BFC96,150);
  line(300,100,x,-50);
  stroke(#E5FC3B,150);
  line(300,200,x,-300);
  stroke(#FC623B,150);
  line(300,200,x,350);
  stroke(#FC9C3B,150);
  line(300,100,x,600);
  stroke(#FF4040,150);
  line(600,200,x,350);
  stroke(#FF52D4,150);
  line(600,100,x,550);


}


for(int x=0;x<=300;x +=3){
  
  stroke(#FC0000,150);
  line(0,150-x,150,150);
  stroke(#EB00FC,150);
  line(0,300-x,150,150);
  stroke(#6000FC,150);
  line(0,550-x,150,150);
  stroke(#0027FC,150);
  line(300,150-x,150,150);
  stroke(#00FC1B,150);
  line(300,300-x,150,150);
  stroke(#FCF000,150);
  line(300,550-x,150,150);
  
  
}  








