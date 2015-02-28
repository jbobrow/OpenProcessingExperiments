
int x = 50;
int y = 50;
 
void setup (){
 size (200,200);
}
void draw( ){
    background(190);
    fill (250, 190, 200);
    ellipse(x,y,100,100);
}
 
void keyPressed( ){
    if(keyCode == UP||key== UP){
        y--;
    }else if(keyCode == DOWN||key== DOWN){
        y++;
    }else if(keyCode == LEFT||key== LEFT){
        x--;
    }else if(keyCode == RIGHT||key== RIGHT){
        x++;
    }
}

