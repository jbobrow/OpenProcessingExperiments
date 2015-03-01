
int ballCount=10;
float[] circleX = new float [ballCount];
float[] circleY = new float [ballCount];
float[] speedY = new float [ballCount];
float diam=100;
boolean[] falling = new boolean [ballCount];
float[] distance = new float[ballCount];
float gravity;
float[] speedX = new float [ballCount]; 

PImage soup;
PImage road;
PImage plane;


void setup(){
  size(700,700);
  
  for(int i=0; i<ballCount; i++){
  circleX[i] = random(diam/2, width-diam/2);
  circleY[i]= random(diam/2, height-diam/2);
  circleY[i] = height/4;
  speedY[i]=0;
  speedX[i]=0; 
  falling[i]=false;
  distance[i]=0;
  soup = loadImage("car.png");
  road = loadImage("road.jpg");
  plane = loadImage("plane.jpg");
}

  gravity=0.1;
}

void draw(){
  background(100);
    image(road,0,0, 700, 700);
    
    for(int i=0; i<ballCount; i++){

    image(soup, circleX[i], circleY[i], diam, diam);
    distance[i] = dist(mouseX, mouseY, circleX[i], circleY[i]);
    
    if(distance[i]<diam/2){
        //fill(0);
        falling[i]=true;
        speedX[i] = mouseX - pmouseX;
        println("speedX: " + speedX);
    } else {
        //fill(255);
    }
    
    if(falling[i]){
        circleY[i] += speedY[i];
        circleX[i] += speedX[i];
        speedY[i] += gravity;
        
        if(circleY[i]>height-diam/2){
          circleY[i]=height-diam/2; //trick to get the ball to not stick 
          speedY[i]=-speedY[i]*0.8; 
          
          if(abs(speedY[i])<2){
           speedY[i] = 0; 
          }
        }
        }
        for(int j=0; j<ballCount; j++){
            
          if(i!=j){
            if(dist(circleX[i], circleY[i], circleX[j], circleY[j])<diam){
            //change circle i
            circleX[i]=circleX[i]-speedX[i];
            circleY[i]=circleY[i]-speedY[i];
            speedX[i]=speedX[i]*-0.8;
            speedY[i]=speedY[i]*-0.8;
            
            //change circle j
            circleX[j]=circleX[j]-speedX[i]*2;
            circleY[j]=circleY[j]-speedY[i]*2;
            speedX[j]=speedX[j]*-0.8;
            speedY[j]=speedY[j]*-0.8;
        }
    
    
    
    
    }
    }
  }
}




