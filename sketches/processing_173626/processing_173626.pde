
void setup() {
  size(600,600); 
  stroke (255,600,116);
}
void draw(){
  
background(0); 
float s= map (second(),0,60,0,600);
float m = map (minute(),0,60,0,600);
float h = map (hour(),0, 25,0,600);

//fill(255,300,22);
//segundos
for( int i=0; i < width; i= i+ 50) {     

 fill ( 255,255,0,15);
 
 ellipse (width/2, height/2, s, i);  
 }
 
 //minutos


 for( int i=0; i < width; i= i+ 50) {       

 fill ( 0,0,255,20);
 stroke ( 12,32,240);
 ellipse (width/2, height/2, m/1.5, i/1.5);
 
 }
 


//horas

 for( int i=0; i < width; i= i+ 50) {     

 fill ( 255,0,0,20);
 stroke (242,15,15);
 
 ellipse (width/2, height/2, h/2, i/2);  
 }
 

int a = second();
int b =minute ();
int c = hour ();
}
