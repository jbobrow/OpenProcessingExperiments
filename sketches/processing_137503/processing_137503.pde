

int x = 50;
int y = 50;
 
void setup (){
 size (300,300);
}
void draw( ){
    background(0);
    fill (250, 250, 250);
    ellipse(x,y,60,60);                                  
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

