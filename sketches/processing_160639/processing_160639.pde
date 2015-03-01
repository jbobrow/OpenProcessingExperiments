
Pimage Logo;
float speed = 1.0;
float move;

void setup(){
size(515,500); //(Picture size (Left-Right,UpDown)
Logo=loadImage("https://lh4.googleusercontent.com/-gtrQKf9O31Y/AAAAAAAAAAI/AAAAAAAAACo/wWGjk7FEyrU/photo.jpg");
}
void draw(){
move=move+speed;
image(Logo,0,move);
if (move > 150 ) {
move=0;
}
}
