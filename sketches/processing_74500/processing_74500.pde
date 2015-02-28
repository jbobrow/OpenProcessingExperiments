
void setup(){
 size(600,600,P3D);
 background(0);

 noStroke();
 directionalLight(255,255,240,-0,-1,-2);
 translate(20,50,0);
 sphere(300);
 }
 
float value=0;
 
void draw (){
 fill (value);
 ellipse (500,400,50,50);
 
fill (value);
 ellipse (400,550,20,20);
 fill (value);
 ellipse (600,500,40,40);
 fill (value);
 ellipse (200, 100,30,30);
 fill (value);
 ellipse (250,250,20,20);
 fill (value);
 ellipse (400,200,10,10);
 fill (value);
 ellipse (550,300,20,20);
 fill (value);
 ellipse (3,750,40,40);
 fill (value);
 ellipse (600, 50,30,30);
 fill (value);
 ellipse (20,600,20,20);
 fill (value);
 ellipse (100,500,10,10);
 fill (value);
 ellipse (550,300,20,20);
 fill (value);
 ellipse (550,300,20,20);
 fill (value);
 ellipse (3,750,40,40);
 fill (value);
 ellipse (350,500,30,30);
 fill (value);
 ellipse (200,200,20,20);
 fill (value);
 ellipse (100,100,10,10);
 fill (value);
 ellipse (700,200,20,20);
 
for (int ii=0;ii<20;ii++);
 fill(random (255),random (255), random (255));
 translate(0,20);
 pushMatrix();
 for (int i=0;i<10;i++) {
 ellipse(width/2, height/2, 3, 3);
 translate(30, 0);
 rotate(radians(map(mouseY, 0, width-5, 100, 0)));
 }
 popMatrix();
 }
 
void keyReleased(){
 
if (value ==0){
 value=random (250);
 }else{
 value=random (250);
 
}
 }

