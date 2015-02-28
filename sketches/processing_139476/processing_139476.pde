
float speed=20; 
float x=width/2;
float y=height/2;
float o=width/2;
float p=height/2;
float j=width/2;
float k=height/2;
void setup()
{
  size(800,1000);
  background(255);
  smooth();
  frameRate(80);
}
 
void draw(){
  x += random(-speed,speed);
  y += random(-speed,speed);
  o += random(-speed,speed);
  p += random(-speed,speed);
  j += random(-speed,speed);
  k += random(-speed,speed);
  x=constrain(x,0,width);
  y=constrain(y,0,height);
  o=constrain(x,0,width);
  p=constrain(y,0,height);
  j=constrain(x,0,width);
  k=constrain(y,0,height);
 if (key=='c'){   
       stroke(0,random(150,250));
       fill(random(250),random(250),random(250),100);
       arc(x,y,random(30),random(25),random(PI),random(PI+PI/2));
    }
    else if (key=='r'){
   stroke(0,random(150,250));
   fill(random(250),random(250),random(250),100);
    rect(o,p,random(30),random(25));}
    else if (key=='e'){
   stroke(0,random(150,250));
    fill(random(250),random(250),random(250),100);
    ellipse(j,k,random(15),random(30));
   
 if (key=='s'){
save("overlap.tif");
 }
 }
  }  




