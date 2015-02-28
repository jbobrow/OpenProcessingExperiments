
PImage img;

Monster[] bob = new Monster[5];


void setup(){
  size(800,492);
  img=loadImage("beast3.jpg");
  
  
  
  for(int i=0;i<bob.length;i++){

  bob[i]=new Monster();
  } 
  
  bob[0].prime(100,height/2);
  bob[1].prime(250,height/4);
  bob[2].prime(400,height/2);
  bob[3].prime(550,height/4);
  bob[4].prime(700,height/2);

}

void draw(){
 background(img);
  
  for (int i=0; i<bob.length;i++){
 

   bob[i].animate();
   bob[i].move();
  
  
}
}

//
//make each Monster move
//make if statements in here to perform a function (movement)


class Monster{

float x;
float y;

float speed;
float gravity;

void prime(float a, float b){//setup function
x=a;
y=b;
 

speed=1;
gravity=0.3;

} 

void animate(){

  noStroke();
  fill(252,198,48);
  rect(x,y,60,100);//body
  
  fill(255);
  ellipse(x+20,y+20,15,15);//eyes
  ellipse(x+40,y+20,15,15);//eyes
  
  fill(0);
  ellipse(x+20,y+25,5,5);
  ellipse(x+40,y+25,5,5);//pupil
  

  
  fill(111,247,143);
  triangle(x+15,y,x+27.5,y-75,x+30,y);
  triangle(x+30,y,x+32.5,y-75,x+45,y);
  
  fill(10,204,55);//pineapple hair
  triangle(x,y,x+10, y-50,x+20,y);
  triangle(x+20,y,x+30,y-50,x+40,y);
  triangle(x+40,y,x+50,y-50,x+60,y);
  
  fill(102,60,5);//body grids
  stroke(255);
  line(x,y+34,x+59,y+100);
  line(x+30,y+34,x+59,y+66);
  line(x,y+50,x+20,y+35);
  line(x,y+90,x+59,y+35);
  line(x+30,y+99,x+59,y+66);
  
  noStroke();
  fill(0);
  ellipse(x+30, y+70, 20,30); //mouth 
  
  fill(247,89,168);
  ellipse(x+30,y+77,10,15);//tongue
  

}

void move(){
  if (mousePressed==true){
    y+=speed;
    speed+=gravity;
  }
}
}


