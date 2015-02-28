
void setup() {
  size(400,400);
}
int x;
void draw(){
fill(x);
  rectMode(CENTER);
rect(width/2, height/2, 40,40);
if(mouseX>=180 && mouseX<=220 && mouseY>=180 && mouseY<=220 ){
x=255;
}else{x=150;}


}


