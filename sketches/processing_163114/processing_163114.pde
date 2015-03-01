
float delta = 25;
float r = 200;
float r2 = 100;
float r3 = 150;
float r4 = 50;
float r5 = 10;
float r6 = 250;
float r7 = 300;
void setup()
{
  size(600,600,P3D);
}

void draw()
{
  background(38,0,0);
  
  translate(width/2, height/2, 0);
  rotateX(radians(mouseY));
  rotateY(radians(mouseX));
  
  for (float z = 0; z<200; z+=5) {
    for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r* cos(theta);
      float y = r * sin(theta);
      point (x,y,z);
     stroke(193,82,0);
     strokeWeight(2);
    }
   
    for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r2* cos(theta);
      float y = r2 * sin(theta);
      point (x,y,z);
      stroke(193,138,0);
     strokeWeight(2);
    }
      for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r3* cos(theta);
      float y = r3 * sin(theta);
      point (x,y,z);
        stroke(135,35,0);
     strokeWeight(2);

    }

    for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r4* cos(theta);
      float y = r4 * sin(theta);
      point (x,y,z);
     stroke(193,82,0);
     strokeWeight(2);
    }

    for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r5* cos(theta);
      float y = r5 * sin(theta);
      point (x,y,z);
     stroke(193,82,0);
     strokeWeight(2);
    }
     
       for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r6* cos(theta);
      float y = r6 * sin(theta);
      point (x,y,z);
     stroke(193,82,0);
     strokeWeight(2);
    }
    
       for(float deg = 0; deg < 360; deg += delta){
      float theta = radians(deg);
      float x = r7* cos(theta);
      float y = r7 * sin(theta);
      point (x,y,z);
     stroke(193,82,0);
     strokeWeight(2);
    }
  }
    }

