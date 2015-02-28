



void setup(){
 
  size(500,800);

 
  background(0,0,20);
  smooth();
  fill(240,240,255,0);
  stroke(255,255,255,90);

float b = 45;
while(b<500) {
  
 
    int a = 10;
          int mysize = 5;
    while(a < height) {

       strokeWeight(random(1,3));
       
      line(random(35,450), a, random(35,450)+30, a);
      line(random(35,450)-5,a+10,random(35,450)-5+40,a+10);
      line(random(35,450)-10,a+20,random(35,450)-10+50,a+20);
      line(random(35,450)-15,a+30,random(35,450)-15+60,a+30);
      line(random(35,450)-20,a+40,random(35,450)-20+70,a+40);
      line(random(35,450)-25,a+50,random(35,450)-15+70,a+50);
      line(random(35,450)-20,a+60,random(35,450)-10+60,a+60);
      line(random(35,450)-15,a+70,random(35,450)-5+50,a+70);
      line(random(35,450)-10,a+80,random(35,450)-0+40,a+80);
      line(random(35,450)-5,a+90,random(35,450)+35,a+90);
      a = a + 100;
    }
   
    b = b + 95;
}
}

void draw(){

}

