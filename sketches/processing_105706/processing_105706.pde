
int friend[] = new int[100];

float xFriend[] = new float[100];
float yFriend[] = new float[100];
//float xSpeed[] = new float[100];
//float ySpeed[] = new float[100];

int friendSize[] = new int[100];
color friendColor[] = new color[100];


void setup(){
  size(600,600);
  noStroke();
 
  for(int i = 0; i < 100; i++){
    friend[i] = i;
    xFriend[i] = random(0,width);
    yFriend[i] = i*10;
    friendColor[i] = color(0,i*3+10,i*2);
    friendSize[i] = int(random(1,30));
//    xSpeed[i]=random(-1,1);
//    ySpeed[i]=random(-1,1);
  }
}

void draw(){
  background(255,167,138);
  for(int i = 0; i<100; i++){
    fill(friendColor[i]);
    ellipse(xFriend[i],yFriend[i],friendSize[i] ,friendSize[i]);
    ellipse(xFriend[i],i*7,friendSize[i] ,friendSize[i]);
  }
  
//  for(int i=0;i<100;i++){
//   xFriend[i]= xFriend[i] + 5*xSpeed[i];
//   yFriend[i]= yFriend[i] + 3*ySpeed[i]; }
//  }
// 
  
  
}

