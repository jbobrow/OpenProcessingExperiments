
Pineapple[] piney = new Pineapple[1];

Clouds[] cloud=new Clouds[3];//class of clouds

void setup(){
  size(800,400);
 
  
  for (int i=0;i<cloud.length;i++){
    cloud[i]=new Clouds();
  }
  
  cloud[0].prime(100, height/3);
  cloud[1].prime(500, 200);
  cloud[2].prime(200, 75);

  
  for(int j=0; j<piney.length;j++){
    piney[j]=new Pineapple();
  }
    piney[0].prime(100,240);
  
  
}

void draw(){
  noStroke();
  fill(31,87,3);//grass
  rect(0,300,800,100);
  fill(28,216,237);//sky
  rect(0,0,800,300);
  fill(100,106,107);//mountain
  triangle(300,300,400,200,550,300);
  triangle(450,300, 550, 250, 700, 300);
  fill(181,197,199);//middle mountain
  triangle(450,300,490,210,550,300);
  
  
  for(int i=0; i<cloud.length;i++){
    cloud[i].animate();
  }
  
  for (int j=0; j<piney.length;j++){
    piney[j].animate();
    piney[j].move();
  }
  
  
}

class Clouds{
  
  float x;
  float y;
  float xSpeed;
  
  void prime(float a, float b){
    
    x= a;
    y= b;
    xSpeed = random(-1,1.5);
  }
  
  void animate(){
    noStroke();
    fill(255);
    ellipse(x,y,50,50);
    ellipse(x+20,y-10,65,100);
    ellipse(x+50,y,90,60);
    
    x+= xSpeed;
    
    if (x<0 || x+110>width){
      xSpeed*=-1;
    }

    
  }
  
  
  
  
}
class Pineapple {

  float x;
  float y;

  float xSpeed;
  float ySpeed;

  void prime(float a, float b) {//setup function
    x=a;
    y=b;


    xSpeed=1;
    ySpeed=1;
  } 

  void animate() {

    noStroke();
    fill(252, 198, 48);
    rect(x, y, 60, 100);//body

    fill(255);
    ellipse(x+20, y+20, 15, 15);//eyes
    ellipse(x+40, y+20, 15, 15);//eyes

    fill(0);
    ellipse(x+20, y+25, 5, 5);
    ellipse(x+40, y+25, 5, 5);//pupil



    fill(111, 247, 143);
    triangle(x+15, y, x+27.5, y-75, x+30, y);
    triangle(x+30, y, x+32.5, y-75, x+45, y);

    fill(10, 204, 55);//pineapple hair
    triangle(x, y, x+10, y-50, x+20, y);
    triangle(x+20, y, x+30, y-50, x+40, y);
    triangle(x+40, y, x+50, y-50, x+60, y);

    fill(102, 60, 5);//body grids
    stroke(255);
    line(x, y+34, x+59, y+100);
    line(x+30, y+34, x+59, y+66);
    line(x, y+50, x+20, y+35);
    line(x, y+90, x+59, y+35);
    line(x+30, y+99, x+59, y+66);

    noStroke();
    fill(0);
    ellipse(x+30, y+70, 20, 30); //mouth 

    fill(247, 89, 168);
    ellipse(x+30, y+77, 10, 15);//tongue
  }

  void move() {
    if (key==CODED) {
      if (keyCode==RIGHT) {
        x+=xSpeed;
      } 
      else if (keyCode==LEFT) {
        x+=xSpeed*-1;
      } 
      else if (keyCode==UP) {
        y+=ySpeed*-1;
      } 
      else if (keyCode==DOWN) {
        y+=ySpeed;
      }
    }
  }
}
