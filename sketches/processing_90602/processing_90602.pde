
//Declaring Narwhals
Narwhal myNarwhal;
Narwhal myNarwhal2;
Narwhal myNarwhal3;

//Rendering each Narwhal
void setup() {
size(500,500);
myNarwhal=new Narwhal(0,0,width/2,height/2); //main original Narwhal
myNarwhal2=new Narwhal(0,0,200,80); //a second Narwhal to the upper left
myNarwhal3=new Narwhal(0,0,400,350); //a third Narwhal to the lower right


}


//Narwhal Action
void draw() {
      background(146,184,189);//bg color
      iceFloes(); //ice floes
        pushMatrix(); //making the original Narwhal swim, blow bubbles, and exist
          myNarwhal.swim();
          myNarwhal.bubble();
      myNarwhal.render(0);
      popMatrix();
      pushMatrix(); //making the second Narwhal swim, blow bubbles, and exist
      myNarwhal2.swim();
      myNarwhal2.bubble();
      myNarwhal2.render(0);
      popMatrix();
      pushMatrix(); //making the third Narwhal swim, blow bubbles, and exist
      myNarwhal3.swim();
      myNarwhal3.bubble();
      myNarwhal3.render(0);
      popMatrix();
  }

//Class and variables
class Narwhal {
  float myX;
float myY;
float xx;
float yy;
int nTime;
float z;
float u;

Narwhal(float myX_,float myY_,float xx_,float yy_) { //these variables can change value
myY=myY_;
myX=myX_;
xx=xx_;
yy=yy_;
}

//Narwhal takes a random swim upwards
void swim() {
  xx=xx-(0.5-noise(frameCount/2)); 
  yy=yy-(0.5-noise(frameCount/2));
  translate(xx,yy);
}

//Narwhal blows bubbles
void bubble() {
    z=z-1;
    noStroke();
    fill(221,228,251); 
ellipse(myX-60,z,7,7); //bubble 1
ellipse(myX-66,z,4,4); //bubble 2
if(z-1<-200) { //if the bubbles reach a certain height...
noStroke();
z=myY-10;
    fill(221,228,251); //then draw two new ones
    ellipse(myX-60,z,7,7);
    ellipse(myX-66,z,4,4);
    }
}

//Make that Narwhal
void render(int myTime) {
  noStroke();
  fill(218,218,218);//skin color
      nTime=second()-myTime;
      if(nTime>=1 && nTime%2) { //if the number of seconds that have passed are greater or equal to 1 and that number is even...
    triangle(myX+109,myY+17,myX+122,myY,myX+122,myY+34);
    quad(myX+52,myY-22,myX+52,myY+23,myX+112,myY+19,myX+112,myY+15); //then the tail moves down
    myTime=second(); //makes it a loop
  }
  else{
triangle(myX+109,myY-3,myX+122,myY-20,myX+122,myY+14); //otherwise, shapes are over here
quad(myX+52,myY-22,myX+52,myY+23,myX+112,myY-1,myX+112,myY-5);
  }
ellipse(myX,myY,150,75);//main body shape
ellipse(myX-65,myY,60,60);//head
fill(221,217,210);//horn color
triangle(myX-90,myY-5,myX-90,myY+3,myX-145,myY-25);//horn
fill(255,255,255);//eyeball color
ellipse(myX-80,myY-10,10,10);//eyeball
fill(0,0,0);//pupil color
ellipse(myX-77,myY-10,3,3);//pupil
fill(177,177,176);//spots colors
ellipse(myX,myY-30,20,5);//spot 1
ellipse(myX-20,myY-25,20,5);//spot 2
ellipse(myX+30,myY-27,20,5);//spot 3
ellipse(myX+20,myY-20,18,5);//spot 4
ellipse(myX+35,myY-15,16,5);//spot 5
ellipse(myX+52,myY-17,12,5);//spot 6
fill(218,218,218);//left flipper color
pushMatrix();
translate(-10,18);
rotate(-frameCount/12); //rotate the left flipper counterclockwise at a reduced speed
triangle(myX-4,myY+21,myX+16,myY,myX+16,myY+42);//left flipper
popMatrix();
stroke(1);//mouth line
line(myX-87,myY+20,myX-70,myY+20);//mouth
}

}

//make ice floes
void iceFloes() {
    noStroke();
    fill(255);
quad(50,-2,80,-2,70,120,65,120);
quad(90,-2,256,-2,168,298,162,298);
quad(310,-2,465,-2,400,200,355,200);
fill(94,119,122);
ellipse(150,600,600,300);
ellipse(350,600,600,300);
    }
