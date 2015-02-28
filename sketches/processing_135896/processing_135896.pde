
float a = 80;
float b = 80;
float c = 80;
float d = 80;
float e,f;

void setup(){
  size(800,400);
  smooth();

}



void draw(){
    background(map(second(), 0, 59, 0, 255),map(minute(), 0, 59, 0, 255),map(hour(), 0, 23, 0, 255));
    coldplay();
    bigClock();
  
 }


void coldplay(){
  for (int i =0; i<5; i++){
    for (int j =0; j<10; j++){
      
      //making the boxes
      fill(map(minute(), 0, 59, 0, 80)+j,map(minute(), 0, 59, 80, 160)+i,map(second(), 0, 59, 160, 255)+j,99);
      rect(a*j, b*i, a*j+80, b*i+80);
      
      //making the clock
      pushMatrix();
      translate(a*j+40,b*i+40);
      fill(map(second(), 0, 59, 80, 160)+i*2,map(second(), 0, 59, 0, 80)+3*j,map(minute(), 0, 59, 160, 255)+j*1);
      ellipse(0,0,80,80);
      
      //minute
      pushMatrix();
      rotate((TWO_PI/60)*minute()+j+i);
      line(0,0,0,40);
      popMatrix();
      
      //second
       pushMatrix();
       rotate((TWO_PI/60)*second()+j+2*i);
       line(0,0,0,40);
       popMatrix();
      
      
      popMatrix();

    }

  }
  
}

void bigClock(){
  translate(width/2, height/2);
  fill(200,200,200,90);
  ellipse(0, 0, 400,400);


//hour
  float hr = hour();
  if (hr>12){
    hr= hr-12;
  }
  pushMatrix();
  fill(map(hour(), 0, 23, 0, 255));
  rotate((TWO_PI/12)*hr);
  triangle(0,0,-(PI*180/24),-200,PI*180/24,-200);
  popMatrix();
 
  fill(map(minute(), 0, 59, 0, 255),map(minute(), 0, 59, 0, 255),map(minute(), 0, 59, 0, 255),90);
  ellipse(0,0, 350,350);
  fill(0,0,0,90);
  ellipse(0, 0, 300,300);

//minute
  pushMatrix();
  fill(23,52,67);
  rotate((TWO_PI/60)*minute());
  triangle(0,0,-(PI*175/60),-175,PI*175/60,-175);
  popMatrix();

//second
  pushMatrix();
  fill(255);
  rotate((TWO_PI/60)*second());
  triangle(0,0,-PI*150/60,-150,PI*150/60,-150);
  popMatrix();

}


