
// minim example code:
// http://code.compartmental.net/minim/examples/Minim/getLineIn/
import ddf.minim.*;
Minim minim;
AudioInput in;
int i = 0;

int starTime = 0;
int spacing = 50;
int bgcolor = color(65,0,129);
int bgteal = color(100,214,167);
boolean orientation = true;


int r = 0;
int g = 0;
int b = 0;  
int rInt = 0;
int gInt = 1;
int bInt = 2; 
int sCount = 0;
int starColor = color(0,0,0);
boolean sChange = true;
int s = 0;

void setup(){
  size(600,500);
  background(bgcolor);
  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
 //fft.forward(in.left); 
}

void draw(){
  starColorChange();
  stars();
  randomCircles();
  // clear if mouse hasn't moved for several seconds
  if(pmouseX == mouseX){
    i++;
  }
  if (i == 500){
    background(bgcolor);
    i=0;
  }
}

// star color change
void starColorChange(){
  sCount++;
  println(sCount);
  s = int(random(3));
  if(sChange==true){
    if (s==rInt){
      r=int(r+random(15));
    }
    if (s==gInt){
      g= int(g+random(15));
    }
    if (s==bInt){
      b= int(b+random(15));
    }
  }
  if(sChange==false){
    if (s==rInt){
      r=int(r-random(15));
    }
    if (s==gInt){
      g= int(g-random(15));
    }
    if (s==bInt){
      b= int(b-random(15));
    }
  }
    starColor = color(r,g,b);
  if (sCount==110){
    if (sChange==true){
      sChange=false;
      sCount=0;
    }
    else{
      sChange=true;
      sCount=0;
    }
  }
  println(r + "," + g + "," + b);
}
/*
// old star color change code
void starColorChange(){
  if (starChange == true){
    if (s<200){
      g= g + 2;
      s++;
    }
    if (s>=200 && s<400){
      r = r+ 2;
      s++;
    }
    if (s>=400 && s<600){
      b = b + 2;
      s++;
    }
    if (s==600){
      starChange = false;
    }
  }    
  if (starChange == false){
      if (s<=600 && s>400){
      r = r - 2;
      s--;
    }
      if (s<=400 && s>200){
      g = g - 2;
      s--;
    }    
    if (s<=200){
      b = b - 2;
      s--;
    }  
     if (s==0){
      starChange = true;
    }
    }
  starColor = color(r,g,b);
}
*/

// draw stars
void stars(){
  for (int a = 0; a < width; a = a + 80){
   for (int b = 0; b < height; b = b + 80){
  fill(bgcolor);  
  stroke(bgcolor);
  strokeWeight(5);
  line(a+20,b,a+20,b+40);
  line(a,b+20,a+40,b+20);
  line(a+7,b+7,a+32,b+32);
  line(a+33,b+7,a+7,b+32);
  stroke(starColor);
  strokeWeight(random(5));
  line(a+20,b,a+20,b+40);
  line(a,b+20,a+40,b+20);
  line(a+7,b+7,a+32,b+32);
  line(a+33,b+7,a+7,b+32);
  }
  }
delay(40);
}

void randomCircles(){
  fill(random(255),random(255),random(255));
  stroke(0);
  strokeWeight(1);
  for(int i = 0; i < in.bufferSize() - 1; i++){
    if(orientation == true){
      ellipse(mouseX,mouseY,30+in.left.get(i)*700,10+in.left.get(i)*100);
    }
    if(orientation == false){
      ellipse(mouseX,mouseY,10+in.left.get(i)*100,30+in.left.get(i)*700);
    } 
  }
}

// switch orientation of ellipses on click
void mouseClicked(){
  if(orientation == true){
    orientation = false;
  }
  else{
    orientation = true;
  }
}

// clear screen if key is pressed
void keyPressed(){
  background(bgcolor);
}

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}

