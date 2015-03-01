
float speedx = 5;
float speedy = random(50,100);


void setup(){
  size(800,500);
  frameRate(30);
  background(0);

}
  void ball(float posx, float posy,int r, int g, int b){
    fill(r,g,b);
    ellipse(posx+random(-800,800),posy+random(-500,500),75,75);
    posx = posx + speedx; 
    
    if (posx+75/2 >= 500 || posx-75/2 <= 0){
     speedx=-speedx;    
    } 
  
  posy = posy + speedy;
  if (posy+75/2 >= 500 || posy-75/2 <= 0){
     speedy=-speedy;    
    } 
    }
  void draw(){
    noStroke();
        fill(0,30);
    rect(0,0,width,height);
    ball(10,10,255,0,0);
    ball(100,50,100,100,100);
    ball(50,100,34,209,88);
    ball(300,300,0,255,25);
    ball(400,400,255,0,0);
}
    
    
