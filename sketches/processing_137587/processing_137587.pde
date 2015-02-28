

int x = 100;
int y = 100;
 
void setup (){
 size (200,200);
}
void draw( ){
    background(230);
    fill (210, 0, 0);
    ellipse(x,y,50,50);
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

