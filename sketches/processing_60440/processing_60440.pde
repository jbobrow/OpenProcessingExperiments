
//NOM USA

//keys : 'n', 'o', 'm', 'u', 's', 'a'
PImage sandwitch, icecream, frenchfries, pie, dog, USA;
float x, y, dX, dY, easing;
int value = 0;
int mode = 1 ;
import ddf.minim.*;
Minim minim;
AudioSample breath;



void setup(){
  
  
size (600, 800);
smooth();
background(249, 200, 140);
noStroke();
minim = new Minim(this);
  
  breath = minim.loadSample("breath.wav", 2048);

//foodz
sandwitch = loadImage("SANDWITCH!.png");
imageMode(CENTER);
icecream = loadImage("ICECREAM.png");
imageMode(CENTER);
frenchfries = loadImage("frenchfries.png");
imageMode(CENTER);
pie = loadImage("PIE.png");
imageMode(CENTER);
dog = loadImage("DOG.png");
imageMode(CENTER);
USA = loadImage("USA.png");
imageMode(CENTER);
x = 0;
y = 0;
easing = .05;
image(sandwitch, x, y);
image(icecream, x, y);
image(frenchfries, x, y);
image(pie, x, y);
image(dog, x, y);
image(USA, x, y);
  
//hair
float inc=0;
for(int x = 0; x< width; x++){
  noiseDetail(30);
  float myFill =noise(inc)*255;
  inc+=.05;
stroke(myFill,0, 0);
line(x,0,x,myFill);
  

  
}
}




 
void draw(){
  
  if(frameCount %180 == 0){
     breath.trigger();
  }
  
 //foodz
 dX = mouseX - x;
 dY = mouseY - y;
 
  
  //constrain math crap
int LeftEyeX = 205;
int LeftEyeY = 211;
int RightEyeX = 440;
int RightEyeY = 211;
 
float d = dist(mouseX, mouseY, LeftEyeX, LeftEyeY);
float rd = dist(mouseX, mouseY, RightEyeX, RightEyeY);

  
  
 float b = dist(mouseX, mouseY, pmouseX, pmouseY);
float c = constrain(b, 0, 25);

 
 
//Left eye
//white
fill(255); 
ellipse (LeftEyeX, LeftEyeY, 150,150);
 
fill(mouseX, mouseY, 0); 
 
d = constrain (d,0,30);
float a = atan2(mouseY-LeftEyeY, mouseX-LeftEyeX);
float x = LeftEyeX + cos(a)*d;
float y = LeftEyeY + sin(a)*d;
ellipse(x,y, 90, 90);
ellipse(x,y, 100, 100);

//innerpuple
fill(mouseX, mouseY, 250); 
d = constrain (d, 0, 30);
ellipse (x, y, 60, 60);
ellipse (x, y, 70, 70);

fill(mouseX, mouseY, 250); 
d = constrain (d, 0, 30);
ellipse (x, y, 60, 60);
ellipse (x, y, 70, 70);
   
  fill(0);
  ellipse(x, y, 30,30);
  
  //smallwhite 
  fill(255);
  ellipse(x+3,y-9, 15, 15);
 
 
//Right Eye
 //white
fill(255);
ellipse(RightEyeX, RightEyeY, 150, 150);


 
fill(mouseX, mouseY, 0); 
d = constrain (d, 0, 30);
float ra = atan2(mouseY-RightEyeY, mouseX-LeftEyeX);
float rx = RightEyeX + cos(a)*d;
float ry = RightEyeY + sin(a)*d;
ellipse (rx, ry, 90, 90);
ellipse (rx, ry, 100, 100);

//inner puple
fill(mouseX, mouseY, 250); 
d = constrain (d, 0, 30);
ellipse (rx, ry, 60, 60);
ellipse (rx, ry, 70, 70);

 
fill (0);
ellipse(rx, ry, 30,30);


 //smallwhite
fill(255);
ellipse(rx+3, ry-9, 15, 15);


//Mouth

bezier(150, 295, 200, 400, 400, 400, 350, 295);
bezier(150, 295, 200, 500, 400, 400, 350, 295);
fill(400);



  if (mode == 1){
    func1();
  }
  else if(mode == 2){
     func2();
  }
  else if(mode==3){
     func3();
  }
     else if(mode==4){
     func4();
  }   
     else if(mode==5){
     func5();
  }   
     else if(mode==6){
     func6();
   

}
}


//foodz

     
void func1(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(sandwitch, x , y);
  }
  
void func2(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(icecream, x ,y);
 }
  
void func3(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(frenchfries, x ,y);
 }
 
 void func4(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(pie, x ,y);
 }
 void func5(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(dog, x ,y);
 }
  void func6(){
   x = x + dX*easing;
   y = y + dY*easing;
  image(USA, x ,y);
 }


  
void keyPressed(){

  
  if (key == 'n'){
   mode =2;
  }
  else if (key== 'o'){
    mode =1;
 }
   else if (key == 'm'){
     mode =3;
   }
     else if (key == 'u'){
     mode =4;
     }  
      else if (key == 's'){
     mode =5;
      }
     else if (key == 'a'){
     mode =6;
 }
}
  
  //end of foodz
  
  void stop()
{
  breath.close();
  minim.stop();
  
  super.stop();
 
}
  
//cite:
  //openprocesing: constrains, bezier, sound 
  //inspiration and help with constrains:
  //http://www.openprocessing.org/sketch/8147
  //special thanks to Roget Ratchford and his amazing trigonometry skillz!!
  //image source: Google


