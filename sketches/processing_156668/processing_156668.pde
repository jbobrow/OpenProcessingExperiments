

PImage qianniao;
Boolean click=false;
void setup() {
    size(500, 500); 
   

    qianniao=loadImage("qianniao.png");
} 

void draw() {
    background(255);
  if(click==true){
    for(int j=0;j<6;j++){
    for(int i = 0; i <6; i++){
        image(qianniao,i*85-10,j*85-10); 
    }
  }
}
else{image(qianniao,-10,-10);}
}
void mousePressed(){
if(mousePressed){click=true;}

}





