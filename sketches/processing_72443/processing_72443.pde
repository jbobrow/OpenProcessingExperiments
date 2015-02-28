
void setup() {
 size (600,600);
 colorMode(HSB);
 noStroke();
 grid();
 }
 void draw(){

 strokeWeight(6);
 stroke(60);
 line(80,0,80,600);
 line(100,0,100,600);
 line(180,0,180,600);
 line(200,0,200,600);
 line(280,0,280,600);
 line(300,0,300,600);
 line(380,0,380,600);
 line(400,0,400,600);
 line(480,0,480,600);
 line(500,0,500,600);
 line(580,0,580,600);
 line(0,80,600,80);
 line(0,100,600,100);
 line(0,180,600,180);
 line(0,200,600,200);
 line(0,280,600,280);
 line(0,300,600,300);
 line(0,380,600,380);
 line(0,400,600,400);
 line(0,480,600,480);
 line(0,500,600,500);
 line(0,580,600,580);

 }


 void grid(){
 noStroke();
 for(int x=0;x<width;x+=35){
 for(int y=0;y<height;y+=35){
 fill(random(336),536,100,80);
 ellipse(x, y, 55, 55);
 }
 }
 }

