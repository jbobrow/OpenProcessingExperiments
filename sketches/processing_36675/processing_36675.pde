
void setup(){
  size(300,300);
  colorMode(HSB,100);
  background(100);
  smooth();
}
float a=155;
float count = 20;
float circle;
float rndColor;
void draw(){
  if(mousePressed){
   background(a);
  a--;
  stroke(random(0,255),155,155,10);
  line(40,195,265,195);//building
  line(40,235,265,235);
  line(40,50,40,300);
  line(265,50,265,300);
  line(40,50,265,50);
  line(40,155,265,155);
  if (count < 0) {   //second floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(10,20);
   rect(50,200, circle, circle);//window1
   rect(80,200, circle, circle);
   rect(110,200, circle, circle);
   rect(140,200, circle, circle);
   rect(170,200, circle, circle);
   rect(200,200, circle, circle);
   rect(230,200, circle, circle);
  }
  if (count < -20) {  //third floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(10,20);
   rect(50,160, circle, circle);//window2
   rect(80,160, circle, circle);
   rect(110,160, circle, circle);
   rect(140,160, circle, circle);
   rect(170,160, circle, circle);
   rect(200,160, circle, circle);
   rect(230,160, circle, circle);
  }
    if (count < 20) {// first floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(10,20);
   rect(50,240, circle, circle);//window3
   rect(80,240, circle, circle);
   rect(110,240, circle, circle);
   rect(140,240, circle, circle);
   rect(170,240, circle, circle);
   rect(200,240, circle, circle);
   rect(230,240, circle, circle);
  }
    if (count < -60) {// forth floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(50,70);
   rect(50,70, circle, circle);//big window
  }
  count--;
  }
else{
  line(40,195,265,195);//building
  line(40,235,265,235);
  line(40,50,40,300);
  line(265,50,265,300);
  line(40,50,265,50);
  line(40,155,265,155);
  if (count < 0) {   //second floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(150,150,100,10);
   }
   circle = random(10,20);
   rect(50,200, circle, circle);//window1
   rect(80,200, circle, circle);
   rect(110,200, circle, circle);
   rect(140,200, circle, circle);
   rect(170,200, circle, circle);
   rect(200,200, circle, circle);
   rect(230,200, circle, circle);
  }
  if (count < -20) {  //third floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(10,20);
   rect(50,160, circle, circle);//window2
   rect(80,160, circle, circle);
   rect(110,160, circle, circle);
   rect(140,160, circle, circle);
   rect(170,160, circle, circle);
   rect(200,160, circle, circle);
   rect(230,160, circle, circle);
  }
    if (count < 20) {// first floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(10,20);
   rect(50,240, circle, circle);//window3
   rect(80,240, circle, circle);
   rect(110,240, circle, circle);
   rect(140,240, circle, circle);
   rect(170,240, circle, circle);
   rect(200,240, circle, circle);
   rect(230,240, circle, circle);
  }
    if (count < -60) {// forth floor
   rndColor = random(100);
   if(rndColor > 20){ //color
     fill(66,100,100,10);
   }else{
     fill(random(0,100),random(0,100),100);
   }
   circle = random(50,70);
   rect(50,70, circle, circle);//big window
  }
  count--;
}
}

