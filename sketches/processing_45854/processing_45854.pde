
Thing t = new Thing(30,500, 15,.07);
Thing t2 = new Thing(100,200, 11, .04);
Thing t3 = new Thing(110,250,  8,.05);
Thing t4 = new Thing(500,290, 20, .06);
Thing t5 = new Thing(100,330,  70,.06);
Thing t6 = new Thing(100,450, 16, .04);
Thing t7 = new Thing(100,460, 90,.08);
Thing t8 = new Thing(100,540, 120, .09);
Thing t9 = new Thing(100,560,13,.07);
Thing t10 = new Thing(230,400,14, .05);
Thing t11 = new Thing(230,430,100,.07);
Thing t12 = new Thing(30,90,12, .1);
Thing t13 = new Thing(70,460,30,.08);
Thing t14 = new Thing(400,500,40, .09);
Thing t15 = new Thing(550,580,20,.07);
Thing t16 = new Thing(500,400,-32, .3);
Thing t17 = new Thing(430,500,18,.6);
Thing t18 = new Thing(540,90,12, .1);
Thing t19 = new Thing(28,80,4, .05);
Thing t20 = new Thing(300,430,6,.07);
Thing t21 = new Thing(30,90,2, .1);
Thing t22 = new Thing(70,460,33,.08);
Thing t23 = new Thing(40,350,50, .09);
Thing t24 = new Thing(300,200,20,.07);
Thing t25 = new Thing(500,40,100, .07);
Thing t26 = new Thing(60,500,18,.05);
Thing t27 = new Thing(50,90,80, 1);

float a2;
float b2;
float a;
float b;
float fisha;
float fishb;
float easing;

void setup() {
size(750, 650);
strokeWeight(.5);
smooth();

a = 30;
b = 30;
fisha = a;
fishb = b;
easing = .01;
}

void draw() {
background(3,6,15);

t.display();
t2.display();
t3.display();
t4.display();
t5.display();
t6.display();
t7.display();
t8.display();
t9.display();
t10.display();
t11.display();
t12.display();
t13.display();
t14.display();
t15.display();
t16.display();
t17.display();
t18.display();
t19.display();
t20.display();
t21.display();
t22.display();
t23.display();
t24.display();
t25.display();
t26.display();
t27.display();
 
 a2 = keyCode - a;
 b2 = keyCode - b;
 
  a = a + a2 *easing;
  b = b + b2 *easing;
fish (fisha, fishb);  
  
}

//http://processing.org/reference/keyCode.html

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
 
      fishb +=-2;
    } else if (keyCode == DOWN) {
      fishb+=+2;  
    }
    else if (keyCode == LEFT){
      fisha +=-2;
    }
    else if (keyCode == RIGHT){
      fisha+=2;
     }
   }
 }

 

void fish (float a, float b){
fill(124,116,75);
ellipse(a,b,40,20);
}
  
// class 1
class Thing {
float x,y;
float angle = 0; // Current angle
float speed = .05; // Speed 
float radius = 36; // Range of motion

int trailNum = 20; //keep track of last 20 spots
int prevx[];
int prevy[]; //declare arrays


//constructor
Thing (float _x, float _y, float _angle, float _speed){
x = _x;
y = _y;
angle = _angle;
speed = _speed;
prevx = new int[trailNum]; //make new array with trailNum spots (20)
prevy = new int[trailNum];
}

//methods
void display(){
 for(int i =1; i < trailNum; i++){ //push the numbers back loop
   prevx[i-1] = prevx[i];
   prevy[i-1] = prevy[i];   
 }
  //p 291
  if ((x >0 && x<700) && (y>0 && y<600)){
angle += 1*speed; // Update the angle
float x2 = y;
float y2 = y;
float sinval = sin(angle);
float cosval = cos(angle);
float x =  x2+(sinval * 140);
float y =  y2-(cosval * 130);
prevx[trailNum -1] = mouseX;
prevy[trailNum -1] =  mouseY; 
for(int i= 0; i <trailNum; i++){
  // fill(20,77,9,50);
   //ellipse(prevx[i],prevy[i],i,i);
fill(20,77,9,100);
ellipse(x, y, 15, 15);
}

}
 }
}



