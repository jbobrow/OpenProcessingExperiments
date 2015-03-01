
color bluish = color(45,105,235);
color reddish = color(171,34,48,200);
color darkBlue = color(13,40,191, 200);
color red2 = color(219,26,39);

float px, py;
float sx, sy;
float d1;
float d2;
int counter;
boolean wait1;
boolean wait2;
boolean wait3;


void setup()
{
size(680,520);
background(bluish);
smooth();
frameRate(60);

px = 0.00;
py = 0.00;
d1 = 1.0;
sx = 0.00;
sy = 0.00;
d2 = 1.0;
counter = 0;
wait1 = true;
wait2 = true;
wait3 = true;

}



void draw()
{
  
  background(color(45+(mouseX/5),105+(mouseY/5),235)); 
  
  color blue2 = color(26+(mouseX/5),197+(mouseY/5),219);

//circle 1
ellipseMode(CENTER);
noFill();



int i = 0;
while(i<15) {
  stroke(red2);
  //starting position = (150,450) and dx,dy = (-150, -150)
  ellipse(-i*150+150+100*px, -i*150+450+100*py, 100, 100*sy);
  stroke(blue2);
  line(-i*150 +100+100*px, -i*150 +400+100*py, -i*150+200+100*px, -i*150+500+100*py);
  line(-i*150 +100+100*px, -i*150 +430+100*py, -i*150+200+100*px, -i*150+530+100*py);
  line(-i*150 +100+100*px, -i*150 +370+100*py, -i*150+200+100*px, -i*150+470+100*py);

  
  stroke(red2);
  //starting position = (0,0) and dx,dy = (150, 150)
  ellipse(i*150-100*px, i*150-100*py, 100, 100*sy);
  stroke(blue2);
  line(i*150 - 50-100*px, i*150 - 50-100*py, i*150+50-100*px, i*150+50-100*py);
  line(i*150 - 50-100*px, i*150 - 20-100*py, i*150+50-100*px, i*150+80-100*py);
  line(i*150 - 50-100*px, i*150 - 80-100*py, i*150+50-100*px, i*150+20-100*py);
  
  
  
  
  stroke(red2);
  //starting position = (750,450) and dx,dy = (-150, -150)
  ellipse(-i*150 + 750+100*px, -i*150+450 +100*py, 100, 100*sy);
  stroke(blue2);
  line(-i*150 +700+100*px, -i*150 + 400+100*py, -i*150+800+100*px, -i*150+500+100*py);
  line(-i*150 +700+100*px, -i*150 + 430+100*py, -i*150+800+100*px, -i*150+530+100*py);
  line(-i*150 +700+100*px, -i*150 + 370+100*py, -i*150+800+100*px, -i*150+470+100*py);
  
  
  


  stroke(red2);
  //starting position = (600,0) and dx,dy = (150, 150)
  ellipse(i*150 + 600-100*px, i*150-100*py, 100, 100*sy);
  stroke(blue2);
  line(i*150 +550-100*px, i*150 - 50-100*py, i*150+650-100*px, i*150+50-100*py);
  line(i*150 +550-100*px, i*150 - 20-100*py, i*150+650-100*px, i*150+80-100*py);
  line(i*150 +550-100*px, i*150 - 80-100*py, i*150+650-100*px, i*150+20-100*py);
  
 
  i++;
     
  }
  


stroke(0,0,0);

// diagonal 1
fill(darkBlue);
if(counter<17){
quad(0,height/2 - 20, 40,(height/2)+40 -mouseY/2, 40,(height/2)+80 -mouseY/2, 0,height/2 + 20);  
}
translate(0,-40);
fill(reddish);
if(counter<1){
quad(0,height/2 - 20, 40,(height/2)+40 -mouseY/2, 40,(height/2)+80 -mouseY/2, 0,height/2 + 20);  
}
translate(0,80);
if(counter<9){
quad(0,height/2 - 20, 40,(height/2)+40 -mouseY/2, 40,(height/2)+80 -mouseY/2, 0,height/2 + 20);  
}
translate(0,-40);


//diagonal 2
fill(darkBlue);
if(counter<21){
quad(40,(height/2)+40 -mouseY/2, 120, (height/2)-100 +mouseY/2, 120, (height/2)-60 +mouseY/2, 40,(height/2)+80 -mouseY/2);  
}
translate(0,-40);
fill(reddish);
if(counter<10){
quad(40,(height/2)+40 -mouseY/2, 120, (height/2)-100 +mouseY/2, 120, (height/2)-60 +mouseY/2, 40,(height/2)+80 -mouseY/2);  
}
translate(0,80);
if(counter<2){
quad(40,(height/2)+40 -mouseY/2, 120, (height/2)-100 +mouseY/2, 120, (height/2)-60 +mouseY/2, 40,(height/2)+80 -mouseY/2);  
}
translate(0,-40);

//diagonal 3
fill(darkBlue);
if(counter<18){
quad(120, (height/2)-100 +mouseY/2,  200, (height/2) + 160 - mouseY/2, 200, (height/2)+200 - mouseY/2, 120, (height/2)-60 +mouseY/2); 
}
translate(0,-40);
fill(reddish);
if(counter<3){
quad(120, (height/2)-100 +mouseY/2,  200, (height/2) + 160 - mouseY/2, 200, (height/2)+200 - mouseY/2, 120, (height/2)-60 +mouseY/2); 
}
translate(0,80);
if(counter<11){
quad(120, (height/2)-100 +mouseY/2,  200, (height/2) + 160 - mouseY/2, 200, (height/2)+200 - mouseY/2, 120, (height/2)-60 +mouseY/2); 
}
translate(0,-40);

//diagonal 4
fill(darkBlue);
if(counter<22){
quad(200, (height/2) + 160 - mouseY/2, 280, (height/2) +mouseY/2, 280, (height/2) + 40 +mouseY/2, 200, (height/2)+200 - mouseY/2 );
}
translate(0,-40);
fill(reddish);
if(counter<12){
quad(200, (height/2) + 160 - mouseY/2, 280, (height/2) +mouseY/2, 280, (height/2) + 40 +mouseY/2, 200, (height/2)+200 - mouseY/2);
}
translate(0,80);
if(counter<4){
quad(200, (height/2) + 160 - mouseY/2, 280, (height/2) +mouseY/2, 280, (height/2) + 40 +mouseY/2, 200, (height/2)+200 - mouseY/2);
}
translate(0,-40);

//diagonal 5
fill(darkBlue);
if(counter<19){
quad(280, (height/2) +mouseY/2, 360, (height/2) + 100 -mouseY/2, 360, (height/2) + 140 -mouseY/2, 280, (height/2) + 40 + mouseY/2);
}
translate(0,-40);
fill(reddish);
if(counter<5){
quad(280, (height/2) +mouseY/2, 360, (height/2) + 100 -mouseY/2, 360, (height/2) + 140 -mouseY/2, 280, (height/2) + 40 + mouseY/2);
}
translate(0,80);
if(counter<13){
quad(280, (height/2) +mouseY/2, 360, (height/2) + 100 -mouseY/2, 360, (height/2) + 140 -mouseY/2, 280, (height/2) + 40 + mouseY/2);
}
translate(0,-40);

//diagonal 6
fill(darkBlue);
if(counter<23){
quad(360, (height/2) + 100 -mouseY/2, 460, (height/2) - 140 +mouseY/2, 460, (height/2) - 100 +mouseY/2, 360, (height/2) + 140 -mouseY/2);
}
translate(0,-40);
fill(reddish);
if(counter<14){
quad(360, (height/2) + 100 -mouseY/2, 460, (height/2) - 140 +mouseY/2, 460, (height/2) - 100 +mouseY/2, 360, (height/2) + 140 -mouseY/2);
}
translate(0,80);
if(counter<6){
quad(360, (height/2) + 100 -mouseY/2, 460, (height/2) - 140 +mouseY/2, 460, (height/2) - 100 +mouseY/2, 360, (height/2) + 140 -mouseY/2);
}
translate(0,-40);

//diagonal 7
fill(darkBlue);
if(counter<20){
quad(460, (height/2) - 140 +mouseY/2, 550, (height/2)+ 160 -mouseY/2, 550, (height/2)+200 -mouseY/2, 460, (height/2) - 100 +mouseY/2);
}
translate(0,-40);
fill(reddish);
if(counter<7){
quad(460, (height/2) - 140 +mouseY/2, 550, (height/2)+ 160 -mouseY/2, 550, (height/2)+200 -mouseY/2, 460, (height/2) - 100 +mouseY/2);
}
translate(0,80);
if(counter<15){
quad(460, (height/2) - 140 +mouseY/2, 550, (height/2)+ 160 -mouseY/2, 550, (height/2)+200 -mouseY/2, 460, (height/2) - 100 +mouseY/2);
}
translate(0,-40);


//diagonal 8
fill(darkBlue);
if(counter<24){
quad(550, (height/2) + 160 -mouseY/2, width-1, (height/2)-40, width-1, (height/2), 550, (height/2)+200 -mouseY/2);
}
translate(0,-40);
fill(reddish);
if(counter<16){
quad(550, (height/2) + 160 -mouseY/2, width-1, (height/2)-40, width-1, (height/2), 550, (height/2)+200 -mouseY/2);
}
translate(0,80);
if(counter<8){
quad(550, (height/2) + 160 -mouseY/2, width-1, (height/2)-40, width-1, (height/2), 550, (height/2)+200 -mouseY/2);
}
translate(0,-40);

 
  
if(px< 11 && py< 11){
px +=d1*0.01;
py +=d1*0.01;}
if(abs(px-10) <= 0.001 || abs(px) <= 0.001){
  d1*= -1.00;}
  
if(sx< 2 && sy< 2){
sx +=d2*0.01;
sy +=d2*0.01;}
if(abs(sx-1) <= 0.001 || abs(sx) <= 0.001){
  d2*= -1.00;}
  
controls();

}

void controls()
{
  
//subtract diagonals
if (wait1==true){
 if (mousePressed==true){
   counter++;
   wait1 = false; 
 }
}
else{
 if (mousePressed==false){
  wait1 = true;
 }
}   

//reset diagonals
if (wait2==true){
 if (keyPressed==true){
  if(key==TAB || key==' '){ 
   counter=0;
   wait2 = false;
  }
 }
}
else
{
 if (keyPressed==false)
 {
  wait2 = true;
 }
}  
/////////////////////////////////////////////////
if (wait3==true){
 if (keyPressed==true){
  if(key==ENTER){ 
   d1*= -1.00;
   wait3 = false;
  }
 }
}
else
{
 if (keyPressed==false)
 {
  wait3 = true;
 }
}   

}



