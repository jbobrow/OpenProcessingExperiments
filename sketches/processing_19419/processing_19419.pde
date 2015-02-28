
void setup (){
size(250,250);
smooth();
background(220,50,3,5); }

  float a=2; //position variable
  float b=2; //position variable
  float speed=0.001; //value for speed
  float radius=10; //circle size

void draw(){   
a=radius+a;
b=radius+b;

    fill(245,radius,170,speed+1); //color for stroke and faster the speed a little bit
    stroke(220,a+b,radius);
    strokeWeight(1.5);
     
      bezier(0,a-100,a,b*3,b*5,radius,radius,0); //curve start from top left
      bezier(250,a-100,a,b*3,b*5,radius,radius,250);//curve start from bottom right
 a+=speed-5;
  b+=speed-5;// increase value to move curves
}



