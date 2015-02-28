
int n = 130;

float ballSize = 2;
float[] x = new float[n];
float[] y = new float[n];
float[] sx = new float[n];
float[] sy = new float[n];

boolean[] bc = new boolean [n];
boolean click =false ;


void setup() {
  size(800, 600);
  smooth();
  for (int i=0; i<n; i++) {
    x[i] = random(10, width-10);
    y[i] = random(10, height-10);
    sx[i] = random(-1, 1);
    sy[i] = random(-1, 1);
    bc[i]= (i%2==0);
  }
}



void move(){
  for (int i=0; i<n; i++) {
    x[i] += sx[i];
    y[i] += sy[i];

    if (x[i] < 0) { x[i] = 0; sx[i] = -sx[i]; }
    if (x[i] > width) { x[i] = width; sx[i] = -sx[i]; }
    if (y[i] < 0) { y[i] = 0; sy[i] = -sy[i]; }
    if (y[i] > height) { y[i] = height; sy[i] = -sy[i];}
   
    for (int j=0;j<n ;j++){
      float d =dist(x[i],y[i],x[j],y[j]);
      if(d<30){
        float f = map(d,0,30,0,0.5);
        sx[i] += random(-f,f);  
        sy[i] += random(-f,f);
        sx[i] = constrain(sx[i],-2,2);
        sy[i] = constrain(sy[i],-2,2);   
      }
      
      if (d<10 && i<j){
        boolean t = bc[i];
        bc[i]=bc[j];
        bc[j]=t;
      }
      
      float m =dist(mouseX,mouseY,x[i],y[i]);

      if(m<60&& mouseButton !=RIGHT){
        
        
        stroke(30,20);
        noFill();
        ellipse (x[i],y[i],10,10);
       
        float n = map(m,0,60,0,0.8);
        
        if(mouseX>x[i]){
        x[i] -=n; sx[i] = -sx[i]; 
        }
        if(mouseX<x[i]){
         x[i] +=n; sx[i] = -sx[i]; 
        }
        if(mouseY<y[i]){
         y[i] +=n; sy[i] = -sy[i]; 
        }
        if(mouseY>y[i]){
         y[i] -=n; sy[i] = -sy[i]; 
        }

       
      }
      
     }
  }
}




void draw() {
  background(240);
  
  for (int i=0; i<n; i++) {
      for (int j=0; j<n; j++) {
        float d = dist(x[i], y[i], x[j], y[j]);
        if (d < 80 && click==true) {
         
          //x[i] -= sx[i];
          //y[i] -= sy[i];
          float c = map(d, 0, 80, 20, 230);//map the distance with the transparency
          stroke(c);
          line(x[i], y[i], x[j], y[j]);
          
          if(c<20){
          
          sy[i] = random(-0.2, 0.2);

          sx[i] = random(-0.2, 0.2);

          }
        }
     }
  }
  
  for (int i=0; i<n; i++) {

     noStroke();
     fill(30);
         ellipse(x[i], y[i], ballSize, ballSize);
         
  }

   if (mouseButton == RIGHT && click == false) {
   
     for (int i=0; i<n; i++){

      float tx, ty;
      if (i == 0){
        tx = mouseX;
        ty = mouseY;
      } 
      else {
           tx = x[i-1];
           ty = y[i-1];
      }
    
     follow(i, tx, ty);

    }
  }


  if (mousePressed == true && click ==false) {
    
    if (mouseButton == LEFT) {
    click =true;
    mousePressed= false;
    }
  }
  
  if (mousePressed == true && click ==true) {
    if (mouseButton == LEFT) {
    click= false;
   
    }
  }
  
  move();
}


void follow (int i, float targetX, float targetY){
    float dx = targetX - x[i];
    float dy = targetY - y[i];
    x[i] += dx * 0.2;
    y[i] += dy * 0.2;
}





