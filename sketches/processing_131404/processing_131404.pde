
int recta;
int wco;
int hco;
int space;
int space1;
float x_coor;
float y_coor;
float p_num= 001;
void setup()
{
size(1600,900);
background(10);
smooth();



}
void draw()
{
recta=0;
space =40;
space1 =5;
 

wco =width/space;
hco =height/space1;



stroke(0,random(255),0,50);
 for (int i=0; i<wco; i+=1) { 
     for (int j=0; j<hco; j+=1){
         noFill();
         x_coor = recta+j*space;
        y_coor = recta+i*space;
  ellipse(x_coor,y_coor,space*random(20),space*random(20)); }
}
} 
void mousePressed() {
  p_num=p_num+1;    //each time increases the number so the new snapshot wont delete the previous one
  save(p_num+"circles.jpg"); 
  loop();
}
