
int card = 0; 

PImage img1,img2,img3,img4,img5,img6,img7,img8;
PFont font;

void setup() {
  size (800,400) ;
  smooth();
  background(250);
  img1 = loadImage("Untitled-3.jpg");
  img2 = loadImage("Untitled-6.gif");
  img3= loadImage("Untitled-7.gif");
  img4= loadImage("Untitled-2.gif");
  img5= loadImage("Untitled-5.gif");
  img6= loadImage("Untitled-1.gif");
   img7= loadImage("Untitled-11.gif");
    img8= loadImage("Untitled-13.gif");
  
    font = loadFont("Helvetica-48.vlw");
     fill(51,175,127);
  textFont(font);
}

void draw() {
  noStroke();
  if (card == 0) {
   
       
 image(img1, 0 ,0);
 image(img2, 580,0);
 image(img4,750,350);
 
  textSize(45);
 text("< Growing Larva >",20,50);
  textSize(25);
  text("   Once upon a time, ",20,90);
   text("   The green larva was living.",20,130);
    text("   He is taking a walk.",20,170);
    textSize(25);
       fill(246,30,6);
      text("clik",700,380);

    
  head(-150,250,1,0); 
  body1(0,0,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
}

 else if (card == 1) {  


 image(img1, 0 ,0);
 image(img6, 580,-5);
 image(img4,750,350);
 image(img5,300,-5);
  image(img2,30,-5);
  
 textSize(25);
 text("  At that time,",20,180);
  text("  green larva look around and find some fruit. ",20,220);
 text("  He is getting hungry. ",20,260);
 
 textSize(25);
       fill(246,30,6);
      text("clik",700,380);
 
  head(0,250,1,0); 
  body1(0,0,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
}

if (card == 2) {
    rect (750,350,40,50);
  image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
  text(" 'I would really like to have some fruit.'",360,180);
text("  Larva said.",360,220);
 textSize(40);
text(" Choice Fruit!!",360,260);

  body1(0,250,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
  head(0,int(random(190,195)),1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  
}

else if (card  == 3) { 
  rect (0,0,260,50);
  
   image(img1, 0 ,0);
 image(img6, 580,-5);
 image(img5,300,-5);
  image(img2,30,-5);
   
 textSize(25);
  fill(51,175,127);
  text("Red Apple!!",360,180);
 textSize(40);
text("     UP",360,253);

triangle(370,220,350,250,390,250);

  body1(0,250,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
  head(0,int(random(190,195)),1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
}



else if (card  == 31) { 
 


 image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Red Apple!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);

triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);


    
       
 
   head(0,390,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,0,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(120,-90,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(0,0,1,0);
  body3(0,0,1,0);
}


else if (card  == 32) { 

 image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Red Apple!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);

triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);


    
       
 
 head(-30,310,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(10,215,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(118,-80,1,QUARTER_PI);
    body4(103,-40,1,QUARTER_PI);
    body3(0,0,1,0);
  
}


else if (card  == 33) { 

image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Red Apple!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);

triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);

 head(-30,260,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,207,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(0,0,1,0);
  body3(105,-40,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(90,10,1,QUARTER_PI);
}


else if (card  == 34) { 
  
    image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img3,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Eat!!",360,180);
 textSize(40);
text("     Another",360,253);
text("     Choice",360,298);

triangle(390,230,390,290,350,260);
   
 
   head(-100,40,1,0); 
  body1(150,360,1,PI+HALF_PI);
  body2(0,0,1,0);
  body3(0,0,1,0);
  body4(155,55,1,HALF_PI);
  
}
  

else if (card  == 4) { 
 rect (266,0,260,50);
  image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
  text("Purple  Grape!!",560,180);
 textSize(40);
text("     UP",560,253);
triangle(570,220,550,250,590,250);

  body1(200,250,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
  head(0,int(random(190,195)),1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  
}

else if (card  == 41) { 

 image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
  text("Purple  Grape!!",560,180);
 textSize(40);
text("     UP",560,253);
text("     DOWN",560,298);

triangle(570,220,550,250,590,250);
triangle(570,300,550,270,590,270);


 
   head(200,390,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,0,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(120,-90,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(0,0,1,0);
  body3(0,0,1,0);
  
}

else if (card  == 42) { 
 image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
 textSize(25);
  fill(51,175,127);
  text("Purple  Grape!!",560,180);
 textSize(40);
text("     UP",560,253);
text("     DOWN",560,298);

triangle(570,220,550,250,590,250);
triangle(570,300,550,270,590,270);

 
 head(200,310,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(10,215,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(118,-80,1,QUARTER_PI);
    body4(103,-40,1,QUARTER_PI);
    body3(0,0,1,0);
  
}

else if (card  == 43) { 

  image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
 textSize(25);
  fill(51,175,127);
  text("Purple  Grape!!",560,180);
 textSize(40);
text("     UP",560,253);
text("     DOWN",560,298);

triangle(570,220,550,250,590,250);
triangle(570,300,550,270,590,270);



 head(200,260,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,207,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(0,0,1,0);
  body3(105,-40,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(90,10,1,QUARTER_PI);
  
}

else if (card  == 44) { 
  
   image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img8,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Eat!!",560,180);
 textSize(40);
text("     Another",560,253);
text("     Choice",560,298);

triangle(590,230,590,290,550,260);
   head(200,40,1,0); 
  body1(150,360,1,PI+HALF_PI);
  body2(0,0,1,0);
  body3(0,0,1,0);
  body4(155,55,1,HALF_PI);
  
}


 else if (card  == 5) { 
  rect (532,0,260,50);
  
   image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
  text("Yellow Pear!!",360,180);
 textSize(40);
text("     UP",360,253);
triangle(370,220,350,250,390,250);

 
  body1(450,250,1,0);
  body2(0,0,1,0);
  body4(0,0,1,0);
  body3(0,0,1,0);
  head(0,int(random(190,195)),1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
 }
 
  else if (card  == 51) { 

 image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Yellow Pear!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);

triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);

       
 head(450,390,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,0,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(120,-90,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(0,0,1,0);
  body3(0,0,1,0);
}

  else if (card  == 52) { 

   image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Yellow Pear!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);

triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);


 head(450,310,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
    body1(10,215,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
    body2(118,-80,1,QUARTER_PI);
    body4(103,-40,1,QUARTER_PI);
    body3(0,0,1,0);
  
}
 
  
  else if (card  == 53) { 
     image(img1, 0 ,0);
 image(img6, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Yellow Pear!!",360,180);
 textSize(40);
text("     UP",360,253);
text("     DOWN",360,298);
triangle(370,220,350,250,390,250);
triangle(370,300,350,270,390,270);


 head(450,260,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI); 
  body1(0,207,1,PI+QUARTER_PI+QUARTER_PI+QUARTER_PI);
  body2(0,0,1,0);
  body3(105,-40,1,PI+QUARTER_PI+HALF_PI+HALF_PI);
  body4(90,10,1,QUARTER_PI);
}


  else if (card  == 54) { 
    
     image(img1, 0 ,0);
 image(img7, 580,-5);

 image(img5,300,-5);
  image(img2,30,-5);
  
   
 textSize(25);
  fill(51,175,127);
   text("Eat!!",360,180);
 textSize(40);
text("     Another",360,253);
text("     Choice",360,298);

triangle(390,230,390,290,350,260);

   head(450,40,1,0); 
  body1(150,360,1,PI+HALF_PI);
  body2(0,0,1,0);
  body3(0,0,1,0);
  body4(155,55,1,HALF_PI);
  
}
    
}
 
 
 
 
 
 
 
 
 
 
void body2(int z, int b,float c, float v) {
  noStroke();
  translate(z,b);
  scale(c);
  rotate(v);
  noStroke();


  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(145,120,140,140);
  line(155,120,160,140);

  //body
  noStroke();
  fill(8,244,138);
  ellipse(150,105,50,50);
}


void body3(int d, int f,float g, float h) {
  noStroke();
  translate(d,f);
  scale(g);
  rotate(h);
  noStroke();

  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(95,120,90,140);
  line(105,120,110,140);

  //body
  noStroke();
  fill(59,178,107);
  ellipse(100,105,50,50);
}


void body4(int u, int i,float o, float p) {
  noStroke();
  translate(u,i);
  scale(o);
  rotate(p);
  noStroke();


  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(45,120,40,140);
  line(55,120,60,140);


  //body
  noStroke();
  fill(8,244,138);
  ellipse(50,105,50,50);
}


void head(int q, int w,float e, float r) {
  noStroke();
  translate(q,w);
  scale(e);
  rotate(r);
  noStroke();

  //head line
  strokeWeight(4);
  stroke(83,178,126);
  line(250,50,270,100);
  line(280,50,260,100);
  stroke(100,204,10);
  strokeWeight(8);
  line(246,40,250,50);
  line(284,40,280,50);


  //body
  noStroke();
  fill(8,244,138);
  ellipse(260,100,70,70);  

  //eye
  noStroke();
  fill(255);
  ellipse(250,80,20,20);
  ellipse(275,80,20,20);
  fill(0);
  ellipse(253,75,10,10);
  ellipse(278,75,10,10);

  //mouse
  noStroke();
  fill(247,201,201);
  ellipse(240,90,18,8);
  ellipse(285,90,18,8);
  noStroke();
  fill(244,127,127);
  arc(260,100,70,70,0,QUARTER_PI);
}



void body1(int x, int y,float s,float t) {

  noStroke();
  translate(x,y);
  scale(s);
  rotate(t);
  noStroke();



  //leg
  strokeWeight(5);
  stroke(73,119,91);
  line(195,120,190,140);
  line(205,120,210,140);

  //body
  noStroke();
  fill(59,178,107);
  ellipse(200,105,50,50);
}

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
void mousePressed() {  

  if (card == 0) {  

    if((mouseX >750)&& (mouseX < 750 + 40) && (mouseY > 350) && (mouseY < 350+ 50)) {
      card = 1;
    } 
    else card = 0;
  }
  else if (card == 1) {  

    if((mouseX >750)&& (mouseX < 750 + 40) && (mouseY > 350) && (mouseY < 350+ 50)) {
       card = 2;
    } 
    else card =1;
  }   
  
  
  
    
  else if (card == 2) {
   if((mouseX >0)&& (mouseX < 0 + 260) && (mouseY > 0) && (mouseY < 0+ 200)) 
    card = 3;
 
    if((mouseX >266)&& (mouseX < 266 + 260) && (mouseY > 0) && (mouseY < 0+ 200)) 
    card =4;

if((mouseX >532)&& (mouseX < 532 + 260) && (mouseY > 0) && (mouseY < 0+ 200) )
    card = 5;

}

else if (card == 3) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 31;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =3;
   
}
else if (card == 31) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 32;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =3;
}
else if (card == 32) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 33;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =31;
}

else if (card == 33) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 34;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =32;

} 
 else if (card == 34) {
    if((mouseX >350)&& (mouseX < 350 + 30) && (mouseY > 230) && (mouseY < 230+ 60)) 
    card =2;
     
}












else if (card == 4) {
   if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 41;

    if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =4;
   
}
else if (card == 41) {
   if((mouseX >550)&& (mouseX <550 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 42;

    if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =4;
}
else if (card == 42) {
   if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 43;

    if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =41;
}

else if (card == 43) {
   if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 44;

    if((mouseX >550)&& (mouseX < 550 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =42;

} 
 else if (card == 44) {
    if((mouseX >550)&& (mouseX < 550 + 30) && (mouseY > 230) && (mouseY < 230+ 60)) 
    card =2;
  

 }
 
 
 
 
 
 
 
 else if (card == 5) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 51;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =5;
   
}
else if (card == 51) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 52;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =5;
}
else if (card == 52) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 53;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =51;
}

else if (card == 53) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
    card = 54;

    if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
    card =52;

} 
 else if (card == 54) {
    if((mouseX >350)&& (mouseX < 350 + 30) && (mouseY > 230) && (mouseY < 230+ 60)) 
    card =2;
  


 }





}
/*else if (card == 34) {
   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
   card = 35;

   if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY > 270) && (mouseY < 270+ 30)) 
   card =33;
}

else if (card == 35) {
       if((mouseX >350)&& (mouseX < 350 + 30) && (mouseY > 230) && (mouseY < 230+ 60)) 
    card =3;
    
}
}
//else if (card == 4) {
 //  if((mouseX >350)&& (mouseX < 350 + 40) && (mouseY >220) && (mouseY < 220+ 30)) 
  //  card = 41;
//}
   // else card =4;


//}
*/

