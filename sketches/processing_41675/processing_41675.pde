
int i =0;
int x =5;
int speedX = 8;
int z = 0;
int l= 0;
float purespeeed = 0.5;


void setup(){
 size (400,400);
 noStroke();
 ellipse ( width/2, height/2, 120,120);
}

void draw (){
 if ((z==1) && (l==260)){
  x=int( x+speedX * purespeeed);
    noStroke();
  fill(250,0,0);
  ellipse ( width/2, 200+x-5, 10,10);
    fill(250,0,0);
  ellipse ( 220, 200+x-5, 10,10);
    fill(250,0,0);
  ellipse ( 160, 200+x-5, 10,10);
    fill(250,0,0);
  ellipse ( 240, 200+x-5, 5,5);
    fill(250,0,0);
  ellipse ( 180, 200+x-5, 2,2);
 }

 stroke(0);
 line (0,height/2,l,height/2);
 
}
     
void mouseDragged(){
 stroke(0);
 line (0,height/2,mouseX,height/2);

}

void mouseReleased(){
 if (mouseX > 260){
z=1;
l=260;

 }
}

                
                
