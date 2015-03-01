

 float theta = 0;
 float rad;
 float al = 10;
 
 int count = 0;

void setup(){
 size(600, 480);
 smooth();
 frameRate(200);
 background(0);
 rad = random(10); 
  stroke(240, 240, 150, al);
}

void draw(){
 
  star(width/2, height/2, 300, 300);
  
}

void star(float xpos, float ypos, float xsize,float ysize){ 

 rad += 0.001;
 float x = xpos + ((noise(rad)*xsize)*cos(theta));
 float y = ypos + ((noise(rad)*ysize)*sin(theta));

 line(mouseX, mouseY, x, y);
 switch(count%3){
   case 1:
    line(mouseX-100, mouseY, x, y);
    //break;
    case 2:
     line(mouseX+100, mouseY, x, y);
     //break;
     case 0:
  
     break;
 }
 
 theta+=0.01;
 al += 0.01;
 
 if(al > 10){
   stroke(random(255), random(255), random(255), al);
   al = -1;
 }
 if(al<0){
   al = 1;
   count++;
 }
}


