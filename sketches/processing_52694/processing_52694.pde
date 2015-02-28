
int mode=1;

void setup(){
size(800,600);
noFill();
smooth();
strokeWeight(.1);

}

void draw(){
translate(width/2,height/2);  
for(int i = 0 ; i < mouseX ; i++){
 rotate(radians(91));
 line(0, mouseX-1,mouseY+13, 11); 



}
 }

void keyPressed(){
  if(key=='1'){
  mode=1;
}  else if(key=='2'){
  mode=2;
}
 if(mode==1){
 background(0,217,181);
 } else if(mode== 2){
   background(184,161,255);

}

}

