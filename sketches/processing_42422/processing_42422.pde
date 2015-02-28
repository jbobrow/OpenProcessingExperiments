
int x;
int y;

void setup (){
size (400,400);
smooth ();
x=width/2;
y=height/2;


}
void draw (){

background(0);
rect(x,y,100,50);

if(mouseX > x && mouseX < x+ width && mouseY > y && mouseY < y+height){

  
}else{
fill (random (255), random (30), random (250));
  }

}
void mousePressed (){
  fill(255);
}

                
                
