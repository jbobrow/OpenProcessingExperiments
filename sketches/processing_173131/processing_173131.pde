
float rectX[] = new float[100];
float rectY[] = new float[100];
float sebessegX[] = new float [100];
float sebessegY[] = new float [100];
color szinek[] = new color [100];

void setup () {
size(800,600);
rectMode(CENTER);
  for ( int i = 0; i < rectX.length; ++i) {
    rectX[i] = random(20,width-20);
    rectY[i] = random(20,height-20);
    sebessegX[i] = random(-7,7);
    sebessegY[i] = random(-7,7);
    szinek[i] = color( random(255),random(255),random(255));
  
    
  }

}

void draw () {
  fill( 3,85,55,51);
  rect(width/2,height/2,width,height);
  
  for ( int i = 0; i < rectX.length; ++i) {
   
    rect(rectX[i],rectY[i],40,40);
   
    rectX[i] += sebessegX[i];
    rectY[i] += sebessegY[i];
  }
    if ( rectX[i] >= width-20 || rectX[i] <= 20) {
      sebessegX[i] *= -1;
    }
    if ( rectY[i] >= height-20 || rectY[i] <= 20) {
      sebessegY[i] *= -1;
    }
   
  }


